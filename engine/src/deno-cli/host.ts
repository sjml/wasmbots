import { Config, World, RNG, Player, WasmCoordinator, GameState } from "../index.ts";
import { log } from "./_logs.ts";

if (Deno.args.length == 0) {
	console.error("Give at least one file path.")
	Deno.exit(1);
}

Config.minimumTurnTime = 0;
Config.turnTimeBuffer = 0;

const world = new World(null);
await world.setMap("dynamic:dungeon", new RNG(null), {});


const playerList: Player[] = [];
for (const botPath of Deno.args) {
	const player = new Player();
	const wasmBytes = await Deno.readFile(botPath);
	const coord = new WasmCoordinator(player, log, 0, wasmBytes);
	const playerReady = await player.init(coord);
	if (playerReady) {
		playerList.push(player);
		world.registerPlayer(player);
	}
}

world.startGame();

let count = 0;
while (world.gameState != GameState.Shutdown) {
	count++;
	// console.log(`Turn ${count}`);
	await world.runTurn();
}

Deno.exit(0);
