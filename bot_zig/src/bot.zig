const std = @import("std");
const Allocator = std.mem.Allocator;

var GLOBAL_ALLOCATOR: std.mem.Allocator = undefined;
var HOST_RESERVE: []u8 = undefined;

extern fn logFunction(msgPtr: usize, msgLen: usize) void;

fn log(msg: []const u8) void {
    logFunction(@intFromPtr(msg.ptr), msg.len);
}

export fn setup(requestReserve: usize) usize {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    GLOBAL_ALLOCATOR = gpa.allocator();

    log("Zig -> wasm reporting!");
    const msg = std.fmt.allocPrint(GLOBAL_ALLOCATOR, "Reserving space for {d} bytes.", .{requestReserve}) catch @panic("Error allocating formatted string");
    log(msg);
    defer GLOBAL_ALLOCATOR.free(msg);

    HOST_RESERVE = GLOBAL_ALLOCATOR.alloc(u8, requestReserve) catch @panic("Error allocating host reserve memory.");
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
    const slice = HOST_RESERVE[result..][0..8];
    std.mem.writeInt(u64, @constCast(slice), fibNum, .little);
    return true;
}
