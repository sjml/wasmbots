const std = @import("std");

const wasmbotClient = @import("wasmbot_client");
const msg = wasmbotClient.messages;

pub const PointSet = std.AutoHashMap(Point, void);
pub const Map = std.AutoHashMap(Point, msg.TileType);

// maps to Direction; wish Zig had a way to make this more explicit
pub const Movement = [_]Point{
    // zig fmt: off
    Point{ .x =  1, .y =  0 }, // East
    Point{ .x =  1, .y =  1 }, // Southeast
    Point{ .x =  0, .y =  1 }, // South
    Point{ .x = -1, .y =  1 }, // Southwest
    Point{ .x = -1, .y =  0 }, // West
    Point{ .x = -1, .y = -1 }, // Northwest
    Point{ .x =  0, .y = -1 }, // North
    Point{ .x =  1, .y = -1 }, // Northeast
    // zig fmt: on
};

pub const Point = struct {
    x: i16 = 0,
    y: i16 = 0,

    fn hash(self: Point) u64 {
        const x64: u64 = @intCast(self.x);
        const y64: u64 = @intCast(self.y);
        return x64 * 31 + y64;
    }

    // for hashmap
    fn eql(a: Point, b: Point) bool {
        return a.equals(b);
    }

    pub fn equals(self: Point, other: Point) bool {
        return self.x == other.x and self.y == other.y;
    }

    pub fn toMsgPt(self: Point) msg.Point {
        return msg.Point{.x = self.x, .y = self.y};
    }

    pub fn add(self: Point, other: Point) Point {
        return Point{
            .x = self.x + other.x,
            .y = self.y + other.y,
        };
    }

    pub fn sub(self: Point, other: Point) Point {
        return Point{
            .x = self.x - other.x,
            .y = self.y - other.y,
        };
    }

    pub fn mul(self: Point, scale: i16) Point {
        return Point{
            .x = self.x * scale,
            .y = self.y * scale,
        };
    }

    // TODO: feels like this could be more clever
    pub fn directionToNeighbor(self: Point, other: Point) ?msg.Direction {
        const delta = other.sub(self);
        if (delta.manhattanDistance(Point{}) > 1) {
            return null;
        }

        // zig fmt: off
        if (delta.equals(Point{ .x =  1, .y =  0 })) return msg.Direction.East;
        if (delta.equals(Point{ .x =  1, .y =  1 })) return msg.Direction.Southeast;
        if (delta.equals(Point{ .x =  0, .y =  1 })) return msg.Direction.South;
        if (delta.equals(Point{ .x = -1, .y =  1 })) return msg.Direction.Southwest;
        if (delta.equals(Point{ .x = -1, .y =  0 })) return msg.Direction.West;
        if (delta.equals(Point{ .x = -1, .y = -1 })) return msg.Direction.Northwest;
        if (delta.equals(Point{ .x =  0, .y = -1 })) return msg.Direction.North;
        if (delta.equals(Point{ .x =  1, .y = -1 })) return msg.Direction.Northeast;
        // zig fmt: on

        unreachable;
    }

    pub fn manhattanDistance(self: Point, other: Point) u16 {
        return @abs(other.x - self.x) + @abs(other.y - self.y);
    }

    pub fn getNeighbors4(self: Point) [4]Point {
        return [4]Point{
            self.add(Movement[@intFromEnum(msg.Direction.East)]),
            self.add(Movement[@intFromEnum(msg.Direction.South)]),
            self.add(Movement[@intFromEnum(msg.Direction.West)]),
            self.add(Movement[@intFromEnum(msg.Direction.North)]),
        };
    }

    pub fn getNeighbors8(self: Point) [8]Point {
        return [8]Point{
            self.add(Movement[@intFromEnum(msg.Direction.East)]),
            self.add(Movement[@intFromEnum(msg.Direction.Southeast)]),
            self.add(Movement[@intFromEnum(msg.Direction.South)]),
            self.add(Movement[@intFromEnum(msg.Direction.Southwest)]),
            self.add(Movement[@intFromEnum(msg.Direction.West)]),
            self.add(Movement[@intFromEnum(msg.Direction.Northwest)]),
            self.add(Movement[@intFromEnum(msg.Direction.North)]),
            self.add(Movement[@intFromEnum(msg.Direction.Northeast)]),
        };
    }
};

pub fn Grid(comptime T: type) type {
    return struct {
        const Self = @This();

        data: []const T,
        width: usize,
        height: usize,

        pub fn init(data: []const T, width: usize, height: usize) Self {
            return Self{
                .data = data,
                .width = width,
                .height = height,
            };
        }

        pub fn get(self: *const Self, x: usize, y: usize) T {
            const idx = (y * self.width) + x;
            if (idx >= self.data.len) {
                // TODO: investigate; not sure how different this is from
                //       @panic-ing in a wasm setting
                wasmbotClient.logErr("Bad grid access!");
                unreachable;
            }
            return self.data[idx];
        }
    };
}

pub const Agent = struct {
    location: Point = Point{},
    last_location: Point = Point{},
    attempted_move: Point = Point{},

    pub fn toWorld(self: *Agent, offset_point: Point) Point {
        return self.location.add(offset_point);
    }

    pub fn makeMove(self: *Agent, target: Point) msg.Message {
        self.attempted_move = target.sub(self.location);
        const movement = self.location.directionToNeighbor(target);
        if (movement == null) {
            return msg.Message{ .Wait = msg.Wait{} };
        }
        return msg.Message{ .MoveTo = msg.MoveTo{ .direction = movement.?, .distance = 1 } };
    }
};

pub const PathWalk = struct {
    current_idx: usize,
    path: []Point,

    pub fn isFinished(self: *PathWalk) bool {
        return self.current_idx >= self.path.len;
    }

    pub fn getNextMove(self: *PathWalk, agent: *Agent, mapping: *Map) ?msg.Message {
        if (self.isFinished()) {
            wasmbotClient.logErr("path already exhausted\n");
            return null;
        }
        const next_target = self.path[self.current_idx];
        const tile = mapping.get(next_target).?;
        if (tile == msg.TileType.Void or tile == msg.TileType.Wall) {
            wasmbotClient.logErrFmt("path attempting to move into invalid space: {d}, {d}\n", .{ next_target.x, next_target.y });
            unreachable;
        }
        if (tile == msg.TileType.ClosedDoor) {
            const delta = next_target.sub(agent.location);
            return msg.Message{ .Open = msg.Open{ .target = delta.toMsgPt() } };
        }
        self.current_idx += 1;
        return agent.makeMove(next_target);
    }
};

const PathfindNode = struct { cost: u32, location: Point };

fn pfnComp(ctx: void, a: PathfindNode, b: PathfindNode) std.math.Order {
    _ = ctx;
    return std.math.order(a.cost, b.cost);
}

const Frontier = std.PriorityQueue(PathfindNode, void, pfnComp);

pub fn pathfind(allocator: std.mem.Allocator, start: Point, goal: Point, map: *const Map) !PathWalk {
    const start_node = PathfindNode{ .cost = 0, .location = start };
    var frontier = Frontier.init(allocator, {});
    defer frontier.deinit();
    var came_from = std.AutoHashMap(Point, ?Point).init(allocator);
    defer came_from.deinit();
    var cost_so_far = std.AutoHashMap(Point, u32).init(allocator);
    defer cost_so_far.deinit();

    try frontier.add(start_node);
    try came_from.put(start, null);
    try cost_so_far.put(start, 0);

    while (frontier.count() > 0) {
        const curr_node = frontier.remove();
        const curr = curr_node.location;
        if (curr.equals(goal)) {
            break;
        }

        for (curr.getNeighbors4()) |neighbor| {
            var total_cost = cost_so_far.get(curr).?;
            const neighbor_type = map.get(neighbor) orelse msg.TileType.Void;
            if (neighbor_type == msg.TileType.Void) {
                // we don't know what's there
                continue;
            } else if (neighbor_type == msg.TileType.Wall) {
                // can't go there
                continue;
            } else if (neighbor_type == msg.TileType.ClosedDoor) {
                total_cost += 2;
            } else {
                total_cost += 1;
            }
            if (!cost_so_far.contains(neighbor) or total_cost < cost_so_far.get(neighbor).?) {
                try cost_so_far.put(neighbor, total_cost);
                const priority = total_cost + neighbor.manhattanDistance(goal);
                try frontier.add(PathfindNode{ .cost = priority, .location = neighbor });
                try came_from.put(neighbor, curr);
            }
        }
    }

    if (!cost_so_far.contains(goal)) {
        return PathWalk{ .path = &.{}, .current_idx = 0 };
    }

    var backtrack = std.ArrayList(Point).init(allocator);
    defer backtrack.deinit();
    try backtrack.append(goal);
    var curr = goal;
    while (!curr.equals(start)) {
        curr = came_from.get(curr).?.?;
        try backtrack.append(curr);
    }
    _ = backtrack.pop(); // remove starting point

    var path = try std.ArrayList(Point).initCapacity(allocator, backtrack.items.len);
    while (backtrack.items.len > 0) {
        try path.append(backtrack.pop());
    }

    return PathWalk{
        .current_idx = 0,
        .path = try path.toOwnedSlice(),
    };
}
