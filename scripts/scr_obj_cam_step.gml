view_xview = clamp (x - view_wview / 2, 0, room_width - view_wview[0]);
view_yview = clamp (y - view_hview / 2, 0, room_height- view_hview[0]);

x += (obj_player.x - x) / 10;
y += (obj_player.y - y) / 10;
