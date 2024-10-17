const wasmbotClient = @import("wasmbot_client");
const params = @import("wasmbot_client").params;
const hostReserve = @import("wasmbot_client").host_reserve;

// would be nice to pull these from the build.zig.zon,
//   but can't import just yet
const BOT_NAME = "bot_zig";
const BOT_VERSION = [3]u16{ 0, 1, 0 };
const GP_VERSION: u16 = 7;

export fn client_setup(pars: params.GameParameters) params.BotMetadata {
    _ = pars;
    _ = wasmbotClient.setTickCallback(clientTick);
    const botMeta = params.BotMetadata{
        .name = params.makeBotName(BOT_NAME),
        .botVersion = BOT_VERSION,
        .ready = true,
    };

    wasmbotClient.log("Good to go!");
    return botMeta;
}

fn clientTick() void {
    _ = fib(40);
}

fn fib(n: u64) u64 {
    if (n < 2) {
        return n;
    } else {
        return fib(n - 2) + fib(n - 1);
    }
}

export fn runFib(offset: usize, result: usize) bool {
    if (result + @sizeOf(u64) > hostReserve.HOST_RESERVE.len) {
        wasmbotClient.logErr("Invalid result offset");
        return false;
    }
    if (offset > hostReserve.HOST_RESERVE.len) {
        wasmbotClient.logErr("Invalid offset");
        return false;
    }
    const n = hostReserve.HOST_RESERVE[offset];
    if (n > 93) {
        wasmbotClient.logErr("Fib index too high");
        return false;
    }

    const fibNum = fib(n);
    _ = hostReserve.write_number(u64, result, fibNum);
    return true;
}
