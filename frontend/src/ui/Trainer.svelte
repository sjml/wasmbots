<script lang="ts">
    import { setContext } from "svelte";

    import Navbar from "./Navbar.svelte";
    import WorldCanvas from "./WorldCanvas.svelte";
    import FlowControl from "./FlowControl.svelte";

    import { type WasmBotsState } from "../state.svelte";
    import { Player } from "../engine/game/player";
    import * as CoreMsg from "../engine/core/messages";

    const gameState: WasmBotsState = $state({
        world: null,
        players: [],
        vis: null,
    });
    setContext("gameState", gameState);

    let player: Player|null = $derived(gameState.players.length > 0 ? gameState.players[0] : null);
</script>

<Navbar>
    <div class="spacer"></div>
    {#if gameState.world }
        <FlowControl />
    {/if}
    <div class="divider"></div>
    <div class="navLink">
        <a href="https://github.com/sjml/wasmbots" target="_blank" aria-label="Link to GitHub project source for WasmBots">
            <svg fill="currentColor" viewBox="0 0 98 96" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M48.854 0C21.839 0 0 22 0 49.217c0 21.756 13.993 40.172 33.405 46.69 2.427.49 3.316-1.059 3.316-2.362 0-1.141-.08-5.052-.08-9.127-13.59 2.934-16.42-5.867-16.42-5.867-2.184-5.704-5.42-7.17-5.42-7.17-4.448-3.015.324-3.015.324-3.015 4.934.326 7.523 5.052 7.523 5.052 4.367 7.496 11.404 5.378 14.235 4.074.404-3.178 1.699-5.378 3.074-6.6-10.839-1.141-22.243-5.378-22.243-24.283 0-5.378 1.94-9.778 5.014-13.2-.485-1.222-2.184-6.275.486-13.038 0 0 4.125-1.304 13.426 5.052a46.97 46.97 0 0 1 12.214-1.63c4.125 0 8.33.571 12.213 1.63 9.302-6.356 13.427-5.052 13.427-5.052 2.67 6.763.97 11.816.485 13.038 3.155 3.422 5.015 7.822 5.015 13.2 0 18.905-11.404 23.06-22.324 24.283 1.78 1.548 3.316 4.481 3.316 9.126 0 6.6-.08 11.897-.08 13.526 0 1.304.89 2.853 3.316 2.364 19.412-6.52 33.405-24.935 33.405-46.691C97.707 22 75.788 0 48.854 0z"/></svg>
        </a>
    </div>
    <div class="spacer"></div>
</Navbar>

<div class="trainer">
    <div class="gameRow">
        <div class="playerInfo">
            {#if player}
                <ul>
                    <li><strong>Hit Points:</strong>{player.hitPoints}</li>
                </ul>
            {:else}
            <div class="emptyPlayer">
                [No player loaded]
            </div>
            {/if}
        </div>
        <div class="gameView">
            <WorldCanvas/>
        </div>
    </div>
    <div class="memRow">
        <div class="msgPane">
            <h2>🚧⚠️🚧🏗️</h2>
            <ul>
                <li><strong>Clearly this whole interface is in-progress.</strong></li>
                <li>Idea is that you can step through with your bot, seeing the messages that it will receive, editing them if you want, and then seeing the messages it produced and editing them if you want before sending to the system.</li>
                <li>You become a human <a href="https://github.com/sjml/wasmbots/blob/main/engine/src/worker/coordinator.ts"><code>WasmCoordinator</code></a>, just like you always dreamed.</li>
                <li>Needs some work in the guts of the engine before this works, tho</li>
            </ul>
        </div>
        <div class="memory">
            <h2>Types of Messages:</h2>
            <ul>
                {#each [...CoreMsg.MessageTypeMap] as [key, value]}
                    <li>{`${CoreMsg.MessageType[key].slice(0, -4)}`}</li>
                {/each}
            </ul>
        </div>
    </div>
</div>

<style>
    .trainer {
        width: 100vw;
        height: 100%;
    }
    .gameRow {
        height: 50vh;
        width: 100%;

        display: flex;
        justify-content: center;
    }
    .playerInfo {
        width: 300px;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .emptyPlayer {
        font-size: x-large;
    }
    .gameView {
        flex-shrink: 1;
        max-width: 75%;
    }

    .memRow {
        background-color: white;
        display: flex;
        width: 100%;
        height: 100%;
    }

    .msgPane {
        padding: 10px;
        width: 50%;
        background-color: rgb(68, 72, 81);
        color: white;
    }

    .memory {
        padding: 10px;
        width: 50%;
        background-color: rgb(81, 70, 68);
        color: white;
    }
</style>
