import { assertEquals, assertThrows } from "jsr:@std/assert";

import { World } from "../../game/world.ts";
import { Player } from "../../game/player.ts";

const world = new World("");

const p1 = new Player("A");
const p2 = new Player("B");
const p3 = new Player("C");

Deno.test("Game starts out not ready", () => {
    assertEquals(world.isReadyToStart(), false);
});

Deno.test("Initial player count", () => {
    assertEquals(world.getPlayerCount(), 0);
});

Deno.test("First registration doesn't make game ready", () => {
    assertEquals(world.registerPlayer(p1), false);
    assertEquals(world.getPlayerCount(), 1);
});

Deno.test("Player cannot register twice", () => {
    assertThrows<Error>(() => world.registerPlayer(p1), Error, "Player already registered!");
});

Deno.test("Second registration makes game ready", () => {
    assertEquals(world.registerPlayer(p2), true);
    assertEquals(world.getPlayerCount(), 2);
});

Deno.test("No more than three players", () => {
    assertThrows<Error>(() => world.registerPlayer(p3), Error, "Cannot register more than two players!");
});

Deno.test("Players alone not enough to start game", () => {
    assertEquals(world.isReadyToStart(), false);
});
