r = shader_get_uniform(sh_solid_color, "red");
g = shader_get_uniform(sh_solid_color, "green");
b = shader_get_uniform(sh_solid_color, "blue");
shader_set(sh_solid_color)
shader_set_uniform_f(r, 1);
shader_set_uniform_f(g, 1);
shader_set_uniform_f(b, 1);
draw_self()
shader_set(sh_main);

speed = 0.1;
direction -= 3;