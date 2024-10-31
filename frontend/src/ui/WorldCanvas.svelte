<script lang="ts">
    import { onMount, getContext } from "svelte";

    import { World } from "../engine/game/world";
    import { Player } from "../engine/game/player";
    import { WasmBotsVisualizer } from "../vis/game";

    import { type WasmBotsState } from "../state.svelte";
    const gameState: WasmBotsState = getContext("gameState");

    let parentDiv: HTMLDivElement;

    async function playerAdd(p: Player) {
        await gameState.vis?.addPlayer(p);
    }

    async function playerDrop(p: Player) {
        // TODO: implement
    }

    async function gameSetup() {
        if (gameState.world == null) {
            gameState.world = new World(null);
            gameState.world.on("playerAdded", (evt) => {
                playerAdd(evt.detail.newPlayer);
            });
            gameState.world.on("playerDropped", (evt) => {
                playerDrop(evt.detail.leavingPlayer);
            });
            gameState.vis = new WasmBotsVisualizer(parentDiv, gameState.world);
            await gameState.vis.untilBootloaderDone();
            await gameState.vis.loadMap("arena");
        }
    }

    onMount(() => {
        gameSetup();
    })
</script>

<div class="canvasContainer" bind:this={parentDiv}>
</div>

<style>
</style>
