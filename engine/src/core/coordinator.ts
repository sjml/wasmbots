import * as CoreMsg from "../core/messages.ts";
import { type LogFunction } from "../core/logger.ts";

export enum CoordinatorStatus {
    Uninitialized,
    Invalid,
    Ready,
    Running,
    Shutdown,
}

export interface Coordinator {
    untilReady(): Promise<void>;
    kickoff(programBytes: Uint8Array): void;
    tick(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message>;
    status: CoordinatorStatus;
    logger: LogFunction;
    rngSeed: number;
}
