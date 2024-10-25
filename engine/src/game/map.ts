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
            throw new Error(`ERROR: Invalid tile mapping in lookup (${gid})`);
        }

        for (let y = 0; y < MAP_HEIGHT; y++) {
            for (let x = 0; x < MAP_WIDTH; x++) {
                const t = terrainLayer.data[(y * MAP_WIDTH) + x];
                const tt = lookupTile(t);
                if (tt >= TileType.TERRAIN_MAX) {
                    throw new Error("ERROR: Non-terrain tile in terrain layer");
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


        return newMap;
    }

    static debugDrawSlice(slice: TileType[][]) {
        for (let y = 0; y < slice.length; y++) {
            console.log(slice[y].map(t => {
                if (t === TileType.Empty) {
                    return " ";
                }
                if (t === TileType.Void) {
                    return "*";
                }
                if (t === TileType.Wall) {
                    return "#";
                }
            }).join(""));
        }
    }

    getTileSlice(x: number, y: number, radius: number): TileType[][] {
        const size = 2 * radius + 1;
        const slice: TileType[][] = Array.from({ length: size }, () =>
            Array(size).fill(TileType.Void)
        );

        for (let i = Math.max(0, y - radius); i <= Math.min(y + radius, this.tiles.length - 1); i++) {
            for (let j = Math.max(0, x - radius); j <= Math.min(x + radius, this.tiles[0].length - 1); j++) {
                slice[i - (y - radius)][j - (x - radius)] = this.tiles[i][j];
            }
        }

        return slice;
    }

    getTile(x: number, y: number): TileType {
        return this.tiles[y][x];
    }
}

// const m = await WorldMap.loadTiled("arena");
// WorldMap.debugDrawSlice(m.tiles);
