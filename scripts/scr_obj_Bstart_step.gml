if instance_exists(obj_true_fade) {
    obj_true_fade.fadein = false;
    obj_true_fade.image_alpha = 0;
} else {
    room_goto_next();
}
