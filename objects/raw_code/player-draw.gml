/// Animation and Sprite Drawing

// Controls
// GameMaker Studio 1.x has a funny compiler and calls the draw function first so thats why i have moved my input taking to draw
k_left= keyboard_check(ord("A"))||keyboard_check(vk_left)|| gamepad_button_check(0, gp_padl);
k_right = keyboard_check(ord("D"))||keyboard_check(vk_right)|| gamepad_button_check(0, gp_padr);
k_jump= keyboard_check_pressed(ord("W"))||keyboard_check_pressed(vk_space)|| gamepad_button_check_pressed(0, gp_face1);
k_jump_rel=keyboard_check_released(ord("W"))||keyboard_check_released(vk_space)|| gamepad_button_check_released(0, gp_face1);
k_down = keyboard_check(ord("S")) || keyboard_check(vk_space)

// Collisions
floor_below = place_meeting(x, y+1, obj_floor); // As you know most of these functions return either true or false in the variables so that should make more sense now

// Acting according to the input obtained

move_dir = k_right - k_left;
if move_dir == 0 {

var gp_pad_sticklh = gamepad_axis_value(0, gp_axislh);

    if gp_pad_sticklh &gt; 0 move_dir = 1;
    else if gp_pad_sticklh &lt; 0 move_dir = -1;

}

hsp = hsp + (((hsp * sign(hsp) ^ 2) + walksp) / 10) * move_dir;
if sign(hsp) != sign(move_dir) hsp *= move_dir;
hsp = clamp(hsp, walksp * -1, walksp);

// Drawing Values for debuging

draw_text_transformed_color(
    5,
    5,
    "hsp: " + string(hsp),
    0.5,
    0.5,
    0,
    c_aqua,
    c_aqua,
    c_lime,
    c_lime,
    1
)

//  Animation
    
    // Squeesh Squash
    
    if sign(img_xscale) == -1 img_xscale *= -1;
    
    // On jump
    if k_jump and floor_below {
    
        self.img_xscale = 0.65;
        self.img_yscale = 1.20;
        
    }
    
    // On land
    if !place_meeting(xprevious, yprevious+1, obj_floor) and place_meeting(x, y+1, obj_floor) {
    
        self.img_yscale = 0.70;
        self.img_xscale = 1.20;
        
    }
    
    // Remoulding the Squeeshed Shape to normal
    if img_xscale &lt; 1 {
    
        img_xscale += 0.01;
        
        if floor_below and !k_jump {
        
            img_xscale = 1;
        
        }
    
    } else if img_xscale &gt; 1 {
        
        img_xscale -= 0.01;
        
    }
    
    if img_yscale &gt; 1{
    
        img_yscale -= 0.01;
    
    } else if img_yscale &lt; 1{
    
        img_yscale += 0.01;
    
    }
    
    if move_dir != 0 anim_dir = move_dir
    img_xscale *= anim_dir

draw_sprite_ext(spr_player, image_index, x, y, img_xscale, img_yscale, 0, c_white, 1);