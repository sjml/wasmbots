import * as path from "jsr:@std/path";

import { DungeonBuilder } from "../generation/builder.ts";
import { MapPainter } from "../generation/painter.ts";
import { RNG } from "../game/random.ts";
import { Rect } from "../core/math.ts";
import config from "../core/config.ts";

if (Deno.args.length == 0) {
	console.error("Give an output path.");
	Deno.exit(1);
}

// const builder = new DungeonBuilder(new RNG(null));
const builder = new DungeonBuilder(new RNG(2119213253));
builder.generate(config.mapWidth, config.mapHeight, [
	{
		id: "SpawnRoom_1",
		rect: new Rect(1, 1, 3, 3),
		metas: [{
			position: {x: 2, y: 2},
			type: "SpawnPoint"
		}]
	},
	{
		id: "SpawnRoom_2",
		rect: new Rect(61, 1, 3, 3),
		metas: [{
			position: {x: 62, y: 2},
			type: "SpawnPoint"
		}]
	},
	{
		id: "SpawnRoom_3",
		rect: new Rect(1, 37, 3, 3),
		metas: [{
			position: {x: 2, y: 38},
			type: "SpawnPoint"
		}]
	},
	{
		id: "SpawnRoom_4",
		rect: new Rect(61, 37, 3, 3),
		metas: [{
			position: {x: 62, y: 38},
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
