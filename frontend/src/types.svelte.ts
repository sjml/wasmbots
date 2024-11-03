import { World } from "./engine/game/world";

import { Logger } from "./engine";
import { WasmBotsVisualizer } from "./vis/game";
import { Player } from "./engine/game/player";
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
    visPlayer: VisPlayer|null = null;

    private constructor() {}

    static makingNewPlayer(world: World, rngSeed?: number) {
        const uipd = new UIPlayerData();
        rngSeed ||= world.rng.randInt(0, Number.MAX_SAFE_INTEGER);
        const player = new Player(uipd.selfLog, rngSeed);
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
