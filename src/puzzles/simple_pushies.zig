const ray = @import("../raylib.zig");

pub const colors = .{
    .background = .{ .r = 0, .g = 255, .b = 198, .a = 255 },
    .foreground = .{ .r = 0, .g = 103, .b = 128, .a = 255 },
};
pub const exit = .{ .x = 7, .y = 5 };
pub const exit_direction = .right;

pub const tiles =
    \\########
    \\#.#....#
    \\#...##.#
    \\#P#....#
    \\#.##X#.#
    \\#.##....
    \\#.####.#
    \\#......#
    \\#.####.#
    \\#......#
    \\########
;
pub const connections = &.{
    \\........
    \\........
    \\.l-j....
    \\.|.L--X.
    \\.|......
    \\.|......
    \\.|......
    \\.X......
    \\........
    \\........
    \\........
    ,
};
pub const buttons = &.{
    \\.l-----j
    \\.B.....|
    \\.......|
    \\.......|
    \\.......|
    \\.......D
    \\........
    \\........
    \\........
    \\........
    \\........
    ,
};
