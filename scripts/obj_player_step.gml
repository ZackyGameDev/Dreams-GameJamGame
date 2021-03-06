k_left = keyboard_check(ord("A"))||keyboard_check(vk_left)|| gamepad_button_check(0, gp_padl);
k_right = keyboard_check(ord("D"))||keyboard_check(vk_right)|| gamepad_button_check(0, gp_padr);
k_down = keyboard_check(ord("S"))||keyboard_check(vk_down)|| gamepad_button_check(0, gp_padd);
k_jump= keyboard_check_pressed(ord("W"))||keyboard_check_pressed(vk_space)|| gamepad_button_check_pressed(0, gp_face1);
k_jump_rel=keyboard_check_released(ord("W"))||keyboard_check_released(vk_space)|| gamepad_button_check_released(0, gp_face1);
k_dash = (keyboard_check_pressed(vk_lshift) || (k_down && k_jump) || gamepad_button_check_pressed(0, gp_shoulderr) || gamepad_button_check_pressed(0, gp_shoulderrb)) && self.in_dash == false
floor_below = place_meeting(x, y+1, obj_floor);
just_jumped = false;

// Movement Calculation
var move_dir = k_right - k_left;
if move_dir == 0  {
    move_dir = round(gamepad_axis_value(0, gp_axislh))
} 
accel = clamp(accel + (walksp * move_dir)*0.3, -walksp, walksp);

if not k_dash and k_jump and floor_below {

    vsp = 0;
    vsp = -jumpsp;
    just_jumped = true; // `just_jumped` is later used in squish squash section (currently removed)

    if self.in_dash {

        self.momentum += dash_sp * sign(image_xscale) * 0.35 // Hyper Dash
        alarm[0] = 20;
        jumped_in_dash = true;

    }
    
} else if k_dash {
    
    self.in_dash = true;
    dash_sp = walksp*1.7;
    alarm[0] = 40;
    momentum = (dash_sp*sign(image_xscale))*1.25;

}

if (momentum == 0 or jumped_in_dash) vsp += grv; else if !(jumped_in_dash) self.vsp = 0;
if (-0.15 < momentum && momentum < 0.15) momentum = 0; else momentum -= 0.15 * sign(momentum); // momentum worked in kinda funny way so friction is hard coded here
if (accel != 0) accel -= _friction * sign(accel);
if !(-0.5 < accel && accel < 0.5) hsp = int(momentum) + int(accel); else hsp = int(momentum);

//  Checking for collision and then moving as per the calculated movement
if place_meeting(x+hsp, y, obj_floor){

    while !place_meeting(x+sign(hsp), y, obj_floor){
    
        x += sign(hsp);
        
    }
    
    hsp = 0;
    momentum = 0;
    accel = 0;
    in_dash = false;
    
}

xprev = x; // xprev and yprev are used for checking if the player was in collision in the previous frame, this will be usefull at multiple places
x = x + hsp;

if place_meeting(x, y+vsp, obj_floor){

    while not place_meeting(x, y+sign(vsp), obj_floor){
    
        y += sign(vsp);
        
    }
    
    vsp = 0;
    jumped_in_dash = false;
    
}

yprev = y;
y += vsp;

// I have currently yeeted Animation code since the sprites aren't ready yet
/*
if floor_below {
   if self.hsp == 0 {
        sprite_index = spr_player_idle;
   } else {
        self.sprite_index = spr_player_run;
   }
} else {
    if self.vsp < 0 {
        self.sprite_index = spr_player_jump;
    } else {
        self.sprite_index = spr_player_fall;
    }
}
*/

if hsp != 0 self.image_xscale= sign(hsp)
