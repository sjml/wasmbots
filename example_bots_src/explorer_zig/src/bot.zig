const std = @import("std");

const config = @import("config");
const wasmbotClient = @import("wasmbot_client");
const msg = wasmbotClient.messages;
const explore = @import("exploration.zig");
const Point = explore.Point;
const PointSet = explore.PointSet;
const Grid = explore.Grid;
const Agent = explore.Agent;
const Map = explore.Map;
const PathWalk = explore.PathWalk;

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
    unvisited = PointSet.init(global_allocator);

    return bot_meta;
}

var mapping: Map = undefined;
var doors: Map = undefined;
var visited: PointSet = undefined;
var unvisited: PointSet = undefined;

var bot = Agent{};

fn findClosestUnvisited(pt: Point) !Point {
    var nearest: ?Point = null;
    var minDistance: u16 = std.math.maxInt(u16);
    var ki = unvisited.keyIterator();
    while (ki.next()) |u| {
        const man = u.manhattanDistance(pt);
        if (man < minDistance) {
            minDistance = man;
            nearest = u.*;
        } else if (man == minDistance) {
            // break ties with a coin flip
            if (wasmbotClient.getRandomInt(0, 2) == 0) {
                nearest = u.*;
            }
        }
    }
    return nearest orelse error.NoNearestUnvisited;
}

fn setTarget(tile: ?Point) void {
    target_tile = tile;
    if (current_path != null) {
        global_allocator.free(current_path.?.path);
    }
    if (target_tile == null) {
        current_path = null;
    } else {
        current_path = explore.pathfind(global_allocator, bot.location, target_tile.?, &mapping) catch undefined;
    }
}

fn updateMaps(circs: *const msg.PresentCircumstances) !void {
    const side_len = circs.surroundingsRadius * 2 + 1;
    const grid = Grid(msg.TileType).init(circs.surroundings, side_len, side_len);

    if (circs.lastMoveResult == msg.MoveResult.Succeeded) {
        bot.last_location = bot.location;
        bot.location = bot.location.add(bot.attempted_move);
    } else {
        wasmbotClient.logErr("Last move didn't work; re-evaluating");
        setTarget(null);
    }
    bot.attempted_move = Point{};

    try visited.put(bot.location, {});
    _ = unvisited.remove(bot.location); // just returns false if it wasn't there

    const rad16: i16 = @intCast(circs.surroundingsRadius);
    for (0..grid.height) |y| {
        const y16: i16 = @intCast(y);
        const y_offset: i16 = y16 - rad16;
        for (0..grid.width) |x| {
            const x16: i16 = @intCast(x);
            const x_offset: i16 = x16 - rad16;
            const offset = Point{ .x = x_offset, .y = y_offset };
            const location = bot.toWorld(offset);
            const value = grid.get(x, y);

            if (value == msg.TileType.Void) {
                continue;
            }
            try mapping.put(location, value);
            if ((value == msg.TileType.Floor or value == msg.TileType.OpenDoor) and !visited.contains(location)) {
                try unvisited.put(location, {});
            }

            if (value == msg.TileType.ClosedDoor or value == msg.TileType.OpenDoor) {
                try doors.put(location, value);
            }
        }
    }

    for (bot.location.getNeighbors8()) |n| {
        const value = mapping.get(n) orelse msg.TileType.Void;
        if (value != msg.TileType.Void) {
            try visited.put(n, {});
            _ = unvisited.remove(n);
        }
    }
}

var exploring = true;
var target_tile: ?Point = null;
var current_path: ?PathWalk = null;
var number_of_turns: u64 = 0;

fn clientTick(circumstances: msg.PresentCircumstances) msg.Message {
    number_of_turns += 1;
    updateMaps(&circumstances) catch {
        wasmbotClient.logErr("Could not update maps!");
        unreachable;
    };

    if (!exploring) {
        return msg.Message{ .Wait = msg.Wait{} };
    }

    if ((target_tile != null and bot.location.equals(target_tile.?)) or (current_path != null and current_path.?.isFinished())) {
        setTarget(null);
    }

    if (target_tile == null) {
        if (unvisited.count() > 0) {
            const t = findClosestUnvisited(bot.location) catch @panic("Failed to find reachable tile");
            setTarget(t);
            const next = current_path.?.getNextMove(&bot, &mapping);
            if (next != null) {
                return next.?;
            } else {
                target_tile = null;
                current_path = null;
            }
        } else {
            var target_door: ?Point = null;
            var target_distance: u32 = 0;
            var doors_it = doors.iterator();
            while (doors_it.next()) |door_entry| {
                const pt = door_entry.key_ptr;
                const tt = door_entry.value_ptr;
                if (tt.* == msg.TileType.ClosedDoor) {
                    const dist = pt.manhattanDistance(bot.location);
                    if (target_door == null or dist < target_distance) {
                        target_door = pt.*;
                        target_distance = dist;
                    }
                }
            }
            if (target_door == null) {
                wasmbotClient.logFmt("stopping exploration after {d} turns", .{number_of_turns});
                setTarget(null);
                exploring = false;
                return msg.Message{ .Resign = msg.Resign{} };
            } else {
                setTarget(target_door.?);
                return current_path.?.getNextMove(&bot, &mapping).?;
            }
        }
    } else {
        if (current_path == null) {
            return msg.Message{ .Wait = msg.Wait{} };
        }
        return current_path.?.getNextMove(&bot, &mapping).?;
    }

    // should be unreachable
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
        global_allocator = std.heap.page_allocator;
    }
    wasmbotClient.setAllocator(global_allocator);
}
