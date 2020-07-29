window_set_caption('Dreams')
self.depth = 100;
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

/////////////////////////////////////////////////////////////////////////////
// Deciding which background to draw, this is later useful in the draw event

switch room {

    case rm_test: 
        backgrounds[0] = bg_clouds0;
        backgrounds[1] = bg_clouds1;
        backgrounds[2] = bg_clouds2;
        
        bg_scroll_amount[0] = 1/14;
        bg_scroll_amount[1] = 1/10;
        bg_scroll_amount[2] =  1/6;
        
    break;
    
    default: backgrounds = noone; break; // I later add a check in the draw event that only draws the background if the variable is not `noone`

}

var i;
for (i = 0; i < 5; i++) {
    background_scroll[i] = 0;
}

///////////////////////////////////////////////////////////////////////////////
