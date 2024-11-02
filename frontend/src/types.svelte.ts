import { World } from "./engine/game/world";

import { Logger } from "./engine";
import { WasmBotsVisualizer } from "./vis/game";
import type { Player } from "./engine/game/player";
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

export interface UIPlayerData {
    playerObject: Player;
    consoleLines: LogEntry[];
    visPlayer: VisPlayer|null;
}
