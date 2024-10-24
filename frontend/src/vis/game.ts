import Phaser from "phaser";

import config from "../engine/core/config";
import { GameMap } from "./map";
import { GameBootloader } from "./bootloader";
import { EventBus } from "./events";

export class WasmBotsGame {
    private _game: Phaser.Game;
    private _booloaderPromise: Promise<void>;
    private _bootloaderResolve!: () => void;
    private _bootloaderReject!: () => void;

    constructor(canvas: HTMLCanvasElement) {
        this._game = new Phaser.Game({
            width: config.gameWidth,
            height: config.gameHeight,
            type: Phaser.WEBGL,
            pixelArt: true,
            backgroundColor: "#032300",
            canvas,
            audio: {
                noAudio: true,
            },
            banner: false,
            scene: [GameBootloader],
        });

        this._booloaderPromise = new Promise<void>((resolve, reject) => {
            this._bootloaderResolve = resolve;
            this._bootloaderReject = reject;
        })

        EventBus.on("bootloader-done", () => {
            this._bootloaderResolve();
        });
        EventBus.on("bootloder-error", () => {
            this._bootloaderReject();
        });
    }

    untilBootloaderDone(): Promise<void> {
        return this._booloaderPromise;
    }

    async loadMap(mapName: string) {
        const mapScene = await GameMap.loadFrom(mapName);
        this._game.scene.add(`${mapName}_Scene`, mapScene, true);
    }
}
