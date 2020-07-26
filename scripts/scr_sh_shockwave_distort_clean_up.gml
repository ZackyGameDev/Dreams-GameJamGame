/// @description appsrf draw: on|memory
application_surface_draw_enable(true);

if (ds_exists(list_of_waves, ds_type_list)) {
	for (var w = 0; w < ds_list_size(list_of_waves); w++) {
		if (ds_exists(list_of_waves[|w], ds_type_list)) {
			ds_list_destroy(list_of_waves[|w]);
		}
	}
}

if (surface_exists(srf_waves)) surface_free(srf_waves);