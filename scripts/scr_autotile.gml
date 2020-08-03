var tile,iw,w_left,w_right,w_up,w_down,w_upleft,w_downleft,w_upright,w_downright;

iw          = sprite_width;
w_left      = place_meeting(x-iw,y,object_index);
w_right     = place_meeting(x+iw,y,object_index);
w_up        = place_meeting(x,y-iw,object_index);
w_down      = place_meeting(x,y+iw,object_index);

if not w_up {
    if w_right and w_left {
        image_index = 1;
    } else if w_right {
        image_index = 0;
    } else {
        image_index = 2;
    }
} else if w_down {
    if w_right and w_left {
        image_index = 4;
    } else if w_right {
        image_index = 3;
    } else {
        image_index = 5;
    }
} else {
    if w_right and w_left {
        image_index = 7;
    } else if w_right {
        image_index = 6;
    } else {
        image_index = 8;
    }
}

return image_index;
