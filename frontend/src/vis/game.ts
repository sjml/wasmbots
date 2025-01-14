import Phaser from "phaser";

import {
	Config,
	WorldMap,
	RNG,
	World,
	Player as WorldPlayer,
} from "wasmbots";
import { VisMap } from "./map.ts";
import { VisBootloader } from "./bootloader.ts";
import { VisPlayer } from "./player.ts";
import { VisEventBus } from "./events.ts";
import { LightMaskPipeline } from "./fx.ts";

export class WasmBotsVisualizer extends Phaser.Game {
	private _booloaderPromise: Promise<void>;
	private _bootloaderResolve!: () => void;
	private _bootloaderReject!: () => void;
	private _currentMapScene?: VisMap;
	visualRNG: RNG = new RNG(null);
	worldObject: World;
	playerList: VisPlayer[] = [];

	constructor(parentDiv: HTMLDivElement, world: World) {
		super({
			type: Phaser.WEBGL,
			scale: {
				parent: parentDiv,
				mode: Phaser.Scale.FIT,
				autoCenter: Phaser.Scale.CENTER_BOTH,
				width: Config.gameWidth,
				height: Config.gameHeight,
			},
			pixelArt: true,
			backgroundColor: "#032300",
			audio: {
				noAudio: true,
			},
			input: {
				mouse: false,
				touch: false,
			},
			banner: false,
			scene: [VisBootloader],
			// TODO: fix this typing hilarity if PR is accepted
			//  https://github.com/phaserjs/phaser/pull/6999
			pipeline: [LightMaskPipeline as unknown as Phaser.Renderer.WebGL.Pipelines.PostFXPipeline]
		});

		this.worldObject = world;
		this.worldObject.on("mapChanged", (evt) => {
			this.loadMap(evt.detail.newMap);
		});
		this.worldObject.on("playerAdded", (evt) => {
			this.addPlayer(evt.detail.newPlayer);
		});
		this.worldObject.on("playerDropped", (evt) => {
			this.dropPlayer(evt.detail.leavingPlayer);
		});
		this.worldObject.on("terrainChanged", (evt) => {
			this._currentMapScene?.processTerrainChange(evt.detail.location, evt.detail.newTerrain);
		});
		this.worldObject.on("worldReset", (_) => {
			VisEventBus.emit("world-reset");
		});

		this._booloaderPromise = new Promise<void>((resolve, reject) => {
			this._bootloaderResolve = resolve;
			this._bootloaderReject = reject;
		})

		VisEventBus.on("bootloader-done", () => {
			this._bootloaderResolve();
		});
		VisEventBus.on("bootloader-error", () => {
			this._bootloaderReject();
		});
	}

	untilBootloaderDone(): Promise<void> {
		return this._booloaderPromise;
	}

	async loadMap(map: WorldMap) {
		const newScene = await VisMap.from(map);
		if (this._currentMapScene) {
			const deadKey = `${this._currentMapScene.worldMap!.name}_Scene`;
			this.scene.stop(deadKey);
			this.scene.remove(deadKey);
		}
		this._currentMapScene = newScene;
		this.scene.add(`${map.name}_Scene`, this._currentMapScene, true);

		const playerObjects = this.playerList.map(vp => vp.playerObject);
		this.playerList.map(vp => vp.destroy());
		this.playerList = [];
		for (const p of playerObjects) {
			this.addPlayer(p);
		}
	}

	async addPlayer(p: WorldPlayer) {
		const pvis = new VisPlayer(this._currentMapScene!, p);
		this.playerList.push(pvis);
		VisEventBus.emit("player-vis-assigned", { player: p, vis: pvis })
	}

	async dropPlayer(p: WorldPlayer) {
		const pidx = this.playerList.findIndex(pvis => pvis.playerObject === p);
		if (pidx < 0) {
			throw new Error(`Visualization couldn't find VisPlayer matching ${p}`)
		}
		const vp = this.playerList[pidx];
		this.playerList.splice(pidx, 1);

		vp.destroy();
	}
}
