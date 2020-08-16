repeat(10){
    instance_create(x+random_range(-10, 10), y+random_range(-3, 3), obj_buttonbg2);
}
with(obj_buttonbg2){
    image_speed = 0.2;
}
speed = 0.01;
direction += 3;
toggle = 0
image_speed = 0;

