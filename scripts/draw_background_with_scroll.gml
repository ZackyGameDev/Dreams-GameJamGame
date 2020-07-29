scrollx = argument0;
scroll_amount = argument1;
backgrounds = argument2;
 
////////////////////////////////////////////////////////////////////////////////////////////////////
// Drawing the backgrounds to a custom surface
srf = surface_create(view_wview[0], view_hview[0]);
surface_set_target(srf);

var i;
for (i = 0; i < array_length_1d(backgrounds); i++) {
    scrollx[i] += scroll_amount[i];
    if scrollx[i] >= background_get_width(backgrounds[i])-10 {
        scrollx[i] -= background_get_width(backgrounds[i]);
        show_message("ye boi It happenned")
    }
    
    draw_background(backgrounds[i], x + scrollx[i] - background_get_width(backgrounds[i]), 0);
    draw_background(backgrounds[i], x + scrollx[i]                                       , 0);
}

surface_reset_target();
////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////
// Drawing the Custom suface to the screen with bloom
bloomIntensity = shader_get_uniform(sh_bloom, "intensity");
bloomblurSize = shader_get_uniform(sh_bloom, "blurSize");

shader_set(sh_bloom);
shader_set_uniform_f(bloomIntensity, 0.3);
shader_set_uniform_f(bloomblurSize, 5)

draw_surface(srf, view_xview[0], view_yview[0]);
surface_free(srf);

shader_reset();
////////////////////////////////////////////////////////////////////////////////////////////////////

return scrollx;
