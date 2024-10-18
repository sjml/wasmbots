export { setup, tick, receiveGameParams } from "wasmbots_client/assembly";
import { GameParameters, BotMetadata, registerTickCallback, log, registerClientSetup } from "wasmbots_client/assembly";

// as with zig, would be nice to be able to pull from
//   the build config, but alack
const BOT_NAME = "bot_as";
const VERSION: u16[] = [0, 1, 0];


function clientSetup(params: GameParameters): BotMetadata {
    const botMeta = new BotMetadata(BOT_NAME, VERSION, true);
    log("Good to go!");
    return botMeta;
}

export function clientInitialize(): void {
    registerClientSetup(clientSetup);
    registerTickCallback(tick);
}

let CURRENT_FIB: u64 = 35;
function tick(lastDuration: u32): void {
    if (lastDuration < 250) {
        CURRENT_FIB += 1;
        log(`Incrementing fib to ${CURRENT_FIB}`);
    }
    fib(CURRENT_FIB);
}

function fib(n: u64): u64 {
    if (n < 2) {
        return n;
    }
    else {
        return fib(n-2) + fib(n-1);
    }
}
