const ray = @import("../raylib.zig");

pub const colors = .{
    .background = .{ .r = 225, .g = 112, .b = 202, .a = 255 },
    .foreground = .{ .r = 123, .g = 48, .b = 108, .a = 255 },
};
pub const exit = .{ .x = 9, .y = 4 };
pub const exit_direction = .right;

pub const tiles =
    \\##########
    \\##...#...#
    \\P..W.#.W.#
    \\##...##.##
    \\#####..W..
    \\#..##.#.##
    \\#.W.#...##
    \\##..######
    \\##########
;
pub const connections = &.{
    \\..........
    \\..........
    \\...X---X..
    \\..........
    \\..........
    \\..........
    \\..........
    \\..........
    \\..........
    ,
    \\..........
    \\..........
    \\..........
    \\..........
    \\..l----X..
    \\..|.......
    \\..X.......
    \\..........
    \\..........
    ,
};
pub const buttons = &.{};
