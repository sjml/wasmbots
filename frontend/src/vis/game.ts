import { Game, Scene, WEBGL } from "phaser";

import config from "../engine/core/config";
import { WorldMap, TileType } from "../engine/game/worldMap";

class MapScene extends Scene {
    private _map?: WorldMap;
    private _tileMapping: number[][] = [];

    private constructor() {
        super("MapScene");
    }

    static async init(name: string): Promise<MapScene> {
        const ms = new MapScene();
        ms._map = await WorldMap.loadStatic(name);
        ms._tileMapping = [];
        // TODO: this is a ham-fisted hack; get more clever about this some day
        // TODO: add some purely visual variations to the empty spaces
        for (let y = 0; y < ms._map.tiles.length; y++) {
            const row: number[] = Array(ms._map.tiles[y].length).fill(0);
            for (let x = 0; x < ms._map.tiles[y].length; x++) {
                const tile = ms._map.tiles[y][x];
                if (tile === TileType.Empty) {
                    if (y == ms._map.tiles.length - 2) {
                        row[x] = 2;
                    }
                }
                else if (tile === TileType.Wall) {
                    if (y == ms._map.tiles.length-1 && x == 0) {
                        row[x] = 40;
                    }
                    else if (y == ms._map.tiles.length-1 && x == ms._map.tiles[y].length-1) {
                        row[x] = 40;
                    }
                    else if (x == 0) {
                        row[x] = 59;
                    }
                    else if (x == ms._map.tiles[y].length-1) {
                        row[x] = 57;
                    }
                    else {
                        row[x] = 40;
                    }
                }
            }
            ms._tileMapping.push(row);
        }
        return ms;
    }

    preload() {
        this.load.setPath("rsc");

        this.load.image("dungeon-tiles", "img/kenny_tiny-dungeon_tilemap.png");
    }

    create() {
        const tm = this.make.tilemap({
            data: this._tileMapping,
            tileWidth: 16,
            tileHeight: 16,
        });
        const tmi = tm.addTilesetImage("dungeon-tiles")!;
        const tml = tm.createLayer(0, tmi, 0, 0);
        // this.add.text(512, 320, "WasmBots!", {
        //     align: "center",
        //     fontFamily: "Lucida Grande",
        //     fontSize: 72,
        //     color: "white",
        // }).setOrigin(0.5);
    }
}

export class WasmBotsGame {
    private _game: Game;

    constructor(canvas: HTMLCanvasElement) {
        this._game = new Game({
            width: config.gameWidth,
            height: config.gameHeight,
            type: WEBGL,
            pixelArt: true,
            backgroundColor: "#032300",
            canvas,
            audio: {
                noAudio: true,
            },
            banner: false,
        });
    }

    async loadMap(mapName: string) {
        const mapScene = await MapScene.init(mapName);
        this._game.scene.add(`${mapName}_Scene`, mapScene, true);
    }
}
