if toggle == 0 {   
    image_speed = 0;
    image_index = 1;
    toggle = 1;
    obj_global.audio_on = false;
}
else {
    image_speed = 0;
    image_index = 0;
    toggle = 0;
    obj_global.audio_on = true;
    audio_master_gain(1);
}
