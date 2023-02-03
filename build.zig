const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const module = b.addModule(.{
        .name = "cf",
        .source_file = .{ .path = "cf.zig" },
    });

    // We do not have an example of using the zig module yet.
    _ = module;

    const lib = b.addStaticLibrary(.{
        .name = "cf",
        .root_source_file = .{ .path = "cf.zig" },
        .optimize = optimize,
        .target = target,
    });
    lib.install();

    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = "cf.zig" },
        .optimize = optimize,
        .target = target,
    });

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
