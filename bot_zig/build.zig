const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{ .default_target = .{
        .cpu_arch = .wasm32,
        .os_tag = .freestanding,
    } });

    const optimize = std.builtin.OptimizeMode.ReleaseSmall;

    const exe = b.addExecutable(.{
        .name = "bot_zig",
        .root_source_file = b.path("src/bot.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.rdynamic = true;

    //// wasm memory limits
    // exe.import_memory = true;
    // exe.initial_memory = 65536;
    // exe.max_memory = 1048576;
    // exe.stack_size = 1024;

    exe.entry = .disabled;

    b.installArtifact(exe);
}
