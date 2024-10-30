const std = @import("std");
const Allocator = std.mem.Allocator;

const config = @import("config");

const log = @import("wasmbot_client.zig").log;
const logErr = @import("wasmbot_client.zig").logErr;

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
