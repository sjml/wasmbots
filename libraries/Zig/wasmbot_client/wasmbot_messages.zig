// This file was automatically generated by Beschi v0.2.3
// <https://github.com/sjml/beschi>
// Do not edit directly.

// DATA PROTOCOL
// -----------------
// [meta]
// namespace = "WasmBots"
// list_size_type = "uint16"
// string_size_type = "byte"
// 
// # used internally for handling host <-> module mishaps
// [[messages]]
// _name = "_Error"
// description = "string"
// 
// # initial setup message that you can either accept or reject
// [[messages]]
// _name = "InitialParameters"
// paramsVersion = "uint16"       # version of this very message, so you know if you can parse the rest
// engineVersionMajor = "uint16"  # major version of engine
// engineVersionMinor = "uint16"  # minor version of engine
// engineVersionPatch = "uint16"  # patch version of engine
// diagonalMovement = "bool"      # if false, any attempted diagonal move will be Invalid
// 
// 
// [[structs]]
// _name = "Point"
// x = "uint16"
// y = "uint16"
// 
// 
// [[enums]]
// _name = "MoveResult"
// _values = [
//     "Succeeded",  # your move worked (ex: attack hit, moved successfully)
//     "Failed",     # your move did not work (ex: attack missed, moved into wall)
//     "Invalid",    # your move was not allowed by the system (ex: tried diagonal movement when not allowed, targeted something out of range)
//     "Error",      # your move was not understood (ex: malformed message, missing data)
// ]
// 
// [[enums]]
// _name = "TileType"
// _values = [
//     "Void",        # you don't know what's there; might be off the edge of the map, or maybe just behind a wall
//     "Empty",       # an open space you can move to
//     "OpenDoor",    # a door space that you can pass through or take a turn to target with Close
//     "ClosedDoor",  # an impassible door space that you can take a turn to target with Open
//     "Wall",        # an impassible space
// ]
// 
// [[enums]]
// _name = "Direction"
// _values = [
//     "East",
//     "Southeast",
//     "South",
//     "Southwest",
//     "West",
//     "Northwest",
//     "North",
//     "Northeast",
// ]
// 
// # player receives every tick
// [[messages]]
// _name = "PresentCircumstances"  # describes your immediate situation and surroundings at the start of this turn
// lastTickDuration = "uint32"     # how long, in milliseconds, you took on the last tick (will be 0 on initial turn)
// lastMoveResult = "MoveResult"   # the result of your last turn (will be Succeeded on initial turn)
// currentHitPoints = "uint16"     # how many hit points you have
// surroundings = "[TileType]"     # array of tiles representing your immediate surroundings as a square with you in the middle
// surroundingsRadius = "byte"     # radius (from you) of the surroundings, so the side of a square is (this * 2) + 1
// 
// 
// ### moves that the player submits
// 
// [[messages]]
// _name = "Wait"  # no-op; don't do anything and wait for the next tick
// 
// [[messages]]
// _name = "Resign"  # give up the game; you will receive no more tick calls after submitting this move
// 
// [[messages]]
// _name = "MoveTo"         # move to a new tile
// direction = "Direction"  # which way to move
// distance = "byte"        # how far to move (can usually just be 1, but might be modified); if you put a number that is beyond your max range, the move will be Invalid
// 
// [[messages]]
// _name = "Open"     # open (a door, a chest, etc.) at a specific tile
// target = "Point"   # the position *relative to you* that you want to try to open; can usually only be one square away (manhattan distance); if already opened, move will fail; if target is not openable, move will be Invalid
// 
// [[messages]]
// _name = "Close"    # close (a door, a chest, etc.) at a specific tile
// target = "Point"   # the position *relative to you* that you want to try to close; can usually only be one square away (manhattan distance); if already closed, move will fail; if target is not closable, move will be Invalid
// 
// -----------------
// END DATA PROTOCOL


const std = @import("std");

const DataReaderError = error {
    EOF,
    InvalidData,
};

fn numberTypeIsValid(comptime T: type) bool {
    const validNumericTypes = [_]type{
        bool,
        u8,  i8,
        u16, i16,
        u32, i32,
        u64, i64,
        f32, f64,
    };
    for (validNumericTypes) |vt| {
        if (T == vt) {
            return true;
        }
    }
    return false;
}

const simpleTypes = [_]type{
    Point, InitialParameters, Wait, Resign, MoveTo, Open, Close,
};

const enumTypes = [_]type{
    MoveResult, TileType, Direction,
};

fn typeIsSimple(comptime T: type) bool {
    if (comptime numberTypeIsValid(T)) {
        return true;
    }
    for (simpleTypes) |vt| {
        if (T == vt) {
            return true;
        }
    }
    if (typeIsEnum(T)) {
        return true;
    }
    return false;
}

fn typeIsEnum(comptime T: type) bool {
    for (enumTypes) |vt| {
        if (T == vt) {
            return true;
        }
    }
    return false;
}

fn isValidEnum(comptime Te: type, comptime Ti: type, value: Ti) bool {
    inline for (std.meta.fields(Te)) |f| {
        if (value == f.value) {
            return true;
        }
    }
    return false;
}

pub fn readNumber(comptime T: type, offset: usize, buffer: []const u8) !struct { value: T, bytes_read: usize } {
    comptime {
        const actual_type = switch (@typeInfo(T)) {
            .Enum => |enum_info| enum_info.tag_type,
            else => T,
        };

        if (!numberTypeIsValid(actual_type)) {
            @compileError("Invalid number type");
        }
    }

    if (offset + @sizeOf(T) > buffer.len) {
        return DataReaderError.EOF;
    }

    const val: T = switch (T) {
        f32 => @bitCast(std.mem.readInt(u32, buffer[offset..][0..@sizeOf(T)], .little)),
        f64 => @bitCast(std.mem.readInt(u64, buffer[offset..][0..@sizeOf(T)], .little)),
        bool => std.mem.readInt(u8, buffer[offset..][0..@sizeOf(T)], .little) != 0,
        else => enum_conversion: {
            break :enum_conversion switch (@typeInfo(T)) {
                .Enum => |ei| {
                    const raw = std.mem.readInt(ei.tag_type, buffer[offset..][0..@sizeOf(T)], .little);
                    if (!isValidEnum(T, ei.tag_type, raw)) {
                        return DataReaderError.InvalidData;
                    }
                    break :enum_conversion @enumFromInt(raw);
                },
                else => std.mem.readInt(T, buffer[offset..][0..@sizeOf(T)], .little),
            };
        },
    };

    return .{ .value = val, .bytes_read = @sizeOf(T) };
}

pub fn readString(allocator: std.mem.Allocator, offset: usize, buffer: []const u8) !struct { value: []u8, bytes_read: usize } {
    const len_read = try readNumber(u8, offset, buffer);
    const len = len_read.value;

    if (offset + @sizeOf(u8) + len > buffer.len) {
        return DataReaderError.EOF;
    }

    var str = try allocator.alloc(u8, len);
    for (0..len) |i| {
        str[i] = buffer[offset + len_read.bytes_read + i];
    }
    return .{ .value = str, .bytes_read = @sizeOf(u8) + len };
}

pub fn readList(comptime T: type, allocator: std.mem.Allocator, offset: usize, buffer: []const u8) !struct { value: []T, bytes_read: usize } {
    var local_offset = offset;
    const len_read = try readNumber(u16, local_offset, buffer);
    const len = len_read.value;
    local_offset += len_read.bytes_read;
    var list = try allocator.alloc(T, len);
    var made_count: u16 = 0;

    errdefer {
        for (0..made_count) |i| {
            if (comptime (numberTypeIsValid(T) or typeIsEnum(T))) {
                // no-op; just keeping the same structure as below
            }
            else {
                switch (T) {
                    []u8, []const u8 => {
                        allocator.free(list[i]);
                    },
                    else => {
                        if (comptime typeIsSimple(T)) {
                            // no-op
                        }
                        else {
                            list[i].deinit(allocator);
                        }
                    }
                }
            }
        }
        allocator.free(list);
    }

    for (0..len) |i| {
        if (comptime (numberTypeIsValid(T) or typeIsEnum(T))) {
            const list_read = try readNumber(T, local_offset, buffer);
            list[i] = list_read.value;
            local_offset += list_read.bytes_read;
        } else {
            switch (T) {
                []u8, []const u8 => {
                    const list_read = try readString(allocator, local_offset, buffer);
                    list[i] = list_read.value;
                    local_offset += list_read.bytes_read;
                },
                else => {
                    if (comptime typeIsSimple(T)) {
                        const list_read = try T.fromBytes(local_offset, buffer);
                        list[i] = list_read.value;
                        local_offset += list_read.bytes_read;
                    }
                    else {
                        const list_read = try T.fromBytes(allocator, local_offset, buffer);
                        list[i] = list_read.value;
                        local_offset += list_read.bytes_read;
                    }
                },
            }
        }
        made_count += 1;
    }
    return .{ .value = list, .bytes_read = local_offset - offset };
}

pub fn writeNumber(comptime T: type, offset: usize, buffer: []u8, value: T) usize {
    comptime {
        const actual_type = switch (@typeInfo(T)) {
            .Enum => |enum_info| enum_info.tag_type,
            else => T,
        };

        if (!numberTypeIsValid(actual_type)) {
            @compileError("Invalid number type");
        }
    }

    const slice = buffer[offset..][0..@sizeOf(T)];
    switch (T) {
        f32 => std.mem.writeInt(u32, @constCast(slice), @bitCast(value), .little),
        f64 => std.mem.writeInt(u64, @constCast(slice), @bitCast(value), .little),
        bool => std.mem.writeInt(u8, @constCast(slice), @intFromBool(value), .little),
        else => switch (@typeInfo(T)) {
            .Enum => |ei| std.mem.writeInt(ei.tag_type, @constCast(slice), @intFromEnum(value), .little),
            else => std.mem.writeInt(T, @constCast(slice), value, .little),
        }
    }
    return @sizeOf(T);
}

pub fn writeString(offset: usize, buffer: []u8, value: []const u8) usize {
    _ = writeNumber(u16, offset, buffer, @intCast(value.len));
    std.mem.copyForwards(u8, buffer[offset+@sizeOf(u16)..][0..value.len], value);
    return @sizeOf(u16) + value.len;
}

pub fn writeList(comptime T: type, offset: usize, buffer: []u8, value: []T) usize {
    var local_offset = offset;
    local_offset += writeNumber(u16, local_offset, buffer, @intCast(value.len));

    for (value) |item| {
        if (comptime (numberTypeIsValid(T) or typeIsEnum(T))) {
            local_offset += writeNumber(T, local_offset, buffer, item);
        }
        else {
            switch(T) {
                []u8, []const u8 => {
                    local_offset += writeString(local_offset, buffer, item);
                },
                else => {
                    local_offset += item.writeBytes(local_offset, buffer);
                }
            }
        }
    }
    return local_offset - offset;
}

pub fn writeBytes(m: *const Message, offset: usize, buffer: []u8, tag: bool) usize {
    switch (m.*) {
        inline else => |inner| return inner.writeBytes(offset, buffer, tag),
    }
}

pub const MessageType = enum(u8) {
    _Error,
    InitialParameters,
    PresentCircumstances,
    Wait,
    Resign,
    MoveTo,
    Open,
    Close,
};

pub const Message = union(MessageType) {
    _Error: _Error,
    InitialParameters: InitialParameters,
    PresentCircumstances: PresentCircumstances,
    Wait: Wait,
    Resign: Resign,
    MoveTo: MoveTo,
    Open: Open,
    Close: Close,
};

pub fn processRawBytes(allocator: std.mem.Allocator, buffer: []const u8) ![]Message {
    var msg_list = std.ArrayList(Message).init(allocator);
    defer msg_list.deinit();

    var local_offset: usize = 0;
    while (local_offset < buffer.len) {
        const msg_type_byte = (try readNumber(u8, local_offset, buffer)).value;
        local_offset += 1;
        if (msg_type_byte == 0) {
            return msg_list.toOwnedSlice();
        }
        const msg_type: MessageType = std.meta.intToEnum(MessageType, msg_type_byte - 1) catch return DataReaderError.InvalidData;
        switch(msg_type) {
            ._Error => {
                const msg_read = try _Error.fromBytes(allocator, local_offset, buffer);
                local_offset += msg_read.bytes_read;
                try msg_list.append(Message{ ._Error = msg_read.value });
            },
            .InitialParameters => {
                const msg_read = try InitialParameters.fromBytes(local_offset, buffer);
                local_offset += msg_read.bytes_read;
                try msg_list.append(Message{ .InitialParameters = msg_read.value });
            },
            .PresentCircumstances => {
                const msg_read = try PresentCircumstances.fromBytes(allocator, local_offset, buffer);
                local_offset += msg_read.bytes_read;
                try msg_list.append(Message{ .PresentCircumstances = msg_read.value });
            },
            .Wait => {
                const msg_read = try Wait.fromBytes(local_offset, buffer);
                local_offset += msg_read.bytes_read;
                try msg_list.append(Message{ .Wait = msg_read.value });
            },
            .Resign => {
                const msg_read = try Resign.fromBytes(local_offset, buffer);
                local_offset += msg_read.bytes_read;
                try msg_list.append(Message{ .Resign = msg_read.value });
            },
            .MoveTo => {
                const msg_read = try MoveTo.fromBytes(local_offset, buffer);
                local_offset += msg_read.bytes_read;
                try msg_list.append(Message{ .MoveTo = msg_read.value });
            },
            .Open => {
                const msg_read = try Open.fromBytes(local_offset, buffer);
                local_offset += msg_read.bytes_read;
                try msg_list.append(Message{ .Open = msg_read.value });
            },
            .Close => {
                const msg_read = try Close.fromBytes(local_offset, buffer);
                local_offset += msg_read.bytes_read;
                try msg_list.append(Message{ .Close = msg_read.value });
            },
        }
    }
    return msg_list.toOwnedSlice();
}

pub const MoveResult = enum(u8) {
    Succeeded = 0,
    Failed = 1,
    Invalid = 2,
    Error = 3,
};

pub const TileType = enum(u8) {
    Void = 0,
    Empty = 1,
    OpenDoor = 2,
    ClosedDoor = 3,
    Wall = 4,
};

pub const Direction = enum(u8) {
    East = 0,
    Southeast = 1,
    South = 2,
    Southwest = 3,
    West = 4,
    Northwest = 5,
    North = 6,
    Northeast = 7,
};

pub const Point = struct {
    x: u16 = 0,
    y: u16 = 0,

    pub fn getSizeInBytes(self: *const Point) usize {
        _ = self;
        return 4;
    }

    pub fn fromBytes(offset: usize, buffer: []const u8) !struct { value: Point, bytes_read: usize } {
        const Point_x = (try readNumber(u16, offset + 0, buffer)).value;
        const Point_y = (try readNumber(u16, offset + 2, buffer)).value;
        return .{ .value = Point{
            .x = Point_x,
            .y = Point_y,
        }, .bytes_read = 4 };
    }

    pub fn writeBytes(self: *const Point, offset: usize, buffer: []u8) usize {
        _ = writeNumber(u16, offset + 0, buffer, self.x);
        _ = writeNumber(u16, offset + 2, buffer, self.y);
        return 4;
    }
};

pub const _Error = struct {
    description: []const u8 = "",

    pub fn getSizeInBytes(self: *const _Error) usize {
        var size: usize = 0;
        size += self.description.len;
        size += 1;
        return size;
    }

    pub fn fromBytes(allocator: std.mem.Allocator, offset: usize, buffer: []const u8) !struct { value: _Error, bytes_read: usize } {
        var local_offset = offset;

        const _Error_description_read = try readString(allocator, local_offset, buffer);
        const _Error_description = _Error_description_read.value;
        local_offset += _Error_description_read.bytes_read;

        return .{ .value = _Error{
            .description = _Error_description,
        }, .bytes_read = local_offset - offset };
    }

    pub fn writeBytes(self: *const _Error, offset: usize, buffer: []u8, tag: bool) usize {
        var local_offset = offset;
        if (tag) {
            local_offset += writeNumber(u8, local_offset, buffer, 1);
        }

        local_offset += writeString(local_offset, buffer, self.description);

        return local_offset - offset;
    }

    pub fn deinit(self: *_Error, allocator: std.mem.Allocator) void {
        allocator.free(self.description);
    }
};

pub const InitialParameters = struct {
    paramsVersion: u16 = 0,
    engineVersionMajor: u16 = 0,
    engineVersionMinor: u16 = 0,
    engineVersionPatch: u16 = 0,
    diagonalMovement: bool = false,

    pub fn getSizeInBytes(self: *const InitialParameters) usize {
        _ = self;
        return 9;
    }

    pub fn fromBytes(offset: usize, buffer: []const u8) !struct { value: InitialParameters, bytes_read: usize } {
        const InitialParameters_paramsVersion = (try readNumber(u16, offset + 0, buffer)).value;
        const InitialParameters_engineVersionMajor = (try readNumber(u16, offset + 2, buffer)).value;
        const InitialParameters_engineVersionMinor = (try readNumber(u16, offset + 4, buffer)).value;
        const InitialParameters_engineVersionPatch = (try readNumber(u16, offset + 6, buffer)).value;
        const InitialParameters_diagonalMovement = (try readNumber(bool, offset + 8, buffer)).value;
        return .{ .value = InitialParameters{
            .paramsVersion = InitialParameters_paramsVersion,
            .engineVersionMajor = InitialParameters_engineVersionMajor,
            .engineVersionMinor = InitialParameters_engineVersionMinor,
            .engineVersionPatch = InitialParameters_engineVersionPatch,
            .diagonalMovement = InitialParameters_diagonalMovement,
        }, .bytes_read = 9 };
    }

    pub fn writeBytes(self: *const InitialParameters, offset: usize, buffer: []u8, tag: bool) usize {
        var local_offset = offset;

        if (tag) {
            local_offset += writeNumber(u8, local_offset, buffer, 2);
        }
        local_offset += writeNumber(u16, local_offset, buffer, self.paramsVersion);
        local_offset += writeNumber(u16, local_offset, buffer, self.engineVersionMajor);
        local_offset += writeNumber(u16, local_offset, buffer, self.engineVersionMinor);
        local_offset += writeNumber(u16, local_offset, buffer, self.engineVersionPatch);
        local_offset += writeNumber(bool, local_offset, buffer, self.diagonalMovement);

        return local_offset - offset;
    }
};

pub const PresentCircumstances = struct {
    lastTickDuration: u32 = 0,
    lastMoveResult: MoveResult = MoveResult.Succeeded,
    currentHitPoints: u16 = 0,
    surroundings: []TileType = &.{},
    surroundingsRadius: u8 = 0,

    pub fn getSizeInBytes(self: *const PresentCircumstances) usize {
        var size: usize = 0;
        size += self.surroundings.len * 1;
        size += 10;
        return size;
    }

    pub fn fromBytes(allocator: std.mem.Allocator, offset: usize, buffer: []const u8) !struct { value: PresentCircumstances, bytes_read: usize } {
        var local_offset = offset;

        const PresentCircumstances_lastTickDuration_read = try readNumber(u32, local_offset, buffer);
        const PresentCircumstances_lastTickDuration = PresentCircumstances_lastTickDuration_read.value;
        local_offset += PresentCircumstances_lastTickDuration_read.bytes_read;

        const PresentCircumstances_lastMoveResult_read = try readNumber(MoveResult, local_offset, buffer);
        const PresentCircumstances_lastMoveResult = PresentCircumstances_lastMoveResult_read.value;
        local_offset += PresentCircumstances_lastMoveResult_read.bytes_read;

        const PresentCircumstances_currentHitPoints_read = try readNumber(u16, local_offset, buffer);
        const PresentCircumstances_currentHitPoints = PresentCircumstances_currentHitPoints_read.value;
        local_offset += PresentCircumstances_currentHitPoints_read.bytes_read;

        const PresentCircumstances_surroundings_read = try readList(TileType, allocator, local_offset, buffer);
        const PresentCircumstances_surroundings = PresentCircumstances_surroundings_read.value;
        local_offset += PresentCircumstances_surroundings_read.bytes_read;

        const PresentCircumstances_surroundingsRadius_read = try readNumber(u8, local_offset, buffer);
        const PresentCircumstances_surroundingsRadius = PresentCircumstances_surroundingsRadius_read.value;
        local_offset += PresentCircumstances_surroundingsRadius_read.bytes_read;

        return .{ .value = PresentCircumstances{
            .lastTickDuration = PresentCircumstances_lastTickDuration,
            .lastMoveResult = PresentCircumstances_lastMoveResult,
            .currentHitPoints = PresentCircumstances_currentHitPoints,
            .surroundings = PresentCircumstances_surroundings,
            .surroundingsRadius = PresentCircumstances_surroundingsRadius,
        }, .bytes_read = local_offset - offset };
    }

    pub fn writeBytes(self: *const PresentCircumstances, offset: usize, buffer: []u8, tag: bool) usize {
        var local_offset = offset;
        if (tag) {
            local_offset += writeNumber(u8, local_offset, buffer, 3);
        }

        local_offset += writeNumber(u32, local_offset, buffer, self.lastTickDuration);
        local_offset += writeNumber(MoveResult, local_offset, buffer, self.lastMoveResult);
        local_offset += writeNumber(u16, local_offset, buffer, self.currentHitPoints);
        local_offset += writeList(TileType, local_offset, buffer, self.surroundings);
        local_offset += writeNumber(u8, local_offset, buffer, self.surroundingsRadius);

        return local_offset - offset;
    }

    pub fn deinit(self: *PresentCircumstances, allocator: std.mem.Allocator) void {
        allocator.free(self.surroundings);
    }
};

pub const Wait = struct {

    pub fn getSizeInBytes(self: *const Wait) usize {
        _ = self;
        return 0;
    }

    pub fn fromBytes(offset: usize, buffer: []const u8) !struct { value: Wait, bytes_read: usize } {
        _ = offset;
        _ = buffer;
        return .{ .value = Wait{
        }, .bytes_read = 0 };
    }

    pub fn writeBytes(self: *const Wait, offset: usize, buffer: []u8, tag: bool) usize {
        _ = self;
        var local_offset = offset;

        if (tag) {
            local_offset += writeNumber(u8, local_offset, buffer, 4);
        }

        return local_offset - offset;
    }
};

pub const Resign = struct {

    pub fn getSizeInBytes(self: *const Resign) usize {
        _ = self;
        return 0;
    }

    pub fn fromBytes(offset: usize, buffer: []const u8) !struct { value: Resign, bytes_read: usize } {
        _ = offset;
        _ = buffer;
        return .{ .value = Resign{
        }, .bytes_read = 0 };
    }

    pub fn writeBytes(self: *const Resign, offset: usize, buffer: []u8, tag: bool) usize {
        _ = self;
        var local_offset = offset;

        if (tag) {
            local_offset += writeNumber(u8, local_offset, buffer, 5);
        }

        return local_offset - offset;
    }
};

pub const MoveTo = struct {
    direction: Direction = Direction.East,
    distance: u8 = 0,

    pub fn getSizeInBytes(self: *const MoveTo) usize {
        _ = self;
        return 2;
    }

    pub fn fromBytes(offset: usize, buffer: []const u8) !struct { value: MoveTo, bytes_read: usize } {
        const MoveTo_direction_check = (try readNumber(u8, offset + 0, buffer)).value;

        const MoveTo_distance = (try readNumber(u8, offset + 1, buffer)).value;
        return .{ .value = MoveTo{
            .direction = MoveTo_direction,
            .distance = MoveTo_distance,
        }, .bytes_read = 2 };
    }

    pub fn writeBytes(self: *const MoveTo, offset: usize, buffer: []u8, tag: bool) usize {
        var local_offset = offset;

        if (tag) {
            local_offset += writeNumber(u8, local_offset, buffer, 6);
        }
        local_offset += writeNumber(Direction, local_offset, buffer, self.direction);
        local_offset += writeNumber(u8, local_offset, buffer, self.distance);

        return local_offset - offset;
    }
};

pub const Open = struct {
    target: Point = Point{},

    pub fn getSizeInBytes(self: *const Open) usize {
        _ = self;
        return 4;
    }

    pub fn fromBytes(offset: usize, buffer: []const u8) !struct { value: Open, bytes_read: usize } {
        const Open_target_read = Point.fromBytes(0, buffer);
        const Open_target = Open_target_read.value;
        return .{ .value = Open{
            .target = Open_target,
        }, .bytes_read = 4 };
    }

    pub fn writeBytes(self: *const Open, offset: usize, buffer: []u8, tag: bool) usize {
        var local_offset = offset;

        if (tag) {
            local_offset += writeNumber(u8, local_offset, buffer, 7);
        }
        local_offset += self.target.writeBytes(local_offset, buffer);

        return local_offset - offset;
    }
};

pub const Close = struct {
    target: Point = Point{},

    pub fn getSizeInBytes(self: *const Close) usize {
        _ = self;
        return 4;
    }

    pub fn fromBytes(offset: usize, buffer: []const u8) !struct { value: Close, bytes_read: usize } {
        const Close_target_read = Point.fromBytes(0, buffer);
        const Close_target = Close_target_read.value;
        return .{ .value = Close{
            .target = Close_target,
        }, .bytes_read = 4 };
    }

    pub fn writeBytes(self: *const Close, offset: usize, buffer: []u8, tag: bool) usize {
        var local_offset = offset;

        if (tag) {
            local_offset += writeNumber(u8, local_offset, buffer, 8);
        }
        local_offset += self.target.writeBytes(local_offset, buffer);

        return local_offset - offset;
    }
};
