import * as CoreMsg from "../core/messages.ts";
import { type LogFunction } from "../core/logger.ts";

export enum CoordinatorStatus {
    Uninitialized,
    Invalid,
    Ready,
    Running,
    Shutdown,
}

export enum CoordinatorType {
    WebAssembly,
    Trainer,
}

export interface Coordinator {
    kickoff(): void;
    reset(): void;
    untilReady(): Promise<void>;

    tick(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message>;
    flavor: CoordinatorType;
    status: CoordinatorStatus;
    logger: LogFunction;
    rngSeed: number;
}
