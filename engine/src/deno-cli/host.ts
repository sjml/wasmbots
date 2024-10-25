import { LogLevel } from "../core/logger.ts";
import { World, GameState } from "../game/world.ts";
import { Player } from "../game/player.ts";
import { WorldMap } from "../game/map.ts";

if (Deno.args.length == 0) {
    console.error("Give at least one file path.")
    Deno.exit(1);
}

function log(level: LogLevel, msg: string) {
    switch (level) {
        case LogLevel.Error:
            console.error(msg);
            break;
        case LogLevel.Warn:
            console.warn(msg);
            break;
        case LogLevel.Log:
            console.log(msg);
            break;
        case LogLevel.Info:
            console.info(msg);
            break;
        case LogLevel.Debug:
            console.debug(msg);
            break;
    }
}

function nullLog(_level: LogLevel, _msg: string) {};

const world = new World(null);
const map = await WorldMap.loadTiled("arena");
world.setMap(map);
const playerA = new Player(log, world.rng.randInt(0, Number.MAX_SAFE_INTEGER));
const progA = await Deno.readFile(Deno.args[0]);
await playerA.init(progA);
world.registerPlayer(playerA);

const playerB = new Player(log, world.rng.randInt(0, Number.MAX_SAFE_INTEGER));
const progB = Deno.args.length > 1 ? await Deno.readFile(Deno.args[1]) : progA;
await playerB.init(progB);
world.registerPlayer(playerB);

world.startGame();
while (world.gameState != GameState.Shutdown) {
    await world.runTurn();
}

Deno.exit(0);
