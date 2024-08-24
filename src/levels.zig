const std = @import("std");

const ArrayList = std.ArrayList;

const ray = @import("raylib.zig");
const TileMap = @import("TileMap.zig");
const Tile = @import("Tile.zig");
const config = @import("config.zig");
const Object = @import("Object.zig");
const util = @import("util.zig");

const UVector2 = util.UVector2;

pub const test1 = parse(.{
    .tiles =
    \\#########
    \\#P......#
    \\#.X.....#
    \\#.......#
    \\#.......#
    \\#.......#
    \\#########
    ,
    .colors = .{},
});

const LevelDefition = struct {
    tiles: []const u8,
    colors: TileMap.Prototype.Colors = .{},
};

fn parse(comptime level: LevelDefition) TileMap.Prototype {
    var current_width: usize = 0;
    var first_row = true;
    var width: usize = 0;
    var height: usize = 0;

    var tiles: []const []const Tile = &.{};
    var tile_row: []const Tile = &.{};
    var objects: []const Object.Prototype = &.{};

    for (level.tiles) |char| {
        if (char == '\n') {
            if (first_row) {
                width = current_width;
                first_row = false;
            } else {
                if (current_width != width) {
                    @compileError(std.fmt.comptimePrint("Level definition not uniformally wide:\n{s}\n", .{level.tiles}));
                }
            }

            tiles = tiles ++ .{tile_row};
            tile_row = &.{};

            height += 1;
            current_width = 0;
        } else {
            const tile: Tile = if (char == '#') .{ .wall = true } else .{ .wall = false };

            blk: {
                const object: Object.Prototype = .{
                    .object_type = switch (char) {
                        'P' => .player,
                        'X' => .block,
                        else => break :blk,
                    },
                    .board_position = .{ .x = current_width, .y = height },
                };
                objects = objects ++ .{object};
            }

            tile_row = tile_row ++ .{tile};
            current_width += 1;
        }
    }
    tiles = tiles ++ .{tile_row};
    height += 1;

    const options: TileMap.Options = .{
        .width = width,
        .height = height,
    };

    const width_px: comptime_float = @floatFromInt(config.tile_size * width);
    const height_px: comptime_float = @floatFromInt(config.tile_size * height);
    const ratio = config.resolution.width / config.resolution.height;

    const camera_data = blk: {
        if (ratio * height_px > width_px) {
            const zoom = @as(f32, @floatFromInt(config.resolution.width)) / width_px;
            break :blk .{
                .target = .{
                    .x = 0,
                    .y = -(config.resolution.height / zoom - height_px) / 2,
                },
                .zoom = zoom,
            };
        } else {
            const zoom = @as(f32, @floatFromInt(config.resolution.height)) / height_px;
            break :blk .{
                .target = .{
                    .x = -(config.resolution.width / zoom - width_px) / 2,
                    .y = 0,
                },
                .zoom = zoom,
            };
        }
    };

    const camera: ray.Camera2D = .{
        .target = camera_data.target,
        .offset = .{ .x = 0, .y = 0 },
        .zoom = camera_data.zoom,
        .rotation = 0,
    };

    return .{
        .options = options,
        .tiles = tiles,
        .camera = camera,
        .objects = objects,
        .colors = level.colors,
    };
}
