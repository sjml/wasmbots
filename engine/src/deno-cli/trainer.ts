import { Player } from "../game/player.ts";
import { World } from "../game/world.ts";
import { TrainerCoordinator } from "../trainer/trainer-coordinator.ts";
import { log } from "./_logs.ts";
import { sleep } from "../core/util.ts";


// eventually take this as program argument, have it start up automatically?
// const programPath = `${import.meta.dirname}../../example_bots_src/explorer_zig/zig-out/bin/explorer-trainer`;

async function main(): Promise<void> {
    const player = new Player();
    const coord = new TrainerCoordinator(player, log, 0);
    await player.init(coord);
    coord.logger = log;

    const world = new World(null);
    await world.setMap("dungeon");
    world.registerPlayer(player);
    world.startGame();


    console.log("start:", player.location);

    for (let i = 0; i < 2; i++) {
        await sleep(1);
        await world.runTurn();
        console.log(player.location);
    }
}

try {
    main();
}
catch (err) {
    console.error(err);
    Deno.exit(1);
}
