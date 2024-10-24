import Phaser from "phaser";

import { WorldMap } from "../engine/game/map";

export class GameMap extends Phaser.Scene {
    private _map?: WorldMap;
    private _backgroundLayer: Phaser.Tilemaps.TilemapLayer | null = null;

    private constructor() {
        super("MapScene");
    }

    static async loadFrom(name: string): Promise<GameMap> {
        const ms = new GameMap();
        ms._map = await WorldMap.loadTiled(name);
        return ms;
    }

    preload() {

    }

    create() {
        const tm = this.make.tilemap({key: `map-${this._map!.name}`});
        const tmi = tm.addTilesetImage("KennyDungeonTiles", "tiles-dungeon")!;
        this._backgroundLayer = tm.createLayer(0, tmi, 0, 0);
    }
}
