<script lang="ts">
    import { onMount } from "svelte";

    import config from "../engine/core/config";
    // import { startGame } from "../vis/game";
    // import { MapScene } from "../vis/map";

    // aspect is not calculated automatically and also manually copied
    //   below instead of doing some magic with CSS variables.
    //   we don't need to get too fancy. just remember to update things
    //     down in the style section if anything changes.
    const width: number = config.gameWidth;
    const height: number = config.gameHeight;
    let canvas: HTMLCanvasElement;
    // let gameHandle: MapScene;

    $effect(() => {
        // gameHandle = startGame(canvas);
        // just stubbing this out for now to have
        //   *some* kind of canvas thing happening here;
        //   eventually will get handed to a game engine
        //   or the like
        const ctx = canvas.getContext("2d")!;
        const bg = new Image();
        bg.src = "./img/cat1024x640.jpg";
        bg.onload = () => {
            ctx.drawImage(bg, 0, 0, canvas.width, canvas.height);
        };
    });
</script>

<div class="canvasContainer">
    <canvas id="worldCanvas" bind:this={canvas} width={width} height={height}></canvas>
</div>

<style>
    .canvasContainer {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
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
