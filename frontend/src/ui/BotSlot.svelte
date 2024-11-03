<script lang="ts">
    import { getContext, tick as svelteTick } from "svelte";
    import { Logger } from "../engine";
    import { type UIPlayerData,  } from "../types.svelte";

    import { type WasmBotsState } from "../types.svelte";
    const gameState: WasmBotsState = getContext("gameState");

    interface Props {
        playerUI: UIPlayerData;
        slotIdx: number;
    }
    let { playerUI = $bindable(), slotIdx }: Props = $props();

    let consoleDiv: HTMLDivElement|null = $state(null);
    let consoleExpanded: boolean = $state(false);
    async function logToMyConsole(level: Logger.LogLevel, msg: string) {
        playerUI.selfLog(level, msg);
        await svelteTick();
        consoleDiv?.scroll({
            top: consoleDiv.scrollHeight,
            behavior: "smooth",
        });
    }

    function copyLogs() {
        const output = playerUI.consoleLines.map(l => l.msg).join("\n");
        navigator.clipboard.writeText(output);
    }

    $effect(() => {
        if (playerUI) {
            playerUI.playerObject.coordinator.logFunction = logToMyConsole;
        }
    });

    function dropPlayer() {
        if (playerUI) {
            gameState.world!.dropPlayer(playerUI.playerObject);
        }
    }
</script>

<div class="botSlot">
    <div class="slotNumber">#{slotIdx}</div>
    <div class="botStuffs">
        <div class="info">
            <div class="name">(name and icon go here)</div>
            <button class="delete" onclick={dropPlayer} aria-label="delete this bot">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 256 256"><path d="M216,48H176V40a24,24,0,0,0-24-24H104A24,24,0,0,0,80,40v8H40a8,8,0,0,0,0,16h8V208a16,16,0,0,0,16,16H192a16,16,0,0,0,16-16V64h8a8,8,0,0,0,0-16ZM96,40a8,8,0,0,1,8-8h48a8,8,0,0,1,8,8v8H96Zm96,168H64V64H192ZM112,104v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Zm48,0v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Z"></path></svg>
            </button>
        </div>
        <div class="consoleContainer" class:expanded={consoleExpanded}>
            <div class="controls">
                <button class="disclosure" onclick={() => {consoleExpanded = !consoleExpanded;}} aria-label="Toggle expanded console">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 256 256"><path d="M181.66,133.66l-80,80A8,8,0,0,1,88,208V48a8,8,0,0,1,13.66-5.66l80,80A8,8,0,0,1,181.66,133.66Z"></path></svg>
                </button>
                {#if consoleExpanded}
                <button class="copyLog" onclick={copyLogs} aria-label="copy logs to clipboard">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 256 256"><path d="M216,32H88a8,8,0,0,0-8,8V80H40a8,8,0,0,0-8,8V216a8,8,0,0,0,8,8H168a8,8,0,0,0,8-8V176h40a8,8,0,0,0,8-8V40A8,8,0,0,0,216,32ZM160,208H48V96H160Zm48-48H176V88a8,8,0,0,0-8-8H96V48H208Z"></path></svg>
                </button>
                {/if}
            </div>
            <div class="console" bind:this={consoleDiv}>
                {#each playerUI!.consoleLines as log}
                <div class={log.level}>{log.msg}</div>
                {/each}
            </div>
        </div>
    </div>
</div>

<style>
    .botSlot {
        background-color: rgb(62, 62, 62);
        min-height: 60px;
        border-top: 1px solid black;

        display: flex;
        flex-direction: row;
    }

    .slotNumber {
        margin-top: 15px;
        margin-left: 5px;
        margin-right: 15px;
    }

    .botStuffs {
        flex-grow: 1;
        padding-top: 5px;
    }
    .botStuffs .info {
        margin-bottom: 5px;
    }

    .info {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .botLoading {
        display: flex;
        flex-grow: 1;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }

    .consoleContainer {
        display: flex;
    }

    .botStuffs button {
        border: none;
        background-color: #00000000;
        color: white;
        display: flex;
        cursor: pointer;
    }

    .consoleContainer.expanded button.disclosure {
        transform: rotate(90deg);
    }

    .consoleContainer.expanded .console {
        height: 150px;
    }

    .consoleContainer.expanded {
        flex-direction: column;
    }

    .consoleContainer .controls {
        display: flex;
        justify-content: space-between;
    }

    .console {
        background-color: rgb(0, 0, 0, 0.7);
        color: white;
        font-family: 'Courier New', Courier, monospace;
        font-size: 70%;
        white-space: pre;
        flex-grow: 2;

        overflow-x: hidden;
        height: 20px;
        overflow-y: auto;

        padding: 1px 10px;
    }

    .console .error {
        font-weight: bold;
    }
    .console .error::before {
        content: "❌ ";
    }

    .console .info {
        color: rgb(180, 180, 180);
    }
    .console .info::before {
        content: "ⓘ ";
    }

    .console .log::before {
        content: "";
    }

    .console .warn::before {
        content: "⚠️ ";
    }

    .console .debug::before {
        content: "👾 ";
    }

    .console .error::before,
    .console .info::before,
    .console .log::before,
    .console .warn::before,
    .console .debug::before {
        font-family: "Apple Color Emoji", "Segoe UI Emoji", "Noto Color Emoji", sans-serif;
    }
</style>
