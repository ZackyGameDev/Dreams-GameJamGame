





// not possible with outdated GML of GM:S 1.x im giving up on this idea







/*
var wave_list_size = ds_list_size(list_of_waves);

if (wave_list_size <= 0) {
    draw_surface(application_surface, 0, 0);
} else {
    var fx_strength     = slider_get_value(1) * 0.2 - 0.1;
    var aberration      = slider_get_value(2) * 2 - 1;
    var subimage        = toggle_get_group_active(2);

    if (!surface_exists(srf_waves)) {
        srf_waves = surface_create(view_w * srf_waves_scale, view_h * srf_waves_scale);
        tex_waves = surface_get_texture(srf_waves);
    }
    
    gpu_set_texfilter(true);
    
    surface_set_target(srf_waves);
        draw_clear_alpha($FF7F7F, 1);
        gpu_set_blendmode_ext(bm_dest_color, bm_src_color);
        shader_set(shd_add_normals);
        
        var w, this_wave;
        //var wave_list_size = ds_list_size(list_of_waves);
        for (w = 0; w < wave_list_size; w++) {
            this_wave = list_of_waves[|w];
            draw_sprite_ext(sprite, subimage,
                            (this_wave[|waveparam.xx] - camera_get_view_x(view_camera[0])) * srf_waves_scale,
                            (this_wave[|waveparam.yy] - camera_get_view_y(view_camera[0])) * srf_waves_scale,
                            this_wave[|waveparam.scale] * srf_waves_scale,
                            this_wave[|waveparam.scale] * srf_waves_scale,
                            0, c_white, this_wave[|waveparam.alpha]);
        }
        
        shader_reset();
        gpu_set_blendmode(bm_normal);
    surface_reset_target();
    
    shader_set(shader);
        shader_set_uniform_f(u_fx_strength, fx_strength);
        shader_set_uniform_f(u_aspect, aspect);
        shader_set_uniform_f(u_aberration, aberration);
        texture_set_stage(u_tex_waves, tex_waves);
        draw_surface(application_surface, 0, 0);
    shader_reset();
    
    gpu_set_texfilter(false);
    
    switch (toggle_get_group_active(1)) {
        case 0: break;
        case 1: draw_surface_ext(srf_waves, 0, 0, 1 / srf_waves_scale, 1 / srf_waves_scale, 0, c_white, 0.8); break;
        case 2: draw_surface_ext(srf_waves, 0, 0, 1, 1, 0, c_white, 1);
    }
    
    if (toggle_get_state(3, 0)) {
        var txt1 = "wave:\nage:\nscale:\nalpha: ";
        var txt2;
        
        draw_text(10, 10, "waves: " + string(wave_list_size));
        for (w = 0; w < wave_list_size; w++) {
            this_wave = list_of_waves[|w];
            txt2 =  string_format(w,                              0, 0) + "\n" +
                    string_format(this_wave[|waveparam.age],      0, 0) + "\n" + 
                    string_format(this_wave[|waveparam.scale],    0, 1) + "\n" +
                    string_format(this_wave[|waveparam.alpha],    0, 2);
            draw_text(10 + w * 120,      40, txt1);
            draw_text(10 + w * 120 + 60, 40, txt2);
        }
    }
}

// not possible with outdated GML of GM:S 1.x im giving up on this idea
