import Phaser from "phaser";

import { WorldMap } from "../engine/game/map";
import type { VisPlayer } from "./player";

export class VisMap extends Phaser.Scene {
    worldMap?: WorldMap;
    private _backgroundLayer: Phaser.Tilemaps.TilemapLayer | null = null;
    private _itemLayer: Phaser.Tilemaps.TilemapLayer | null = null;
    playerList: VisPlayer[] = [];

    private constructor() {
        super("MapScene");
    }

    static async loadFrom(name: string): Promise<VisMap> {
        const ms = new VisMap();
        ms.worldMap = await WorldMap.loadTiled(name);
        return ms;
    }

    preload() {}

    create() {
        const tm = this.make.tilemap({key: `map-${this.worldMap!.name}`});
        const tmi = tm.addTilesetImage("KennyDungeonTiles", "tiles-dungeon")!;
        this._backgroundLayer = tm.createLayer("terrain", tmi, 0, 0);
        this._itemLayer = tm.createLayer("items", tmi, 0, 0);
    }

    update() {
        for (const p of this.playerList) {
            p.update();
        }
    }
}
