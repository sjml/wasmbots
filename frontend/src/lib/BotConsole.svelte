<script lang="ts">
    import { onMount } from "svelte";

    import { Validator, Loader, Logger, WasmCoordinator, WorkerStatus } from "../host";

    let coordinator!: WasmCoordinator;

    interface LogEntry {
        level: Logger.LogLevel;
        msg: string;
    };
    let logs: LogEntry[] = [];

    async function runBot(fpath: string) {
        if (!fpath || fpath.length == 0) return;
        logs = [];
        fpath = `/example_bots/${fpath}`;
        const wasmBytes = await Loader.readBinaryFile(fpath);
        coordinator = new WasmCoordinator((level: Logger.LogLevel, msg: string) => {
            logs = [...logs, {level, msg}];
        });
        coordinator.kickoff(wasmBytes);
        await coordinator.untilReady();
        let count = 0;
        while (count < 10 && coordinator.workerStatus != WorkerStatus.Shutdown) {
            await coordinator.tick();
            count += 1;
        }
    }
    export let selectedFile: string;
    $: runBot(selectedFile);
</script>

<div class="console">
    {#each logs as log}
        <div class={log.level}>{log.msg}</div>
    {/each}
</div>

<style>
    .console {
        background-color: black;
        color: white;
        font-family: 'Courier New', Courier, monospace;
        white-space: pre;

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
