/// Autotiling and Props Generation

image_speed = 0;

switch room {
    case rm_test:
        sprite_index = spr_tileset_stage1_1;
        spr_props = spr_props_stage1_1;
    break;
}

// Auto tiling
alarm[0] = random_range(5, 250); // no real reason to keep it random except for funzies

// Props
if !place_meeting(x, y-sprite_width, obj_floor) {
    if !random_range(0, 5) {
        instance_create(x, y, obj_props);
    }
}
