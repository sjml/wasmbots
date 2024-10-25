<script lang="ts">
    import { tick as svelteTick } from "svelte";

    import { Loader, Logger, WorkerStatus } from "../engine";
    import { Player } from "../engine/game/player";

    interface LogEntry {
        level: Logger.LogLevel;
        msg: string;
    };
    let logs: LogEntry[] = $state([]);
    let consoleDiv: HTMLDivElement;

    async function logToMe(level: Logger.LogLevel, msg: string) {
        logs = [...logs, {level, msg}];
        await svelteTick();
        consoleDiv.scroll({
            top: consoleDiv.scrollHeight,
            behavior: "smooth",
        });
    }

    async function createPlayerObject(fpath: string) {
        if (!fpath || fpath.length == 0) return;
        logs = [];
        fpath = `./example_bots/${fpath}`;
        const wasmBytes = await Loader.readBinaryFile(fpath);
        playerObject = new Player(logToMe);
        await playerObject.init(wasmBytes);
        let count = 0;
        while (count < 10 && playerObject.coordinator.workerStatus != WorkerStatus.Shutdown) {
            await playerObject.processTurn();
            count += 1;
        }
    }

    interface Props {
        selectedFile: string;
        playerObject: Player | null;
    }
    let { selectedFile, playerObject = $bindable(null) }: Props = $props();
    $effect(() => {
        createPlayerObject(selectedFile);
    });
</script>

<div class="console" bind:this={consoleDiv}>
    {#each logs as log}
        <div class={log.level}>{log.msg}</div>
    {/each}
</div>

<style>
    .console {
        background-color: rgb(0, 0, 0, 0.7);
        color: white;
        font-family: 'Courier New', Courier, monospace;
        font-size: 70%;
        white-space: pre;
        flex-grow: 2;

        height: 100%;
        overflow-y: auto;

        padding: 10px;
    }

    .console .error {
        font-weight: bold;
    }
    .console .error::before {
        content: "❌ ";
        font-family: "Apple Color Emoji", "Segoe UI Emoji", "Noto Color Emoji", sans-serif;
    }

    .console .info {
        color: rgb(180, 180, 180);
    }
    .console .info::before {
        content: "ⓘ ";
        font-family: "Apple Color Emoji", "Segoe UI Emoji", "Noto Color Emoji", sans-serif;
    }

    .console .log::before {
        content: "";
        font-family: "Apple Color Emoji", "Segoe UI Emoji", "Noto Color Emoji", sans-serif;
    }

    .console .warn::before {
        content: "⚠️ ";
        font-family: "Apple Color Emoji", "Segoe UI Emoji", "Noto Color Emoji", sans-serif;
    }

    .console .debug::before {
        content: "👾 ";
        font-family: "Apple Color Emoji", "Segoe UI Emoji", "Noto Color Emoji", sans-serif;
    }
</style>
