if place_meeting(x, y, obj_player)
{
    obj_player.vsp = self.spring_strength; // spring_strength is just a float type var which holds the speed which should be given to play when he lands on spring
    image_speed = 0.2;
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
