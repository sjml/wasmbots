import { WasmCoordinator, WorkerStatus, type LogFunction } from "../worker/coordinator.ts";

import config from "../core/config.ts";
import { type Point } from "./map.ts";

export class Player {
    coordinator: WasmCoordinator;

    location: Point;
    hitPoints: number;

    constructor(logger: LogFunction) {
        this.location = {x: -1, y: -1};
        this.coordinator = new WasmCoordinator(logger);
        this.hitPoints = config.startingHitPoints;
    }

    async init(programBytes: Uint8Array): Promise<boolean> {
        this.coordinator.kickoff(programBytes);
        await this.coordinator.untilReady();
        if (this.coordinator.workerStatus == WorkerStatus.Shutdown) {
            return false;
        }
        return true;
    }

    async processTurn() {
        await this.coordinator.tick();
    }
}
