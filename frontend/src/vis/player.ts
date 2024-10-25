import Phaser from "phaser";

import config from "../engine/core/config.ts";
import { type Point } from "../engine/game/map.ts";
import { Deck } from "../engine/game/random.ts";
import { WasmBotsVisualizer } from "./game.ts";

const PLAYER_IMG_FRAMES = [84, 111];

export enum PlayerFacing {
    Right,
    Left,
}

export class GamePlayer extends Phaser.GameObjects.Sprite {
    static playerImageDeck?: Deck<number>;

    constructor(scene: Phaser.Scene, tilePos: Point) {
        if (!GamePlayer.playerImageDeck) {
            GamePlayer.playerImageDeck = new Deck(PLAYER_IMG_FRAMES, (scene.game as WasmBotsVisualizer).visualRNG)
        }
        super(
            scene,
            tilePos.x * config.tileSize, tilePos.y * config.tileSize,
            "tiles-dungeon", GamePlayer.playerImageDeck.draw()
        );

        this.setOrigin(0, 0);
        scene.add.existing(this);
    }

    setFacing(facing: PlayerFacing) {
        if (facing == PlayerFacing.Left) {
            this.setFlipX(true);
        }
        else {
            this.setFlipX(false);
        }
    }
}
