import * as path from "jsr:@std/path";

import { DungeonBuilder } from "../generation/builder.ts";
import { MapPainter } from "../generation/painter.ts";
import { RNG } from "../game/random.ts";
import { Rect } from "../core/math.ts";

if (Deno.args.length == 0) {
	console.error("Give an output path.");
	Deno.exit(1);
}

const builder = new DungeonBuilder({rng: new RNG(null)});
builder.generate(63, 39, [
	{
		id: "spawnRoom1",
		rect: new Rect(1, 1, 3, 3),
		metas: [{
			position: {x: 2, y: 2},
			type: "SpawnPoint"
		}]
	},
	{
		id: "spawnRoom2",
		rect: new Rect(59, 1, 3, 3),
		metas: [{
			position: {x: 60, y: 2},
			type: "SpawnPoint"
		}]
	},
	{
		id: "spawnRoom3",
		rect: new Rect(1, 35, 3, 3),
		metas: [{
			position: {x: 2, y: 36},
			type: "SpawnPoint"
		}]
	},
	{
		id: "spawnRoom4",
		rect: new Rect(59, 35, 3, 3),
		metas: [{
			position: {x: 60, y: 36},
			type: "SpawnPoint"
		}]
	},
]);

Deno.writeTextFileSync(Deno.args[0], builder.toJSON());

const painter = new MapPainter(builder.toTiled(), builder.rng);
const tilesetPath = path.join(import.meta.dirname!, "..", "..", "rsc", "maps", "tilesets", "dungeon_tiles.tsj");
const tileset = JSON.parse(Deno.readTextFileSync(tilesetPath));

painter.paint(tileset);

Deno.writeTextFileSync(Deno.args[0], painter.toJSON());
