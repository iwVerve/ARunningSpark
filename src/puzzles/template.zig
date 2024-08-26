const ray = @import("../raylib.zig");

pub const colors = .{
    .background = .{ .r = 40, .g = 240, .b = 80, .a = 255 },
    .foreground = .{ .r = 20, .g = 120, .b = 40, .a = 255 },
};
pub const exit = .{ .x = 0, .y = 0 };
pub const exit_direction = .right;

pub const tiles =
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
    \\................
;
pub const connections = &.{
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // ,
};
pub const buttons = &.{
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // \\................
    // ,
};
