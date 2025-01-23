import { RNG } from "./random.ts";

export type EntityId = number;

export class EntityIdGenerator {
	private static nextId: EntityId = 0;
	private static isInitialized: boolean = false;

	static initialize(rng: RNG) {
		this.nextId = rng.randInt(10000, 1000000) as EntityId;
		this.isInitialized = true;
	}

	static generateId(): EntityId {
		if (!this.isInitialized) {
			throw new Error("EntityIdGenerator not initalized");
		}
		return (this.nextId++ as EntityId);
	}
};
