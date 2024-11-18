<script lang="ts">
	import { onMount, getContext } from "svelte";
	import { Config, World } from "wasmbots";

	import { WasmBotsVisualizer } from "../vis/game";

	import { type WasmBotsState } from "../types.svelte";
    import Spinner from "./Spinner.svelte";
	const gameState: WasmBotsState = getContext("gameState");

	let parentDiv: HTMLDivElement;

	async function gameSetup() {
		gameState.world = new World(null);
		gameState.vis = new WasmBotsVisualizer(parentDiv, gameState.world);
		await gameState.vis.untilBootloaderDone();
		gameState.mapLoading = true;
		await gameState.world.setMap(Config.enabledMaps[0]);
		gameState.mapLoading = false;
	}

	onMount(() => {
		gameSetup();
	})
</script>

<div class="canvasContainer" bind:this={parentDiv}>
	{#if gameState.mapLoading}<Spinner/>{/if}
</div>

<style>
</style>
