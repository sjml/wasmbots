import { readJsonFile } from "../core/loader.ts";
import { stringToNumericEnum } from "../core/util.ts";
import { type Point, Rect } from "../core/math.ts";
import { computeFOV } from "./fov.ts";
import { TileType as TerrainTileType } from "../core/messages.ts";
import { DungeonBuilder } from "../generation/builder.ts";
import { MapPainter } from "../generation/painter.ts";


// right now assuming all maps are the same size
const MAP_WIDTH = 63;
const MAP_HEIGHT = 39;


const TILED_FLAG_FLIPPED_HORIZONTALLY    = 0x80000000;
const TILED_FLAG_FLIPPED_VERTICALLY      = 0x40000000;
const TILED_FLAG_FLIPPED_DIAGONALLY      = 0x20000000;
const TILED_FLAG_ROTATED_HEXAGONAL_120   = 0x10000000;

export enum MetaTileType {
	SpawnPoint,
	Tombstone,
}

export class Tile {
	terrainType: TerrainTileType;
	metaDatums: Set<MetaTileType>;

	constructor(terrain?: TerrainTileType) {
		this.terrainType = terrain || TerrainTileType.Void;
		this.metaDatums = new Set();
	}
}

interface TileRecord {
	terrain?: TerrainTileType;
	meta?: MetaTileType
}

export class WorldMap {
	name: string = "";
	tiles: Tile[][] = Array.from({length: MAP_HEIGHT}, () =>
		Array.from({ length: MAP_WIDTH }, () => new Tile())
	);
	spawnPoints: Point[] = [];
	minPlayers: number = 1;
	maxPlayers: number = 1;
	rawMapData: any;

	private constructor(){}

	static async generate(generatorName: string): Promise<WorldMap> {
		const builder = new DungeonBuilder();
		builder.generate(MAP_WIDTH, MAP_HEIGHT, [
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

		const painter = new MapPainter(builder.toTiled(), builder.rng);
		const tileset = await readJsonFile("$rsc/maps/tilesets/dungeon_tiles.tsj");
		painter.paint(tileset);

		const newMap = new WorldMap();
		newMap.name = `${generatorName}-{${builder.rng.seed}}`;
		newMap.rawMapData = painter.map;
		newMap.setupFromJson();
		return newMap;
	}

	static async loadStatic(mapName: string): Promise<WorldMap> {
		const newMap = new WorldMap();
		newMap.name = mapName;

		newMap.rawMapData = await readJsonFile(`$rsc/maps/static/${mapName}.tmj`);

		newMap.setupFromJson();
		return newMap;
	}

	private setupFromJson() {
		for (const tsd of this.rawMapData.tilesets) {
			const tileData: Map<number, TileRecord> = new Map();
			for (const td of tsd.tiles) {
				if (td.type === undefined) {
					continue; // nothing special here
				}
				const [genus, species] = td.type.split(".");
				if (species === undefined) {
					continue; // not one of ours
				}
				switch (genus) {
					case "Terrain":
						const terrain = stringToNumericEnum(TerrainTileType, species);
						if (terrain === undefined) {
							throw new Error(`Invalid tile type: ${td.type}`);
						}
						tileData.set(td.id, { terrain });
						continue;
					case "Meta":
						const meta = stringToNumericEnum(MetaTileType, species);
						if (meta === undefined) {
							throw new Error(`Invalid tile type: ${td.type}`);
						}
						tileData.set(td.id, { meta });
						continue;
					default:
						console.warn(`Unrecognized tile genus: ${genus}`);
						continue;
				}
			}
			tsd.tileData = tileData;
		}

		const terrainLayer = this.rawMapData.layers.find((l: { name: string; }) => l.name == "terrain");
		const metadataLayer = this.rawMapData.layers.find((l: { name: string; }) => l.name == "metadata");
		if (!terrainLayer || !metadataLayer) {
			throw new Error("Invalid map data, missing required layers!");
		}
		if (this.rawMapData.width != MAP_WIDTH || this.rawMapData.height != MAP_HEIGHT) {
			throw new Error("Invalid map data, wrong dimensions!");
		}

		const tileLookup: Map<number, TileRecord> = new Map();

		const lookupTile = (t: number): TileRecord => {
			if (tileLookup.has(t)) {
				return tileLookup.get(t)!;
			}
			const gid = t & ~(TILED_FLAG_FLIPPED_HORIZONTALLY |
				TILED_FLAG_FLIPPED_VERTICALLY |
				TILED_FLAG_FLIPPED_DIAGONALLY |
				TILED_FLAG_ROTATED_HEXAGONAL_120
			);
			if (gid == 0) {
				return {};
			}
			for (let i = this.rawMapData.tilesets.length - 1; i >= 0; i--) {
				const ts = this.rawMapData.tilesets[i];
				if (ts.firstgid <= gid) {
					const lookup = ts.tileData.get(gid - ts.firstgid)!;
					tileLookup.set(t, lookup);
					return lookup;
				}
			}
			throw new Error(`Invalid tile mapping in lookup (${gid})`);
		}

		for (let y = 0; y < MAP_HEIGHT; y++) {
			for (let x = 0; x < MAP_WIDTH; x++) {
				const t = terrainLayer.data[(y * MAP_WIDTH) + x];
				const tr = lookupTile(t);

				if (tr.terrain === undefined) {
					throw new Error(`Non-terrain tile in terrain layer: ${tr.terrain} at (${x}, ${y})`);
				}
				this.tiles[y][x].terrainType = tr.terrain;
			}
		}

		for (let y = 0; y < MAP_HEIGHT; y++) {
			for (let x = 0; x < MAP_WIDTH; x++) {
				const t = metadataLayer.data[(y * MAP_WIDTH) + x];
				const tr = lookupTile(t);

				if (tr.terrain !== undefined) {
					throw new Error(`Non-meta tile in meta layer: ${x}, ${y} -- ${Object.entries(tr)}`);
				}
				if (tr.meta === undefined) {
					continue;
				}
				this.tiles[y][x].metaDatums.add(tr.meta);
				switch (tr.meta) {
					case MetaTileType.SpawnPoint:
						this.spawnPoints.push({ x, y });
						break;
					case MetaTileType.Tombstone:
						break;
					default:
						throw new Error(`Unrecognized meta tile: ${tr.meta}`);
				}
			}
		}

		if (this.spawnPoints.length == 0) {
			throw new Error("Map has no spawn points!");
		}

		this.maxPlayers = this.rawMapData.properties?.
			find((prop: { name: string; }) => prop.name === "maxPlayers")?.value as number
			?? this.spawnPoints.length;
		this.minPlayers = this.rawMapData.properties?.
			find((prop: { name: string; }) => prop.name === "minPlayers")?.value as number
			?? 1;

		if (this.maxPlayers > this.spawnPoints.length) {
			console.warn(`Map ${this.name} declares ${this.maxPlayers} player(s) but only has ${this.spawnPoints.length} spawn point(s); using smaller value.`);
			this.maxPlayers = this.spawnPoints.length;
		}

		for (let y = 0; y < MAP_HEIGHT; y++) {
			for (let x = 0; x < MAP_WIDTH; x++) {
				// for now, should not be any void spots in the map
				// (maybe someday a howling vortex somewhere?
				//  more likely would be its own tile type and void
				//  will remain a proper nil.)
				if (this.tiles[y][x].terrainType === TerrainTileType.Void) {
					throw new Error(`Tile at ${x}, ${y} was void after map parsing`);
				}
			}
		}
	}

	static debugDrawSlice(slice: Tile[][]) {
		for (let y = 0; y < slice.length; y++) {
			console.log(slice[y].map((t, x) => {
				switch (t.terrainType) {
					case TerrainTileType.Floor:
						return ".";
					case TerrainTileType.Void:
						return " ";
					case TerrainTileType.OpenDoor:
						return "_";
					case TerrainTileType.ClosedDoor:
						return "-";
					case TerrainTileType.Wall:
						return "#";
				}
			}).join(""));
		}
	}

	getTile(x: number, y: number): Tile {
		if (x < 0 || y < 0 || x >= MAP_WIDTH || y >= MAP_WIDTH) {
			return new Tile();
		}
		return this.tiles[y][x];
	}
	getTilePt(loc: Point): Tile {
		return this.getTile(loc.x , loc.y);
	}

	getTileSlice(origin: Point, radius: number): Tile[][] {
		const size = 2 * radius + 1;
		const slice: Tile[][] = Array.from({ length: size }, () =>
			Array.from({ length: size }, () => new Tile())
		);

		for (let i = Math.max(0, origin.y - radius); i <= Math.min(origin.y + radius, this.tiles.length - 1); i++) {
			for (let j = Math.max(0, origin.x - radius); j <= Math.min(origin.x + radius, this.tiles[0].length - 1); j++) {
				slice[i - (origin.y - radius)][j - (origin.x - radius)] = this.tiles[i][j];
			}
		}

		return slice;
	}

	// outsourcing to another file because lotsa helper classes and things
	computeFOV(origin: Point, radius: number, opacityTest: TerrainTileType[]|((t: TerrainTileType) => boolean)): Tile[][] {
		return computeFOV(this, origin, radius, opacityTest);
	}
}

// // testing functionality while developing
// async function main() {
// 	const m = await WorldMap.loadTiled("dungeon");
// 	const opaqueList = [TerrainTileType.Wall, TerrainTileType.ClosedDoor];
// 	// const opaqueList = [TerrainTileType.Wall]; // letting us see through closed doors for the purposes of testing
// 	const view = m.computeFOV({x: 21, y: 4}, 2, opaqueList);
// 	WorldMap.debugDrawSlice(view);
// }

// // @ts-ignore
// if (import.meta.main) {
// 	main();
// }
