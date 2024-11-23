import { Direction as MsgDir } from "./messages.ts";

// transform direction values from `messages.toml` into more useful/powerful TypeScript things
const DirectionValues = {
	North: MsgDir.North,
	Northeast: MsgDir.Northeast,
	East: MsgDir.East,
	Southeast: MsgDir.Southeast,
	South: MsgDir.South,
	Southwest: MsgDir.Southwest,
	West: MsgDir.West,
	Northwest: MsgDir.Northwest,
} as const;

type DirectionType = typeof DirectionValues[keyof typeof DirectionValues];
export class Direction {
	private constructor(
		private readonly value: DirectionType,
		private readonly name: string,
	) {}

	static readonly North = new Direction(DirectionValues.North, "North");
	static readonly Northeast = new Direction(DirectionValues.Northeast, "Northeast");
	static readonly East = new Direction(DirectionValues.East, "East");
	static readonly Southeast = new Direction(DirectionValues.Southeast, "Southeast");
	static readonly South = new Direction(DirectionValues.South, "South");
	static readonly Southwest = new Direction(DirectionValues.Southwest, "Southwest");
	static readonly West = new Direction(DirectionValues.West, "West");
	static readonly Northwest = new Direction(DirectionValues.Northwest, "Northwest");

	static readonly Cardinal: readonly Direction[] = Object.freeze([
		Direction.North,
		Direction.East,
		Direction.South,
		Direction.West,
	]);

	static readonly CardinalDeltas: readonly Point[] = Object.freeze([
		Direction.North.moveDelta,
		Direction.East.moveDelta,
		Direction.South.moveDelta,
		Direction.West.moveDelta,
	]);

	static readonly Ordinal: readonly Direction[] = Object.freeze([
		Direction.Northeast,
		Direction.Southeast,
		Direction.Southwest,
		Direction.Northwest,
	]);

	static readonly OrdinalDeltas: readonly Point[] = Object.freeze([
		Direction.Northeast.moveDelta,
		Direction.Southeast.moveDelta,
		Direction.Southwest.moveDelta,
		Direction.Northwest.moveDelta,
	]);

	static readonly All: readonly Direction[] = Object.freeze([
		Direction.North,
		Direction.Northeast,
		Direction.East,
		Direction.Southeast,
		Direction.South,
		Direction.Southwest,
		Direction.West,
		Direction.Northwest,
	]);

	static readonly Deltas: readonly Point[] = Object.freeze([
		Direction.North.moveDelta,
		Direction.Northeast.moveDelta,
		Direction.East.moveDelta,
		Direction.Southeast.moveDelta,
		Direction.South.moveDelta,
		Direction.Southwest.moveDelta,
		Direction.West.moveDelta,
		Direction.Northwest.moveDelta,
	]);

	static from(d: MsgDir): Direction {
		switch (d) {
			case MsgDir.North:
				return Direction.North;
			case MsgDir.Northeast:
				return Direction.Northeast;
			case MsgDir.East:
				return Direction.East;
			case MsgDir.Southeast:
				return Direction.Southeast;
			case MsgDir.South:
				return Direction.South;
			case MsgDir.Southwest:
				return Direction.Southwest;
			case MsgDir.West:
				return Direction.West;
			case MsgDir.Northwest:
				return Direction.Northwest;
		}
	}

	get moveDelta(): Point {
		switch (this.value) {
			case DirectionValues.North:
				return { x:  0, y: -1 };
			case DirectionValues.Northeast:
				return { x:  1, y: -1 };
			case DirectionValues.East:
				return { x:  1, y:  0 };
			case DirectionValues.Southeast:
				return { x:  1, y:  1 };
			case DirectionValues.South:
				return { x:  0, y:  1 };
			case DirectionValues.Southwest:
				return { x: -1, y:  1 };
			case DirectionValues.West:
				return { x: -1, y:  0 };
			case DirectionValues.Northwest:
				return { x: -1, y: -1 };
		}
	}

	reverse(): Direction {
		switch (this.value) {
			case DirectionValues.North:
				return Direction.South;
			case DirectionValues.Northeast:
				return Direction.Southwest;
			case DirectionValues.East:
				return Direction.West;
			case DirectionValues.Southeast:
				return Direction.Northwest;
			case DirectionValues.South:
				return Direction.North;
			case DirectionValues.Southwest:
				return Direction.Northeast;
			case DirectionValues.West:
				return Direction.East;
			case DirectionValues.Northwest:
				return Direction.Southeast;
		}
	}

	toString(): string {
		return this.name;
	}
}


export interface Point {
	x: number;
	y: number;
}

export function manhattanDistance(a: Point, b: Point): number {
	return Math.abs(a.x - b.x) + Math.abs(a.y - b.y);
}

export class Fraction {
	numerator: number;
	denominator: number;

	constructor(numerator: number, denominator: number) {
		this.numerator = numerator;
		this.denominator = denominator;
		this.reduce();
	}

	reduce() {
		const gcd = (a: number, b: number): number => (b == 0 ? a : gcd(b, a % b));
		const divisor = gcd(this.numerator, this.denominator);
		this.numerator /= divisor;
		this.denominator /= divisor;
	}

	add(other: Fraction | number): Fraction {
		if (typeof other === "number") {
			other = new Fraction(other, 1);
		}
		const newNum = (this.numerator * other.denominator) + (other.numerator * this.denominator);
		const newDen = this.denominator * other.denominator;
		return new Fraction(newNum, newDen);
	}

	subtract(other: Fraction | number): Fraction {
		if (typeof other === "number") {
			other = new Fraction(other, 1);
		}
		const newNum = (this.numerator * other.denominator) - (other.numerator * this.denominator);
		const newDem = this.denominator * other.denominator;
		return new Fraction(newNum, newDem);
	}

	multiply(other: Fraction | number): Fraction {
		if (typeof other === "number") {
			other = new Fraction(other, 1);
		}
		const newNum = this.numerator * other.numerator;
		const newDen = this.denominator * other.denominator;
		return new Fraction(newNum, newDen);
	}

	divide(other: Fraction | number): Fraction {
		if (typeof other === "number") {
			other = new Fraction(other, 1);
		}
		const newNum = this.numerator * other.denominator;
		const newDen = this.denominator * other.numerator;
		return new Fraction(newNum, newDen);
	}

	toNumber(): number {
		return this.numerator / this.denominator;
	}

	toString(): string {
		return `${this.numerator}/${this.denominator}`;
	}
}

export function roundTiesUp(n: number): number {
	return Math.floor(n + 0.5);
}

export function roundTiesDown(n: number): number {
	return Math.ceil(n - 0.5);
}

export class Array2D<T> {
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

	static from<T>(array1D: Array<T>, width: number, height: number): Array2D<T> {
		if (width * height != array1D.length || array1D.length == 0) {
			throw new Error(`Bad dimensions on 1D -> 2D array (width: ${width}, height: ${height}, length: ${array1D.length})`);
		}
		const entries = Array.from({length: height}, (_, i) =>
			array1D.slice(i * width, (i + 1) * width)
		) as unknown as T[][];
		const array2D = Object.create(this.prototype) as Array2D<T>;
		array2D.entries = entries;
		array2D._width = width;
		array2D._height = height;
		return array2D;
	}

	get width(): number {
		return this._width;
	}

	get height(): number {
		return this._height;
	}

	flat(): T[] {
		return this.entries.flat();
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

	getBitmask4(position: Point, masked: T[]): number {
		let mask = 0;
		for (const [di, delta] of Direction.CardinalDeltas.entries()) {
			const pt = {
				x: position.x + delta.x,
				y: position.y + delta.y,
			};
			if (
				   pt.x < 0 || pt.x >= this._width
				|| pt.y < 0 || pt.y >= this._height
			) {
				continue;
			}
			const value = this.get(pt);
			if (masked.includes(value)) {
				mask |= (1 << di);
			}
		}
		return mask;
	}

	getBitmask8(position: Point, masked: T[]): number {
		let mask = 0;
		for (const [di, delta] of Direction.Deltas.entries()) {
			const pt = {
				x: position.x + delta.x,
				y: position.y + delta.y,
			};
			if (
				   pt.x < 0 || pt.x >= this._width
				|| pt.y < 0 || pt.y >= this._height
			) {
				continue;
			}
			const value = this.get(pt);
			if (masked.includes(value)) {
				mask |= (1 << di);
			}
		}

		// clear diagonals if their neighboring edges aren't set.
		//    (this is what lets us reduce the wang set from 255 to 47)
		// if there are other uses for bitmasks this should be
		//    put behind a parameter
		for (const [n1, n2, d] of [[1,4,2], [4,16,8], [16,64,32], [64,1,128]]) {
			if (!((mask & n1) && (mask & n2))) {
				mask &= ~d;
			}
		}

		return mask;
	}
}

export class Rect {
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

	toString(): string {
		return `[x: ${this.x}, y: ${this.y}; w: ${this.width}, h: ${this.height}]`;
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
				yield {x, y};
			}
		}
	}
}
