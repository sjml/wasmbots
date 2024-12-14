<script lang="ts">
	import { onMount, getContext } from "svelte";
	import { RNG, World } from "wasmbots";

	import { WasmBotsVisualizer } from "../vis/game";

	import { type WasmBotsState } from "../types.svelte";
	import Spinner from "./Spinner.svelte";
	const gameState: WasmBotsState = getContext("gameState");

	interface Props {
		createWorld?: boolean;
	}
	let { createWorld = true }: Props = $props();

	let parentDiv: HTMLDivElement;
	let vis: WasmBotsVisualizer|null = null;

	async function gameSetup() {
		gameState.world = new World(null);
		vis = new WasmBotsVisualizer(parentDiv, gameState.world);
		await vis.untilBootloaderDone();
		gameState.mapLoading = true;
		await gameState.world.setMap("dynamic:dungeon", new RNG(null));
		gameState.mapLoading = false;
	}

	$effect(() => {
		if (gameState.world != null && !createWorld) {
			vis = new WasmBotsVisualizer(parentDiv, gameState.world);
			vis.untilBootloaderDone().then(() => {
				if (gameState.world!.currentMap != null) {
					vis!.loadMap(gameState.world!.currentMap);
				}
			});
		}
	});

	onMount(() => {
		if (createWorld) {
			gameSetup();
		}
	})
</script>

<div class="canvasContainer" bind:this={parentDiv}>
	{#if gameState.mapLoading}<Spinner/>{/if}
</div>

<style>
</style>
