<script lang="ts">
    import { getContext, onMount } from "svelte";
    import { type WasmBotsState } from "../state.svelte";
    const gameState: WasmBotsState = getContext("gameState");

    let playerSlotCount = $state(0);

    $effect(() => {
        if (gameState.world === null) return;

        gameState.world.on("mapChanged", (evt) => {
            playerSlotCount = evt.detail.newMap.spawnPoints.length;
        });
    });
</script>

(should be {playerSlotCount} slots)
