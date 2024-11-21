// doing my own little autotiling with lots of magic numbers
//   will I come to regret this? probably!
//   if this project takes off enough that I want it to start
//     looking polished, this can be revisited
//   just doing enough work to have it look not *utter* garbage

import { RNG } from "../game/random.ts";
import { Point } from "../core/math.ts";
import { TileType } from "../core/messages.ts";

const TILED_FLAG_FLIPPED_HORIZONTALLY    = 0x80000000;
const TILED_FLAG_FLIPPED_VERTICALLY      = 0x40000000;
const TILED_FLAG_FLIPPED_DIAGONALLY      = 0x20000000;
const ROTATE_90 = TILED_FLAG_FLIPPED_DIAGONALLY + TILED_FLAG_FLIPPED_HORIZONTALLY;
const ROTATE_180 = TILED_FLAG_FLIPPED_VERTICALLY + TILED_FLAG_FLIPPED_HORIZONTALLY;
const ROTATE_270 = TILED_FLAG_FLIPPED_DIAGONALLY + TILED_FLAG_FLIPPED_VERTICALLY;

const rng = new RNG(null);

const tileset = JSON.parse(Deno.readTextFileSync("../../rsc/maps/tilesets/dungeon_tiles.tsj"));
const dungeon = JSON.parse(Deno.readTextFileSync("../../rsc/maps/static/dungeon.tmj"));

delete tileset.tiledversion;
delete tileset.type;
delete tileset.version;

if (dungeon.tilesets.length == 0) {
	tileset.firstgid = 1;
}
else {
	const lastTileset = dungeon.tilesets[dungeon.tilesets.length - 1]
	tileset.firstgid = lastTileset.firstgid + (lastTileset.tilecount) + 1;
}

dungeon.tilesets.push(tileset);

const layerTemplate = {
	data: [],
	width: 64,
	height: 40,
	opacity: 1,
	type: "tilelayer",
	visible: true,
	x: 0,
	y: 0,
	id: -1,
	name: "",
}


class TileBag {
	private totalProbability: number;
	private probs: {
		tileGid: number,
		probability: number,
	}[];

	constructor(ts, indices: number[]) {
		this.probs = [];
		for (const idx of indices) {
			// first check if it's specified with a probability
			let tile;
			for (const t of ts.tiles) {
				if (t.id === idx) {
					tile = t;
					break;
				}
			}
			if (tile === undefined) {
				tile = { id: idx, probability: 1.0 };
			}
			this.probs.push({
				tileGid: tile.id + ts.firstgid,
				probability: tile.probability || 1.0
			});
		}
		this.totalProbability = this.probs.reduce((sum, pair) => sum + pair.probability, 0);
	}

	draw(): number {
		const randomValue = this.totalProbability * rng.randDouble();

		let cumulator = 0;
		for (const pair of this.probs) {
			cumulator += pair.probability;
			if (randomValue <= cumulator) {
				return pair.tileGid;
			}
		}
		return this.probs[this.probs.length - 1].tileGid;
	}
}





const wangBagLookup = new Map<number, TileBag>();

const floorBag = new TileBag(tileset, [
	 6,  7,  8,  9,
	16, 17, 18, 19,
	26, 27, 28, 29,
	70, 71, 72, 73,
]);
const wallBag = new TileBag(tileset, [
	1, 2, 3, 4
]);
const capBag = new TileBag(tileset, [
	63
]);
const runnerBag = new TileBag(tileset, [
	60, 61, 62
]);
const cornerTopLeftBag = new TileBag(tileset, [
	50, 54
]);
const topVoidBag = new TileBag(tileset, [
	51, 52
]);
const cornerTopRightBag = new TileBag(tileset, [
	53, 55
]);
const leftVoidBag = new TileBag(tileset, [
	15, 25
]);
const rightVoidBag = new TileBag(tileset, [
	10, 20
]);
const spotTopRightBag = new TileBag(tileset, [
	40
]);
const spotTopLeftBag = new TileBag(tileset, [
	45
]);
const voidBag = new TileBag(tileset, [
	78
]);

wangBagLookup.set(0, floorBag);
wangBagLookup.set(4, wallBag);
wangBagLookup.set(92, cornerTopLeftBag);
wangBagLookup.set(124, topVoidBag);
wangBagLookup.set(116, cornerTopRightBag);
wangBagLookup.set(80, capBag);
wangBagLookup.set(16, capBag);
wangBagLookup.set(20, capBag);
wangBagLookup.set(87, capBag);
wangBagLookup.set(223, leftVoidBag);
wangBagLookup.set(241, rightVoidBag);
wangBagLookup.set(21, runnerBag);
wangBagLookup.set(64, wallBag);
wangBagLookup.set(29, cornerTopLeftBag);
wangBagLookup.set(117, cornerTopRightBag);
wangBagLookup.set(85, runnerBag);
wangBagLookup.set(71, wallBag);
wangBagLookup.set(221, cornerTopLeftBag);
wangBagLookup.set(125, topVoidBag);
wangBagLookup.set(112, cornerTopRightBag);
wangBagLookup.set(31, leftVoidBag);
wangBagLookup.set(253, spotTopRightBag);
wangBagLookup.set(113, cornerTopRightBag);
wangBagLookup.set(28, cornerTopLeftBag);
wangBagLookup.set(127, spotTopLeftBag);
wangBagLookup.set(247, rightVoidBag);
wangBagLookup.set(209, capBag);
wangBagLookup.set(23, capBag);
wangBagLookup.set(199, wallBag);
wangBagLookup.set(213, capBag);
wangBagLookup.set(95, leftVoidBag);
wangBagLookup.set(255, voidBag);
wangBagLookup.set(245, rightVoidBag);
wangBagLookup.set(81, runnerBag);
wangBagLookup.set(5, wallBag);
wangBagLookup.set(84, capBag);
wangBagLookup.set(93, cornerTopLeftBag);
wangBagLookup.set(119, cornerTopRightBag);
wangBagLookup.set(215, capBag);
wangBagLookup.set(193, wallBag);
wangBagLookup.set(17, runnerBag);
wangBagLookup.set(1, wallBag);
wangBagLookup.set(7, wallBag);
wangBagLookup.set(197, wallBag);
wangBagLookup.set(69, wallBag);
wangBagLookup.set(68, wallBag);
wangBagLookup.set(65, wallBag);

function pointToIndex(position: Point): number {
	return (position.y * dungeon.width!) + position.x;
}

function readTile(pt: Point): TileType {
	const idx = pointToIndex(pt);
	return (dungeon.layers[0]).data[idx] as TileType;
}

function isWall(pt: Point, countDoors?: boolean): boolean {
	countDoors ||= false;
	if (   pt.x < 0 || pt.x >= dungeon.width!
		|| pt.y < 0 || pt.y >= dungeon.height!
	) {
		return true;
	}

	const value = readTile(pt);
	if (countDoors) {
		return value === TileType.Wall || value === TileType.ClosedDoor || value == TileType.OpenDoor;
	}
	else {
		return value === TileType.Wall;
	}
}

function isDoor(pt: Point): boolean {
	if (   pt.x < 0 || pt.x >= dungeon.width!
		|| pt.y < 0 || pt.y >= dungeon.height!
	) {
		return true;
	}

	const value = readTile(pt);
	return value === TileType.ClosedDoor || value == TileType.OpenDoor;
}

function getBitmask8(position: Point, countDoors?: boolean) {
	countDoors ||= false;
	const deltas: Point[] = [
		{x:  0, y: -1}, // north (1)
		{x:  1, y: -1}, // northeast (2)
		{x:  1, y:  0}, // east (4)
		{x:  1, y:  1}, // southeast (8)
		{x:  0, y:  1}, // south (16)
		{x: -1, y:  1}, // southwest (32)
		{x: -1, y:  0}, // west (64)
		{x: -1, y: -1}, // northwest (128)
	];
	let mask = 0;
	for (let di = 0; di < deltas.length; di++) {
		const pt = {
			x: position.x + deltas[di].x,
			y: position.y + deltas[di].y,
		};
		if (isWall(pt, countDoors)) {
			mask |= (1 << di);
		}
	}
	// clear diagonals if their neighboring edges aren't set
	//   (this is what lets us reduce the wang set from 255 to 47)
	for (const [n1, n2, d] of [[1,4,2], [4,16,8], [16,64,32], [64,1,128]]) {
		if (!((mask & n1) && (mask & n2))) {
			mask &= ~d;
		}
	}
	return mask;
}

function getBitmask4(position: Point, countDoors?: boolean) {
	countDoors ||= false;
	const deltas: Point[] = [
		{x:  0, y: -1}, // north (1)
		{x:  1, y:  0}, // east (2)
		{x:  0, y:  1}, // south (4)
		{x: -1, y:  0}, // west (8)
	];
	let mask = 0;
	for (let di = 0; di < deltas.length; di++) {
		const pt = {
			x: position.x + deltas[di].x,
			y: position.y + deltas[di].y,
		};
		if (isWall(pt, countDoors)) {
			mask |= (1 << di);
		}
	}
	return mask;
}


const groundLayer = Object.assign({}, layerTemplate, {name: "ground", id: dungeon.layers.length});
groundLayer.data = [];

for (let y = 0; y < dungeon.height!; y++) {
	for (let x = 0; x < dungeon.width!; x++) {
		groundLayer.data.push(floorBag.draw());
	}
}
dungeon.layers.push(groundLayer);



const wallLayer = Object.assign({}, layerTemplate, {name: "walls", id: dungeon.layers.length});
wallLayer.data = [] as number[];

for (let y = 0; y < dungeon.height!; y++) {
	for (let x = 0; x < dungeon.width!; x++) {
		if (!isWall({x, y}, true)) {
			wallLayer.data.push(0);
			continue;
		}
		if (isDoor({x,y})) {
			const mask = getBitmask4({x,y}, false);
			const isOpen = readTile({x,y}) == TileType.OpenDoor;
			if (mask == 5) {
				// vertical door, hinge in bottom left corner, opens down
				if (isOpen) {
					wallLayer.data.push(58 + tileset.firstgid);
				}
				else {
					wallLayer.data.push(47 + tileset.firstgid);
				}
			}
			else if (mask == 10) {
				// horizontal door, hinge at left, opens up to hinge in bottom left corner
				if (isOpen) {
					wallLayer.data.push(48 + tileset.firstgid);
				}
				else {
					wallLayer.data.push(36 + tileset.firstgid);
				}
			}
			else {
				throw new Error(`Door in unexpected location! (${x}, ${y})`);
			}
		}
		else {
			const mask = getBitmask8({x, y}, true);
			const bag = wangBagLookup.get(mask);
			if (bag === undefined) {
				throw new Error(`No wang tile for mask ${mask}`);
			}
			wallLayer.data.push(bag.draw());
		}
	}
}


for (let y = 0; y < dungeon.height!; y++) {
	for (let x = 0; x < dungeon.width!; x++) {
		const targetIndex = pointToIndex({x, y});
		if (isWall({x,y}) || isDoor({x, y})) {
			continue;
		}
		const mask = getBitmask4({x, y}, false);
		switch (mask) {
			case 0:
				wallLayer.data[targetIndex] = 0;
				break;
			case 1:
				wallLayer.data[targetIndex] = (100 + tileset.firstgid);
				break;
			case 2:
				wallLayer.data[targetIndex] = (100 + tileset.firstgid) | ROTATE_90;
				break;
			case 3:
				wallLayer.data[targetIndex] = (101 + tileset.firstgid) | ROTATE_90;
				break;
			case 4:
				wallLayer.data[targetIndex] = (100 + tileset.firstgid) | ROTATE_180;
				break;
			case 5:
				wallLayer.data[targetIndex] = (102 + tileset.firstgid);
				break;
			case 6:
				wallLayer.data[targetIndex] = (101 + tileset.firstgid) | ROTATE_180;
				break;
			case 7:
				wallLayer.data[targetIndex] = (103 + tileset.firstgid) | ROTATE_180;
				break;
			case 8:
				wallLayer.data[targetIndex] = (100 + tileset.firstgid) | ROTATE_270;
				break;
			case 9:
				wallLayer.data[targetIndex] = 101 + tileset.firstgid;
				break;
			case 10:
				wallLayer.data[targetIndex] = (102 + tileset.firstgid) | ROTATE_90;
				break;
			case 11:
				wallLayer.data[targetIndex] = (103 + tileset.firstgid) | ROTATE_90;
				break;
			case 12:
				wallLayer.data[targetIndex] = (101 + tileset.firstgid) | ROTATE_270;
				break;
			case 13:
				wallLayer.data[targetIndex] = 103 + tileset.firstgid;
				break;
			case 14:
				wallLayer.data[targetIndex] = (103 + tileset.firstgid) | ROTATE_270;
				break;
			case 15:
				wallLayer.data[targetIndex] = 104 + tileset.firstgid;
				break;
		}
	}
}


dungeon.layers.push(wallLayer);


let outputJson = JSON.stringify(dungeon, null, "\t");
outputJson = outputJson.replaceAll(/"data": \[([^\]]+)\]/mg, (_, content: string) => {
	const items = content.split(/,\s*/);

	const wrapped = items.reduce((acc: string[][], item: string, idx: number) => {
		if (idx % 64 == 0) {
			acc.push([]);
		}
		acc[acc.length - 1].push(item.trim());
		return acc;
	}, []).map(row => `\t\t\t\t${row.join(", ")}`);

	return `"data": [\n${wrapped.join(",\n")}\n\t\t\t]`;
});

Deno.writeTextFileSync("../../rsc/maps/static/dungeon.painted.tmj", outputJson);
