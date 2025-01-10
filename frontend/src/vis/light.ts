import { VisMap } from "./map.ts";
import { WasmBotsVisualizer } from "./game.ts";

const LIGHT_MASK_SIZE_RANGE = [0.9, 1.1];
const LIGHT_ANIM_RATE_RANGE = [500, 900];

export class LightEffect extends Phaser.GameObjects.Container {
	innerLight: Phaser.GameObjects.Sprite; // great TNG ep
	outerLight: Phaser.GameObjects.Sprite;
	animTiming: number = 0;
	animRate: number;

	constructor(mapScene: VisMap, size: number, diamond: boolean = false) {
		super(mapScene);

		let masks: string[] = [];
		if (size == 5) {
			masks = ["light-mask-5x5", "light-mask-3x3"];
		}
		else if (size == 3) {
			masks = ["light-mask-3x3", "light-mask-1x1"];
		}
		else {
			throw new Error(`Unsupported lighting size: ${size}`);
		}
		if (diamond) {
			masks = masks.map(m => `${m}-rot`);
		}

		this.outerLight = new Phaser.GameObjects.Sprite(
			mapScene,
			0, 0,
			masks[0],
		);
		this.outerLight.angle = (mapScene.game as WasmBotsVisualizer).visualRNG.pickOne([0, 90, 180, 270]);
		this.outerLight.alpha = 0.45;
		this.innerLight = new Phaser.GameObjects.Sprite(
			mapScene,
			0, 0,
			masks[1],
		);
		this.innerLight.angle = (mapScene.game as WasmBotsVisualizer).visualRNG.pickOne([0, 90, 180, 270]);
		this.innerLight.alpha = 1.0;

		this.scene.cameras.main.ignore(this.outerLight);
		this.scene.cameras.main.ignore(this.innerLight);
		this.animRate = (mapScene.game as WasmBotsVisualizer).visualRNG.randInt(LIGHT_ANIM_RATE_RANGE[0], LIGHT_ANIM_RATE_RANGE[1]);

		this.add(this.outerLight);
		this.add(this.innerLight);
	}

	update(t: number, dt: number) {
		this.animTiming += dt / this.animRate;

		// firelight formula I initially found for the gratitude bank!
		//     :D https://shaneliesegang.com/projects/gratitude 🔥
		// here I normalized it (the adjustments at the end), so it goes from
		//     a bit shy of 0.0 to a bit shy of 1.0
		const lightingIntensity =
			(
				  (3 * Math.sin(this.animTiming))
				+ (Math.sin(10 * this.animTiming))
				+ (Math.cos(5 * this.animTiming))
			) / 10.0 + 0.5;

		const scaleAddon = (LIGHT_MASK_SIZE_RANGE[1] - LIGHT_MASK_SIZE_RANGE[0]) * lightingIntensity;
		this.innerLight.scale = LIGHT_MASK_SIZE_RANGE[0] + scaleAddon;
		const targetOuterScale = LIGHT_MASK_SIZE_RANGE[0] + scaleAddon;
		this.outerLight.scale += (targetOuterScale - this.outerLight.scale) * 0.12;
	}
}
