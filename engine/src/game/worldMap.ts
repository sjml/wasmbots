import { readTextFile, } from "../core/loader.ts";
import { pathJoin } from "../core/util.ts";

// right now assuming all maps are the same size
const MAP_WIDTH: number = 64;
const MAP_HEIGHT: number = 40;

export enum TileType {
    Empty,
    Wall,
}

// so effing tempting to over-engineer this (especially after years of
//   Advent of Code) but let's take a YAGNI approach
export class WorldMap {
    tiles: TileType[][] = Array.from({length: MAP_HEIGHT}, () => Array(MAP_WIDTH).fill(TileType.Empty));

    static async loadStatic(mapName): Promise<WorldMap> {
        const newMap = new WorldMap();
        const mapText = await readTextFile(pathJoin("$rsc/maps/static", `${mapName}.txt`));
        mapText.split("\n").forEach((rowStr: string, y: number) => {
            for (const [x, t] of Array.from(rowStr).entries()) {
                if (t === "#") {
                    newMap.tiles[y][x] = TileType.Wall;
                }
            }
        });

        return newMap;
    }
}

