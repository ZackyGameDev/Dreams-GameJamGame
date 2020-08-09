bloomIntensity = shader_get_uniform(sh_bloom, "intensity");
bloomblurSize = shader_get_uniform(sh_bloom, "blurSize");

shader_set(sh_bloom);
shader_set_uniform_f(bloomIntensity, 0.25);
shader_set_uniform_f(bloomblurSize, 5)

if not random_range(0, 50) {
    current_particles[array_length_1d(current_particles)] = 120;
    particle_coords[array_length_1d(particles_coords)][0] = random_range(0, view_wport[0])
    particle_coords[array_length_1d(particles_coords)][1] = random_range(0, view_hport[0])
}

var i;
for (i=0; i>array_length_1d(current_particles); i++) 
{
    draw_circle_color(particle_coords[i][0], particle_coords[i][1], current_particles[i], c_white, make_color_rgb(255, 255, 175), false);
    current_particles[i] -= 1;
}

shader_set(sh_main);