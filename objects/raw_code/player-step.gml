// Getting Input
// Controls
k_left	= keyboard_check(ord("A"))			||	keyboard_check(vk_left)				|| gamepad_button_check(0, gp_padl);
k_right = keyboard_check(ord("D"))			||	keyboard_check(vk_right)			|| gamepad_button_check(0, gp_padr);
k_jump	= keyboard_check_pressed(ord("W"))	||	keyboard_check_pressed(vk_space)	|| gamepad_button_check_pressed(0, gp_face1);
k_jump_rel=keyboard_check_released(ord("W"))||	keyboard_check_released(vk_space)	|| gamepad_button_check_released(0, gp_face1);

// Collisions
floor_below = place_meeting(x, y+1, obj_floor);

// Jump and Gravity

vsp += grv;

if k_jump and floor_below {
    
    vsp = 0;
    vsp = -4;
    
}

//  Horizontal Collision and Movement

if place_meeting(x+walksp*move_dir, y, obj_floor){
    
    while not place_meeting(x+sign(hsp), y, obj_floor){
    
        x += sign(hsp);
    
    }
    
    hsp = 0;

}

x += hsp;

//  Vertical Collision and Movement

if place_meeting(x, y+vsp, obj_floor){

    while not place_meeting(x, y+sign(vsp), obj_floor){
    
        y += sign(vsp);
    
    }
    
    vsp = 0;
    
}

y += vsp;

// Debug Controls and stuff

if keyboard_check(ord("R")) room_restart();