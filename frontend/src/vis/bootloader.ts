import Phaser from "phaser";

import { VisEventBus } from "./events";

export class VisBootloader extends Phaser.Scene {

    constructor() {
        super({key: "bootloader"});
    }

    preload() {
        this.setLoadEvents();
        this.load.setPath("rsc");

        this.load.spritesheet("tiles-dungeon", "img/kenny_tiny-dungeon_tilemap.png", {
            frameWidth: 16,
            frameHeight: 16,
        });

        this.load.tilemapTiledJSON("map-arena", "maps/static/arena.tmj");
    }

    setLoadEvents() {
        this.load.on("complete", () => {
            VisEventBus.emit("bootloader-done");
        });
        this.load.on("loaderror", (erroredFile: Phaser.Loader.File) => {
            console.error(`ERROR: Bootloader could not load ${erroredFile.src}`);
            VisEventBus.emit("bootloader-error");
        });
    }
}
