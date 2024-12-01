import { Player } from "../game/player.ts";
import { World } from "../game/world.ts";
import { TrainerCoordinator } from "../trainer/trainer-coordinator.ts";
import { log } from "./_logs.ts";
import { sleep } from "../core/util.ts";
import { CoordinatorStatus } from "../core/coordinator.ts";
import { GameState, Config, RNG } from "../index.ts";

// eventually take this as program argument, have it start up automatically?
// const programPath = `${import.meta.dirname}../../example_bots_src/explorer_zig/zig-out/bin/explorer-trainer`;

// TODO: make this a command line parameter
const MAX_TURNS = 0; // 0 or negative makes it run until the world is shutdown

async function main(): Promise<void> {
	const player = new Player();
	const coord = new TrainerCoordinator(player, log, 0);
	await player.init(coord);
	coord.logger = log;

	// don't need to bother turning off the time limits because
	//   the TrainerCoordinator neither tracks nor enforces them.
	// (the `minimumTurnTime` is only used by the visualizations, so
	//   *also* shouldn't matter but hitting it here because it's not
	//   fully blocked by the coordinator the same way the others are.)
	Config.minimumTurnTime = 0;

	const world = new World(null);
	await world.setMap("dungeon", new RNG(null), {});
	world.registerPlayer(player);
	world.startGame();


	console.log("start:", player.location);

	function loop(numIterations: number = 0) {
		let iterations = 0;
		return () => numIterations <= 0 || iterations++ < numIterations;
	}

	while (loop(MAX_TURNS)()) {
		await sleep(1); // servers don't like getting hammered, but this almost nominal delay seems to be enough
		await world.runTurn();
		console.log(player.location);
		if (player.coordinator.status === CoordinatorStatus.Shutdown) {
			break;
		}
		if (world.gameState !== GameState.Running) {
			break;
		}
	}
}

try {
	main();
}
catch (err) {
	console.error(err);
	Deno.exit(1);
}
