<script lang="ts">
    import config from "../engine/core/config";
    import { WasmBotsGame } from "../vis/game";

    const width: number = config.gameWidth;
    const height: number = config.gameHeight;
    let canvas: HTMLCanvasElement;
    let gameHandle: WasmBotsGame;

    async function gameSetup() {
        gameHandle = new WasmBotsGame(canvas);
        await gameHandle.untilBootloaderDone();
        gameHandle.loadMap("arena");
    }

    $effect(() => { gameSetup(); });
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
