import { WasmCoordinator } from "../worker/wasm-coordinator.ts";
import { type Coordinator, CoordinatorStatus } from "../core/coordinator.ts";
import * as CoreMsg from "../core/messages.ts";

import config from "../core/config.ts";
import { type Point } from "./map.ts";
import { LogLevel, type LogFunction } from "../core/logger.ts";

export class Player {
    private _programBytes: Uint8Array = new Uint8Array();
    coordinator!: Coordinator;
    name: string;
    version: number[];

    // remember that anything added here needs to be dealt with in the reset
    location: Point;
    spawnPoint: Point;
    hitPoints: number;
    lastMoveSucceeded: boolean;

    constructor() {
        this.name = "";
        this.version = [];

        this.location = {x: -1, y: -1};
        this.spawnPoint = this.location;
        this.hitPoints = config.startingHitPoints;
        this.lastMoveSucceeded = true;
    }

    async init(coordinator: Coordinator): Promise<boolean> {
        this.coordinator = coordinator;
        this.coordinator.kickoff();
        await this.coordinator.untilReady();
        if (this.coordinator.status == CoordinatorStatus.Shutdown) {
            return false;
        }
        return true;
    }

    async reset(): Promise<boolean> {
        this.coordinator.logger(LogLevel.Info, "-------- RESETTING");

        this.hitPoints = config.startingHitPoints;
        this.lastMoveSucceeded = true;
        this.location = this.spawnPoint;

        this.coordinator.reset();
        await this.coordinator.untilReady();
        return true;
    }

    async tickTurn(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message> {
        circumstances.lastMoveSucceeded = this.lastMoveSucceeded;

        const move = await this.coordinator.tick(circumstances);

        return move;
    }
}
