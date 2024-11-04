const std = @import("std");
const harness = @import("harness.zig");
const net = std.net;
const http = std.http;

pub fn main() !void {
    // const addr = net.Address.parseIp4("127.0.0.1", 9090) catch |err| {
    //     std.debug.print("An error occurred while resolving the IP address: {}\n", .{err});
    //     return;
    // };

    const reserve_block = harness.simulateSetup();
    const bot_name = harness.liftString(@intFromPtr(reserve_block.ptr), 26);
    std.debug.print("program name is '{s}'\n", .{bot_name});

    // var server = try addr.listen(.{});

    // start_server(&server);
}

// fn start_server(server: *net.Server) void {
//     while (true) {
//         var connection = server.accept() catch |err| {
//             std.debug.print("Connection to client interrupted: {}\n", .{err});
//             continue;
//         };
//         defer connection.stream.close();

//         var read_buffer: [1024]u8 = undefined;
//         var http_server = http.Server.init(connection, &read_buffer);

//         var request = http_server.receiveHead() catch |err| {
//             std.debug.print("Could not read head: {}\n", .{err});
//             continue;
//         };
//         handle_request(&request) catch |err| {
//             std.debug.print("Could not handle request: {}", .{err});
//             continue;
//         };
//     }
// }

// fn handle_request(request: *http.Server.Request) !void {
//     std.debug.print("Handling request for {s}\n", .{request.head.target});
//     try request.respond("Hello http!\n", .{});
// }
