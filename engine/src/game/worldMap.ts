import { readTextFile, } from "../core/loader.ts";
import { pathJoin } from "../core/util.ts";

// right now assuming all maps are the same size
const MAP_WIDTH = 64;
const MAP_HEIGHT = 40;

export enum TileType {
    Void,
    Empty,
    Wall,
}

export interface Point {
    x: number;
    y: number;
}

// so effing tempting to over-engineer this but after years of
//   Advent of Code, I say let's take a YAGNI approach
export class WorldMap {
    tiles: TileType[][] = Array.from({length: MAP_HEIGHT}, () => Array(MAP_WIDTH).fill(TileType.Empty));
    spawnPoints: Point[] = [];

    static async loadStatic(mapName): Promise<WorldMap> {
        const newMap = new WorldMap();
        const mapText = await readTextFile(pathJoin("$rsc/maps/static", `${mapName}.txt`));
        mapText.split("\n").forEach((rowStr: string, y: number) => {
            for (const [x, t] of Array.from(rowStr).entries()) {
                if (t === "#") {
                    newMap.tiles[y][x] = TileType.Wall;
                }
                if (t === "P") {
                    newMap.spawnPoints.push({x, y});
                }
            }
        });

        return newMap;
    }

    static drawSlice(slice: TileType[][]) {
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
}
