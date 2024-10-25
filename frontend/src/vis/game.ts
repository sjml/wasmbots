import Phaser from "phaser";

import config from "../engine/core/config";
import { RNG } from "../engine/game/random";
import { World } from "../engine/game/world";
import { Player as WorldPlayer } from "../engine/game/player";
import { GameMap } from "./map";
import { GameBootloader } from "./bootloader";
import { GamePlayer } from "./player";
import { EventBus } from "./events";

export class WasmBotsVisualizer extends Phaser.Game {
    private _booloaderPromise: Promise<void>;
    private _bootloaderResolve!: () => void;
    private _bootloaderReject!: () => void;
    private _currentMapScene?: GameMap;
    visualRNG: RNG = new RNG(null);
    worldObject: World;

    constructor(canvas: HTMLCanvasElement, world: World) {
        super({
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

        this.worldObject = world;

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
        this._currentMapScene = await GameMap.loadFrom(mapName);
        this.worldObject.setMap(this._currentMapScene.worldMap!);
        this.scene.add(`${mapName}_Scene`, this._currentMapScene, true);
    }

    async addPlayer(p: WorldPlayer) {
        console.log("adding vis player at", p.location);
        const pvis = new GamePlayer(this._currentMapScene!, p.location);
    }
}
