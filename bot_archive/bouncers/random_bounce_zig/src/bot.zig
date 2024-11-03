const std = @import("std");

const wasmbotClient = @import("wasmbot_client");
const msg = wasmbotClient.messages;

// would be nice to pull these from the build.zig.zon,
//   but can't import just yet
const BOT_NAME = "zagger by zig";
const BOT_VERSION = [3]u16{ 0, 2, 1 };
const GP_VERSION: u16 = 7;

var allocator: std.mem.Allocator = undefined;

export fn clientInitialize() void {
    wasmbotClient.registerClientSetup(clientSetup);
    wasmbotClient.registerTickCallback(clientTick);
    wasmbotClient.registerClientReceiveGameParams(clientReceiveGameParams);

    allocator = std.heap.wasm_allocator;
    wasmbotClient.setAllocator(allocator);
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

fn clientSetup() wasmbotClient.BotMetadata {
    const bot_meta = wasmbotClient.BotMetadata{
        .name = wasmbotClient.makeBotName(BOT_NAME),
        .version = BOT_VERSION,
    };

    return bot_meta;
}

fn clientReceiveGameParams(initParams: msg.InitialParameters) bool {
    _ = initParams;
    chooseNewDirection();
    return true;
}

fn clientTick(circumstances: msg.PresentCircumstances) msg.Message {
    if (!circumstances.lastMoveSucceeded) {
        reflect();
        wasmbotClient.log("bounce");
    }

    return msg.Message{ .MoveTo = msg.MoveTo{
        .direction = @intFromEnum(CURRENT_DIR),
        .distance = 1,
    } };
}
