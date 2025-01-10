import Phaser from "phaser";

import { Loader } from "wasmbots";
import { VisEventBus } from "./events.ts";

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

		this.load.spritesheet("tiles-dungeon", "img/Dungeon_Tileset.png", {
			frameWidth: 16,
			frameHeight: 16,
		});
		this.load.spritesheet("tiles-kenny", "img/kenny_tiny-dungeon_tilemap.png", {
			frameWidth: 16,
			frameHeight: 16,
		});
		this.load.spritesheet("tiles-data", "img/colors.png", {
			frameWidth: 16,
			frameHeight: 16,
		});
		this.load.image("light-mask-5x5", "img/light-mask-5x5.png");
		this.load.image("light-mask-3x3", "img/light-mask-3x3.png");
		this.load.image("light-mask-1x1", "img/light-mask-3x3.png");
		this.load.image("light-mask-5x5-rot", "img/light-mask-5x5-rot.png");
		this.load.image("light-mask-3x3-rot", "img/light-mask-3x3-rot.png");
		this.load.image("light-mask-1x1-rot", "img/light-mask-1x1-rot.png");
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
			frames: this.anims.generateFrameNumbers("tiles-dungeon", {start: 100, end: 109}),
			frameRate: 6,
			repeat: -1,
		});

		VisEventBus.emit("bootloader-done");
	}
}
