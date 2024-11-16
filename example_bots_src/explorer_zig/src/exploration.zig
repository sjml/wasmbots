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
    lastLocation: Point = Point{},
    attemptedMove: Point = Point{},

    pub fn toWorld(self: *Agent, offset_point: Point) Point {
        return self.location.add(offset_point);
    }

    pub fn makeMove(self: *Agent, target: Point) msg.Message {
        self.attemptedMove = target.sub(self.location);
        const movement = self.location.directionToNeighbor(target);
        if (movement == null) {
            return msg.Message{ .Wait = msg.Wait{} };
        }
        return msg.Message{ .MoveTo = msg.MoveTo{ .direction = movement.?, .distance = 1 } };
    }
};

pub const PathWalk = struct {
    currentIdx: usize,
    path: []Point,

    pub fn isFinished(self: *PathWalk) bool {
        return self.currentIdx >= self.path.len;
    }

    pub fn getNext(self: *PathWalk) ?Point {
        if (self.isFinished()) {
            return null;
        }
        self.currentIdx += 1;
        return self.path[self.currentIdx - 1];
    }
};

const PathfindNode = struct { cost: u32, location: Point };

fn pfnComp(ctx: void, a: PathfindNode, b: PathfindNode) std.math.Order {
    _ = ctx;
    return std.math.order(a.cost, b.cost);
}

const Frontier = std.PriorityQueue(PathfindNode, void, pfnComp);

pub fn pathfind(allocator: std.mem.Allocator, start: Point, goal: Point, map: *const Map) !PathWalk {
    const startNode = PathfindNode{ .cost = 0, .location = start };
    var frontier = Frontier.init(allocator, {});
    defer frontier.deinit();
    var cameFrom = std.AutoHashMap(Point, ?Point).init(allocator);
    defer cameFrom.deinit();
    var costSoFar = std.AutoHashMap(Point, u32).init(allocator);
    defer costSoFar.deinit();

    try frontier.add(startNode);
    try cameFrom.put(start, null);
    try costSoFar.put(start, 0);

    while (frontier.count() > 0) {
        const currNode = frontier.remove();
        const curr = currNode.location;
        if (curr.equals(goal)) {
            break;
        }

        for (curr.getNeighbors4()) |neighbor| {
            var totalCost = costSoFar.get(curr).?;
            const neighborType = map.get(neighbor);
            if (neighborType == msg.TileType.Void) {
                // we don't know what's there
                continue;
            } else if (neighborType == msg.TileType.Wall) {
                // can't go there
                continue;
            } else if (neighborType == msg.TileType.ClosedDoor) {
                totalCost += 2;
            } else {
                totalCost += 1;
            }
            if (!costSoFar.contains(neighbor) or totalCost < costSoFar.get(neighbor).?) {
                try costSoFar.put(neighbor, totalCost);
                const priority = totalCost + neighbor.manhattanDistance(goal);
                try frontier.add(PathfindNode{ .cost = priority, .location = neighbor });
                try cameFrom.put(neighbor, curr);
            }
        }
    }

    if (!costSoFar.contains(goal)) {
        return PathWalk{ .path = &.{}, .currentIdx = 0 };
    }

    var backtrack = std.ArrayList(Point).init(allocator);
    defer backtrack.deinit();
    try backtrack.append(goal);
    var curr = goal;
    while (!curr.equals(start)) {
        curr = cameFrom.get(curr).?.?;
        try backtrack.append(curr);
    }
    _ = backtrack.pop(); // remove starting point

    var path = try std.ArrayList(Point).initCapacity(allocator, backtrack.items.len);
    while (backtrack.items.len > 0) {
        try path.append(backtrack.pop());
    }

    return PathWalk{
        .currentIdx = 0,
        .path = try path.toOwnedSlice(),
    };
}
