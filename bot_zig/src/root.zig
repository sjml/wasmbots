extern fn logFunction(msgPtr: usize, msgLen: usize) void;

export fn run() void {
    const msg = "Zig -> wasm reporting!";
    logFunction(@intFromPtr(msg.ptr), msg.len);
}
