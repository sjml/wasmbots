const lightMaskFragShader = `
	precision mediump float;

	uniform sampler2D uMainSampler;
	varying vec2 outTexCoord;

	void main() {
		vec4 shadowColor = vec4(0.0, 0.0, 0.0, 0.7);
		vec4 maskColor = texture2D(uMainSampler, outTexCoord);
		gl_FragColor = shadowColor * (1.0 - maskColor.a);
	}
`;

export class LightMaskPipeline extends Phaser.Renderer.WebGL.Pipelines.PostFXPipeline {
	constructor (game: Phaser.Game) {
		super({
			name: "LightMaskPipeline",
			game,
			renderTarget: true,
			fragShader: lightMaskFragShader,
		});
	}
}
