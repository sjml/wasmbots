import config from "../core/config.ts";
import * as CoreMsg from "../core/messages.ts";
import { LogLevel, type LogFunction } from "../core/logger.ts";
import { type Coordinator, CoordinatorStatus } from "../core/coordinator.ts";
import { Player } from "../game/player.ts";
import * as Msg from "./messages.ts";


export class WasmCoordinator implements Coordinator {
	private worker: Worker;
	private player: Player;
	status: CoordinatorStatus;
	logger: LogFunction;
	rngSeed: number;
	lastTickDuration: number;

	private programBytes: Uint8Array;
	private setupTimeout: number = -1;
	private tickTimeout: number = -1;
	private inTick: boolean = false;
	private tickStartTime: number = 0;
	private tickPromise!: Promise<CoreMsg.Message>;
	private tickResolve!: (val: CoreMsg.Message) => void;
	private tickReject!: () => void;
	private workerWarningsCount = 0;

	private readyPromise!: Promise<void>;
	private readyResolve!: () => void;
	private readyReject!: () => void;

	constructor(parent: Player, logger: LogFunction, rngSeed: number, programBytes: Uint8Array) {
		this.player = parent;
		this.logger = logger;
		this.rngSeed = rngSeed;
		this.programBytes = programBytes;
		this.lastTickDuration = 0;

		this.worker = new Worker(
			new URL("./wasmbot.worker.ts", import.meta.url).href,
			{ type: "module" }
		);
		this.status = CoordinatorStatus.Uninitialized;

		this.worker.onmessage = this.onMessage.bind(this);

		this.readyPromise = new Promise<void>((resolve, reject) => {
			this.readyResolve = resolve;
			this.readyReject = reject;
		});
	}

	untilReady(): Promise<void> {
		return this.readyPromise;
	}

	kickoff() {
		const initMsgPayload: Msg.InitModulePayload = {
			wasmBytes: this.programBytes.buffer,
			wasmBytesOffset: this.programBytes.byteOffset,
			wasmBytesLength: this.programBytes.byteLength,
			setupTimeLimit: config.setupTimeLimit,
			tickWarnTimeLimit: config.tickWarnTimeLimit,
			tickKillTimeLimit: config.tickKillTimeLimit,
		};
		this.worker.postMessage(
			{
				type: Msg.HostToGuestMessageType.InitModule,
				payload: initMsgPayload,
			},
			// not playing with Transferable for now
			// [programBytes.buffer]
		);
	}

	async reset() {
		this.worker = new Worker(
			new URL("./wasmbot.worker.ts", import.meta.url).href,
			{ type: "module" }
		);
		this.status = CoordinatorStatus.Uninitialized;

		this.worker.onmessage = this.onMessage.bind(this);

		this.readyPromise = new Promise<void>((resolve, reject) => {
			this.readyResolve = resolve;
			this.readyReject = reject;
		});

		this.kickoff();
	}

	initModuleDone(payload: Msg.InitModuleDonePayload) {
		if (!payload.success) {
			this.status = CoordinatorStatus.Invalid;
			this.logger(LogLevel.Error, payload.errorMsg!);
			this.readyReject();
			return;
		}
		this.worker.postMessage({
			type: Msg.HostToGuestMessageType.Instantiate,
			payload: {
				rngSeed: this.rngSeed
			} as Msg.InstantiatePayload,
		});
		this.setupTimeout = setTimeout(() => {
			if (this.status == CoordinatorStatus.Uninitialized) {
				this.worker.terminate();
				this.status = CoordinatorStatus.Shutdown;
				this.logger(LogLevel.Error, `Module timed out on setup (limit: ${config.setupTimeLimit}ms)`);
				this.readyReject();
			}
		}, config.setupTimeLimit);
	}

	instantiateDone(payload: Msg.InstantiateDonePayload) {
		clearTimeout(this.setupTimeout);
		if (!payload.success) {
			this.status = CoordinatorStatus.Invalid;
			this.logger(LogLevel.Error, "Could not instantiate module");
			this.readyReject();
			return;
		}
		this.status = CoordinatorStatus.Ready;
		this.setupTimeout = -1;
		this.player.name = payload.botName;
		this.player.version = payload.botVersion;

		this.readyResolve();
	}

	tick(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message> {
		this.tickPromise = new Promise<CoreMsg.Message>((resolve, reject) => {
			this.tickResolve = resolve;
			this.tickReject = reject;
		});
		if (this.status == CoordinatorStatus.Shutdown) {
			this.logger(LogLevel.Warn, "Tried to tick shutdown module");
			this.tickReject();
		}
		else if (this.inTick) {
			this.logger(LogLevel.Warn, "Rejected attempt to call overlapping tick function");
			this.tickReject();
		}
		else {
			this.inTick = true;

			this.tickStartTime = performance.now();

			circumstances.lastTickDuration = this.lastTickDuration;

			const buffer = new Uint8Array(circumstances.getSizeInBytes());
			circumstances.writeBytes(new DataView(buffer.buffer), false);
			this.worker.postMessage({
				type: Msg.HostToGuestMessageType.RunTick,
				payload: {
					circumstancesBuffer: buffer,
				} as Msg.RunTickPayload
			});

			this.tickTimeout = setTimeout(() => {
				this.logger(LogLevel.Error, `Module timed out on tick (limit: ${config.tickKillTimeLimit}ms)`);
				this.tickReject();
				this.worker.terminate();
				this.status = CoordinatorStatus.Shutdown;
			}, config.tickKillTimeLimit);
		}
		return this.tickPromise;
	}

	async runTickDone(payload: Msg.RunTickDonePayload) {
		clearTimeout(this.tickTimeout)
		this.inTick = false;
		this.lastTickDuration = Math.ceil(performance.now() - this.tickStartTime);
		if (this.lastTickDuration > config.tickWarnTimeLimit) {
			this.logger(LogLevel.Warn, `Giving warning for tick running more than ${config.tickWarnTimeLimit}ms`);
			this.workerWarningsCount += 1;
			if (this.workerWarningsCount >= config.numTimeLimitStrikes) {
				this.logger(LogLevel.Error, `Module shut down after ${config.numTimeLimitStrikes} time strikes`);
				this.worker.terminate();
				this.status = CoordinatorStatus.Shutdown;
			}
		}
		if (payload.hadError) {
			this.worker.terminate();
			this.status = CoordinatorStatus.Shutdown;
			this.tickReject();
			return;
		}

		let restoredMessage: CoreMsg.Message;
		let restoredConstructor = CoreMsg.MessageTypeMap.get(payload.playerMoveType) || CoreMsg._Error;
		restoredMessage = new restoredConstructor();
		if (restoredMessage instanceof CoreMsg._Error) {
			restoredMessage.description = `Invalid message type submitted: ${payload.playerMoveType}`;
		}
		else {
			Object.assign(restoredMessage, payload.playerMove);
		}

		this.tickResolve(restoredMessage);
	}

	private async onMessage(evt: MessageEvent<Msg.GuestToHostMessage<Msg.GuestToHostMessageType>>) {
		const { type, payload } = evt.data;
		switch (type) {
			case Msg.GuestToHostMessageType.InitModuleDone:
				this.initModuleDone(payload as Msg.InitModuleDonePayload);
				break;
			case Msg.GuestToHostMessageType.InstantiateDone:
				this.instantiateDone(payload as Msg.InstantiateDonePayload);
				break;
			case Msg.GuestToHostMessageType.RunTickDone:
				await this.runTickDone(payload as Msg.RunTickDonePayload);
				break;
			case Msg.GuestToHostMessageType.LogMessage:
				const logPayload = payload as Msg.LogMessagePayload;
				this.logger(logPayload.logLevel, logPayload.message);
				break;
		}
	}
}
