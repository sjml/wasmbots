const std = @import("std");

const config = @import("config");
const wasmbotClient = @import("wasmbot_client");
const msg = wasmbotClient.messages;
const explore = @import("exploration.zig");
const Point = explore.Point;
const Grid = explore.Grid;
const Agent = explore.Agent;

// would be nice to pull these from the build.zig.zon,
//   but can't import just yet
const BOT_NAME = "explorer";
const BOT_VERSION = [3]u16{ 0, 1, 0 };

fn clientReceiveGameParams(initParams: msg.InitialParameters) bool {
    _ = initParams;
    return true;
}

fn clientSetup() wasmbotClient.BotMetadata {
    const bot_meta = wasmbotClient.BotMetadata{
        .name = wasmbotClient.makeBotName(BOT_NAME),
        .version = BOT_VERSION,
    };

    mapping = Map.init(global_allocator);
    doors = Map.init(global_allocator);
    visited = PointSet.init(global_allocator);

    return bot_meta;
}

const TileType = enum {
    Void,
    Empty,
    OpenDoor,
    ClosedDoor,
    Wall,
};

const PointSet = std.AutoHashMap(Point, void);
const Map = std.AutoHashMap(Point, TileType);
var mapping: Map = undefined;
var doors: Map = undefined;
var visited: PointSet = undefined;

var bot = Agent{};

fn updateMaps(circs: *const msg.PresentCircumstances) !void {
    const side_len = circs.surroundingsRadius * 2 + 1;
    const grid = Grid(u16).init(circs.surroundings, side_len, side_len);

    if (circs.lastMoveSucceeded) {
        bot.lastLocation = bot.location;
        bot.location = bot.location.add(bot.attemptedMove);
        bot.attemptedMove = Point{};
    }

    try visited.put(bot.location, {});

    const rad16: i16 = @intCast(circs.surroundingsRadius);
    for (0..grid.width) |y| {
        const y16: i16 = @intCast(y);
        const y_offset: i16 = y16 - rad16;
        for (0..grid.height) |x| {
            const x16: i16 = @intCast(x);
            const x_offset: i16 = x16 - rad16;
            const offset = Point{ .x = x_offset, .y = y_offset };
            const location = bot.toWorld(offset);

            const value: TileType = @enumFromInt(grid.get(x, y));
            try mapping.put(location, value);

            if (value == TileType.ClosedDoor or value == TileType.OpenDoor) {
                try doors.put(location, value);
            }
        }
    }
}

fn clientTick(circumstances: msg.PresentCircumstances) msg.Message {
    updateMaps(&circumstances) catch {
        wasmbotClient.logErr("Could not update maps!");
        unreachable;
    };

    // if exploring == false:
    //      submit wait message and return
    // if targetTile is null:
    //      use DFS to pick a targetTile that's been seen but not visited
    //      if there are no candidates:
    //          pick the nearest closed door as a target
    //          if none:
    //              set targetTile to null
    //              set exploring to false
    // else:
    //         move towards target
    //         if within one square of targetTile and targetTile is closed door:
    //              open door
    //         set targetTile to null

    return msg.Message{ .Wait = msg.Wait{} };
}

////////////
////////////
////////////
//////////// housekeeping below

const GP_VERSION: u16 = 7;

var global_allocator: std.mem.Allocator = undefined;

export fn clientInitialize() void {
    wasmbotClient.registerClientSetup(clientSetup);
    wasmbotClient.registerTickCallback(clientTick);
    wasmbotClient.registerClientReceiveGameParams(clientReceiveGameParams);

    if (config.building_wasm) {
        global_allocator = std.heap.wasm_allocator;
    } else {
        // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
        // global_allocator = gpa.allocator();

        // a little troubling that the GPA allocator was faulting...
        //   let's figure that out; maybe it was a threading thing?
        global_allocator = std.heap.page_allocator;
    }
    wasmbotClient.setAllocator(global_allocator);
}