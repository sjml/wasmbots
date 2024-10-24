import Phaser from "phaser";

import { EventBus } from "./events";

export class GameBootloader extends Phaser.Scene {

    constructor() {
        super({key: "bootloader"});
    }

    preload() {
        this.setLoadEvents();
        this.load.setPath("rsc");

        this.load.image("tiles-dungeon", "img/kenny_tiny-dungeon_tilemap.png");
        this.load.tilemapTiledJSON("map-arena", "maps/static/arena.tmj");
    }

    setLoadEvents() {
        this.load.on("complete", () => {
            EventBus.emit("bootloader-done");
        });
        this.load.on("loaderror", (erroredFile: Phaser.Loader.File) => {
            console.error(`ERROR: Bootloader could not load ${erroredFile.src}`);
            EventBus.emit("bootloader-error");
        });
    }
}
