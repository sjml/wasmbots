import { Game, Scene, WEBGL } from "phaser";

import { WorldMap, TileType } from "../engine/game/worldMap";

class MapScene extends Scene {
    private _map?: WorldMap;
//     return new Game({
//         width: config.gameWidth,
    private constructor() {
        super("MapScene");
    }

    static async init(name: string): Promise<MapScene> {
        const ms = new MapScene();
        ms._map = await WorldMap.loadStatic(name);
        return ms;
    }

    preload() {
    }

    create() {
        this.add.text(512, 320, "Hello, world!", {
            align: "center",
            fontFamily: "Lucida Grande",
            fontSize: 72,
            color: "white",
        }).setOrigin(0.5);
    }
}

export class WasmBotsGame {
    private _game: Game;

    constructor(canvas: HTMLCanvasElement) {
        this._game = new Game({
            width: canvas.width,
            height: canvas.height,
            type: WEBGL,
            pixelArt: true,
            backgroundColor: "#032300",
            canvas,
            audio: {
                noAudio: true,
            }
        });
    }

    async loadMap(mapName: string) {
        const mapScene = await MapScene.init(mapName);
        this._game.scene.add(`${mapName}_Scene`, mapScene, true);
    }
}
