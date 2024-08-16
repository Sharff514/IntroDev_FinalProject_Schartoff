draw_sprite(spr_lives_icon_1,0,x,y);
draw_set_font(global.font_lives);
draw_text(x +110,y+27,obj_player.player_lives);

if(obj_player.invincible) {
	draw_sprite(spr_inv_tag,0,x+150,y)
}