import { WasmCoordinator, WorkerStatus } from "../worker/coordinator.ts";
import { LogLevel } from "../core/logger.ts";
import { RNG } from "../game/random.ts";

if (Deno.args.length == 0) {
    console.error("Give a file path.")
    Deno.exit(1);
}

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

const program = await Deno.readFile(Deno.args[0]);
const rng = new RNG(null);
const coord = new WasmCoordinator(log, rng.randInt(0, Number.MAX_SAFE_INTEGER));

coord.kickoff(program);
try {
    await coord.untilReady();
}
catch {
    // error already printed
    Deno.exit(1);
}
while (coord.workerStatus != WorkerStatus.Shutdown) {
    await coord.tick();
}

Deno.exit(0);
