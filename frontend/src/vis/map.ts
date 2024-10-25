import Phaser from "phaser";

import { WorldMap } from "../engine/game/map";

export class GameMap extends Phaser.Scene {
    worldMap?: WorldMap;
    private _backgroundLayer: Phaser.Tilemaps.TilemapLayer | null = null;

    private constructor() {
        super("MapScene");
    }

    static async loadFrom(name: string): Promise<GameMap> {
        const ms = new GameMap();
        ms.worldMap = await WorldMap.loadTiled(name);
        return ms;
    }

    preload() {

    }

    create() {
        const tm = this.make.tilemap({key: `map-${this.worldMap!.name}`});
        const tmi = tm.addTilesetImage("KennyDungeonTiles", "tiles-dungeon")!;
        this._backgroundLayer = tm.createLayer(0, tmi, 0, 0);
    }
}
