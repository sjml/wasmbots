// doing my own little autotiling with lots of magic numbers
//   will I come to regret this? probably!
//   if this project takes off enough that I want it to start
//     looking polished, this can be revisited
//   just doing enough work to have it look not *utter* garbage

import { TileType } from "../core/messages.ts";
import { type Point, Array2D } from "../core/math.ts";
import { RNG } from "../game/random.ts";
import * as Tiled from "./tileTypes.ts";
import { mapObjectToJSON } from "./builder.ts";

const TILED_FLAG_FLIPPED_HORIZONTALLY = 0x80000000;
const TILED_FLAG_FLIPPED_VERTICALLY   = 0x40000000;
const TILED_FLAG_FLIPPED_DIAGONALLY   = 0x20000000;
const ROTATE_90 = TILED_FLAG_FLIPPED_DIAGONALLY + TILED_FLAG_FLIPPED_HORIZONTALLY;
const ROTATE_180 = TILED_FLAG_FLIPPED_VERTICALLY + TILED_FLAG_FLIPPED_HORIZONTALLY;
const ROTATE_270 = TILED_FLAG_FLIPPED_DIAGONALLY + TILED_FLAG_FLIPPED_VERTICALLY;

const layerTemplate: Tiled.TileLayer = {
	data: [] as number[],
	width: -1,
	height: -1,
	opacity: 1,
	type: "tilelayer",
	visible: true,
	x: 0,
	y: 0,
	id: -1,
	name: "",
};

export class MapPainter {
	map: Tiled.TileMap;
	tileset!: Tiled.Tileset;
	wangBagLookup!: Map<number, TileBag>;
	rng: RNG;
	private tileGrid: Array2D<TileType>;

	constructor(map: Tiled.TileMap, rng: RNG) {
		this.rng = rng;
		this.map = map;
		this.tileGrid = Array2D.from((this.map.layers[0]).data, this.map.width, this.map.height);
	}

	paint(ts: Tiled.Tileset) {
		this.tileset = structuredClone(ts);
		delete (this.tileset as any).tiledversion;
		delete (this.tileset as any).version;
		if (this.map.tilesets.length == 0) {
			this.tileset.firstgid = 1;
		}
		else {
			const lastTileset = this.map.tilesets[this.map.tilesets.length - 1]
			this.tileset.firstgid = lastTileset.firstgid + (lastTileset.tilecount) + 1;
		}
		this.map.tilesets.push(this.tileset);

		this.wangBagLookup = new Map<number, TileBag>();
		this.setLookups(this.tileset);

		const groundLayer = Object.assign({}, layerTemplate, {
			name: "ground",
			id: this.map.nextlayerid,
			width: this.map.width,
			height: this.map.height,
		});
		groundLayer.data = [];
		for (let y = 0; y < this.map.height!; y++) {
			for (let x = 0; x < this.map.width!; x++) {
				groundLayer.data.push(this.floorBag.draw(this.rng));
			}
		}
		this.map.layers.push(groundLayer);
		this.map.nextlayerid += 1;

		const wallLayer = Object.assign({}, layerTemplate, {
			name: "walls",
			id: this.map.nextlayerid,
			width: this.map.width,
			height: this.map.height,
		});
		wallLayer.data = [];

		for (let y = 0; y < this.map.height!; y++) {
			for (let x = 0; x < this.map.width!; x++) {
				if (!this.isWall({x, y}, true)) {
					wallLayer.data.push(0);
					continue;
				}
				if (this.isDoor({x,y})) {
					const mask = this.tileGrid.getBitmask4({x,y}, [TileType.Wall]);
					const isOpen = this.tileGrid.get({x,y}) == TileType.OpenDoor;
					if (mask == 5) {
						// vertical door, hinge in bottom left corner, opens down
						if (isOpen) {
							wallLayer.data.push(58 + this.tileset.firstgid);
						}
						else {
							wallLayer.data.push(47 + this.tileset.firstgid);
						}
					}
					else if (mask == 10) {
						// horizontal door, hinge at left, opens up to hinge in bottom left corner
						if (isOpen) {
							wallLayer.data.push(48 + this.tileset.firstgid);
						}
						else {
							wallLayer.data.push(36 + this.tileset.firstgid);
						}
					}
					else {
						throw new Error(`Door in unexpected location! (${x}, ${y}), mask is ${mask}`);
					}
				}
				else {
					const mask = this.tileGrid.getBitmask8({x, y}, [TileType.Wall, TileType.OpenDoor, TileType.ClosedDoor]);
					const bag = this.wangBagLookup.get(mask);
					if (bag === undefined) {
						throw new Error(`No wang tile for mask ${mask}`);
					}
					wallLayer.data.push(bag.draw(this.rng));
				}
			}
		}

		for (let y = 0; y < this.map.height!; y++) {
			for (let x = 0; x < this.map.width!; x++) {
				const targetIndex = this.pointToIndex({x, y});
				// TODO: can this be consolidated?
				if (this.isWall({x,y}) || this.isDoor({x, y})) {
					continue;
				}
				const mask = this.tileGrid.getBitmask4({x,y}, [TileType.Wall]);
				switch (mask) {
					case 0:
						wallLayer.data[targetIndex] = 0;
						break;
					case 1:
						wallLayer.data[targetIndex] = (100 + this.tileset.firstgid);
						break;
					case 2:
						wallLayer.data[targetIndex] = (100 + this.tileset.firstgid) | ROTATE_90;
						break;
					case 3:
						wallLayer.data[targetIndex] = (101 + this.tileset.firstgid) | ROTATE_90;
						break;
					case 4:
						wallLayer.data[targetIndex] = (100 + this.tileset.firstgid) | ROTATE_180;
						break;
					case 5:
						wallLayer.data[targetIndex] = (102 + this.tileset.firstgid);
						break;
					case 6:
						wallLayer.data[targetIndex] = (101 + this.tileset.firstgid) | ROTATE_180;
						break;
					case 7:
						wallLayer.data[targetIndex] = (103 + this.tileset.firstgid) | ROTATE_180;
						break;
					case 8:
						wallLayer.data[targetIndex] = (100 + this.tileset.firstgid) | ROTATE_270;
						break;
					case 9:
						wallLayer.data[targetIndex] = 101 + this.tileset.firstgid;
						break;
					case 10:
						wallLayer.data[targetIndex] = (102 + this.tileset.firstgid) | ROTATE_90;
						break;
					case 11:
						wallLayer.data[targetIndex] = (103 + this.tileset.firstgid) | ROTATE_90;
						break;
					case 12:
						wallLayer.data[targetIndex] = (101 + this.tileset.firstgid) | ROTATE_270;
						break;
					case 13:
						wallLayer.data[targetIndex] = 103 + this.tileset.firstgid;
						break;
					case 14:
						wallLayer.data[targetIndex] = (103 + this.tileset.firstgid) | ROTATE_270;
						break;
					case 15:
						wallLayer.data[targetIndex] = 104 + this.tileset.firstgid;
						break;
				}
			}
		}

		this.map.layers.push(wallLayer);
		this.map.nextlayerid += 1;
	}

	toJSON(): string {
		return mapObjectToJSON(this.map);
	}

	// Most of this should eventually get pushed into the tileset
	// #region Wang Lookup
	floorBag!: TileBag;
	wallBag!: TileBag;
	capBag!: TileBag;
	runnerBag!: TileBag;
	cornerTopLeftBag!: TileBag;
	topVoidBag!: TileBag;
	cornerTopRightBag!: TileBag;
	leftVoidBag!: TileBag;
	rightVoidBag!: TileBag;
	spotTopRightBag!: TileBag;
	spotTopLeftBag!: TileBag;
	voidBag!: TileBag;
	setLookups(tileset: Tiled.Tileset) {
		this.floorBag = new TileBag(tileset, [
			6,  7,  8,  9,
		   16, 17, 18, 19,
		   26, 27, 28, 29,
		   70, 71, 72, 73,
		]);
		this.wallBag = new TileBag(tileset, [
			1, 2, 3, 4
		]);
		this.capBag = new TileBag(tileset, [
			63
		]);
		this.runnerBag = new TileBag(tileset, [
			60, 61, 62
		]);
		this.cornerTopLeftBag = new TileBag(tileset, [
			50, 54
		]);
		this.topVoidBag = new TileBag(tileset, [
			51, 52
		]);
		this.cornerTopRightBag = new TileBag(tileset, [
			53, 55
		]);
		this.leftVoidBag = new TileBag(tileset, [
			15, 25
		]);
		this.rightVoidBag = new TileBag(tileset, [
			10, 20
		]);
		this.spotTopRightBag = new TileBag(tileset, [
			40
		]);
		this.spotTopLeftBag = new TileBag(tileset, [
			45
		]);
		this.voidBag = new TileBag(tileset, [
			78
		]);

		this.wangBagLookup.set(0, this.wallBag);
		this.wangBagLookup.set(4, this.wallBag);
		this.wangBagLookup.set(92, this.cornerTopLeftBag);
		this.wangBagLookup.set(124, this.topVoidBag);
		this.wangBagLookup.set(116, this.cornerTopRightBag);
		this.wangBagLookup.set(80, this.capBag);
		this.wangBagLookup.set(16, this.capBag);
		this.wangBagLookup.set(20, this.capBag);
		this.wangBagLookup.set(87, this.capBag);
		this.wangBagLookup.set(223, this.leftVoidBag);
		this.wangBagLookup.set(241, this.rightVoidBag);
		this.wangBagLookup.set(21, this.runnerBag);
		this.wangBagLookup.set(64, this.wallBag);
		this.wangBagLookup.set(29, this.cornerTopLeftBag);
		this.wangBagLookup.set(117, this.cornerTopRightBag);
		this.wangBagLookup.set(85, this.runnerBag);
		this.wangBagLookup.set(71, this.wallBag);
		this.wangBagLookup.set(221, this.cornerTopLeftBag);
		this.wangBagLookup.set(125, this.topVoidBag);
		this.wangBagLookup.set(112, this.cornerTopRightBag);
		this.wangBagLookup.set(31, this.leftVoidBag);
		this.wangBagLookup.set(253, this.spotTopRightBag);
		this.wangBagLookup.set(113, this.cornerTopRightBag);
		this.wangBagLookup.set(28, this.cornerTopLeftBag);
		this.wangBagLookup.set(127, this.spotTopLeftBag);
		this.wangBagLookup.set(247, this.rightVoidBag);
		this.wangBagLookup.set(209, this.capBag);
		this.wangBagLookup.set(23, this.capBag);
		this.wangBagLookup.set(199, this.wallBag);
		this.wangBagLookup.set(213, this.capBag);
		this.wangBagLookup.set(95, this.leftVoidBag);
		this.wangBagLookup.set(255, this.voidBag);
		this.wangBagLookup.set(245, this.rightVoidBag);
		this.wangBagLookup.set(81, this.runnerBag);
		this.wangBagLookup.set(5, this.wallBag);
		this.wangBagLookup.set(84, this.capBag);
		this.wangBagLookup.set(93, this.cornerTopLeftBag);
		this.wangBagLookup.set(119, this.cornerTopRightBag);
		this.wangBagLookup.set(215, this.capBag);
		this.wangBagLookup.set(193, this.wallBag);
		this.wangBagLookup.set(17, this.runnerBag);
		this.wangBagLookup.set(1, this.wallBag);
		this.wangBagLookup.set(7, this.wallBag);
		this.wangBagLookup.set(197, this.wallBag);
		this.wangBagLookup.set(69, this.wallBag);
		this.wangBagLookup.set(68, this.wallBag);
		this.wangBagLookup.set(65, this.wallBag);
	}
	// #endregion

	pointToIndex(pt: Point): number {
		return (pt.y * this.map.width) + pt.x;
	}

	isWall(pt: Point, countDoors?: boolean): boolean {
		countDoors ||= false;
		if (   pt.x < 0 || pt.x >= this.map.width!
			|| pt.y < 0 || pt.y >= this.map.height!
		) {
			return true;
		}

		const value = this.tileGrid.get(pt);
		if (countDoors) {
			return value === TileType.Wall || value === TileType.ClosedDoor || value == TileType.OpenDoor;
		}
		else {
			return value === TileType.Wall;
		}
	}

	isDoor(pt: Point): boolean {
		if (   pt.x < 0 || pt.x >= this.map.width!
			|| pt.y < 0 || pt.y >= this.map.height!
		) {
			return true;
		}

		const value = this.tileGrid.get(pt);
		return value === TileType.ClosedDoor || value == TileType.OpenDoor;
	}
}




class TileBag {
	private totalProbability: number;
	private probs: {
		tileGid: number,
		probability: number,
	}[];

	constructor(ts: Tiled.Tileset, indices: number[]) {
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

	draw(rng: RNG): number {
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
