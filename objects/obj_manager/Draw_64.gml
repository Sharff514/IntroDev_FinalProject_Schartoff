/// @description Insert description here
// You can write your code in this editor

if(paused) {
	draw_set_font(fnt_buttons);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2, "paused");
}