const std = @import("std");

const wasmbotClient = @import("wasmbot_client");
const params = @import("wasmbot_client").params;
const hostReserve = @import("wasmbot_client").host_reserve;

// would be nice to pull these from the build.zig.zon,
//   but can't import just yet
const BOT_NAME = "zagger by zig";
const BOT_VERSION = [3]u16{ 0, 1, 0 };
const GP_VERSION: u16 = 7;

export fn clientInitialize() void {
    params.registerClientSetup(clientSetup);
    wasmbotClient.registerTickCallback(clientTick);
}

// SE -> SW (+2)
// SW -> SE (-2)
// NW -> NE (+2)
const Direction = enum(u8) {
    East,
    Southeast,
    South,
    Southwest,
    West,
    Northwest,
    North,
    Northeast,
};

var CURRENT_DIR: Direction = Direction.East;

fn chooseNewDirection() void {
    var random_dir: u8 = @intCast(wasmbotClient.getRandomInt(0, 3));
    random_dir *= 2;
    random_dir += 1;
    CURRENT_DIR = @enumFromInt(random_dir);
}

fn reflect() void {
    var dir = @intFromEnum(CURRENT_DIR);
    if (wasmbotClient.getRandomInt(0, 2) == 0) {
        dir += 2;
    } else {
        dir -= 2;
    }
    dir %= 8;
    CURRENT_DIR = @enumFromInt(dir);
}

fn clientSetup(pars: params.GameParameters) params.BotMetadata {
    _ = pars;
    const bot_meta = params.BotMetadata{
        .name = params.makeBotName(BOT_NAME),
        .version = BOT_VERSION,
        .ready = true,
    };

    chooseNewDirection();

    return bot_meta;
}

fn clientTick(last_duration: u32, last_move_succeeded: bool) void {
    _ = last_duration;

    if (!last_move_succeeded) {
        reflect();
        wasmbotClient.log("bounce");
    }
    _ = hostReserve.writeNumber(u8, 0, @intFromEnum(CURRENT_DIR));
    const f = hostReserve.readNumber(f32, 0);
    _ = hostReserve.writeNumber(f32, 200, f);
}
