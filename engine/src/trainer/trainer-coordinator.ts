import { type Coordinator, CoordinatorStatus } from "../core/coordinator.ts";
import { TrainerGuestProgram } from "../core/guest.ts";
import { LogFunction, LogLevel } from "../core/logger.ts";
import * as CoreMsg from "../core/messages.ts";
import { Player } from "../game/player.ts";

export class TrainerCoordinator implements Coordinator {
	private player: Player;
	private program: TrainerGuestProgram;
	status: CoordinatorStatus;
	logger: LogFunction;
	rngSeed: number;
	lastTickDuration: number;

	private readyPromise!: Promise<void>;
	private readyResolve!: () => void;
	private readyReject!: () => void;
	private tickStartTime: number = 0;

	constructor(parent: Player, logger: LogFunction, rngSeed: number) {
		this.player = parent;
		this.logger = logger;
		this.rngSeed = rngSeed;
		this.lastTickDuration = 0;

		this.status = CoordinatorStatus.Uninitialized;

		this.program = new TrainerGuestProgram(this.rngSeed);

		this.readyPromise = new Promise<void>((resolve, reject) => {
			this.readyResolve = resolve;
			this.readyReject = reject;
		});
	}

	untilReady(): Promise<void> {
		return this.readyPromise;
	}

	private async runKickoff() {
		const setupStatus = await this.program.runSetup();
		if (setupStatus.success) {
			this.status = CoordinatorStatus.Ready;
		}
		this.readyResolve();
	}

	kickoff(): void {
		this.runKickoff();
	}

	reset(): void {
		throw new Error("Reset not implemented on trainer coordinator");
	}

	async tick(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message> {
		if (this.status == CoordinatorStatus.Shutdown) {
			this.logger(LogLevel.Warn, "Tried to tick shutdown module");
			return Promise.reject();
		}

		this.tickStartTime = performance.now();
		circumstances.lastTickDuration = this.lastTickDuration;

		let move: CoreMsg.Message;
		try {
			move = await this.program.runTick(circumstances);
		}
		catch (err) {
			const errMsg = `Error in tick! ${err}`;
			this.status = CoordinatorStatus.Shutdown;

			const e = new CoreMsg._Error();
			e.description = errMsg;
			return e;
		}
		if (move.getMessageType() == CoreMsg.MessageType._ErrorType) {
			this.status = CoordinatorStatus.Shutdown;
		}

		this.lastTickDuration = Math.ceil(performance.now() - this.tickStartTime);

		return move;
	}
}
