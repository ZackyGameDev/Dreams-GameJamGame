//view_xview = clamp (x - view_wview / 2, 0, room_width - view_wview[0]);
view_xview = x - view_wview / 2;
view_yview = y - view_hview / 2;

x += (current_rm_obj_x - x) / 10;
y += (current_rm_obj_y - y) / 10;
