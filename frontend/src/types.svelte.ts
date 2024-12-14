import { Config, World, Logger, Player, type DungeonBuilderOptions, DungeonBuilder } from "wasmbots";
import { WasmBotsVisualizer } from "./vis/game";
import type { VisPlayer } from "./vis/player";

export interface WasmBotsState {
	world: World|null;

	mapLoading: boolean;
	currentMapOptionString: string;
	mapSeed: string,
	mapSeedLocked: boolean;
	mapGeneratorOptions: DungeonBuilderOptions;
}

export const DefaultWasmBotsState: WasmBotsState = Object.freeze({
	world: null,
	vis: null,

	mapLoading: false,
	currentMapOptionString: "",
	mapSeed: "",
	mapSeedLocked: false,
	mapGeneratorOptions: DungeonBuilder.optionsDefaults,
});

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
	isZoomed: boolean = $state(false);

	constructor() {
		this.playerObject = new Player();
	}

	selfLog = (level: Logger.LogLevel, msg: string) => {
		this.consoleLines = [
			...this.consoleLines,
			{level, msg}
		].slice(-MAX_LOG_ENTRIES);
	}
}

export type SetupInfo = {
	botUrlList?: string[],
	map?: string;
	worldSeed?: string | null;
	mapSeed?: string | null;
	mapOptions?: DungeonBuilderOptions;
};
