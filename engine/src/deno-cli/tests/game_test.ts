import { assertEquals, assertThrows } from "jsr:@std/assert";

import { World, GameState } from "../../game/world.ts";
import { Player } from "../../game/player.ts";
import { nullLog } from "../_logs.ts";

const world = new World("");

const p1 = new Player(nullLog, world.rng.randInt(0, Number.MAX_SAFE_INTEGER));
const p2 = new Player(nullLog, world.rng.randInt(0, Number.MAX_SAFE_INTEGER));
const p3 = new Player(nullLog, world.rng.randInt(0, Number.MAX_SAFE_INTEGER));

Deno.test("Game starts out not ready", () => {
	assertEquals(world.isReadyToStart(), false);
});

Deno.test("Setting map alone does not make game ready", () => {
	world.setMap("arena");
	assertEquals(world.isReadyToStart(), false);
});

Deno.test("Initial player count", () => {
	assertEquals(world.players.length, 0);
});

Deno.test("First registration doesn't make game ready", () => {
	world.registerPlayer(p1);
	assertEquals(world.gameState, GameState.Setup);
	assertEquals(world.players.length, 1);
});

Deno.test("Player cannot register twice", () => {
	assertThrows<Error>(() => world.registerPlayer(p1), Error, "Player already registered!");
});

Deno.test("Second registration makes game ready", () => {
	world.registerPlayer(p2);
	assertEquals(world.gameState, GameState.Ready);
	assertEquals(world.players.length, 2);
});

Deno.test("No more than three players", () => {
	assertThrows<Error>(() => world.registerPlayer(p3), Error, "Cannot register more than two players!");
});

Deno.test("Game flips to Ready state automatically when it has map and enough players", () => {
	assertEquals(world.isReadyToStart(), true);
});
