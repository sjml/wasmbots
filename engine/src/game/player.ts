import { WasmCoordinator, WorkerStatus, type LogFunction } from "../worker/coordinator.ts";

import config from "../core/config.ts";
import { type Point } from "./map.ts";
import { LogLevel } from "../core/logger.ts";

export class Player {
    private _programBytes: Uint8Array = new Uint8Array();
    coordinator: WasmCoordinator;

    // remember that anything added here needs to be dealt with in the reset
    location: Point;
    hitPoints: number;

    constructor(logger: LogFunction) {
        this.location = {x: -1, y: -1};
        this.coordinator = new WasmCoordinator(logger);
        this.hitPoints = config.startingHitPoints;
    }

    async init(programBytes: Uint8Array, cloneProgram: boolean = true): Promise<boolean> {
        if (cloneProgram) {
            this._programBytes = programBytes.slice();
        }
        this.coordinator.kickoff(programBytes);
        await this.coordinator.untilReady();
        if (this.coordinator.workerStatus == WorkerStatus.Shutdown) {
            return false;
        }
        return true;
    }

    async reset(): Promise<boolean> {
        const logger = this.coordinator.logFunction;
        logger(LogLevel.Info, "-------- RESETTING");
        this.coordinator = new WasmCoordinator(logger);
        this.hitPoints = config.startingHitPoints;
        return await this.init(this._programBytes, false);
    }

    async processTurn() {
        await this.coordinator.tick();
    }
}
