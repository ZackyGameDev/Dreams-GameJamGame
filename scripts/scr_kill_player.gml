if obj_player.image_alpha != 0 instance_create(view_xview[0], view_yview[0], obj_death_transition);

if not audio_is_playing(snd_dead) and obj_global.audio_on audio_play_sound(snd_dead, 999, false);
