import { Tile, WorldMap } from "./map.ts";
import { TileType as TerrainTileType } from "../core/messages.ts";
import { Direction, Fraction, roundTiesDown, roundTiesUp, type Point } from "../core/math.ts";


// uses symmetric shadowcast (based on https://www.albertford.com/shadowcasting/)


class Quadrant {
	private dir: Direction;
	private origin: Point;

	constructor(dir: Direction, origin: Point) {
		if (!Direction.Cardinal.includes(dir)) {
			throw new Error("Quadrant must be made with cardinal direction");
		}
		this.dir = dir;
		this.origin = origin;
	}

	transform(pt: Point): Point {
		if (this.dir === Direction.East) {
			return { x: this.origin.x + pt.x, y: this.origin.y + pt.y };
		}
		else if (this.dir === Direction.South) {
			return { x: this.origin.x + pt.y, y: this.origin.y + pt.x };
		}
		else if (this.dir === Direction.West) {
			return { x: this.origin.x - pt.x, y: this.origin.y + pt.y }
		}
		else /* if (this.dir === Direction.North) */ {
			return { x: this.origin.x + pt.y,  y: this.origin.y - pt.x }
		}
	}
}

class Row {
	constructor(
		public depth: number,
		public startSlope: Fraction,
		public endSlope: Fraction,
	) {}

	*tiles(): Generator<Point> {
		const minCol =   roundTiesUp(this.startSlope.multiply(this.depth).toNumber());
		const maxCol = roundTiesDown(  this.endSlope.multiply(this.depth).toNumber());
		for (let col = minCol; col < maxCol + 1; col++) {
			yield({x: this.depth, y: col});
		}
	}

	next(): Row {
		return new Row(this.depth + 1, this.startSlope, this.endSlope);
	}
}

function slope(pt: Point): Fraction {
	return new Fraction(2 * pt.y - 1, 2 * pt.x);
}

function isSymmetric(row: Row, pt: Point): boolean {
	return (
		   pt.y >= row.startSlope.multiply(row.depth).toNumber()
		&& pt.y <=   row.endSlope.multiply(row.depth).toNumber()
	);
}

export function computeFOV(map: WorldMap, origin: Point, radius: number, opacityTest: TerrainTileType[]|((t: TerrainTileType) => boolean)): Tile[][] {
	const size = 2 * radius + 1;
	const calculatedSlice: Tile[][] = Array.from({ length: size }, () =>
		Array(size).fill(new Tile())
	);

	function checkOpacity(t: Tile): boolean {
		if (Array.isArray(opacityTest)) {
			return opacityTest.includes(t.terrainType);
		}
		return opacityTest(t.terrainType);
	}

	const globalToLocal = (global: Point): Point => {
		return { x: global.x - origin.x + radius, y: global.y - origin.y + radius };
	}

	const setVisible = (globalLocation: Point) => {
		const loc = globalToLocal(globalLocation);
		const val = map.getTilePt(globalLocation);
		calculatedSlice[loc.y][loc.x] = val;
	}

	// origin always visible
	setVisible(origin);

	for (const card of Direction.Cardinal) {
		const quad = new Quadrant(card, origin);

		function reveal(tile: Point) {
			const actual = quad.transform(tile);
			setVisible(actual);
		}

		function isOpaque(tile: Point|null): boolean {
			if (tile == null) {
				return false;
			}
			const actual = quad.transform(tile);
			return checkOpacity(map.getTilePt(actual));
		}

		// recursive
		function scan(row: Row) {
			let prevTile: Point|null = null;
			for (const tile of row.tiles()) {
				if (isOpaque(tile) || isSymmetric(row, tile)) {
					reveal(tile);
				}
				if (isOpaque(prevTile) && !isOpaque(tile)) {
					row.startSlope = slope(tile);
				}
				if (!isOpaque(prevTile) && isOpaque(tile) && row.depth < radius) {
					const nextRow = row.next();
					nextRow.endSlope = slope(tile);
					scan(nextRow);
				}
				prevTile = tile;
			}
			if (!isOpaque(prevTile) && row.depth < radius) {
				scan(row.next());
			}
		}

		const firstRow = new Row(1, new Fraction(-1, 1), new Fraction(1, 1));
		scan(firstRow);
	}

	return calculatedSlice;
}
