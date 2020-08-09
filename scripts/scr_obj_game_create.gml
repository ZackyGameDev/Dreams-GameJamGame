////////////////////////////////////////////////////////////////////////////
// Resizing Window to fit on screen
var win_x, win_y, win_w, win_h;

if (os_browser != browser_not_a_browser) {

    win_w = (display_get_height()/10)*16;
    win_h = (display_get_height()/10)*9;
    win_x = display_get_width()/2 - win_w/2
    win_y = display_get_height()/2 - win_h/2;

} else {

    win_w = display_get_width()/1.5;
    win_h = display_get_height()/1.5;
    win_x = display_get_width()/2 - win_w/2
    win_y = display_get_height()/2 - win_h/2;

}

window_set_size(win_w, win_h)
window_set_position(win_x, win_y);

if room == rm_start {
    return noone;
}

////////////////////////////////////////////////////////////////////////////
// Standard setup
random_set_seed(room);

window_set_caption('Dreams')
self.depth = 100;
Dlimit = 1;
PLcCR = 0;
if (!instance_exists(obj_TextS)){
        instance_create(0,0,obj_TextS);
}
if (!instance_exists(obj_cam)){
    instance_create(0,0,obj_cam);
}
if (!instance_exists(obj_fade)){
    obj_fade.check = 0;
    instance_create(0,0,obj_fade);
}

////////////////////////////////////////////////////////////////////////////
// Creating the obj_foor tiles on the room borders because i am too lazy to do it by hand
if room != rm_start && room != rm_D1 && room != rm_D2 {
    var rw, rh, i;

    rw = room_width;
    rh = room_height;

    while rw%8 != 0 { rw-- }
    while rh%8 != 0 { rh-- }

    for(i=0; i<=rw/8; i++) { instance_create(i*8, rh, obj_floor); instance_create(i*8, 0, obj_floor); } // Bottom and top Border
    for(i=0; i<=rh/8; i++) { instance_create(rw, i*8, obj_floor); instance_create(0, i*8, obj_floor); } // Right and left Border
}

/////////////////////////////////////////////////////////////////////////////
// Deciding which background to draw, this is later useful in the draw event

switch room {

    case rm_one: 
        backgrounds[0] = bg_clouds0;
        backgrounds[1] = bg_clouds1;
        backgrounds[2] = bg_clouds2;
        
        bg_scroll_amount[0] = 1/14;
        bg_scroll_amount[1] = 1/10;
        bg_scroll_amount[2] =  1/6;
        
    break;
    
    default: backgrounds[0] = noone; break; // I later add a check in the draw event that only draws the background if the variable is not `noone`

}

var i;
for (i = 0; i < 5; i++) {
    background_scroll[i] = 0;
}

///////////////////////////////////////////////////////////////////////////////
