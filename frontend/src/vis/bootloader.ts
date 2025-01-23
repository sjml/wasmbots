import Phaser from "phaser";

import { Loader } from "wasmbots";
import { VisEventBus } from "./events.ts";
import { phaserAssetKeys } from "./assets.ts";

export class VisBootloader extends Phaser.Scene {

	constructor() {
		super({key: "bootloader"});
	}

	preload() {
		this.load.on("loaderror", (erroredFile: Phaser.Loader.File) => {
			console.error(`ERROR: Bootloader could not load ${erroredFile.src}`);
			VisEventBus.emit("bootloader-error");
		});

		this.load.setPath(Loader.getRscPath());

		this.load.spritesheet("tiles-dungeon", phaserAssetKeys.dungeonTiles, {
			frameWidth: 16,
			frameHeight: 16,
		});
		this.load.spritesheet("tiles-kenny", phaserAssetKeys.kennyTiles, {
			frameWidth: 16,
			frameHeight: 16,
		});
		this.load.spritesheet("tiles-data", phaserAssetKeys.colorTiles, {
			frameWidth: 16,
			frameHeight: 16,
		});
		this.load.image("light-mask-5x5", phaserAssetKeys.lightmask5x5);
		this.load.image("light-mask-3x3", phaserAssetKeys.lightmask3x3);
		this.load.image("light-mask-1x1", phaserAssetKeys.lightmask1x1);
		this.load.image("light-mask-5x5-rot", phaserAssetKeys.lightmask5x5rot);
		this.load.image("light-mask-3x3-rot", phaserAssetKeys.lightmask3x3rot);
		this.load.image("light-mask-1x1-rot", phaserAssetKeys.lightmask1x1rot);
	}

	create() {
		this.anims.create({
			key: "flame",
			frames: this.anims.generateFrameNumbers("tiles-dungeon", {start: 92, end: 97}),
			frameRate: 12,
			repeat: -1,
		});
		this.anims.create({
			key: "banner-blue",
			frames: this.anims.generateFrameNumbers("tiles-dungeon", {start: 110, end: 119}),
			frameRate: 6,
			repeat: -1,
		});
		this.anims.create({
			key: "coin",
			frames: this.anims.generateFrameNumbers("tiles-dungeon", {start: 100, end: 102}),
			frameRate: 9,
			repeat: -1,
			yoyo: true,
		});

		VisEventBus.emit("bootloader-done");
	}
}
