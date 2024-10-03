<script lang="ts">
    import { Validator, Loader, type ILogger } from "../host";

    enum LogLevel {
        Debug = "debug",
        Info = "info",
        Log = "log",
        Warn = "warn",
        Error = "error",
    }
    interface LogEntry {
        level: LogLevel;
        msg: string;
    };
    let logs: LogEntry[] = [];

    class Logger implements ILogger {
        assert(condition?: boolean, ...data: any[]): void {
            if (!condition) { this.error(data); }
        }
        clear(): void {
            logs = [];
        }
        debug(...data: any[]): void {
            logs = [...logs, {level: LogLevel.Debug, msg: data.join(" ")}];
        }
        error(...data: any[]): void {
            logs = [...logs, {level: LogLevel.Error, msg: data.join(" ")}];
        }
        info(...data: any[]): void {
            logs = [...logs, {level: LogLevel.Info, msg: data.join(" ")}];
        }
        log(...data: any[]): void {
            logs = [...logs, {level: LogLevel.Log, msg: data.join(" ")}];
        }
        warn(...data: any[]): void {
            logs = [...logs, {level: LogLevel.Warn, msg: data.join(" ")}];
        }
    }
    export const logger: ILogger = new Logger();

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
