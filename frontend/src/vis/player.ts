import Phaser from "phaser";

import config from "../engine/core/config.ts";
import { type Point } from "../engine/game/map.ts";
import { Player } from "../engine/game/player.ts";
import { Deck } from "../engine/game/random.ts";
import { WasmBotsVisualizer } from "./game.ts";
import { VisMap } from "./map.ts";

const PLAYER_IMG_FRAMES = [84, 111];

export enum PlayerFacing {
    Right,
    Left,
}

export class VisPlayer extends Phaser.GameObjects.Sprite {
    static playerImageDeck?: Deck<number>;
    playerObject: Player;
    tilePosition: Point;

    constructor(mapScene: VisMap, playerObject: Player) {
        if (!VisPlayer.playerImageDeck) {
            VisPlayer.playerImageDeck = new Deck(PLAYER_IMG_FRAMES, (mapScene.game as WasmBotsVisualizer).visualRNG)
        }
        super(
            mapScene,
            playerObject.location.x * config.tileSize, playerObject.location.y * config.tileSize,
            "tiles-dungeon", VisPlayer.playerImageDeck.draw()
        );
        this.playerObject = playerObject;
        this.tilePosition = playerObject.location;
        this.setOrigin(0, 0);

        if (playerObject.location.x > (config.gameWidth / config.tileSize * 0.5)) {
            this.setFacing(PlayerFacing.Left);
        }
        else {
            this.setFacing(PlayerFacing.Right);
        }

        mapScene.add.existing(this);
        mapScene.playerList.push(this);
    }

    setFacing(facing: PlayerFacing) {
        if (facing == PlayerFacing.Left) {
            this.setFlipX(true);
        }
        else {
            this.setFlipX(false);
        }
    }

    update() {
        if (   this.tilePosition.x != this.playerObject.location.x
            || this.tilePosition.y != this.playerObject.location.y
        ) {
            this.tilePosition = this.playerObject.location;
            this.setPosition(
                this.tilePosition.x * config.tileSize,
                this.tilePosition.y * config.tileSize,
            );
        }
    }
}
