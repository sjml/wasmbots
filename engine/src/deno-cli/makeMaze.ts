// a simple port of Robert Nystrom's "Rooms and Mazes" generator from Dart
//     https://journal.stuffwithstuff.com/2014/12/21/rooms-and-mazes/

// outputs a very boring looking .tmj file that I will likely paint over

import * as path from "jsr:@std/path";


import { RNG } from "../game/random.ts";

enum TileType {
    Empty,
    OpenDoor,
    ClosedDoor,
    Wall,
}

class Rect {
    readonly x: number = 0;
    readonly y: number = 0;
    readonly width: number = 0;
    readonly height: number = 0;
    readonly top: number;
    readonly right: number;
    readonly bottom: number;
    readonly left: number;

    constructor(x: number, y: number, width: number, height: number) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.top = y;
        this.right = x + width;
        this.bottom = y + height;
        this.left = x;
    }

    overlaps(other: Rect): boolean {
        if (this.right <= other.x || other.right <= this.left) {
            return false;
        }
        if (this.bottom <= other.top || other.bottom <= this.top) {
            return false;
        }
        return true;
    }

    contains(pt: Point): boolean {
        if (
               (pt.x < this.left)
            || (pt.y < this.top)
            || (pt.x >= this.right)
            || (pt.y >= this.bottom)
        ) {
            return false;
        }
        return true;
    }

    inflate(delta: number): Rect {
        return new Rect(
            this.x - delta,
            this.y - delta,
            this.width  + (delta * 2),
            this.height + (delta * 2),
        );
    }

    *squares(): Generator<Point> {
        for (let y = this.y; y < this.y + this.height; y++) {
            for (let x = this.x; x < this.x + this.width; x++) {
                yield new Point(x, y);
            }
        }
    }
}

class Array2D<T> {
    entries: T[][] = [];
    private _width: number = 0;
    private _height: number = 0;

    constructor(width: number, height: number, fill: T) {
        this.entries = Array.from({ length: height }, () =>
            Array.from({ length: width }, () => fill)
        );
        this._width = width;
        this._height = height;
    }

    get width(): number {
        return this._width;
    }

    get height(): number {
        return this._height;
    }

    get(pos: Point): T {
        return this.entries[pos.y][pos.x];
    }

    set(pos: Point, val: T) {
        this.entries[pos.y][pos.x] = val;
    }

    expand(x: number, y: number, fill: T) {
        if (x > 0) {
            for (const row of this.entries) {
                row.push(...Array(x).fill(fill));
            }
            this._width += x;
        }
        if (y > 0) {
            const newRows = Array.from({ length: y }, () => Array(this._width).fill(fill));
            this.entries.push(...newRows);
            this._height += y;
        }
    }
}

class Point {
    x: number;
    y: number;

    constructor(x: number, y: number) {
        this.x = x;
        this.y = y;
    }

    advance(dir: Direction, steps: number = 1): Point {
        switch (dir) {
            case Direction.East:
                return new Point(this.x + 1*steps, this.y + 0*steps);
            case Direction.South:
                return new Point(this.x + 0*steps, this.y + 1*steps);
            case Direction.West:
                return new Point(this.x - 1*steps, this.y + 0*steps);
            case Direction.North:
                return new Point(this.x + 0*steps, this.y - 1*steps);
        }
    }

    manhattanDistance(other: Point): number {
        return Math.abs(this.y - other.y) + Math.abs(this.x - other.x);
    }
}

enum Direction {
    East,
    South,
    West,
    North,
}

const numRoomTries = 200;

// The inverse chance of adding a connector between two regions that have
// already been joined. Increasing this leads to more loosely connected
// dungeons.
const extraConnectorChance = 20;

// Increasing this allows rooms to be larger.
const roomExtraSize = 0;

const windingPercent = 0;

function generate(mapWidth: number, mapHeight: number, rng?: RNG): Array2D<TileType> {
    function carve(pos: Point, t: TileType = TileType.Empty) {
        _tiles.set(pos, t);
        _regions.set(pos, currentRegion);
    }

    function canCarve(pos: Point, dir: Direction) {
        if (!_worldBounds.contains(pos.advance(dir, 3))) {
            return false;
        }
        const adv = pos.advance(dir, 2);
        return _tiles.get(adv) === TileType.Wall;
    }

    function addJunction(pos: Point) {
        if (rng!.oneIn(4)) {
            _tiles.set(pos, rng!.oneIn(3) ? TileType.OpenDoor : TileType.Empty);
        }
        else {
            _tiles.set(pos, TileType.ClosedDoor);
        }
    }

    function growMaze(start: Point) {
        const cells: Point[] = [];
        let lastDir: number|null = null;

        currentRegion += 1;
        carve(start);

        cells.push(start);
        while (cells.length > 0) {
            const cell = cells[cells.length-1];
            const unmadeCells: Direction[] = [];
            if (canCarve(cell, Direction.East))  { unmadeCells.push(Direction.East); }
            if (canCarve(cell, Direction.South)) { unmadeCells.push(Direction.South); }
            if (canCarve(cell, Direction.West))  { unmadeCells.push(Direction.West); }
            if (canCarve(cell, Direction.North)) { unmadeCells.push(Direction.North); }

            if (unmadeCells.length > 0) {
                let dir;
                if (unmadeCells.indexOf(lastDir!) >= 0 && rng!.randInt(0, 100) > windingPercent) {
                    dir = lastDir;
                }
                else {
                    dir = rng!.pickOne(unmadeCells);
                }

                carve(cell.advance(dir!));
                carve(cell.advance(dir!, 2));

                cells.push(cell.advance(dir!, 2));
                lastDir = dir;
            }
            else {
                cells.pop();
                lastDir = null;
            }
        }
    }

    function connectRegions() {
        const connectorRegions: Map<Point, Set<number>> = new Map();
        for (const pos of _worldBounds.inflate(-1).squares()) {
            if (_tiles.get(pos) != TileType.Wall) {
                continue;
            }

            const regions = new Set<number>();
            for (const dir of [Direction.East, Direction.South, Direction.West, Direction.North]) {
                const region = _regions.get(pos.advance(dir));
                if (region != null) {
                    regions.add(region);
                }
            }

            if (regions.size < 2) {
                continue;
            }

            connectorRegions.set(pos, regions);
        }

        let connectors = Array.from(connectorRegions.keys());

        // set up merged map (each region is merged with itself already)
        const merged: Map<number, number> = new Map();
        const openRegions = new Set<number>();
        for (let i = 0; i < currentRegion; i++) {
            merged.set(i, i);
            openRegions.add(i);
        }

        // keep connecting regions until we're down to one
        while (openRegions.size > 1) {
            const connector = rng!.pickOne(connectors);

            addJunction(connector);

            const regions = Array.from(
                connectorRegions.get(connector)!,
                r => merged.get(r)!
            );
            const dest = regions[0];
            const sources = regions.slice(1);

            for (let i = 0; i < currentRegion; i++) {
            if (sources.indexOf(merged.get(i)!) >= 0) {
                    merged.set(i, dest);
                }
            }

            sources.forEach(r => openRegions.delete(r));

            connectors = connectors.filter(pos => {
                if (connector.manhattanDistance(pos) < 2) {
                    return false;
                }

                const regions = new Set(Array.from(connectorRegions.get(pos)!, region => merged.get(region)!));
                if (regions.size > 1) {
                    return true;
                }

                if (rng?.oneIn(extraConnectorChance)) {
                    addJunction(pos);
                }

                return false;
            });
        }
    }

    function removeDeadEnds() {
        let done = false;

        while (!done) {
            done = true;

            for (const pos of _worldBounds.inflate(-1).squares()) {
                if (_tiles.get(pos) === TileType.Wall) {
                    continue;
                }

                // if it only has one exit, it's a dead end
                let exits = 0;
                for (const dir of [Direction.East, Direction.South, Direction.West, Direction.North]) {
                    if (_tiles.get(pos.advance(dir)) !== TileType.Wall) {
                        exits += 1;
                    }
                }

                if (exits != 1) {
                    continue;
                }

                done = false;
                _tiles.set(pos, TileType.Wall);
            }
        }
    }

    if (mapWidth % 2 == 0 || mapHeight % 2 == 0) {
        throw new Error("The stage must be odd-sized.");
    }

    if (!rng) {
        rng = new RNG(null);
    }

    const _worldBounds = new Rect(0, 0, mapWidth, mapHeight);

    const _rooms: Rect[] = [];
    let currentRegion = -1;
    const _regions: Array2D<number|null> = new Array2D(mapWidth, mapHeight, null);

    const _tiles = new Array2D<TileType>(mapWidth, mapHeight, TileType.Wall);

    // add rooms
    for (let i = 0; i < numRoomTries; i++) {
        const size = rng.randInt(1, 3 + roomExtraSize) * 2 + 1;
        const rectangularity = rng.randInt(0, 1 + Math.floor(size/2)) * 2;
        let roomWidth = size;
        let roomHeight = size;
        if (rng.pickOne([0,1]) == 0) {
            roomWidth += rectangularity;
        }
        else {
            roomHeight += rectangularity;
        }

        const x = rng.randInt(0, Math.floor((mapWidth - roomWidth) / 2)) * 2 + 1;
        const y = rng.randInt(0, Math.floor((mapHeight - roomHeight) / 2)) * 2 + 1;

        const room: Rect = new Rect(x, y, roomWidth, roomHeight);

        let overlaps = false;
        for (const other of _rooms) {
            if (room.overlaps(other)) {
                overlaps = true;
                break;
            }
        }
        if (overlaps) continue;

        _rooms.push(room);

        currentRegion += 1;
        for (const pos of room.squares()) {
            carve(pos);
        }
    }

    // fill empty space with mazes
    for (let y = 1; y < mapHeight; y += 2) {
        for (let x = 1; x < mapWidth; x += 2) {
            if (_tiles.get(new Point(x, y)) !== TileType.Wall) {
                continue;
            }

            growMaze(new Point(x,y));
        }
    }

    connectRegions();
    removeDeadEnds();

    return _tiles;
}

if (Deno.args.length == 0) {
    console.error("Give an output path.");
    Deno.exit(1);
}

const WORLD_WIDTH = 64;
const WORLD_HEIGHT = 40;

const mapWidth  = WORLD_WIDTH  % 2 == 1 ? WORLD_WIDTH  : WORLD_WIDTH - 1;
const mapHeight = WORLD_HEIGHT % 2 == 1 ? WORLD_HEIGHT : WORLD_HEIGHT - 1;

const world = generate(mapWidth, mapHeight);

if (mapWidth != WORLD_WIDTH || mapHeight != WORLD_HEIGHT) {
    world.expand(WORLD_WIDTH - mapWidth, WORLD_HEIGHT - mapHeight, TileType.Wall);
}

const templatePath = path.join(import.meta.dirname!, "..", "data", "squareMapTemplate.json");
const templateJson = Deno.readTextFileSync(templatePath);
const templateData = JSON.parse(templateJson);

templateData.width = world.width;
templateData.height = world.height;

templateData.layers[0].data = world.entries.flat().map(t => (t as number) + 1);
templateData.layers[0].width = world.width;
templateData.layers[0].height = world.height;


let outputJson = JSON.stringify(templateData, null, 2);
outputJson = outputJson.replace(/"data": \[([^\]]+)\]/m, (_, content: string) => {
    const items = content.split(/,\s*/);

    const wrapped = items.reduce((acc: string[][], item: string, idx: number) => {
        if (idx % world.width == 0) {
            acc.push([]);
        }
        acc[acc.length - 1].push(item.trim());
        return acc;
    }, []).map(row => `        ${row.join(", ")}`);

    return `"data": [\n${wrapped.join(",\n")}\n      ]`;
});

Deno.writeTextFileSync(Deno.args[0], outputJson);

