const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{ .default_target = .{
        .cpu_arch = .wasm32,
        .os_tag = .freestanding,
    } });

    const optimize = std.builtin.OptimizeMode.ReleaseSmall;

    const lib = b.addStaticLibrary(.{
        .name = "wasmbot_client",
        .root_source_file = b.path("src/wasmbot_client.zig"),
        .target = target,
        .optimize = optimize,
    });

    const bounds_check = b.option(bool, "bounds_checking", "Whether reads and writes to the reserve memory should do bounds checks before access") orelse true;

    const options = b.addOptions();
    options.addOption(bool, "bounds_checking", bounds_check);
    lib.root_module.addOptions("config", options);

    lib.rdynamic = true;

    //// wasm memory limits
    // lib.import_memory = true;
    // lib.initial_memory = 65536;
    // lib.max_memory = 1048576;
    // lib.stack_size = 1024;

    lib.entry = .disabled;

    b.installArtifact(lib);
}
