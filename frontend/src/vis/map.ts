import Phaser from "phaser";

import { Config, CoreMsg, WorldMap, type Point } from "wasmbots";
import { type VisPlayer } from "./player";
import { VisEventBus } from "./events";

const ZOOM_TIME = 750;
const ZOOM_FUNC = Phaser.Math.Easing.Sine.InOut;

export class VisMap extends Phaser.Scene {
	worldMap!: WorldMap;
	private _backgroundLayer: Phaser.Tilemaps.TilemapLayer | null = null;
	private _itemLayer: Phaser.Tilemaps.TilemapLayer | null = null;
	playerList: Set<VisPlayer> = new Set();

	private constructor(key: string) {
		super(key);
	}

	static async from(map: WorldMap): Promise<VisMap> {
		const ms = new VisMap(`${map.name}_Scene`);
		ms.worldMap = map;
		return ms;
	}

	preload() {}

	create() {
		const tm = this.make.tilemap({key: `map-${this.worldMap.name}`});
		for (const tsObj of tm.tilesets) {
			tm.addTilesetImage(tsObj.name, `tiles-${tsObj.name}`);
		}
		this._backgroundLayer = tm.createLayer("terrain", tm.tilesets, 0, 0);
		this._itemLayer = tm.createLayer("items", tm.tilesets, 0, 0);

		this.cameras.main.setBounds(0, 0, Config.gameWidth, Config.gameHeight);

		VisEventBus.on("zoom-in", (data: {target: VisPlayer}) => {
			this.cameras.main.pan(data.target.x, data.target.y, ZOOM_TIME, ZOOM_FUNC, true, (cam: Phaser.Cameras.Scene2D.Camera, progress: number) => {
				cam.panEffect.destination.x = data.target.x;
				cam.panEffect.destination.y = data.target.y;
				if (progress === 1) {
					// fire callback if needed
				}
			});
			this.cameras.main.zoomTo(5.0, ZOOM_TIME, ZOOM_FUNC);
			this.cameras.main.startFollow(data.target, true);
		});
		VisEventBus.on("zoom-out", () => {
			this.cameras.main.pan(Config.gameWidth / 2, Config.gameHeight / 2, ZOOM_TIME, ZOOM_FUNC);
			this.cameras.main.zoomTo(1.0, ZOOM_TIME, ZOOM_FUNC);
			this.cameras.main.stopFollow();
		});
	}

	processTerrainChange(location: Point, newTerrain: CoreMsg.TileType) {
		const candidates = this.worldMap.terrainIndexLookup.get(newTerrain);
		if (candidates === undefined) {
			throw new Error(`Cannot change ${location} to terrain ${newTerrain}; does not exist in map.`);
		}
		if (candidates.length === 0) {
			throw new Error(`Cannot change ${location} to terrain ${newTerrain}; no candidates.`);
		}
		this._backgroundLayer?.putTileAt(candidates[0], location.x, location.y);
	}

	update() {
		for (const p of this.playerList) {
			if (p.update) {
				p.update();
			}
		}
	}

	addPlayer(p: VisPlayer) {
		this.playerList.add(p);
		this.add.existing(p);

		p.once("destroy", () => {this.playerList.delete(p)});
	}
}
