<script lang="ts">
    import { onMount, getContext } from "svelte";
    import { Config, World } from "wasmbots";

    import { WasmBotsVisualizer } from "../vis/game";

    import { type WasmBotsState } from "../types.svelte";
    const gameState: WasmBotsState = getContext("gameState");

    let parentDiv: HTMLDivElement;

    async function gameSetup() {
        gameState.world = new World(null);
        gameState.vis = new WasmBotsVisualizer(parentDiv, gameState.world);
        await gameState.vis.untilBootloaderDone();
        await gameState.world.setMap(Config.enabledMaps[0]);
    }

    onMount(() => {
        gameSetup();
    })
</script>

<div class="canvasContainer" bind:this={parentDiv}>
</div>

<style>
</style>
