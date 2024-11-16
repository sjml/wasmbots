const std = @import("std");
const Allocator = std.mem.Allocator;

pub const messages = @import("wasmbot_messages.zig");

const MAX_NAME_LEN: usize = 26;
const GP_VERSION: u16 = 7;

extern fn logFunction(logLevel: i32, msgPtr: usize, msgLen: usize) void;
pub fn log(msg: []const u8) void {
    logFunction(2, @intFromPtr(msg.ptr), msg.len);
}

pub fn logErr(msg: []const u8) void {
    logFunction(0, @intFromPtr(msg.ptr), msg.len);
}

pub fn logFmt(comptime fmtMsg: []const u8, args: anytype) void {
    const msg = std.fmt.allocPrint(global_allocator, fmtMsg, args) catch @panic("Couldn't allocate memory for logging");
    defer global_allocator.free(msg);
    log(msg);
}

pub fn logErrFmt(comptime fmtMsg: []const u8, args: anytype) void {
    const msg = std.fmt.allocPrint(global_allocator, fmtMsg, args) catch @panic("Couldn't allocate memory for logging");
    defer global_allocator.free(msg);
    logErr(msg);
}

pub const BotMetadata = extern struct {
    name: [MAX_NAME_LEN]u8,
    version: [3]u16,
};

pub fn makeBotName(name: []const u8) [MAX_NAME_LEN]u8 {
    var name_bytes: [MAX_NAME_LEN]u8 = [_]u8{0} ** 26;
    const name_len = @min(name.len, MAX_NAME_LEN);
    @memcpy(name_bytes[0..name_len], name[0..name_len]);
    return name_bytes;
}

pub const ClientSetupFn = fn () BotMetadata;
var _client_setup: *const ClientSetupFn = _clientSetupNoop;
fn _clientSetupNoop() BotMetadata {
    return BotMetadata{
        .name = makeBotName("[INVALID]"),
        .version = [_]u16{ 0, 0, 0 },
    };
}

pub fn registerClientSetup(cb: *const ClientSetupFn) void {
    _client_setup = cb;
}

export fn setup(requestReserve: usize) usize {
    if (!reserveMemory(requestReserve)) {
        return 0;
    }

    const bot_data = _client_setup();

    var offset: usize = 0;
    for (0..MAX_NAME_LEN) |i| {
        if (i < bot_data.name.len) {
            _ = messages.writeNumber(u8, offset + i, HOST_RESERVE, bot_data.name[i]);
        } else {
            _ = messages.writeNumber(u8, offset + i, HOST_RESERVE, 0);
        }
    }
    offset += MAX_NAME_LEN;
    for (bot_data.version) |ve| {
        offset += messages.writeNumber(u16, offset, HOST_RESERVE, ve);
    }

    return @intFromPtr(HOST_RESERVE.ptr);
}

pub const TickFn = fn (messages.PresentCircumstances) messages.Message;
var _client_tick: *const TickFn = _clienTickNoop;
fn _clienTickNoop(_: messages.PresentCircumstances) messages.Message {
    return messages.Message{ ._Error = messages._Error{ .description = "No client tick function registered" } };
}

pub fn registerTickCallback(cb: *const TickFn) void {
    _client_tick = cb;
}

pub var global_allocator: Allocator = undefined;
pub fn setAllocator(allocator: Allocator) void {
    global_allocator = allocator;
}

export fn tick(offset: usize) void {
    const circumstances_read = messages.PresentCircumstances.fromBytes(global_allocator, offset, HOST_RESERVE) catch {
        logErr("Could not parse PresentCircumstances in host reserve");
        return;
    };
    var circumstances = circumstances_read.value;
    defer circumstances.deinit(global_allocator);

    const move = _client_tick(circumstances);

    _ = messages.writeBytes(&move, 0, HOST_RESERVE, true);
}

pub extern fn getRandomInt(min: i32, max: i32) i32;

pub const ClientReceiveGameParamsFn = fn (messages.InitialParameters) bool;
var _client_receive_game_params: *const ClientReceiveGameParamsFn = _clientReceiveNoop;
fn _clientReceiveNoop(params: messages.InitialParameters) bool {
    _ = params;
    logErr("no clientReceiveGameParamsFn set!");
    return false;
}

pub fn registerClientReceiveGameParams(cb: *const ClientReceiveGameParamsFn) void {
    _client_receive_game_params = cb;
}

export fn receiveGameParams(offset: usize) bool {
    var local_offset = offset;

    const initParamsRead = messages.InitialParameters.fromBytes(local_offset, HOST_RESERVE) catch @panic("Could not read from reserve memory");
    const initParams = initParamsRead.value;
    local_offset += initParamsRead.bytes_read;

    if (initParams.paramsVersion != GP_VERSION) {
        var msg_buff: [128]u8 = undefined;
        const written = std.fmt.bufPrint(&msg_buff, "ERROR: Can't parse GameParams v{d}; only prepared for v{d}", .{ initParams.paramsVersion, GP_VERSION }) catch @panic("Buffer too small");
        logErr(written);
        return false;
    }

    return _client_receive_game_params(initParams);
}

pub var HOST_RESERVE: []u8 = undefined;

pub fn reserveMemory(request: usize) bool {
    if (HOST_RESERVE.len > 0) {
        logErr("CLIENT ERROR: Attempting to reserve memory twice");
        return false;
    }

    HOST_RESERVE = global_allocator.alloc(u8, request) catch {
        logErr("CLIENT ERROR: Could not allocate reserve memory");
        return false;
    };

    return true;
}
