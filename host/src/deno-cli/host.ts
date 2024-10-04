import { WasmCoordinator } from "../worker/coordinator.ts";
import { LogLevel } from "../core/logger.ts";

if (Deno.args.length == 0) {
    console.error("Give a file path.")
    Deno.exit(1);
}

const program = await Deno.readFile(Deno.args[0]);

function log(level: LogLevel, msg: string) {
    switch (level) {
        case LogLevel.Error:
            console.error(msg);
            break;
        case LogLevel.Warn:
            console.warn(msg);
            break;
        case LogLevel.Log:
            console.log(msg);
            break;
        case LogLevel.Info:
            console.info(msg);
            break;
        case LogLevel.Debug:
            console.debug(msg);
            break;
    }
}

const coord = new WasmCoordinator(log);

coord.kickoff(program);
await coord.waitUntilReady();
await coord.tick();
await coord.tick();
await coord.tick();
await coord.tick();
await coord.tick();
await coord.tick();
await coord.tick();

Deno.exit(0);
