import { World, Logger, Player } from "wasmbots";
import { WasmBotsVisualizer } from "./vis/game";
import type { VisPlayer } from "./vis/player";

export interface WasmBotsState {
	world: World|null;
	vis: WasmBotsVisualizer|null;
}

export type BotInfo = {
	[K in string]: { source: string, name: string};
};

export interface LogEntry {
	level: Logger.LogLevel;
	msg: string;
};

const MAX_LOG_ENTRIES = 1000;
export class UIPlayerData {
	playerObject!: Player;
	consoleLines: LogEntry[] = $state([]);
	visPlayer: VisPlayer|null = $state(null);

	private constructor() {}

	static makingNewPlayer(world: World) {
		const uipd = new UIPlayerData();
		const player = new Player();
		uipd.playerObject = player;
		return uipd;
	}

	selfLog = (level: Logger.LogLevel, msg: string) => {
		this.consoleLines = [
			...this.consoleLines,
			{level, msg}
		].slice(-MAX_LOG_ENTRIES);
	}
}
