const std = @import("std");
const Allocator = std.mem.Allocator;

const config = @import("config");

const log = @import("./wasmbot_client.zig").log;
const logErr = @import("./wasmbot_client.zig").logErr;

pub var HOST_RESERVE: []u8 = undefined; //&[0]u8{};

pub fn reserveMemory(request: usize) bool {
    if (HOST_RESERVE.len > 0) {
        logErr("CLIENT ERROR: Attempting to reserve memory twice");
        return false;
    }

    HOST_RESERVE = std.heap.page_allocator.alloc(u8, request) catch {
        logErr("CLIENT ERROR: Could not allocate reserve memory");
        return false;
    };

    return true;
}

pub fn write_string(offset: usize, msg: []const u8) usize {
    if (config.bounds_checking) {
        if (offset + msg.len >= HOST_RESERVE.len) {
            logErr("CLIENT ERROR: String too long to write to reserve memory");
            return offset;
        }
    }
    std.mem.copyForwards(u8, HOST_RESERVE[offset..][0..msg.len], msg);
    return offset + msg.len;
}

pub fn read_string(allocator: Allocator, offset: usize, len: usize) []const u8 {
    if (config.bounds_checking) {
        if (offset + len >= HOST_RESERVE.len) {
            logErr("CLIENT ERROR: String read will overrun reserve memory");
            return null;
        }
    }
    const str = allocator.alloc(u8, len) catch @panic("CLIENT ERROR: String memory allocation failed");
    for (0..len) |i| {
        str[i] = HOST_RESERVE[offset + i];
    }
    return str;
}

fn _numberTypeIsValid(comptime T: type) bool {
    const validNumericTypes = [_]type{
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

pub fn write_number(comptime T: type, offset: usize, value: T) usize {
    comptime {
        if (!_numberTypeIsValid(T)) {
            @compileError("Invalid number type");
        }
    }

    if (config.bounds_checking) {
        if (offset + @sizeOf(T) >= HOST_RESERVE.len) {
            logErr(comptime std.fmt.comptimePrint("CLIENT ERROR: Writing {s} outside of reserve memory", .{@typeName(T)}));
            return offset;
        }
    }
    const slice = HOST_RESERVE[offset..][0..@sizeOf(T)];
    switch (T) {
        f32 => std.mem.writeInt(u32, @constCast(slice), @bitCast(value), .little),
        f64 => std.mem.writeInt(u64, @constCast(slice), @bitCast(value), .little),
        else => std.mem.writeInt(T, @constCast(slice), value, .little),
    }
    return offset + @sizeOf(T);
}

pub fn read_number(comptime T: type, offset: usize) T {
    comptime {
        if (!_numberTypeIsValid(T)) {
            @compileError("Invalid number type");
        }
    }

    if (config.bounds_checking) {
        if (offset + @sizeOf(T) >= HOST_RESERVE.len) {
            logErr(comptime std.fmt.comptimePrint("CLIENT ERROR: {s} read will overrun reserve memory", .{@typeName(T)}));
            return 0;
        }
    }

    switch (T) {
        f32 => return @bitCast(std.mem.readInt(u32, HOST_RESERVE[offset..][0..@sizeOf(T)], .little)),
        f64 => return @bitCast(std.mem.readInt(u64, HOST_RESERVE[offset..][0..@sizeOf(T)], .little)),
        else => return std.mem.readInt(T, HOST_RESERVE[offset..][0..@sizeOf(T)], .little),
    }
}
