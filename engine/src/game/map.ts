import { readJsonFile } from "../core/loader.ts";
import { stringToNumericEnum } from "../core/util.ts";

// right now assuming all maps are the same size
const MAP_WIDTH = 64;
const MAP_HEIGHT = 40;


const TILED_FLAG_FLIPPED_HORIZONTALLY    = 0x80000000;
const TILED_FLAG_FLIPPED_VERTICALLY      = 0x40000000;
const TILED_FLAG_FLIPPED_DIAGONALLY      = 0x20000000;
const TILED_FLAG_ROTATED_HEXAGONAL_120   = 0x10000000;

export enum TileType {
    Void,
    Empty,
    OpenDoor,
    ClosedDoor,
    Wall,
    TERRAIN_MAX,

    SpawnPoint,
}

export interface Point {
    x: number;
    y: number;
}


export class WorldMap {
    source: string = "";
    name: string = "";
    tiles: TileType[][] = Array.from({length: MAP_HEIGHT}, () => Array(MAP_WIDTH).fill(TileType.Empty));
    spawnPoints: Point[] = [];
    minPlayers: number = 1;
    maxPlayers: number = 1;

    static async loadTiled(mapName: string): Promise<WorldMap> {
        const newMap = new WorldMap();
        newMap.name = mapName;
        newMap.source = `$rsc/maps/static/${mapName}.tmj`;

        const rawMapData = await readJsonFile(newMap.source);

        for (const tsd of rawMapData.tilesets) {
            const tileData: Map<number, TileType> = new Map();
            for (const td of tsd.tiles) {
                tileData.set(td.id, stringToNumericEnum(TileType, td.type) || TileType.Void);
            }
            tsd.tileData = tileData;
        }

        const terrainLayer  = rawMapData.layers.find((l: {name: string}) => l.name == "terrain");
        const metadataLayer = rawMapData.layers.find((l: {name: string}) => l.name == "metadata");
        if (!terrainLayer || !metadataLayer) {
            throw new Error("Invalid map data, missing required layers!");
        }
        if (rawMapData.width != MAP_WIDTH || rawMapData.height != MAP_HEIGHT) {
            throw new Error("Invalid map data, wrong dimensions!");
        }

        const tileLookup: Map<number, TileType> = new Map();

        function lookupTile(t: number): TileType {
            if (tileLookup.has(t)) {
                return tileLookup.get(t)!;
            }
            const gid = t & ~(TILED_FLAG_FLIPPED_HORIZONTALLY  |
                              TILED_FLAG_FLIPPED_VERTICALLY    |
                              TILED_FLAG_FLIPPED_DIAGONALLY    |
                              TILED_FLAG_ROTATED_HEXAGONAL_120
                             );
            if (gid == 0) {
                return TileType.Void;
            }
            for (let i = rawMapData.tilesets.length - 1; i >= 0; i--) {
                const ts = rawMapData.tilesets[i];
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
                const tt = lookupTile(t);
                if (tt >= TileType.TERRAIN_MAX) {
                    throw new Error("Non-terrain tile in terrain layer");
                }
                newMap.tiles[y][x] = tt;
            }
        }

        for (let y = 0; y < MAP_HEIGHT; y++) {
            for (let x = 0; x < MAP_WIDTH; x++) {
                const t = metadataLayer.data[(y * MAP_WIDTH) + x];
                const tt = lookupTile(t);
                if (tt == TileType.SpawnPoint) {
                    newMap.spawnPoints.push({x, y});
                }
            }
        }

        if (newMap.spawnPoints.length == 0) {
            throw new Error("Map has no spawn points!");
        }

        newMap.maxPlayers = rawMapData.properties?.
            find(prop => prop.name === "maxPlayers")?.value as number
            ?? newMap.spawnPoints.length;
        newMap.minPlayers = rawMapData.properties?.
            find(prop => prop.name === "minPlayers")?.value as number
            ?? 1;

        if (newMap.maxPlayers > newMap.spawnPoints.length) {
            console.warn(`Map ${mapName} declares ${newMap.maxPlayers} but only has ${newMap.spawnPoints.length}; using smaller value.`);
            newMap.maxPlayers = newMap.spawnPoints.length;
        }

        return newMap;
    }

    static debugDrawSlice(slice: TileType[][]) {
        for (let y = 0; y < slice.length; y++) {
            console.log(slice[y].map(t => {
                switch (t) {
                    case TileType.Empty:
                        return ".";
                    case TileType.Void:
                        return " ";
                    case TileType.OpenDoor:
                        return "_";
                    case TileType.ClosedDoor:
                        return "-";
                    case TileType.Wall:
                        return "#";
                }
            }).join(""));
        }
    }

    getTile(x: number, y: number): TileType {
        if (x < 0 || y < 0 || x >= MAP_WIDTH || y >= MAP_WIDTH) {
            return TileType.Void;
        }
        return this.tiles[y][x];
    }
    getTilePt(loc: Point): TileType {
        return this.getTile(loc.x , loc.y);
    }

    getTileSlice(origin: Point, radius: number): TileType[][] {
        const size = 2 * radius + 1;
        const slice: TileType[][] = Array.from({ length: size }, () =>
            Array(size).fill(TileType.Void)
        );

        for (let i = Math.max(0, origin.y - radius); i <= Math.min(origin.y + radius, this.tiles.length - 1); i++) {
            for (let j = Math.max(0, origin.x - radius); j <= Math.min(origin.x + radius, this.tiles[0].length - 1); j++) {
                slice[i - (origin.y - radius)][j - (origin.x - radius)] = this.tiles[i][j];
            }
        }

        return slice;
    }

    calculateLineOfSight(origin: Point, radius: number, opacityTest: TileType[]|((t: TileType) => boolean)) {
        const size = 2 * radius + 1;
        const calculatedSlice: TileType[][] = Array.from({ length: size }, () =>
            Array(size).fill(TileType.Void)
        );

        const globalToLocal = (global: Point): Point => {
            return { x: global.x - origin.x + radius, y: global.y - origin.y + radius };
        }
        const localToGlobal = (local: Point): Point => {
            return { x: local.x + origin.x, y: local.y + origin.y };
        }
        const setVisible = (globalLocation: Point, tile?: TileType) => {
            const loc = globalToLocal(globalLocation);
            calculatedSlice[loc.y][loc.x] = tile || this.getTilePt(globalLocation);
        }

        // origin always visible
        setVisible(origin);



        return calculatedSlice;
    }
}

const m = await WorldMap.loadTiled("dungeon");
const opaqueList = [TileType.Wall, TileType.ClosedDoor];
// const opaqueList = [TileType.Wall]; // letting us see through closed doors for the purposes of testing
const view = m.calculateLineOfSight({x: 19, y: 17}, 5, opaqueList);
WorldMap.debugDrawSlice(view);
