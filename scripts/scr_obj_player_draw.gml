// If I change the self.image_xscale and let
// GameMaker: Studio Draw the player itself, 
// Then it flips the sprite, but the collision
// Mask of this object, a.k.a. obj_player as 
// Well, and that was causing some awkward 
// moments which made the player to simply 
// get stuck in the wall for a reason that is 
// too long for me to type into this already 
// too long comment. Forgive me Convention Gods
// for I just made an extra long comment
// Well not really because 
// 1. There are no real convention gods {duh.}
// 2. I like turtles
// anyway
// you know I am kinda confused about what I should add
// to the game now. Like seriously, what should I?
// man here i go again

draw_sprite_ext(sprite_index, image_index, x, y, round(img_xscale), image_yscale, image_angle, c_white, image_alpha);