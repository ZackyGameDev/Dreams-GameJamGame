bloomIntensity = shader_get_uniform(sh_bloom, "intensity");
bloomblurSize = shader_get_uniform(sh_bloom, "blurSize");

//shader_set(sh_bloom);
//shader_set_uniform_f(bloomIntensity, 0.25);
//shader_set_uniform_f(bloomblurSize, 5)

if not random_range(0, 125)
{
    if not current_particles[0] = -1
    {
        current_particles[array_length_1d(current_particles)] = 120; 
        particles_coords_x[array_length_1d(current_particles)] = random_range(0, view_wport);
        particles_coords_y[array_length_1d(current_particles)] = random_range(0, view_hport);
    }
    else
    {
        current_particles[0] = 120;
        particles_coords_x[0] = random_range(0, view_wport);
        particles_coords_y[0] = random_range(0, view_hport);
    }
}

var i=0;
while(i<array_length_1d(current_particles))
{
    draw_circle_color(particles_coords_x[i], particles_coords_y[i], current_particles[i], c_white, make_color_rgb(0, 0, 175/2), false);
    current_particles[i] = clamp(current_particles[i]-1, 0, 999);
    i++;
}

shader_set(sh_main);