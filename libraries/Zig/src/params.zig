const std = @import("std");

const host_reserve = @import("./host_reserve.zig");

const log = @import("./wasmbot_client.zig").log;
const logErr = @import("./wasmbot_client.zig").logErr;

const GP_VERSION: u16 = 7;
const MAX_NAME_LEN: usize = 26;

extern fn client_setup(params: GameParameters) BotMetadata;

pub const GameParameters = extern struct {
    paramsVersion: u16,
    engineVersion: [3]u16,
};

pub const BotMetadata = extern struct {
    name: [MAX_NAME_LEN]u8,
    botVersion: [3]u16,
    ready: bool,
};

pub fn makeBotName(name: []const u8) [MAX_NAME_LEN]u8 {
    var nameBytes: [MAX_NAME_LEN]u8 = [_]u8{0} ** 26;
    const nameLen = @min(name.len, MAX_NAME_LEN);
    @memcpy(nameBytes[0..nameLen], name[0..nameLen]);
    return nameBytes;
}

export fn receiveGameParams(offset: usize, infoOffset: usize) bool {
    var localOffset = offset;
    var localInfoOffset = infoOffset;
    const gpVersion = host_reserve.read_number(u16, localOffset);
    localOffset += @sizeOf(u16);
    if (gpVersion != GP_VERSION) {
        var msgBuff: [128]u8 = undefined;
        const written = std.fmt.bufPrint(&msgBuff, "ERROR: Can't parse GameParams v{d}; only prepared for v{d}", .{ gpVersion, GP_VERSION }) catch @panic("Buffer too small");
        logErr(written);
        return false;
    }

    var engVersion: [3]u16 = [_]u16{ 0, 0, 0 };
    engVersion[0] = host_reserve.read_number(u16, localOffset);
    localOffset += @sizeOf(u16);
    engVersion[1] = host_reserve.read_number(u16, localOffset);
    localOffset += @sizeOf(u16);
    engVersion[2] = host_reserve.read_number(u16, localOffset);
    localOffset += @sizeOf(u16);

    const gp = GameParameters{
        .paramsVersion = gpVersion,
        .engineVersion = engVersion,
    };

    const botData = client_setup(gp);

    for (0..MAX_NAME_LEN) |i| {
        if (i < botData.name.len) {
            _ = host_reserve.write_number(u8, localInfoOffset + i, botData.name[i]);
        } else {
            _ = host_reserve.write_number(u8, localInfoOffset + i, 0);
        }
    }
    localInfoOffset += MAX_NAME_LEN;
    for (botData.botVersion) |ve| {
        localInfoOffset = host_reserve.write_number(u16, localInfoOffset, ve);
    }

    return botData.ready;
}
