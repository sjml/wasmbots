const Allocator = @import("std").mem.Allocator;

pub const host_reserve = @import("host_reserve.zig");
pub const params = @import("params.zig");
pub const messages = @import("wasmbot_messages.zig");

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

pub const TickFn = fn (messages.GameCircumstances) messages.Message;
var _client_tick: *const TickFn = _clienTickNoop;
fn _clienTickNoop(_: messages.GameCircumstances) messages.Message {
    return messages.Message{ ._Error = messages._Error{ .description = "No client tick function registered" } };
}

pub fn registerTickCallback(cb: *const TickFn) void {
    _client_tick = cb;
}

var _allocator: Allocator = undefined;
pub fn setAllocator(allocator: Allocator) void {
    _allocator = allocator;
}

export fn tick(offset: usize) void {
    const circumstances_read = messages.GameCircumstances.fromBytes(_allocator, offset, host_reserve.HOST_RESERVE) catch {
        logErr("Could not parse GameCircumstances in host reserve");
        return;
    };
    var circumstances = circumstances_read.value;
    defer circumstances.deinit(_allocator);

    const move = _client_tick(circumstances);

    _ = messages.writeBytes(&move, 0, host_reserve.HOST_RESERVE, true);
}

pub extern fn getRandomInt(min: i32, max: i32) i32;
