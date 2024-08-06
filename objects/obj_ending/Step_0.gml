if(keyboard_check(vk_space))
{
	audio_stop_sound(snd_ending_theme)
	room_goto(rm_title)
	game_restart();
}