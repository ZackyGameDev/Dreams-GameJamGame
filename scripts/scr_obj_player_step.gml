/////////////////////////////////////////////////////////////////////////////////////////////
// Taking in input
k_left = keyboard_check(ord("A"))||keyboard_check(vk_left)|| gamepad_button_check(connected_gamepad, gp_padl);
k_right = keyboard_check(ord("D"))||keyboard_check(vk_right)|| gamepad_button_check(connected_gamepad, gp_padr);
k_down = keyboard_check(ord("S"))||keyboard_check(vk_down)|| gamepad_button_check(connected_gamepad, gp_padd);
k_jump= keyboard_check_pressed(vk_space)|| gamepad_button_check_pressed(connected_gamepad, gp_face1) || keyboard_check_pressed(ord("X"));
k_jump_rel=keyboard_check_released(ord("W"))||keyboard_check_released(vk_space)|| gamepad_button_check_released(connected_gamepad, gp_face1);
k_dash = (keyboard_check_pressed(vk_lshift) || (k_down && k_jump) || gamepad_button_check_pressed(connected_gamepad, gp_shoulderr) || gamepad_button_check_pressed(connected_gamepad, gp_shoulderrb) || keyboard_check_pressed(ord("Z"))) && self.in_dash == false
floor_below = place_meeting(x, y+1, obj_floor);
just_jumped = false;
/////////////////////////////////////////////////////////////////////////////////////////////
// music
if obj_global.audio_on
{
    switch sprite_index
    {
        case spr_player_sit:
            audio_master_gain(0.1);
        break;
        
        default:
            audio_master_gain(1);
        break;
    }
}    
/////////////////////////////////////////////////////////////////////////////////////////////
// The starting "Dont move if sitting" thing is here

if sprite_index = spr_player_sit 
{
    if k_jump sprite_index = spr_player_jump;
}

if sprite_index = spr_player_sit 
{
    return noone; // alternate to saying `return void;`
}

/////////////////////////////////////////////////////////////////////////////////////////////
// Movement Calculation
var move_dir = k_right - k_left;
if move_dir == 0  {
    move_dir = round(gamepad_axis_value(0, gp_axislh))
} 
if(!place_meeting(x,y,obj_crystal)){
    accel = clamp(accel + (walksp * move_dir)*0.3, -walksp, walksp);
}

// Jump and hyperdash
if not k_dash and k_jump and floor_below {

    if obj_global.audio_on audio_play_sound(snd_jump, 990, false);
    vsp = -jumpsp;
    just_jumped = true; // `just_jumped` is later used in squish squash section 

    if self.in_dash {

        self.momentum += dash_sp * sign(anime_dir) * 0.35 // Hyper Dash
        alarm[0] = 20;
        jumped_in_dash = true;
        instance_create(x, y, obj_player_dash_casting);

    }

// The Dash
} else if k_dash {
    
    if obj_global.audio_on audio_play_sound(snd_dash, 990, false)
    self.img_yscale = 0.70;
    self.img_xscale = 1.20;
    self.in_dash = true;
    dash_sp = walksp*1.7;
    alarm[0] = 40;
    alarm[1] = 0;
    momentum = dash_sp*sign(anime_dir);
    instance_create(x, y, obj_player_dash_casting);

}

if momentum != 0 {
    if alarm[1] < 0 alarm[1] = 5;
}

if (momentum == 0 or jumped_in_dash) and (!place_meeting(x,y,obj_crystal)) vsp += grv; else if !(jumped_in_dash) self.vsp = 0;
if (-0.15 < momentum && momentum < 0.15) momentum = 0; else momentum -= 0.15 * sign(momentum); // momentum worked in kinda funny way so friction is hard coded here
if (accel != 0) accel -= _friction * sign(accel);
if !(-0.5 < accel && accel < 0.5) hsp = int(momentum) + int(accel); else hsp = int(momentum);

// Fliping the player's sprite based on where it is facing 
if hsp != 0 self.img_xscale= sign(hsp);
/////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////
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
/////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////
// Animation

if floor_below {
   if self.hsp == 0 {
        image_speed = 0.075;
        sprite_index = spr_player_idle;
   } else {
        image_speed = 0.1;
        self.sprite_index = spr_player_run;
   }
} else {
    sprite_index = spr_player_jump;
    if (self.vsp < 0) image_index = 0; else image_index = 1;
}
// I should really get the sprites drawn but drawing with mouse is   t o r t u r e
// Update: I got the sprites done and yes, drawing with mouse is, in fact,  t o r t u r e
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
//  S   Q   U   I   S   H       S   Q   U   A   S   H              

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
if img_xscale < 1 {

    img_xscale += 0.01;

if floor_below and !k_jump {

    img_xscale = 1;

}

} else if img_xscale > 1 {

    img_xscale -= 0.01;

}

if img_yscale > 1{

    img_yscale -= 0.01;

} else if img_yscale < 1{

    img_yscale += 0.01;

}

if move_dir != 0 anime_dir = move_dir;
img_xscale *= anime_dir;

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//
/////////////////////////////////////////////////////////////////////////////////////////////
/*
                           +NMMMMMMMMMN+                                        
                        `/NMMMMMMMMMMMMMN+`                                     
                      `/d+ohMMMMMMMMMMMMMMm+`                                   
                      :MMMM`:hNMMMMMMMMMMMMM:                                   
                      :MMMM  osmMMdoo/+oooNM/                                   
                      :MMMM  dNMMMMNh `NNNMM/                                   
                      :MMMs  dMMMMMm+ `sMyNM/                                   
                      .oyymmmMd:yMMNmmmmy/+y-                                   
                      -y:sMMMM:.-sMMMMMM N/`                                    
                       -y`MMMMdmdmMMMMN: N.                                     
                        ` +mmmmmmmmmmdo  N.                                     
                           ss-+s:/s+-yd  N.    ```````                          
                :++---     sN-hN+oNy-Ns  N. `-/+ymdd+o```                       
               hNMMNo.      .`.-``-.`.   N./o//yds:o:dddd+:.                    
               yNMMMs       -`.`..`.`- -hd. .sds.`:ooooo:yddo.        .--.      
                dMMMmo.    .+`s:++/s.oyMm`.smm+`/hMMMMMMh/`-ymys.-yyyo///+/.    
       `.-ss+   /mMMMMm+.  ddoo+oo+oodm+`.dMy-/hNMMMMMMMMN+`-yMMNdm++.   `+s    
     `:ymNMN. +. /dNMMMMm+`-..........-`+mMy.:hMMMMMMMMMMMN+ -sso..      -:`    
     oNMMMNs `Nm+..+dMMMMMmm+/.``-///+mmMNh+.sMMMMMMMMMMMMM+                    
    oNMMMMd  dMMMm+..+dMMMMMMMmddmMMMMNddohN/+mMMMMMMMMMMMM+                    
    yMMMMMd  MMMMMMm+`:MN/MMMMMMMMNmhoohhMMM+`+NMMMMMMMMMMs.                    
    sNMMMMd  /MMMMMMMy-oNy/modNNy+syhMMMMMMMMo`.sNMMMMMNNo.                     
     sMMMMNo  +NMMMMMMmosm`oNyssshdooosMMMMMMMh: .osssss.                       
     `/dNMMN+  oNMMMMMMMmoo.NMMNNMNh+omMMMMMMMo` `odooos.                       
     :yy//yyy   omMMMMMMMMmmMMMMMMdosNsMMMMMd/`  .osmmo`                        
    .sy///       .-omMMMMMMMMMMMMMdoyMMMMdd/`    :MMMM`                         
  .sNMNo            ./ommmmmmmmmmmmmmd///        :MMMm`                         
 `mMMM+                    ``````                :MMM                           
 +Nyoooooooooooooooooo/    MMMMMMd:              :MMM                           
  `+ssdMMMMMMMMyssss/-++/  ````+s/               :MMM                           
      `........     +NMMMd  :do.                 -hMM                           
                    .--/dh  mMMm/                 -N-                           
         `.  ...   `./ys.   mMMM+                -hh                            
         :mo.mmmyssdNMMMh ` dNNN/                :d``                           
         .yNmss.+smMMMm+.oNo.````                :d`N                           
           `.yMNNNNMMy``+yyymNNNs//////          :d.M                           
              ..shhh+``/hmmmoooyhhhdMMN          :d.M                    .-     
                     :dd.dMMMMMmdddyoo-          :m:h                ---oms     
                     /MNs`/dmMMMMNmho+           -h:-yy`  `.....-yyyymNNMNo     
                     /MMm  ``/+++::hNd`          `:sNmo``+dNNNNNNMMMMMMNy:`     
                     /MNo         -hMMd          -mNM.`/dNMMMMMMMMNNNys:`       
                    .sMd           :MMN/         `.-y dMMMMMMMNyyy...           
                    +MMd           `+MMM:             hhNMMMMMNy:::             
                   /mMd- ---        `+MMM:              -:yddddddd:             
                   +NMh `///+s.      `+mMm. ::`            ```````              
             +.`````:o/  ```sN:        `o. `+do`                                
             .dmmms+////+mmmMy.    .:    `/hNMNo`                               
              -mMMmho-/osMMMM-   .oy- `::dNd/omNo                               
               -yNmhhysdddMMM-   .odhhdMMd/`.odmNo                              
                 yNh+/..-yMMM-     .oNMMMhysds-oMd`                             
                  sNMMMNNNMMM:       `+NMMMy-/dMMMh                             
                  `:hm+...sMMN:        `oNMMNMMMd+-ooooooooo:`                  
            ``//////yNmmmmmMMMs.         .mMMMMy-oNMMMMMMMMMNh:                 
          `/ddMMMMMMMMMMMMMMMMM/          mMMMMNmMMMMMMMMMMMMMd-                
         -dMMMMMMMMMMMMMMMMMMMM/          yNMMMMMMMMMMMMMMMMMMMd                
         -NMMMMMMMMMMMMMMNN////.           hNNNNNNMMMMMMMMMMMMMh                
          `+++++++++++++/                        .++++++++++++:
