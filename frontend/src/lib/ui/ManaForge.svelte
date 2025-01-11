<script lang="ts">
	import { onMount } from "svelte";

	interface Props {
		animRate?: number;
		minExtent?: number;
		maxExtent?: number;
		lightShape?: string;
	}
	let { animRate = 75, minExtent = 75, maxExtent = 100, lightShape = "ellipse at bottom" }: Props = $props();

	let particleCanvas: HTMLCanvasElement;
	let ctx: CanvasRenderingContext2D | null = null;
	let canvasSize = $state({ w: 0, h: 0 });
	let scale = $derived({x: canvasSize.w / Math.min(950, canvasSize.w), y: canvasSize.h / Math.min(100, canvasSize.h)});;
	let particles: Particle[] = [];
	let elapsedTime: number = $state(0);

	const numParticles = 100;

	interface Particle {
		x: number;
		y: number;
		vx: number;
		vy: number;
		initialSpeed: number;
		size: number;
		life: number;
		maxLife: number;
		color: string;
	}

	function createParticle(): Particle {
		let x, y, vx, vy;

		if (Math.random() < 0.5) {
			// start from a side
			const onLeft = Math.random() < 0.5;
			x = onLeft ? 0 : canvasSize.w;
			y = canvasSize.h - (Math.random() * canvasSize.h / 3);

			const targetX = onLeft ?
				(canvasSize.w * 0.5 + Math.random() * canvasSize.w * 0.3) :
				(canvasSize.w * 0.2 + Math.random() * canvasSize.w * 0.3);

			const targetY = canvasSize.h * (0.1 + Math.random() * 0.6);

			const dx = targetX - x;
			const dy = targetY - y;
			const angle = Math.atan2(dy, dx) + (Math.random() - 0.5) * 0.8;

			const speed = 2 + Math.random() * 2;
			vx = Math.cos(angle) * speed * scale.x;
			vy = Math.sin(angle) * speed * scale.y;
		} else {
			// start from bottom
			x = canvasSize.w * (0.2 + Math.random() * 0.6);
			y = canvasSize.h;

			const angle = -Math.PI/2 + (Math.random() - 0.5) * 2.2;
			const speed = 0.8 + Math.random() * 1.2;

			vx = Math.cos(angle) * speed * 2 * scale.x;
			vy = Math.sin(angle) * speed * scale.y;
		}

		const hue = 210 + Math.random() * 10;
		const saturation = Math.random() * 20;
		const lightness = 80 + Math.random() * 20;

		return {
			x,
			y,
			vx,
			vy,
			size: Math.random() * 3 + 1 * scale.x,
			life: 1,
			maxLife: Math.random() * 1.5 + 1,
			color: `hsl(${hue}, ${saturation}%, ${lightness}%)`,
			initialSpeed: Math.sqrt(vx * vx + vy * vy)
		};
	}

	function update(dt: number) {
		if (particles.length < numParticles && Math.random() < .2) {
			particles.push(createParticle());
		}

		particles = particles.filter(p => {
			const currentSpeed = Math.sqrt(p.vx * p.vx + p.vy * p.vy);
			const speedRatio = currentSpeed / p.initialSpeed;

			const decay = 0.985 + (speedRatio * 0.01);

			p.x += p.vx * dt * 60;
			p.y += p.vy * dt * 60;

			p.vy += dt * 0.12;
			p.vx += (Math.random() - 0.5) * dt * 0.15;

			p.vx *= decay;
			p.vy *= decay;

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
		dt /= 1000;
		lastTime = t;
		elapsedTime += dt;

		update(dt);
		render();

		requestAnimationFrame(animate);
	}

	onMount(() => {
		if (window.matchMedia(`(prefers-reduced-motion: reduce)`).matches === true) {
			// not reactive, but this is not a setting people usually change live, I think
			return;
		}
		ctx = particleCanvas.getContext("2d");

		requestAnimationFrame(animate);
	});
</script>

<div class="container" aria-hidden="true"
	bind:offsetWidth={canvasSize.w}
	bind:offsetHeight={canvasSize.h}
	style="--elapsed-time: {elapsedTime}; --anim-rate: {animRate}deg; --min-extent: {minExtent}%; --extent-diff: {maxExtent-minExtent}%; --light-shape: {lightShape};"
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

	canvas {
		--anim-frame: calc(var(--elapsed-time) * var(--anim-rate));
		background: radial-gradient(
			var(--light-shape),
			hsl(221, 45%, 45%) 	0%,
			hsl(221, 10%,  5%) 	calc(
				var(--min-extent) + (var(--extent-diff) * (
					  (3 * sin(var(--anim-frame)))
					+ (sin(10 * var(--anim-frame)))
					+ (cos( 5 * var(--anim-frame)))
				) / 10.5)
			)
		);
	}

	@media (prefers-reduced-motion: reduce) {
		canvas {
			display: none;
		}

		.container {
			background: radial-gradient(
				ellipse at bottom,
				hsl(221, 45%, 45%) 	0%,
				hsl(221, 10%,  5%) 	75%
			);
		}
	}
</style>
