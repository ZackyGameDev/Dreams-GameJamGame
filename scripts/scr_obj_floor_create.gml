/// Autotiling and Props Generation

image_speed = 0;

switch room {
    case rm_one:
        sprite_index = spr_tileset_stage1_1;
        spr_props = spr_props_stage1_1;
    case rm_two:
        sprite_index = spr_tileset_stage1_1;
        spr_props = spr_props_stage1_1;
    case rm_three:
        sprite_index = spr_tileset_stage1_1;
        spr_props = spr_props_stage1_1;
    break;
}

// Auto tiling
alarm[0] = 5; // I have to wait for obj_game to draw the border tiles before I decide to AUTOTILE

// Props
if !place_meeting(x, y-sprite_width, obj_floor) {
    if !random_range(0, 5) {
        instance_create(x, y, obj_props);
    }
}
