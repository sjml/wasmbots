<script lang="ts">
	import { base } from "$app/paths";
	import ManaForge from "$lib/ui/ManaForge.svelte";
    import { onMount } from "svelte";

	let logoVisible = $state(false);

	function animate(t: number) {
		const time = t / 1000;
		if (time > 30) {
			logoVisible = true;
		}
		if (time > 60) {
			logoVisible = false;
		}

		requestAnimationFrame(animate);
	}

	onMount(() => {
		requestAnimationFrame(animate);
	});
</script>

<div class="container">
	<ManaForge animRate={25} minExtent={40} maxExtent={55} lightShape={"200% 200% at bottom"}/>
	<img class="logo" class:visible={logoVisible} src="{base}/img/logo-cropped.svg" alt="WasmBots Logo">
</div>


<style>
	.container {
		position: relative;
		width: 1280px;
		height: 720px;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.container img {
		filter: invert(0.9) drop-shadow(0px 0px 10px hsl(221, 10%, 10%));
		max-height: 50px;
		margin: 8px;
		min-height: 15%;
		margin-top: 200px;

		opacity: 0;
		transition-property: opacity;
		transition-duration: 2400ms;
	}

	.container img.visible {
		opacity: 1;
	}
</style>
