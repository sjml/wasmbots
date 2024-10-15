pub const host_reserve = @import("./host_reserve.zig");
pub const params = @import("./params.zig");

extern fn logFunction(logLevel: i32, msgPtr: usize, msgLen: usize) void;
pub fn log(msg: []const u8) void {
    logFunction(2, @intFromPtr(msg.ptr), msg.len);
}

pub fn logErr(msg: []const u8) void {
    logFunction(0, @intFromPtr(msg.ptr), msg.len);
}

export fn setup(requestReserve: usize) usize {
    if (!host_reserve.reserveMemory(requestReserve)) {
        return 0;
    }

    return @intFromPtr(host_reserve.HOST_RESERVE.ptr);
}

pub const TickFn = fn () void;
var _clientTick: ?*const TickFn = null;

pub fn setTickCallback(cb: ?*const TickFn) bool {
    if (_clientTick) |_| {
        logErr("CLIENT ERROR: Tick callback already registered");
        return false;
    } else {
        _clientTick = cb;
        return true;
    }
}

export fn tick(offset: usize) void {
    _ = offset;
    if (_clientTick) |ct| {
        ct();
    }
}
