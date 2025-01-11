import Phaser from "phaser";

import { Config, CoreMsg, GameState, WorldMap, type Point } from "wasmbots";
import { type VisPlayer } from "./player.ts";
import { VisEventBus } from "./events.ts";
import { LightMaskPipeline } from "./fx.ts";
import { LightEffect } from "./light.ts";
import type { WasmBotsVisualizer } from "./game.ts";

const ZOOM_TIME = 750;
const ZOOM_FUNC = Phaser.Math.Easing.Sine.InOut;

class CameraSet {
	cameras: Phaser.Cameras.Scene2D.Camera[] = [];

	setBounds(x: number, y: number, width: number, height: number, centerOn?: boolean) {
		for (const c of this.cameras) {
			c.setBounds(x, y,width, height, centerOn);
		}
	}

	panEffectReset() {
		for (const c of this.cameras) {
			c.panEffect.reset();
		}
	}

	zoomEffectReset() {
		for (const c of this.cameras) {
			c.zoomEffect.reset();
		}
	}

	pan(x: number, y: number, duration?: number, ease?: string | Function, force?: boolean, callback?: Phaser.Types.Cameras.Scene2D.CameraPanCallback, context?: any) {
		for (const c of this.cameras) {
			c.pan(x, y, duration, ease, force, callback, context);
		}
	}

	zoomTo(zoom: number, duration?: number, ease?: string | Function, force?: boolean, callback?: Phaser.Types.Cameras.Scene2D.CameraPanCallback, context?: any) {
		for (const c of this.cameras) {
			c.zoomTo(zoom, duration, ease, force, callback, context);
		}
	}

	startFollow(target: Phaser.GameObjects.GameObject | object, roundPixels?: boolean, lerpX?: number, lerpY?: number, offsetX?: number, offsetY?: number) {
		for (const c of this.cameras) {
			c.startFollow(target, roundPixels, lerpX, lerpY, offsetX, offsetY);
		}
	}

	stopFollow() {
		for (const c of this.cameras) {
			c.stopFollow();
		}
	}
}

export class VisMap extends Phaser.Scene {
	worldMap!: WorldMap;
	private _tilemap: Phaser.Tilemaps.Tilemap | null = null;
	private _groundLayer: Phaser.Tilemaps.TilemapLayer | null = null;
	private _wallsLayer: Phaser.Tilemaps.TilemapLayer | null = null;
	private _clutterLayer: Phaser.Tilemaps.TilemapLayer | null = null;
	private _playerList: VisPlayer[] = [];
	// private _lightswitch: Phaser.Input.Keyboard.Key|null = null;
	private _lights: LightEffect[] = [];
	private _fxCamera: Phaser.Cameras.Scene2D.Camera | null = null;
	private _cameraSet: CameraSet = new CameraSet();

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
		// this._lightswitch = this.input.keyboard?.addKey("L") ?? null;

		this._tilemap = this.make.tilemap({key: `map-${this.worldMap.name}`});
		for (const tsObj of this._tilemap.tilesets) {
			this._tilemap.addTilesetImage(tsObj.name, `tiles-${tsObj.name}`);
		}
		this._groundLayer = this._tilemap.createLayer("ground", this._tilemap.tilesets, 0, 0);
		this._wallsLayer = this._tilemap.createLayer("walls", this._tilemap.tilesets, 0, 0);
		this._clutterLayer = this._tilemap.createLayer("clutter", this._tilemap.tilesets, 0, 0);


		// clutter
		const animatedClutter = this.add.group();
		for (let y = 0; y < this._tilemap.height; y += 1) {
			for (let x = 0; x < this._tilemap.width; x += 1) {
				const t = this._clutterLayer!.getTileAt(x, y, true);
				if (!t) {
					throw new Error(`No tile at ${x}, ${y}?!`);
				}
				const datums = t.getTileData();
				if (datums && (datums as any).type == "Torch") {
					const flame = this.add.sprite(t.pixelX, t.pixelY-8, "tiles-dungeon");
					flame.play({key: "flame", randomFrame: true});
					flame.setOrigin(0,0);
					flame.setDepth(100);
					flame.flipX = t.flipX;
					animatedClutter.add(flame);

					const light = new LightEffect(this, 3, true);
					light.x = flame.x + flame.width * 0.5;
					light.y = flame.y + flame.height * 0.5;
					light.y += 4;
					this.add.existing(light);
					this._lights.push(light);
				}
				if (datums && (datums as any).type == "Banner") {
					this._clutterLayer!.removeTileAt(x, y);
					const banner = this.add.sprite(t.pixelX, t.pixelY, "tiles-dungeon");
					banner.setOrigin(0,0);
					banner.play({key: "banner-blue", randomFrame: true});
					animatedClutter.add(banner);
				}
			}
		}


		// cameras
		this._cameraSet.cameras.push(this.cameras.main);

		if (this.worldMap.isDark) {
			this._fxCamera = this.cameras.add(
				0, 0,
				this.scale.width, this.scale.height,
				false,
				"fxCamera"
			);
			this._fxCamera.setPostPipeline(LightMaskPipeline);
			this._fxCamera.ignore(this._wallsLayer!);
			this._fxCamera.ignore(this._clutterLayer!);
			this._fxCamera.ignore(animatedClutter);
			this._cameraSet.cameras.push(this._fxCamera);
		}

		this._cameraSet.setBounds(0, 0, Config.gameWidth, Config.gameHeight);


		// events
		VisEventBus.on("zoom-in", (data: {target: VisPlayer}) => {
			let duration = ZOOM_TIME;
			if (this.cameras.main.panEffect.isRunning) {
				duration -= ZOOM_TIME * this.cameras.main.panEffect.progress;
			}
			this._cameraSet.panEffectReset();
			this._cameraSet.zoomEffectReset();
			this._cameraSet.pan(data.target.x, data.target.y, duration, ZOOM_FUNC, true, (cam: Phaser.Cameras.Scene2D.Camera, progress: number) => {
				cam.panEffect.destination.x = data.target.x;
				cam.panEffect.destination.y = data.target.y;
			});
			this._cameraSet.zoomTo(Config.zoomInDistance, duration, ZOOM_FUNC);
			this._cameraSet.startFollow(data.target, false);
		}, this);
		VisEventBus.on("zoom-out", () => {
			let duration = ZOOM_TIME;
			if (this.cameras.main.panEffect.isRunning) {
				duration -= ZOOM_TIME * this.cameras.main.panEffect.progress;
			}
			this._cameraSet.panEffectReset();
			this._cameraSet.zoomEffectReset();
			this._cameraSet.pan(Config.gameWidth / 2, Config.gameHeight / 2, duration, ZOOM_FUNC);
			this._cameraSet.zoomTo(1.0, duration, ZOOM_FUNC);
			this._cameraSet.stopFollow();
		}, this);

		this.events.on("destroy", () => {
			VisEventBus.off("zoom-in", undefined, this);
			VisEventBus.off("zoom-out", undefined, this);
		});
	}

	update(time: number, delta: number) {
		for (const l of this._lights) {
			l.update(time, delta);
		}

		let isDark = (this.game as WasmBotsVisualizer).worldObject.gameState == GameState.Running;
		// if (this._lightswitch?.isDown) {
		// 	isDark = !isDark;
		// }

		if (this._fxCamera && this._groundLayer) {
			if (isDark) {
				this._groundLayer.cameraFilter |= this._fxCamera.id;
			}
			else {
				this._groundLayer.cameraFilter &= ~this._fxCamera.id;
			}
		}

		for (const p of this._playerList) {
			p.update(time, delta);
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

	removePlayer(p: VisPlayer) {
		const pidx = this._playerList.findIndex(pv => pv === p);
		this._playerList.splice(pidx, 1);
	}
}
