const wasmbotClient = @import("wasmbot_client");

pub const Direction = enum(u8) {
    East,
    Southeast,
    South,
    Southwest,
    West,
    Northwest,
    North,
    Northeast,
};

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
};
