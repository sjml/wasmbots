import Phaser from "phaser";

import { Config, CoreMsg, WorldMap, type Point } from "wasmbots";
import { type VisPlayer } from "./player";
import { VisEventBus } from "./events";

const ZOOM_TIME = 750;
const ZOOM_FUNC = Phaser.Math.Easing.Sine.InOut;

export class VisMap extends Phaser.Scene {
	worldMap!: WorldMap;
	private _tilemap: Phaser.Tilemaps.Tilemap | null = null;
	private _groundLayer: Phaser.Tilemaps.TilemapLayer | null = null;
	private _wallsLayer: Phaser.Tilemaps.TilemapLayer | null = null;
	private _dark: boolean = true;
	private _darkOverlay: Phaser.GameObjects.RenderTexture | null = null;
	private _playerList: VisPlayer[] = [];
	private _lightswitch: Phaser.Input.Keyboard.Key|null = null;

	private constructor(key: string) {
		super(key);
	}

	static async from(map: WorldMap): Promise<VisMap> {
		const ms = new VisMap(`${map.name}_Scene`);
		ms.worldMap = map;
		return ms;
	}

	preload() {
		this.load.tilemapTiledJSON(`map-${this.worldMap.name}`, this.worldMap.rawMapData);
	}

	create() {
		this._lightswitch = this.input.keyboard?.addKey("L") ?? null;

		this._tilemap = this.make.tilemap({key: `map-${this.worldMap.name}`});
		for (const tsObj of this._tilemap.tilesets) {
			this._tilemap.addTilesetImage(tsObj.name, `tiles-${tsObj.name}`);
		}
		this._groundLayer = this._tilemap.createLayer("ground", this._tilemap.tilesets, 0, 0);
		this._wallsLayer = this._tilemap.createLayer("walls", this._tilemap.tilesets, 0, 0);

		this.cameras.main.setBounds(0, 0, Config.gameWidth, Config.gameHeight);

		VisEventBus.on("zoom-in", (data: {target: VisPlayer}) => {
			let duration = ZOOM_TIME;
			if (this.cameras.main.panEffect.isRunning) {
				duration -= ZOOM_TIME * this.cameras.main.panEffect.progress;
			}
			this.cameras.main.panEffect.reset();
			this.cameras.main.zoomEffect.reset();
			this.cameras.main.pan(data.target.x, data.target.y, duration, ZOOM_FUNC, true, (cam: Phaser.Cameras.Scene2D.Camera, progress: number) => {
				cam.panEffect.destination.x = data.target.x;
				cam.panEffect.destination.y = data.target.y;
				if (progress === 1) {
					// fire callback if needed
				}
			});
			this.cameras.main.zoomTo(Config.zoomInDistance, duration, ZOOM_FUNC);
			this.cameras.main.startFollow(data.target, true);
		}, this);
		VisEventBus.on("zoom-out", () => {
			let duration = ZOOM_TIME;
			if (this.cameras.main.panEffect.isRunning) {
				duration -= ZOOM_TIME * this.cameras.main.panEffect.progress;
			}
			this.cameras.main.panEffect.reset();
			this.cameras.main.zoomEffect.reset();
			this.cameras.main.pan(Config.gameWidth / 2, Config.gameHeight / 2, duration, ZOOM_FUNC);
			this.cameras.main.zoomTo(1.0, duration, ZOOM_FUNC);
			this.cameras.main.stopFollow();
		}, this);

		this.events.on("destroy", () => {
			VisEventBus.off("zoom-in", undefined, this);
			VisEventBus.off("zoom-out", undefined, this);
		});

		this._darkOverlay = this.add.renderTexture(0, 0, this.scale.width, this.scale.height);
		this._darkOverlay.setOrigin(0, 0);
		this.events.on("render", function () {

		});
	}

	update() {
		this._dark = this._lightswitch?.isDown || false;

		if (this._darkOverlay == null) {
			return;
		}
		this._darkOverlay.clear();
		if (this._dark) {
			this.cameras.main.setRoundPixels(false);
			this._darkOverlay.fill(0x000000, 0.7);
			for (const p of this._playerList) {
				this._darkOverlay.erase("light-mask-5x5",
					// mask is 80x80; midpoint is 40,
					//   minus half of player's sprite gives 32
					p.x - 32, p.y - 32
				);
			}
		}
	}

	processTerrainChange(location: Point, newTerrain: CoreMsg.TileType) {
		// TODO: generalize this a bit (maybe pre-process at load) if we're going to lean into putting data in the tileset
		function getProperty(t: Phaser.Tilemaps.Tile, property: string): number|null {
			if (t.properties === undefined) {
				return null;
			}
			for (const [key, value] of Object.entries(t.properties)) {
				if (key === property) {
					return value as number;
				}
			}
			return null;
		}

		const currentTile = this._wallsLayer!.getTileAt(location.x, location.y);
		let nextIndex: number = -1;
		if (newTerrain === CoreMsg.TileType.OpenDoor) {
			nextIndex = getProperty(currentTile, "openPairIndex") as number;
		}
		else if (newTerrain === CoreMsg.TileType.ClosedDoor) {
			nextIndex = getProperty(currentTile, "closePairIndex") as number;
		}
		else {
			throw new Error("Changing non-door terrain!"); // maybe someday, but not today
		}
		nextIndex += currentTile.tileset!.firstgid;
		const newTile = this._wallsLayer!.putTileAt(nextIndex, location.x, location.y);
		newTile.properties = currentTile.tileset!.getTileProperties(nextIndex);
	}

	addPlayer(p: VisPlayer) {
		this.add.existing(p);
		this._playerList.push(p);
	}
}
