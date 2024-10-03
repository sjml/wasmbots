<script lang="ts">
    import { Validator, Loader, Logger } from "../host";

    interface LogEntry {
        level: Logger.LogLevel;
        msg: string;
    };
    let logs: LogEntry[] = [];

    class UILogger implements Logger.ILogger {
        assert(condition?: boolean, ...data: any[]): void {
            if (!condition) { this.error(data); }
        }
        clear(): void {
            logs = [];
        }
        error(...data: any[]): void {
            logs = [...logs, {level: Logger.LogLevel.Error, msg: data.join(" ")}];
        }
        warn(...data: any[]): void {
            logs = [...logs, {level: Logger.LogLevel.Warn, msg: data.join(" ")}];
        }
        log(...data: any[]): void {
            logs = [...logs, {level: Logger.LogLevel.Log, msg: data.join(" ")}];
        }
        info(...data: any[]): void {
            logs = [...logs, {level: Logger.LogLevel.Info, msg: data.join(" ")}];
        }
        debug(...data: any[]): void {
            logs = [...logs, {level: Logger.LogLevel.Debug, msg: data.join(" ")}];
        }
    }
    export const logger: Logger.ILogger = new UILogger();

    async function validate(fpath: string) {
        if (!fpath || fpath.length == 0) return;
        fpath = `/example_bots/${fpath}`;
        const wasmBytes = await Loader.readBinaryFile(fpath);
        Validator.validateWasm(wasmBytes, logger);
    }
    export let selectedFile: string;
    $: validate(selectedFile);
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

        padding: 10px;
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
        content: "  ";
    }

    .console .warn::before {
        content: "⚠️️ ";
    }

    .console .debug::before {
        content: "👾 ";
    }
</style>
