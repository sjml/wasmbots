const std = @import("std");
const Allocator = std.mem.Allocator;

// would be nice to pull these from the build.zig.zon,
//   but can't import just yet
const BOT_NAME = "bot_zig";
const VERSION = [3]u32{ 0, 1, 0 };

var GLOBAL_ALLOCATOR: std.mem.Allocator = undefined;
var HOST_RESERVE: []u8 = undefined;

extern fn logFunction(msgPtr: usize, msgLen: usize) void;

fn log(msg: []const u8) void {
    logFunction(@intFromPtr(msg.ptr), msg.len);
}

export fn setup(requestReserve: usize) usize {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    GLOBAL_ALLOCATOR = gpa.allocator();

    const msg = std.fmt.allocPrint(GLOBAL_ALLOCATOR, "Reserving space for {d} bytes.", .{requestReserve}) catch @panic("Error allocating formatted string");
    log(msg);
    defer GLOBAL_ALLOCATOR.free(msg);

    HOST_RESERVE = GLOBAL_ALLOCATOR.alloc(u8, requestReserve) catch @panic("Error allocating host reserve memory.");

    const MAX_NAME_LEN = 20;
    const nameLen = @min(MAX_NAME_LEN, BOT_NAME.len);
    var offset: usize = 0;
    @memcpy(HOST_RESERVE[offset .. offset + nameLen], BOT_NAME[0..nameLen]);
    @memset(HOST_RESERVE[nameLen..MAX_NAME_LEN], 0);
    offset += MAX_NAME_LEN;
    for (VERSION) |ve| {
        const slice = HOST_RESERVE[offset..][0..@sizeOf(u32)];
        std.mem.writeInt(u32, @constCast(slice), ve, .little);
        offset += @sizeOf(u32);
    }

    return @intFromPtr(HOST_RESERVE.ptr);
}

fn fib(n: u64) u64 {
    if (n < 2) {
        return n;
    } else {
        return fib(n - 2) + fib(n - 1);
    }
}

export fn runFib(offset: usize, result: usize) bool {
    if (result + @sizeOf(u64) > HOST_RESERVE.len) {
        log("Invalid result offset");
        return false;
    }
    if (offset > HOST_RESERVE.len) {
        log("Invalid offset");
        return false;
    }
    const n = HOST_RESERVE[offset];
    if (n > 93) {
        log("Fib index too high");
        return false;
    }

    const fibNum = fib(n);
    const slice = HOST_RESERVE[result..][0..@sizeOf(u64)];
    std.mem.writeInt(u64, @constCast(slice), fibNum, .little);
    return true;
}
