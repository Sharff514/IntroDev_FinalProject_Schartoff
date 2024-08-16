

if(obj_player_1.y < highest_y) {
   y = obj_player_1.y - (view_height -offset);
   //y = obj_player_1.y - (view_height/2);
   highest_y = obj_player_1.y;
}

view_height = camera_get_view_height(view_camera[0]); // +9

if (y < 0) y = 0;
if (y + view_height > room_height) 

{
	y = room_height - view_height;
}

camera_set_view_pos(view_camera[0],x,y);