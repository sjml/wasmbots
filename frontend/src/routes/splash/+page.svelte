<script lang="ts">
	import { base } from "$app/paths";
	import ManaForge from "$lib/ui/ManaForge.svelte";

	let logoVisible = $state(false);

	let forge: ManaForge;
	let autoRun = $state(false);
	let elapsedTime = 0;
	let fpsTarget: number = $state(60);
	function fakeTick() {
		elapsedTime += 1 / fpsTarget * 1000;
		forge.tick(elapsedTime);
	}
</script>

<div id="splashContainer">
	<ManaForge
		bind:this={forge}
		autoRun={autoRun}
		animRate={25}
		minExtent={40}
		maxExtent={55}
		lightShape={"200% 200% at bottom"}
		creationChance={0.7}
		bottomSpeedMod={{x: 2.0, y: 5.0}}
	/>
	<img class="logo" class:visible={logoVisible} src="{base}/img/logo-cropped.svg" alt="WasmBots Logo">
</div>
<div class="controls">
	<label><input type="checkbox" name="logoVisible" id="logoVisible" bind:checked={logoVisible}>Logo</label>
	<label><input type="checkbox" name="autorun" id="autorun" bind:checked={autoRun}>Autorun</label>
	<button id="tickButton" onclick={() => fakeTick()}>tick</button>
	<label>FPS Target: <input type="number" id="fpsTarget" bind:value={fpsTarget}></label>
</div>
<p class="disclaimer">
	This page is just used to generate frames for the video backdrop via a Playwright script,
	so it can match the appearance of the site header. Why are you even here?!
</p>

<style>
	#splashContainer {
		position: relative;
		width: 1280px;
		height: 720px;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	#splashContainer img {
		filter: invert(0.9) drop-shadow(0px 0px 10px hsl(221, 10%, 10%));
		max-height: 50px;
		margin: 8px;
		min-height: 15%;
		margin-top: 200px;

		opacity: 0;
		transition-property: opacity;
		transition-duration: 2400ms;
	}

	#splashContainer img.visible {
		opacity: 1;
	}

	.controls {
		color: white;
		display: flex;
		gap: 10px;
		margin-top: 10px;
	}

	.disclaimer {
		color: white;
	}
</style>
