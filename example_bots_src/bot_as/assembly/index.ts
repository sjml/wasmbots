export { setup, tick, receiveGameParams } from "wasmbots_client/assembly";
import { GameParameters, BotMetadata, setTickCallback, log, registerClientSetup } from "wasmbots_client/assembly";

// as with zig, would be nice to be able to pull from
//   the build config, but alack
const BOT_NAME = "bot_as";
const VERSION: u16[] = [0, 1, 0];


function clientSetup(params: GameParameters): BotMetadata {
    setTickCallback(tick);

    const botMeta = new BotMetadata(BOT_NAME, VERSION, true);
    log("Good to go!");
    return botMeta;
}
registerClientSetup(clientSetup); // gets called as part of WebAssembly module initialization

function tick(): void {
    fib(40);
}

function fib(n: u64): u64 {
    if (n < 2) {
        return n;
    }
    else {
        return fib(n-2) + fib(n-1);
    }
}
