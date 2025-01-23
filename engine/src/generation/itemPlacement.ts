import * as CoreMsg from "../core/messages.ts";
import { Rect, type Point } from "../core/math.ts";
import { RNG } from "../game/random.ts";
import { MapBuilder, type BuilderRoom } from "./builder.ts";

interface IntRange {
	min: number;
	max: number;
}

// in a just world these would be a tree of classes but they might end
//    up as POJOs in the frontend so we do the interface dance instead.
export type ItemPlacementCondition =
	  AnyCondition
	| AllCondition
	| TileTypeCondition
	| RandomChanceCondition
	| LevelAreaCondition
	| TerrainBitmaskCondition
;

export interface BaseItemPlacementCondition {
	conditionType: string;
}

export interface AnyCondition extends BaseItemPlacementCondition {
	conditionType: "Any";
	conditions: ItemPlacementCondition[];
}

export interface AllCondition extends BaseItemPlacementCondition {
	conditionType: "All";
	conditions: ItemPlacementCondition[];
}

export interface TileTypeCondition extends BaseItemPlacementCondition {
	conditionType: "TileType";
	tileTypes: CoreMsg.TileType[];
}

export interface RandomChanceCondition extends BaseItemPlacementCondition {
	conditionType: "RandomChance";
	chance: number;
}

export interface LevelAreaCondition extends BaseItemPlacementCondition {
	conditionType: "LevelArea";
	area: Rect | { x: number, y: number, width: number, height: number };
}

export interface TerrainBitmaskCondition extends BaseItemPlacementCondition {
	conditionType: "TerrainBitmask";
	bitmask: number;
	exact: boolean;
}

export function isConditionValid(condition: ItemPlacementCondition, builder: MapBuilder, room: BuilderRoom, tilePosition: Point, rng: RNG): boolean {
	switch (condition.conditionType) {
		case "Any":
			return (condition as AnyCondition).conditions.some(c => isConditionValid(c, builder, room, tilePosition, rng));
		case "All":
			return (condition as AllCondition).conditions.every(c => isConditionValid(c, builder, room, tilePosition, rng));
		case "TileType":
			return (condition as TileTypeCondition).tileTypes.includes(builder.tiles.get(tilePosition));
		case "RandomChance":
			const rcc = condition as RandomChanceCondition;
			if (rcc.chance < 0.0 || rcc.chance > 1.0) {
				throw new Error("Chance must be between 0.0 and 1.0");
			}
			return rng.randDouble() < rcc.chance;
		case "LevelArea":
			const lac = condition as LevelAreaCondition;
			const area = lac.area instanceof Rect
				? lac.area
				: new Rect(lac.area.x, lac.area.y, lac.area.width, lac.area.height);
			return area.contains(tilePosition);
		case "TerrainBitmask":
			const mask = builder.tiles.getBitmask4(tilePosition, [CoreMsg.TileType.Wall]);
			const tbc = condition as TerrainBitmaskCondition;
			return tbc.exact ? mask == tbc.bitmask : (mask & tbc.bitmask) != 0;
		default:
			throw new Error(`Unknown condition type: ${(condition as BaseItemPlacementCondition).conditionType}`);
	}
}

export interface ItemPlacementRule {
	itemType: CoreMsg.ItemType;

	/**
	 * note that when you set a minimum greater than 0 on this range, the placement function will throw an error if it cannot be satisfied
	 */
	levelCount: IntRange;

	roomMax?: number;
	conditions?: ItemPlacementCondition[];
}

export interface PlacedItem {
	position: Point;
	itemType: CoreMsg.ItemType;
}

export function placeItems(
	rng: RNG,
	builder: MapBuilder,
	rules: ItemPlacementRule[],
): PlacedItem[] {
	const items = new Map<string, CoreMsg.ItemType>();

	const fullMapRoom = {
		id: "FullMap",
		rect: new Rect(0, 0, builder.tiles.width, builder.tiles.height),
	};

	for (const rule of rules) {
		let itemCount = 0;

		let rooms: BuilderRoom[];
		if (builder.rooms.length == 0) {
			rooms = [fullMapRoom]
		}
		else {
			rooms = structuredClone(builder.rooms);
		}
		rooms = rng.shuffle(rooms);

		for (const room of rooms) {
			let roomCount = 0;
			const validLocations: Point[] = [];
			for (let y = room.rect.y; y < room.rect.y + room.rect.height; y++) {
				for (let x = room.rect.x; x < room.rect.x + room.rect.width; x++) {
					const pt = {x, y};
					const ptStr = `${x},${y}`;
					if (items.has(ptStr)) {
						continue;
					}

					if (
						   rule.conditions
						&& !rule.conditions.every(c => isConditionValid(c, builder, room, pt, rng))
					) {
						continue;
					}

					validLocations.push(pt);
				}
			}

			if (validLocations.length == 0) {
				continue;
			}

			const placements = rng.pick(validLocations, rule.roomMax !== undefined ? rule.roomMax+1 : validLocations.length);
			for (const pos of placements) {
				const posStr = `${pos.x},${pos.y}`;
				items.set(posStr, rule.itemType);
				itemCount++;
				roomCount++;
				if (rule.roomMax !== undefined && roomCount >= rule.roomMax) {
					break;
				}
				if (itemCount >= rule.levelCount.max) {
					break;
				}
			}

			if (itemCount >= rule.levelCount.max) {
				break;
			}
		}

		// fallback placement
		if (itemCount < rule.levelCount.min) {
			const fallbackLocations: Point[] = [];

			for (let y = 0; y < builder.tiles.height; y++) {
				for (let x = 0; x < builder.tiles.width; x++) {
					const pt = {x, y};
					const ptStr = `${x},${y}`;
					if (items.has(ptStr)) {
						continue;
					}

					if (
						   rule.conditions
						&& !rule.conditions.every(c => isConditionValid(c, builder, fullMapRoom, pt, rng))
					) {
						continue;
					}

					fallbackLocations.push(pt);
				}
			}

			const stillNeedCount = rule.levelCount.min - itemCount;
			if (fallbackLocations.length < stillNeedCount) {
				throw new Error("Not enough valid locations for placement");
			}
			const placements = rng.pick(fallbackLocations, stillNeedCount);

			for (const pos of placements) {
				items.set(`${pos.x},${pos.y}`, rule.itemType);
				itemCount++;
				if (itemCount >= rule.levelCount.max) {
					break;
				}
			}
		}
	}

	return [...items].map(([key, itemType]) => {
		const [x, y] = key.split(",").map(Number);
		return { position: { x, y }, itemType };
	});
}
