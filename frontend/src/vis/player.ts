import Phaser from "phaser";

import { Config, type Point, Player, Deck } from "wasmbots";
import { WasmBotsVisualizer } from "./game.ts";
import { VisMap } from "./map.ts";
import { VisEventBus } from "./events.ts";

const PLAYER_IMG_FRAMES = [84, 87, 96, 99, 100, 111];
const LIGHT_MASK_SIZE_RANGE = [0.9, 1.1];
const LIGHT_ANIM_RATE_RANGE = [500, 900];

export enum PlayerFacing {
	Right,
	Left,
}

export class VisPlayer extends Phaser.GameObjects.Container {
	static playerImageDeck?: Deck<number>;
	playerObject: Player;
	playerSprite: Phaser.GameObjects.Sprite;
	playerLightOuter: Phaser.GameObjects.Sprite;
	playerLightInner: Phaser.GameObjects.Sprite;
	playerLightTiming: number = 0;
	playerLightRate: number = 0;
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

		this.playerLightOuter = new Phaser.GameObjects.Sprite(
			mapScene,
			this.playerSprite.width * 0.5, this.playerSprite.height * 0.5,
			"light-mask-5x5"
		);
		this.playerLightOuter.angle = (mapScene.game as WasmBotsVisualizer).visualRNG.pickOne([0, 90, 180, 270]);
		this.playerLightOuter.alpha = 0.45;
		this.playerLightInner = new Phaser.GameObjects.Sprite(
			mapScene,
			this.playerSprite.width * 0.5, this.playerSprite.height * 0.5,
			"light-mask-3x3"
		);
		this.playerLightInner.angle = (mapScene.game as WasmBotsVisualizer).visualRNG.pickOne([0, 90, 180, 270]);
		this.playerLightInner.alpha = 1.0;

		this.scene.cameras.main.ignore(this.playerLightOuter);
		this.scene.cameras.main.ignore(this.playerLightInner);
		this.playerLightRate = (mapScene.game as WasmBotsVisualizer).visualRNG.randInt(LIGHT_ANIM_RATE_RANGE[0], LIGHT_ANIM_RATE_RANGE[1]);

		this.resetFacing();
		VisEventBus.on("world-reset", () => {
			this.resetFacing();
		});

		this.add(this.playerSprite);
		this.add(this.playerLightOuter);
		this.add(this.playerLightInner);
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

	update(t: number, dt: number) {
		this.playerLightTiming += dt / this.playerLightRate;
		// firelight formula I initially found for the gratitude bank!
		//     :D https://shaneliesegang.com/projects/gratitude 🔥
		// here I normalized it (the adjustments at the end), so it goes from
		//     a bit shy of 0.0 to a bit shy of 1.0
		const lightingIntensity =
			(
				  (3 * Math.sin(this.playerLightTiming))
				+ (Math.sin(10 * this.playerLightTiming))
				+ (Math.cos(5 * this.playerLightTiming))
			) / 10.0 + 0.5;

		const scaleAddon = (LIGHT_MASK_SIZE_RANGE[1] - LIGHT_MASK_SIZE_RANGE[0]) * lightingIntensity;
		this.playerLightInner.scale = LIGHT_MASK_SIZE_RANGE[0] + scaleAddon;
		const targetOuterScale = LIGHT_MASK_SIZE_RANGE[0] + scaleAddon;
		this.playerLightOuter.scale += (targetOuterScale - this.playerLightOuter.scale) * 0.12;

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
