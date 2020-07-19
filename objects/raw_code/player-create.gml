grv= 0.15;
vsp= 0.00;
hsp= 0.00;
walksp= 1.00;
jumpsp= 2.75;
img_xscale= 1.00;
img_yscale= 1.00;
anim_dir= 1.0;

/* GameMaker Studio 1.x has a funny compiler that calls the draw event 
before the step event, causing the input variables used in the draw 
event show up as undefined, since i set up input variables in step 
event, so i had to paste all the variables in here so that they didn't 
show up as undefined in the draw event, you might be saying "hey why 
don't you just call the variables in the draw event??" and to that I 
would just like to say...
...no...? */

// Controls
k_left	= keyboard_check(ord("A"))			||	keyboard_check(vk_left)				|| gamepad_button_check(0, gp_padl);
k_right = keyboard_check(ord("D"))			||	keyboard_check(vk_right)			|| gamepad_button_check(0, gp_padr);
k_jump	= keyboard_check_pressed(ord("W"))	||	keyboard_check_pressed(vk_space)	|| gamepad_button_check_pressed(0, gp_face1);
k_jump_rel=keyboard_check_released(ord("W"))||	keyboard_check_released(vk_space)	|| gamepad_button_check_released(0, gp_face1);

// Collisions
floor_below = place_meeting(x, y+1, obj_floor);