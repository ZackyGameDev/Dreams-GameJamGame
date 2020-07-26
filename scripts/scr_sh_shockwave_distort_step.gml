
/// @description get clicks / wave age

// WAVE BIRTH
//-----------------------------------------------------------------------------
// create a wave on mouse-click
if (device_mouse_check_button_pressed(0, mb_left) && !global.mouse_on_gui) {
	var new_wave = ds_list_create();
	new_wave[|waveparam.xx]		= mouse_x;
	new_wave[|waveparam.yy]		= mouse_y;
	new_wave[|waveparam.age]	= 0;
	new_wave[|waveparam.scale]	= 0;
	new_wave[|waveparam.alpha]	= 1;

	ds_list_add(list_of_waves, new_wave);
}

// WAVE AGE:
//-----------------------------------------------------------------------------
var wave_list_size = ds_list_size(list_of_waves);
if (wave_list_size > 0) {
	var w, this_wave;
	for (w = 0; w < wave_list_size; w++) {
		this_wave = list_of_waves[|w];
		this_wave[|waveparam.age]	+= slider_get_value(0);
		
		if (this_wave[|waveparam.age] < wave_life) {
			this_wave[|waveparam.scale]	= tween_cubic_out_simple(this_wave[|waveparam.age] / wave_life) * wave_scale_max;
			this_wave[|waveparam.alpha]	= 1 - tween_quadratic_out_simple(this_wave[|waveparam.age] / wave_life);
		} else {
			ds_list_destroy(this_wave);
			ds_list_delete(list_of_waves, w);
			w--;
			wave_list_size--;
		}
	}
}

// TOGGLE TO SHOW GRID OR MOCKUP:
//-----------------------------------------------------------------------------
if (toggle_get_state(0, 0))	layer_set_visible("tlyr_blue_grid", true);
else						layer_set_visible("tlyr_blue_grid", false);