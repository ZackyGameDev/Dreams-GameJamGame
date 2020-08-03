if instance_exists(obj_cam) {
   obj_cam.right_border = other.bbox_right - view_wview[0];
   obj_cam.left_border = other.bbox_left;
}
