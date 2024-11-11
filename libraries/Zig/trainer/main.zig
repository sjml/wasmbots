const std = @import("std");
const harness = @import("harness.zig");

var global_allocator: std.mem.Allocator = undefined;

const CHATTY_SERVER = false;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    global_allocator = gpa.allocator();

    const addr = std.net.Address.parseIp4("127.0.0.1", 9090) catch |err| {
        std.debug.print("An error occurred while resolving the IP address: {}\n", .{err});
        return;
    };

    var server = try addr.listen(.{ .reuse_port = true });
    defer server.deinit();

    std.debug.print("Listening...\n\n", .{});
    start_server(&server);
}

fn start_server(server: *std.net.Server) void {
    while (true) {
        var connection = server.accept() catch |err| {
            std.debug.print("Connection to client interrupted: {}\n", .{err});
            continue;
        };
        defer connection.stream.close();

        var read_buffer: [2048]u8 = undefined;
        var http_server = std.http.Server.init(connection, &read_buffer);

        var request = http_server.receiveHead() catch |err| {
            std.debug.print("Could not read head: {}\n", .{err});
            continue;
        };
        handle_request(&request) catch |err| {
            std.debug.print("Could not handle request: {}", .{err});
            continue;
        };
    }
}

const SetupRequest = struct {
    reserve: usize,
};

const MemoryRequest = struct {
    offset: usize,
    mem: []u8,
};

const MemoryResult = struct {
    success: bool,
    mem: []u8,
};

fn parseMemoryRequest(json: []const u8) !MemoryRequest {
    const mem_msg_parse = std.json.parseFromSlice(MemoryRequest, global_allocator, json, .{}) catch {
        return error.ParseFailure;
    };
    defer mem_msg_parse.deinit();
    const mem_msg = mem_msg_parse.value;

    const decoder = std.base64.standard.Decoder;
    // should match reserve block size
    const content_len = decoder.calcSizeForSlice(mem_msg.mem) catch {
        return error.DecodeSizeFailure;
    };
    const mem_buffer = try global_allocator.alloc(u8, content_len);
    decoder.decode(mem_buffer, mem_msg.mem) catch {
        return error.DecodeFailure;
    };

    return .{
        .offset = mem_msg.offset,
        .mem = mem_buffer,
    };
}

fn encodeMemory(allocator: std.mem.Allocator, mem: []const u8) []u8 {
    const encoder = std.base64.standard.Encoder;
    const encoded_len = encoder.calcSize(mem.len);
    const mem_buffer = allocator.alloc(u8, encoded_len) catch unreachable;
    _ = encoder.encode(mem_buffer, mem);
    return mem_buffer;
}

fn handle_request(request: *std.http.Server.Request) !void {
    if (std.mem.eql(u8, request.head.target, "/setup")) {
        if (CHATTY_SERVER) {
            std.debug.print("/setup\n", .{});
        }
        var reader = try request.reader();
        const contents = try reader.readAllAlloc(global_allocator, 4096);
        defer global_allocator.free(contents);

        const setup_msg_parse = std.json.parseFromSlice(SetupRequest, global_allocator, contents, .{}) catch {
            std.debug.print("  <parse fail>\n", .{});
            try request.respond("Failed to parse setup message", .{
                .status = .bad_request,
            });
            return;
        };
        defer setup_msg_parse.deinit();
        const setup_msg = setup_msg_parse.value;

        const reserve_block = harness.simulateSetup(setup_msg.reserve);

        if (reserve_block.len == 0) {
            std.debug.print("  <reserve fail>\n", .{});
            try request.respond("Could not reserve requested block", .{
                .status = .internal_server_error,
            });
            return;
        }

        if (CHATTY_SERVER) {
            std.debug.print("  [SUCCESS!]\n", .{});
        }
        try request.respond(reserve_block, .{
            .extra_headers = &.{
                .{
                    .name = "Content-Type",
                    .value = "application/octet-stream",
                },
            },
        });
    } else if (std.mem.eql(u8, request.head.target, "/receiveGameParams")) {
        if (CHATTY_SERVER) {
            std.debug.print("/receiveGameParams\n", .{});
        }
        var reader = try request.reader();
        const contents = try reader.readAllAlloc(global_allocator, 4096);
        defer global_allocator.free(contents);

        const receive_params_msg = parseMemoryRequest(contents) catch {
            std.debug.print("  <decode fail>\n", .{});
            try request.respond("Failed to decode memory message", .{
                .status = .bad_request,
            });
            return;
        };
        defer global_allocator.free(receive_params_msg.mem);

        const receive_result = harness.simulateReceiveGameParams(receive_params_msg.mem, receive_params_msg.offset);

        const output = MemoryResult{
            .success = receive_result.success,
            .mem = encodeMemory(global_allocator, receive_result.mem),
        };
        defer global_allocator.free(output.mem);

        const return_json = std.json.stringifyAlloc(global_allocator, output, .{}) catch unreachable;
        defer global_allocator.free(return_json);

        if (CHATTY_SERVER) {
            std.debug.print("  [SUCCESS!]\n", .{});
        }

        try request.respond(return_json, .{
            .extra_headers = &.{
                .{
                    .name = "Content-Type",
                    .value = "application/json",
                },
            },
        });
    } else if (std.mem.eql(u8, request.head.target, "/tick")) {
        if (CHATTY_SERVER) {
            std.debug.print("/tick\n", .{});
        }
        var reader = try request.reader();
        const contents = try reader.readAllAlloc(global_allocator, 4096);
        defer global_allocator.free(contents);

        const tick_msg = parseMemoryRequest(contents) catch {
            std.debug.print("  <decode fail>\n", .{});
            try request.respond("Failed to decode memory message", .{
                .status = .bad_request,
            });
            return;
        };
        defer global_allocator.free(tick_msg.mem);

        // overwrites the reserve block with the incoming buffer
        const reserve_block = harness.simulateTick(tick_msg.mem, tick_msg.offset);
        // returned block contains the results of whatever the program did in the tick

        if (CHATTY_SERVER) {
            std.debug.print("  [SUCCESS!]\n", .{});
        }

        const output = MemoryResult{
            .success = true,
            .mem = encodeMemory(global_allocator, reserve_block),
        };
        defer global_allocator.free(output.mem);

        const return_json = std.json.stringifyAlloc(global_allocator, output, .{}) catch unreachable;
        defer global_allocator.free(return_json);

        try request.respond(return_json, .{
            .extra_headers = &.{
                .{
                    .name = "Content-Type",
                    .value = "application/json",
                },
            },
        });
    } else {
        // nothing
        try request.respond("nothing here!\n", .{
            .status = .not_found,
        });
    }
}
