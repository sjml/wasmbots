import prand from "pure-rand";

// FNV-1a hash algorithm modified to use 53 bits
//   (max JavaScript integer size; we're not doing
//    cryptography here so it doesn't matter)
function stringToSeed(seedStr: string, seedNumber: number = 0): number {
	let h1 = 0xdeadbeef ^ seedNumber, h2 = 0x41c6ce57 ^ seedNumber;
	for (let i = 0; i < seedStr.length; i += 13) {
		for (let i = 0; i < seedStr.length; i++) {
			const ch = seedStr.charCodeAt(i);
			h1 = Math.imul(h1 ^ ch, 2654435761);
			h2 = Math.imul(h2 ^ ch, 1597334677);
		}
	}
	h1  = Math.imul(h1 ^ (h1 >>> 16), 2246822507);
	h1 ^= Math.imul(h2 ^ (h2 >>> 13), 3266489909);
	h2  = Math.imul(h2 ^ (h2 >>> 16), 2246822507);
	h2 ^= Math.imul(h1 ^ (h1 >>> 13), 3266489909);
	return 4294967296 * (2097151 & h2) + (h1 >>> 0);
}

const CONFOUNDER = 42;

export class RNG {
	private _seed: number;
	private _seedStr: string | null;
	private _rng: prand.RandomGenerator;

	constructor(seed: string | number | null) {
		if (typeof seed == "string") {
			this._seedStr = seed;
			this._seed = stringToSeed(this._seedStr, CONFOUNDER);
		}
		else if (typeof seed == "number") {
			this._seedStr = null;
			this._seed = seed;
		}
		else {
			this._seedStr = null;
			this._seed = Date.now() ^ (Math.random() * 0x100000000);
		}
		this._rng = prand.xoroshiro128plus(this._seed);
	}

	randInt(min: number, max: number) {
		if (min >= max) {
		  throw new Error(`${min} is not less than ${max}!`);
		}
		return prand.unsafeUniformIntDistribution(min, max-1, this._rng);
	}

	randDouble(min?: number, max?: number) {
		const g1 = prand.unsafeUniformIntDistribution(0, (1 << 26) - 1, this._rng);
		const g2 = prand.unsafeUniformIntDistribution(0, (1 << 27) - 1, this._rng);
		const value = (g1 * Math.pow(2, 27) + g2) * Math.pow(2, -53);

		if (min) {
		  if (!max) {
			throw new Error(`Can't have a min range of random double without a max!`);
		  }
		  if (min >= max) {
			throw new Error(`${min} is not less than ${max}!`);
		  }
		  return min + value * (max - min);
		}

		return value;
	}

	shuffle<T>(array: T[]): T[] {
		for (let i = array.length - 1; i > 0; i--) {
			const j = this.randInt(0, i + 1);
			[array[i], array[j]] = [array[j], array[i]];
		}
		return array;
	}

	pickOne<T>(array: T[]): T {
		if (array.length == 0) {
			throw new Error("Cannot pick from empty array!");
		}
		return array[this.randInt(0, array.length)];
	}

	pick<T>(array: T[], count: number): T[] {
		if (array.length == 0) {
			throw new Error("Cannot pick from empty array!");
		}
		if (count < 0) {
			throw new Error("Cannot pick negative count!");
		}
		if (count == 0) {
			return [];
		}
		const subset: T[] = array.slice();
		this.shuffle(subset);
		if (count >= array.length) {
			return subset;
		}
		return subset.slice(0, count);
	}

	oneIn(chance: number): boolean {
		return this.randInt(0, chance) == 0;
	}
}

export class Deck<T> {
	private _deck: T[];
	private _discards: T[];
	private _rng: RNG;
	private _equalityTest: ((a: T, b: T) => boolean)|null;

	constructor(array: T[], rng: RNG, equalityTest?: (a: T, b: T) => boolean) {
		if (array.length == 0) {
			throw new Error("Can't build deck from empty array!");
		}
		this._equalityTest = equalityTest || null;
		this._deck = array.slice();
		this._discards = [];
		this._rng = rng;

		this._rng.shuffle(this._deck);
	}

	get remainingCards(): number {
		return this._deck.length;
	}

	get discardCount(): number {
		return this._discards.length;
	}

	reset() {
		this._deck = [...this._deck, ...this._discards];
		this._discards = [];
		this._rng.shuffle(this._deck);
	}

	draw(): T {
		if (this._deck.length == 0) {
			this._deck = this._discards;
			this._rng.shuffle(this._deck);
			this._discards = [];
		}
		const drawn = this._deck.pop()!;
		this._discards.push(drawn);
		return drawn;
	}

	drawNoReshuffle(): T | null {
		if (this._deck.length == 0) {
			return null;
		}
		const drawn = this._deck.pop()!;
		this._discards.push(drawn);
		return drawn;
	}

	restoreItem(item: T) {
		let discardIdx: number;
		if (this._equalityTest != null) {
			discardIdx = this._discards.findIndex(x => this._equalityTest!(item, x));
		}
		else {
			discardIdx = this._discards.indexOf(item);
		}
		if (discardIdx < 0) {
			throw new Error(`${item} not in discard pile!`);
		}
		this._discards.splice(discardIdx, 1);
		this._deck.splice(this._rng.randInt(0, this._deck.length+1), 0, item);
	}
}
