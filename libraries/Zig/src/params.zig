const std = @import("std");

const host_reserve = @import("host_reserve.zig");

const log = @import("wasmbot_client.zig").log;
const logErr = @import("wasmbot_client.zig").logErr;

const GP_VERSION: u16 = 7;
const MAX_NAME_LEN: usize = 26;

pub const ClientSetupFn = fn (GameParameters) BotMetadata;
var _client_setup: *const ClientSetupFn = _clientSetupNoop;
fn _clientSetupNoop(gp: GameParameters) BotMetadata {
    _ = gp;
    return BotMetadata{
        .name = makeBotName("[INVALID]"),
        .version = [_]u16{ 0, 0, 0 },
        .ready = false,
    };
}

pub fn registerClientSetup(cb: *const ClientSetupFn) void {
    _client_setup = cb;
}

pub const GameParameters = extern struct {
    params_version: u16,
    engine_version: [3]u16,
};

pub const BotMetadata = extern struct {
    name: [MAX_NAME_LEN]u8,
    version: [3]u16,
    ready: bool,
};

pub fn makeBotName(name: []const u8) [MAX_NAME_LEN]u8 {
    var name_bytes: [MAX_NAME_LEN]u8 = [_]u8{0} ** 26;
    const name_len = @min(name.len, MAX_NAME_LEN);
    @memcpy(name_bytes[0..name_len], name[0..name_len]);
    return name_bytes;
}

export fn receiveGameParams(offset: usize, infoOffset: usize) bool {
    var local_offset = offset;
    var local_info_offset = infoOffset;
    const gp_version = host_reserve.readNumber(u16, local_offset);
    local_offset += @sizeOf(u16);
    if (gp_version != GP_VERSION) {
        var msg_buff: [128]u8 = undefined;
        const written = std.fmt.bufPrint(&msg_buff, "ERROR: Can't parse GameParams v{d}; only prepared for v{d}", .{ gp_version, GP_VERSION }) catch @panic("Buffer too small");
        logErr(written);
        return false;
    }

    var engVersion: [3]u16 = [_]u16{ 0, 0, 0 };
    engVersion[0] = host_reserve.readNumber(u16, local_offset);
    local_offset += @sizeOf(u16);
    engVersion[1] = host_reserve.readNumber(u16, local_offset);
    local_offset += @sizeOf(u16);
    engVersion[2] = host_reserve.readNumber(u16, local_offset);
    local_offset += @sizeOf(u16);

    const gp = GameParameters{
        .params_version = gp_version,
        .engine_version = engVersion,
    };

    const bot_data = _client_setup(gp);

    for (0..MAX_NAME_LEN) |i| {
        if (i < bot_data.name.len) {
            _ = host_reserve.writeNumber(u8, local_info_offset + i, bot_data.name[i]);
        } else {
            _ = host_reserve.writeNumber(u8, local_info_offset + i, 0);
        }
    }
    local_info_offset += MAX_NAME_LEN;
    for (bot_data.version) |ve| {
        local_info_offset = host_reserve.writeNumber(u16, local_info_offset, ve);
    }

    return bot_data.ready;
}
