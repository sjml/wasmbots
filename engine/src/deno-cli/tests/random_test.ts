import { assertEquals } from "jsr:@std/assert";

import { RNG } from "../../game/random.ts";


Deno.test("Random shuffle", () => {
    const rng = new RNG("");
    const arr = ["A", "B", "C"];
    rng.shuffle(arr);
    assertEquals(arr, ["A", "C", "B"]); // result of empty seed
});
