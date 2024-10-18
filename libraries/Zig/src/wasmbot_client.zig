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

pub const TickFn = fn (u32) void;
var _clientTick: *const TickFn = _noop;
fn _noop(_: u32) void {}

pub fn registerTickCallback(cb: *const TickFn) void {
    _clientTick = cb;
}

export fn tick(offset: usize) void {
    const lastDuration = host_reserve.read_number(u32, offset);
    _clientTick(lastDuration);
}
