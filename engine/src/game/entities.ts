import { RNG } from "./random.ts";


export class EntityIdGenerator {
	private static nextId: number = 0;
	private static isInitialized: boolean = false;

	static initialize(rng: RNG) {
		this.nextId = rng.randInt(10000, 1000000);
		this.isInitialized = true;
	}

	static generateId(): number {
		if (!this.isInitialized) {
			throw new Error("EntityIdGenerator not initalized");
		}
		return this.nextId++;
	}
};
