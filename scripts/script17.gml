if instance_exists(obj_cam) {
   obj_cam.border_right = other.bbox_right - view_wview[0];
   obj_cam.border_left  = other.bbox_left;
}
