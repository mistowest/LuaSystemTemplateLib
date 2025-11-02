const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Criar biblioteca compartilhada para Lua
    const lib = b.addSharedLibrary(.{
        .name = "zigmodule",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Link com LuaJIT
    lib.linkSystemLibrary("luajit-5.1");
    lib.linkLibC();

    // Instalar o .so
    const install_lib = b.addInstallArtifact(lib, .{});

    // Step de build
    const build_step = b.step("lib", "Build Lua module");
    build_step.dependOn(&install_lib.step);

    // Comando de teste (executar Lua)
    const test_cmd = b.addSystemCommand(&[_][]const u8{
        "luajit",
        "test.lua",
    });
    test_cmd.step.dependOn(&install_lib.step);

    const test_step = b.step("test", "Test with LuaJIT");
    test_step.dependOn(&test_cmd.step);

    // Build padrão instala a biblioteca
    b.getInstallStep().dependOn(&install_lib.step);
}
