import Phaser from "phaser";

import { Loader } from "../engine";
import { VisEventBus } from "./events";

export class VisBootloader extends Phaser.Scene {

    constructor() {
        super({key: "bootloader"});
    }

    preload() {
        this.setLoadEvents();
        this.load.setPath(Loader.getRscPath());

        this.load.spritesheet("tiles-dungeon", "img/kenny_tiny-dungeon_tilemap.png", {
            frameWidth: 16,
            frameHeight: 16,
        });
        this.load.spritesheet("tiles-grayscale", "img/grayscale.png", {
            frameWidth: 16,
            frameHeight: 16,
        });
        this.load.spritesheet("tiles-colors", "img/colors.png", {
            frameWidth: 16,
            frameHeight: 16,
        });

        this.load.tilemapTiledJSON("map-arena", "maps/static/arena.tmj");
        this.load.tilemapTiledJSON("map-dungeon", "maps/static/dungeon.tmj");
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
