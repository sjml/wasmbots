<script lang="ts">
    import { onMount, getContext } from "svelte";

    import config from "../engine/core/config";
    import { World } from "../engine/game/world";
    import { Player } from "../engine/game/player";
    import { WasmBotsVisualizer } from "../vis/game";

    import { type WasmBotsState } from "../state.svelte";
    const gameState: WasmBotsState = getContext("gameState");

    const width: number = config.gameWidth;
    const height: number = config.gameHeight;
    let canvas: HTMLCanvasElement;

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
            gameState.vis = new WasmBotsVisualizer(canvas, gameState.world);
            await gameState.vis.untilBootloaderDone();
            await gameState.vis.loadMap("arena");
        }
    }

    onMount(() => {
        gameSetup();
    })
</script>

<div class="canvasContainer">
    <canvas id="worldCanvas" bind:this={canvas} width={width} height={height}></canvas>
</div>

<style>
    .canvasContainer {
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        height: calc(100% - 50px);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1;
    }

    #worldCanvas {
        max-width: 100%;
        max-height: 100%;
        width: auto;
        height: auto;
        object-fit: contain;
    }

    @media (min-aspect-ratio: 16/10) {
        #worldCanvas {
            width: calc(100vh * 1.6);
            height: 100%;
        }
    }

    @media (max-aspect-ratio: 16/10) {
        #worldCanvas {
            width: 100%;
            height: calc(100vw / 1.6);
        }
    }
</style>
