if place_meeting(x, y, obj_player)
{
    switch image_angle 
    {
        case 0:
            obj_player.vsp = self.spring_strength;  // spring_strength is just a float type var which holds the speed which should be given to play when he lands on spring // spring_strength is just a float type var which holds the speed which should be given to play when he lands on spring
            obj_player.alarm[0] = 0;
            obj_player.momentum = 0;
            obj_player.in_dash = false;
            image_speed = 0.5;
        break;
        case -90:
            obj_player.vsp = self.spring_strength/2;  // spring_strength is just a float type var which holds the speed which should be given to play when he lands on spring // spring_strength is just a float type var which holds the speed which should be given to play when he lands on spring
            obj_player.alarm[0] = 0;
            obj_player.momentum = 0;
            obj_player.in_dash = false;
            image_speed = 0.5;
            obj_player.hsp = self.spring_strength;
        break;
        case 90:
            obj_player.vsp = self.spring_strength/2;  // spring_strength is just a float type var which holds the speed which should be given to play when he lands on spring // spring_strength is just a float type var which holds the speed which should be given to play when he lands on spring
            obj_player.alarm[0] = 0;
            obj_player.momentum = 0;
            obj_player.in_dash = false;
            image_speed = 0.5;
            obj_player.hsp = -self.spring_strength;
        break;
    }
}

if image_index = 0 
{
    image_index += 1;
}

if image_index >= image_number-1
{
    image_speed = 0;
    image_index = 1;
}
