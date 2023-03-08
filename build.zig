const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("zig-playground", "src/tar.zig");
    lib.setBuildMode(mode);
    lib.install();

    const tar_tests = b.addTest("src/tar.zig");
    tar_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run tar tests");
    test_step.dependOn(&tar_tests.step);
}
