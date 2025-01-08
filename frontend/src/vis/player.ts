import Phaser from "phaser";

import { Config, type Point, Player, Deck } from "wasmbots";
import { WasmBotsVisualizer } from "./game.ts";
import { VisMap } from "./map.ts";
import { VisEventBus } from "./events.ts";

const PLAYER_IMG_FRAMES = [84, 87, 96, 99, 100, 111];

export enum PlayerFacing {
	Right,
	Left,
}

export class VisPlayer extends Phaser.GameObjects.Container {
	static playerImageDeck?: Deck<number>;
	playerObject: Player;
	playerSprite: Phaser.GameObjects.Sprite;
	playerLight: Phaser.GameObjects.Sprite;
	tilePosition: Point;
	imageIndex: number;

	constructor(mapScene: VisMap, playerObject: Player) {
		super(
			mapScene,
			playerObject.location.x * Config.tileSize, playerObject.location.y * Config.tileSize,
		);

		if (!VisPlayer.playerImageDeck) {
			VisPlayer.playerImageDeck = new Deck(PLAYER_IMG_FRAMES, (mapScene.game as WasmBotsVisualizer).visualRNG)
		}
		const imageIndex = VisPlayer.playerImageDeck.draw();

		this.playerSprite = new Phaser.GameObjects.Sprite(
			mapScene,
			0, 0,
			"tiles-kenny", imageIndex
		);
		this.on("destroy", () => {
			VisPlayer.playerImageDeck?.restoreItem(imageIndex);
			mapScene.removePlayer(this);
		});
		this.playerObject = playerObject;
		this.tilePosition = playerObject.location;
		this.imageIndex = imageIndex;
		this.playerSprite.setOrigin(0, 0);

		this.playerLight = new Phaser.GameObjects.Sprite(
			mapScene,
			this.playerSprite.width * 0.5, this.playerSprite.height * 0.5,
			"light-mask-5x5"
		);
		this.scene.cameras.main.ignore(this.playerLight);

		this.resetFacing();
		VisEventBus.on("world-reset", () => {
			this.resetFacing();
		});

		this.add(this.playerSprite);
		this.add(this.playerLight);
		mapScene.addPlayer(this);
	}

	resetFacing() {
		if (this.playerObject.location.x > (Config.gameWidth / Config.tileSize * 0.5)) {
			this.setFacing(PlayerFacing.Left);
		}
		else {
			this.setFacing(PlayerFacing.Right);
		}
	}

	setFacing(facing: PlayerFacing) {
		if (facing == PlayerFacing.Left) {
			this.playerSprite.setFlipX(true);
		}
		else {
			this.playerSprite.setFlipX(false);
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

			const world = (this.scene.game as WasmBotsVisualizer).worldObject;
			this.scene.tweens.add({
				targets: this,
				x: this.tilePosition.x * Config.tileSize,
				y: this.tilePosition.y * Config.tileSize,
				duration: Math.min(world.minimumTurnTime - world.turnTimeBuffer, 200),
				ease: 'Linear'
			});
		}
	}
}
