//PLAYER BEATS GAME CODE

if(y < 0){
room_goto(next_level_title);
audio_play_sound(snd_level_warp,false,0);
return;
}

if(keyboard_check_released(vk_tab))room_goto_previous()