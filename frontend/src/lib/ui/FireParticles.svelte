<script lang="ts">
	import { onMount } from "svelte";

	interface Props {}
	let {}: Props = $props();

	let particleCanvas: HTMLCanvasElement;
	let ctx: CanvasRenderingContext2D | null = null;
	let canvasSize = $state({ w: 0, h: 0 });
	let particles: Particle[] = [];

	const numParticles = 100;

	interface Particle {
		x: number;
		y: number;
		vx: number;
		vy: number;
		size: number;
		life: number;
		maxLife: number;
		color: string;
	}

	function createParticle(): Particle {
		return {
			x: canvasSize.w * 0.5 + (Math.random() - 0.5) * 30,
			y: canvasSize.h,
			vx: (Math.random() - 0.5) * 1,
			vy: -Math.random() * 2 - 1,
			size: Math.random() * 4 + 2,
			life: 1,
			maxLife: Math.random() * 1.5 + 0.5,
			color: `hsl(${Math.random() * 40 + 10}, ${Math.random() * 40 + 60}%, ${Math.random() * 70 + 30}%)`,
		};
	}

	function update(dt: number) {
		if (particles.length < numParticles) {
			particles.push(createParticle());
		}

		particles = particles.filter(p => {
			p.x += p.vx * dt * 60;
			p.y += p.vy * dt * 60;
			p.vy += dt * -0.5;
			p.vx *= 0.99;

			p.life -= dt / p.maxLife;

			return p.life > 0;
		});
	}

	function render() {
		if (!ctx) {
			return;
		}

		ctx.scale(window.devicePixelRatio, window.devicePixelRatio);
		ctx.clearRect(0, 0, canvasSize.w, canvasSize.h);

		particles.forEach(p => {
			ctx!.fillStyle = p.color;
			ctx!.globalAlpha = p.life;
			ctx!.fillRect(p.x, p.y, p.size, p.size);
		});

		ctx.globalAlpha = 1;
		ctx.resetTransform();
	}

	let lastTime: DOMHighResTimeStamp = 0;
	function animate(t: DOMHighResTimeStamp) {
		let dt = 0;
		if (lastTime != 0) {
			dt = t - lastTime;
		}
		lastTime = t;

		update(dt / 1000);
		render();

		requestAnimationFrame(animate);
	}

	onMount(() => {
		if (window.matchMedia(`(prefers-reduced-motion: reduce)`).matches === true) {
			// not reactive, but this is not a setting people change a lot live, I think
			return;
		}
		ctx = particleCanvas.getContext("2d");

		requestAnimationFrame(animate);
	});
</script>

<div class="container" aria-hidden="true"
	bind:offsetWidth={canvasSize.w}
	bind:offsetHeight={canvasSize.h}
>
	<canvas
		bind:this={particleCanvas}
		width={canvasSize.w * window.devicePixelRatio}
		height={canvasSize.h * window.devicePixelRatio}
		style={`width: ${canvasSize.w}px; height: ${canvasSize.h}px;`}
	>
	</canvas>
</div>

<style>
	.container {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
	}

	@media (prefers-reduced-motion: reduce) {
		.container {
			display: none;
		}
	}

	canvas {
		background: linear-gradient(to bottom right, hsl(204, 10%, 5%), #4a0000 200%);
	}
</style>
