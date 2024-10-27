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

pub const TickFn = fn (u32, bool) void;
var _client_tick: *const TickFn = _clienTickNoop;
fn _clienTickNoop(_: u32, _: bool) void {}

pub fn registerTickCallback(cb: *const TickFn) void {
    _client_tick = cb;
}

export fn tick(offset: usize) void {
    var local_offset = offset;
    const last_duration = host_reserve.readNumber(u32, local_offset);
    local_offset += 4;
    const last_move_succeeded: bool = host_reserve.readNumber(u8, local_offset) != 0;
    _client_tick(last_duration, last_move_succeeded);
}

pub extern fn getRandomInt(min: i32, max: i32) i32;
