if instance_exists (obj_player) 
{
    if bbox_left < obj_player.x < bbox_right 
    {
        self.vsp = 1;
    }   
    if place_meeting (x, y, obj_player) 
    {
        scr_kill_player();
    }
}

y += vsp;
