import { type Coordinator, CoordinatorStatus, CoordinatorType } from "../core/coordinator.ts";
import { GuestProgram } from "../core/guest.ts";
import { LogFunction, LogLevel } from "../core/logger.ts";
import * as Msg from "../core/messages.ts";
import { Player } from "../game/player.ts";

export class TrainerCoordinator implements Coordinator {
    private player: Player;
    private program: GuestProgram;
    flavor: CoordinatorType = CoordinatorType.Trainer;
    status: CoordinatorStatus;
    logger: LogFunction;
    rngSeed: number;

    private readyPromise!: Promise<void>;
    private readyResolve!: () => void;
    private readyReject!: () => void;
    private tickStartTime: number = 0;
    private lastTickDuration: number = 0;

    constructor(parent: Player, logger: LogFunction, rngSeed: number) {
        this.player = parent;
        this.logger = logger;
        this.rngSeed = rngSeed;

        this.status = CoordinatorStatus.Uninitialized;

        this.program = new GuestProgram(console, this.rngSeed, this.flavor);

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

    tick(circumstances: Msg.PresentCircumstances): Promise<Msg.Message> {
        if (this.status == CoordinatorStatus.Shutdown) {
            this.logger(LogLevel.Warn, "Tried to tick shutdown module");
            return Promise.reject();
        }

        this.tickStartTime = performance.now();
        circumstances.lastTickDuration = this.lastTickDuration;
        const move = this.program.runTick(circumstances);
        this.lastTickDuration = Math.ceil(performance.now() - this.tickStartTime);

        return move;
    }
}
