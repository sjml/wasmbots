import Phaser from "phaser";

import config from "../engine/core/config";
import { RNG } from "../engine/game/random";
import { World } from "../engine/game/world";
import { Player as WorldPlayer } from "../engine/game/player";
import { VisMap } from "./map";
import { VisBootloader } from "./bootloader";
import { VisPlayer, PlayerFacing } from "./player";
import { VisEventBus } from "./events";

export class WasmBotsVisualizer extends Phaser.Game {
    private _booloaderPromise: Promise<void>;
    private _bootloaderResolve!: () => void;
    private _bootloaderReject!: () => void;
    private _currentMapScene?: VisMap;
    visualRNG: RNG = new RNG(null);
    worldObject: World;

    constructor(parentDiv: HTMLDivElement, world: World) {
        super({
            type: Phaser.AUTO,
            scale: {
                parent: parentDiv,
                mode: Phaser.Scale.FIT,
                autoCenter: Phaser.Scale.CENTER_BOTH,
                width: config.gameWidth,
                height: config.gameHeight,
            },
            pixelArt: true,
            backgroundColor: "#032300",
            audio: {
                noAudio: true,
            },
            banner: false,
            scene: [VisBootloader],
        });

        this.worldObject = world;

        this._booloaderPromise = new Promise<void>((resolve, reject) => {
            this._bootloaderResolve = resolve;
            this._bootloaderReject = reject;
        })

        VisEventBus.on("bootloader-done", () => {
            this._bootloaderResolve();
        });
        VisEventBus.on("bootloder-error", () => {
            this._bootloaderReject();
        });
    }

    untilBootloaderDone(): Promise<void> {
        return this._booloaderPromise;
    }

    async loadMap(mapName: string) {
        this._currentMapScene = await VisMap.loadFrom(mapName);
        this.worldObject.setMap(this._currentMapScene.worldMap!);
        this.scene.add(`${mapName}_Scene`, this._currentMapScene, true);
    }

    async addPlayer(p: WorldPlayer) {
        const pvis = new VisPlayer(this._currentMapScene!, p);
    }
}
