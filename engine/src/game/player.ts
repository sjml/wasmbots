import { type Coordinator, CoordinatorStatus } from "../core/coordinator.ts";
import * as CoreMsg from "../core/messages.ts";

import config from "../core/config.ts";
import { type Point } from "../core/math.ts";
import { LogLevel } from "../core/logger.ts";

export class Player {
	private _programBytes: Uint8Array = new Uint8Array();
	coordinator!: Coordinator;
	name: string;
	version: number[];

	// remember that anything added here needs to be dealt with in the reset
	lastMoveStatus: CoreMsg.MoveResult;
	location: Point;
	spawnPoint: Point;
	hitPoints: number;
	stride: number;
	openReach: number;

	constructor() {
		this.name = "";
		this.version = [];

		this.lastMoveStatus = CoreMsg.MoveResult.Succeeded;
		this.location = {x: -1, y: -1};
		this.spawnPoint = this.location;
		this.hitPoints = config.startingHitPoints;
		this.stride = config.defaultPlayerStride;
		this.openReach = config.defaultPlayerOpenReach;
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

		this.lastMoveStatus = CoreMsg.MoveResult.Succeeded;
		this.location = this.spawnPoint;
		this.hitPoints = config.startingHitPoints;
		this.stride = config.defaultPlayerStride;
		this.openReach = config.defaultPlayerOpenReach;

		this.coordinator.reset();
		await this.coordinator.untilReady();
		return true;
	}

	async tickTurn(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message> {
		circumstances.lastMoveResult = this.lastMoveStatus;

		const move = await this.coordinator.tick(circumstances);

		return move;
	}
}
