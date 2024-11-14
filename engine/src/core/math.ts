import { Direction as MsgDir } from "./messages.ts";

// transform direction values from `messages.toml` into more useful/powerful TypeScript things
const DirectionValues = {
	East: MsgDir.East,
	Southeast: MsgDir.Southeast,
	South: MsgDir.South,
	Southwest: MsgDir.Southwest,
	West: MsgDir.West,
	Northwest: MsgDir.Northwest,
	North: MsgDir.North,
	Northeast: MsgDir.Northeast,
} as const;

type DirectionType = typeof DirectionValues[keyof typeof DirectionValues];
export class Direction {
	private constructor(
		private readonly value: DirectionType,
		private readonly name: string,
	) {}

	static readonly East = new Direction(DirectionValues.East, "East");
	static readonly Southeast = new Direction(DirectionValues.Southeast, "Southeast");
	static readonly South = new Direction(DirectionValues.South, "South");
	static readonly Southwest = new Direction(DirectionValues.Southwest, "Southwest");
	static readonly West = new Direction(DirectionValues.West, "West");
	static readonly Northwest = new Direction(DirectionValues.Northwest, "Northwest");
	static readonly North = new Direction(DirectionValues.North, "North");
	static readonly Northeast = new Direction(DirectionValues.Northeast, "Northeast");

	static readonly Cardinal: readonly Direction[] = Object.freeze([
		Direction.East,
		Direction.South,
		Direction.West,
		Direction.North,
	]);

	static readonly Ordinal: readonly Direction[] = Object.freeze([
		Direction.Southeast,
		Direction.Southwest,
		Direction.Northwest,
		Direction.Northeast,
	]);

	static readonly All: readonly Direction[] = Object.freeze([
		Direction.East,
		Direction.Southeast,
		Direction.South,
		Direction.Southwest,
		Direction.West,
		Direction.Northwest,
		Direction.North,
		Direction.Northeast,
	]);

	static from(d: MsgDir): Direction {
		switch (d) {
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
			case MsgDir.North:
				return Direction.North;
			case MsgDir.Northeast:
				return Direction.Northeast;
		}
	}

	get moveDelta(): Point {
		switch (this.value) {
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
			case DirectionValues.North:
				return { x:  0, y: -1 };
			case DirectionValues.Northeast:
				return { x:  1, y: -1 };
		}
	}

	reverse(): Direction {
		switch (this.value) {
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
			case DirectionValues.North:
				return Direction.South;
			case DirectionValues.Northeast:
				return Direction.Southwest;
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

export class Fraction {
	numerator: number;
	denominator: number;

	constructor(numerator: number, denominator: number) {
		this.numerator = numerator;
		this.denominator = denominator;
		this.reduce();
	}

	reduce() {
		const gcd = (a: number, b: number) => (b == 0 ? a : gcd(b, a % b));
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
