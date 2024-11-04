import { WasmCoordinator } from "../worker/wasm-coordinator.ts";
import { CoordinatorStatus } from "../core/coordinator.ts";
import * as CoreMsg from "../core/messages.ts";

import config from "../core/config.ts";
import { type Point } from "./map.ts";
import { LogLevel, type LogFunction } from "../core/logger.ts";

export class Player {
    private _programBytes: Uint8Array = new Uint8Array();
    coordinator: WasmCoordinator;
    name: string;
    version: number[];

    // remember that anything added here needs to be dealt with in the reset
    location: Point;
    spawnPoint: Point;
    hitPoints: number;
    lastMoveSucceeded: boolean;

    constructor(logger: LogFunction, rngSeed: number) {
        this.coordinator = new WasmCoordinator(this, logger, rngSeed);
        this.name = "";
        this.version = [];

        this.location = {x: -1, y: -1};
        this.spawnPoint = this.location;
        this.hitPoints = config.startingHitPoints;
        this.lastMoveSucceeded = true;
    }

    async init(programBytes: Uint8Array, cloneProgram: boolean = true): Promise<boolean> {
        if (cloneProgram) {
            this._programBytes = programBytes.slice();
        }
        this.coordinator.kickoff(programBytes);
        await this.coordinator.untilReady();
        if (this.coordinator.status == CoordinatorStatus.Shutdown) {
            return false;
        }
        return true;
    }

    async reset(): Promise<boolean> {
        const logger = this.coordinator.logger;
        const seed = this.coordinator.rngSeed;
        logger(LogLevel.Info, "-------- RESETTING");
        this.coordinator = new WasmCoordinator(this, logger, seed);
        this.hitPoints = config.startingHitPoints;
        this.lastMoveSucceeded = true;
        this.location = this.spawnPoint;
        return await this.init(this._programBytes, false);
    }

    async tickTurn(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message> {
        circumstances.lastMoveSucceeded = this.lastMoveSucceeded;

        const move = await this.coordinator.tick(circumstances);

        return move;
    }
}
