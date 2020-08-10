if instance_exists (obj_player) 
{
    if (bbox_left < obj_player.x) && (obj_player.x < bbox_right) && (obj_player.y > y)
    {
        self.vsp = 1;
    }   
    if place_meeting (x, y, obj_player) 
    {
        scr_kill_player();
    }
}

switch place_meeting (x, y+1, obj_floor) // no point in using switch but i mean, why not?
{
    case true:
        image_speed = 0.4;
        vsp = 0;

        if self.image_index >= self.image_number - 1
        {
            instance_destroy();
        }
    break;

    case false:
        image_speed = 0;
        image_index = 0;
    break;

}

y += vsp;
