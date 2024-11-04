// simulates the same kind of setup that the host would do if running compiled WebAssembly

const std = @import("std");
const client = @import("wasmbot_client");

const stdout = std.io.getStdOut().writer();
const stderr = std.io.getStdErr().writer();
var rng = std.rand.DefaultPrng.init(0);

export fn logFunction(logLevel: i32, msgPtr: usize, msgLen: usize) void {
    const str = liftString(msgPtr, msgLen);
    if (logLevel == 0) {
        stderr.writeAll(str) catch @panic("Couldn't write to console?!");
    } else {
        stdout.writeAll(str) catch @panic("Couldn't write to console?!");
    }
}

export fn getRandomInt(min: i32, max: i32) i32 {
    return rng.random().intRangeLessThan(i32, min, max);
}

pub fn liftString(offset: usize, len: usize) []const u8 {
    const ptr: [*]const u8 = @ptrFromInt(offset);
    return ptr[0..len];
}

extern fn clientInitialize() void;
extern fn setup(usize) usize;

pub fn simulateSetup() []u8 {
    clientInitialize();
    const reserveOffset = setup(2048);
    if (reserveOffset == 0) {
        return &[0]u8{};
    }
    const reservePtr: [*]u8 = @ptrFromInt(reserveOffset);
    return reservePtr[0..2048];
}
