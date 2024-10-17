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

    const wc_module = b.createModule(.{
        .root_source_file = .{ .src_path = .{
            .owner = b,
            .sub_path = "../../libraries/Zig/src/wasmbot_client.zig",
        } },
    });

    const bounds_check = b.option(bool, "bounds_checking", "Whether reads and writes to the reserve memory should do bounds checks before access") orelse true;

    const options = b.addOptions();
    options.addOption(bool, "bounds_checking", bounds_check);
    wc_module.addOptions("config", options);

    exe.root_module.addImport("wasmbot_client", wc_module);

    exe.rdynamic = true;

    //// wasm memory limits
    // exe.import_memory = true;
    // exe.initial_memory = 65536;
    // exe.max_memory = 1048576;
    // exe.stack_size = 1024;

    exe.entry = .disabled;

    b.installArtifact(exe);
}
