if(keyboard_check(vk_space)){
	room_goto(rm_level_1_title);
	audio_stop_sound(snd_title);
	audio_play_sound(snd_level_warp,false,0);
}