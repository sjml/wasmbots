const std = @import("std");

pub fn build(b: *std.Build) void {
    const trainer = b.option(bool, "trainer", "Build the native trainer program instead of the WebAssembly") orelse false;
    const options = b.addOptions();
    options.addOption(bool, "building_wasm", !trainer);

    var target: std.Build.ResolvedTarget = undefined;
    var optimize: std.builtin.OptimizeMode = undefined;
    var exe: *std.Build.Step.Compile = undefined;

    const wc_module = b.createModule(.{
        .root_source_file = .{ .src_path = .{
            .owner = b,
            .sub_path = "./lib/wasmbot_client/src/lib.zig",
        } },
    });

    if (!trainer) {
        target = b.standardTargetOptions(.{ .default_target = .{
            .cpu_arch = .wasm32,
            .os_tag = .freestanding,
        } });
        optimize = std.builtin.OptimizeMode.ReleaseSmall;
        exe = b.addExecutable(.{
            .name = "explorer",
            .root_source_file = b.path("src/bot.zig"),
            .target = target,
            .optimize = optimize,
        });
        exe.rdynamic = true;
        exe.entry = .disabled;

        exe.root_module.addImport("wasmbot_client", wc_module);
        exe.root_module.addOptions("config", options);

        //// wasm memory limits
        // exe.import_memory = true;
        // exe.initial_memory = 65536;
        // exe.max_memory = 1048576;
        // exe.stack_size = 1024;
    } else {
        target = b.standardTargetOptions(.{});
        optimize = b.standardOptimizeOption(.{});

        exe = b.addExecutable(.{
            .name = "explorer-trainer",
            .root_source_file = b.path("./lib/trainer/src/main.zig"),
            .target = target,
            .optimize = optimize,
        });

        const bot_lib = b.addStaticLibrary(.{
            .name = "bot_lib",
            .root_source_file = b.path("./src/bot.zig"),
            .target = target,
            .optimize = optimize,
        });
        bot_lib.root_module.addImport("wasmbot_client", wc_module);
        bot_lib.root_module.addOptions("config", options);

        exe.linkLibrary(bot_lib);

        const run_cmd = b.addRunArtifact(exe);
        run_cmd.step.dependOn(b.getInstallStep());
        if (b.args) |args| {
            run_cmd.addArgs(args);
        }

        const run_step = b.step("run", "Run the trainer");
        run_step.dependOn(&run_cmd.step);
    }

    b.installArtifact(exe);
}
