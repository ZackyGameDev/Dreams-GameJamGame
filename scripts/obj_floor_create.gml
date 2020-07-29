/// Autotiling and Props Generation

image_speed = 0;

switch room {
    case rm_test:
        sprite_index = spr_tileset_stage1_1;
        spr_props = spr_props_stage1_1;
    break;
}

// Props
if !(place_meeting(x, y-1, obj_floor)) {
    if random_range(0, 20) == 0 {
        props = instance_create(x, y, obj_props);
        props.sprite_index = spr_props;
    }
}