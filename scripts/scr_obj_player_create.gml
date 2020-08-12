grv = 0.2;
vsp = 0.00;
hsp = 0.00;
walksp = 2.00;
jumpsp = 4; // I have put the values almost exactly so that 4 jumpsp == 4 Tiles long jump height;
move_dir = 0;
xprev = xstart;
yprev = ystart;
_friction = 0.125;
dash_sp = 0;
in_dash = false;
accel = 0;
momentum = 0;
jumped_in_dash = false;
img_xscale = image_xscale;
img_yscale = image_yscale;
anime_dir = 1;
depth = obj_floor.depth + 1;
// some of these variables are later updated
sprite_index = spr_player_sit;

// Detecting which controller is plugged in.
connected_gamepad = 0;
var i;
for (i=-1; i<=15; i++) {
    if gamepad_is_connected(i) {
        show_debug_message(string(i));
        connected_gamepad = i;
    }
}
