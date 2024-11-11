import Phaser from "phaser";

import { Config, type Point, Player, Deck } from "wasmbots";
import { WasmBotsVisualizer } from "./game.ts";
import { VisMap } from "./map.ts";

const PLAYER_IMG_FRAMES = [84, 87, 96, 99, 100, 111];

export enum PlayerFacing {
	Right,
	Left,
}

export class VisPlayer extends Phaser.GameObjects.Sprite {
	static playerImageDeck?: Deck<number>;
	playerObject: Player;
	tilePosition: Point;
	imageIndex: number;

	constructor(mapScene: VisMap, playerObject: Player) {
		if (!VisPlayer.playerImageDeck) {
			VisPlayer.playerImageDeck = new Deck(PLAYER_IMG_FRAMES, (mapScene.game as WasmBotsVisualizer).visualRNG)
		}
		const imageIndex = VisPlayer.playerImageDeck.draw();
		super(
			mapScene,
			playerObject.location.x * Config.tileSize, playerObject.location.y * Config.tileSize,
			"tiles-dungeon", imageIndex
		);
		this.playerObject = playerObject;
		this.tilePosition = playerObject.location;
		this.imageIndex = imageIndex;
		this.setOrigin(0, 0);

		if (playerObject.location.x > (Config.gameWidth / Config.tileSize * 0.5)) {
			this.setFacing(PlayerFacing.Left);
		}
		else {
			this.setFacing(PlayerFacing.Right);
		}

		mapScene.addPlayer(this);
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
			if (this.tilePosition.x < this.playerObject.location.x) {
				this.setFacing(PlayerFacing.Right);
			}
			else if (this.tilePosition.x > this.playerObject.location.x) {
				this.setFacing(PlayerFacing.Left);
			}
			this.tilePosition = this.playerObject.location;
			this.setPosition(
				this.tilePosition.x * Config.tileSize,
				this.tilePosition.y * Config.tileSize,
			);
		}
	}
}
