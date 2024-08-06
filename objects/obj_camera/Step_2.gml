view_height = camera_get_view_height(view_camera[0]);

var px = obj_player_1.x;
var py = obj_player_1.y;
var camera_x = lerp(camera_get_view_x(view_camera[0]),px,0.1);
var camera_y = lerp(camera_get_view_y(view_camera[0]) - view_height/2,py,0.1);


if(obj_player_1.y < highest_y) {
   y = obj_player_1.y - (view_height/2);
   highest_y = obj_player_1.y;
}

camera_set_view_pos(view_camera[0], camera_x, camera_y);

if (y < 0) y = 0;
if (y + view_height > room_height) 

{
	y = room_height - view_height;
}

camera_set_view_pos(view_camera[0],x,y);