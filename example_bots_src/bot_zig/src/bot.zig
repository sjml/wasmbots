const std = @import("std");

const wasmbotClient = @import("wasmbot_client");
const params = @import("wasmbot_client").params;
const hostReserve = @import("wasmbot_client").host_reserve;

// would be nice to pull these from the build.zig.zon,
//   but can't import just yet
const BOT_NAME = "bot_zig";
const BOT_VERSION = [3]u16{ 0, 1, 0 };
const GP_VERSION: u16 = 7;

fn clientSetup(pars: params.GameParameters) params.BotMetadata {
    _ = pars;
    const botMeta = params.BotMetadata{
        .name = params.makeBotName(BOT_NAME),
        .version = BOT_VERSION,
        .ready = true,
    };

    wasmbotClient.log("Good to go!");
    return botMeta;
}

var CURRENT_FIB: u64 = 35;
fn clientTick(lastDuration: u32) void {
    if (lastDuration < 250) {
        CURRENT_FIB += 1;
        var output: [45]u8 = undefined;
        const result = std.fmt.bufPrintZ(&output, "Incrementing fib to {d}", .{CURRENT_FIB}) catch unreachable;
        wasmbotClient.log(result);
    }
    _ = fib(40);
}

fn fib(n: u64) u64 {
    if (n < 2) {
        return n;
    } else {
        return fib(n - 2) + fib(n - 1);
    }
}

export fn clientInitialize() void {
    params.registerClientSetup(clientSetup);
    wasmbotClient.registerTickCallback(clientTick);
}
