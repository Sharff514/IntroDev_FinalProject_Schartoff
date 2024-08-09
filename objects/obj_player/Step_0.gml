//MOVEMENT

//slow the player down on the x-axis
x_vel *= 0.9

//adding gravity to the y velocity
y_vel += grav;

//r = remainder
//add the current speed to the leftover
//speed from the last frame
r_y += y_vel;
r_x += x_vel;

//round the velocity
//these are the pixels we're moving this frame
var to_move_y = round(r_y);
var to_move_x = round(r_x);

//remove the rounded amount so that we have the leftover speed
r_y -= to_move_y;
r_x -= to_move_x;


//IF PLAYER HITS WALLS

//find the distance between the player and the walls
var dist_to_r_wall = room_width - x - 8;
var dist_to_l_wall = x - 8;

//if we've hit the right wall
if(to_move_x >= dist_to_r_wall) {
	//nudge the player to the left
	x = room_width - 9;
	//reverse our velocity
	x_vel = abs(x_vel) * -1;
	//reset the remainder variable
	r_x = 0;
} else if(to_move_x < -dist_to_l_wall) {
	//if we've hit the left wall
	//nudge to the right
	x = 9; 
	//reverse the velocity
	x_vel = abs(x_vel);
	//reset the remainder variable
	r_x = 0;
} else {
	//otherwise
	//move however much we need to move this frame
	x += to_move_x;
}

//find the y direction that we're moving
var dir = sign(to_move_y);

//COLLIDING WITH ANYTHING

while(to_move_y != 0) {
	//track IF we've collided w/ anything
	var colliding = false;
	//track what instance we have collided with
	var collidewith = noone;
	
	//check for collisions if we're moving downward
	if(dir >= 0) {
		//set to a player that may be one pixel beneath me
		collidewith = instance_place(x, y + dir, obj_player);
		
		//COLLISION WITH OTHER PLAYER
		//if we've collided w/ a player
		if(collidewith != noone){
			//if we're not already overlapping w/ that player
			if(place_meeting(x, y, collidewith) == false) {
				//track that we've hit something
				colliding = true;
				//bounce  the other player down
				collidewith.y_vel = max(0, collidewith.y_vel + 2);
				//audio_play_sound(snd_hit,1,false)
			}
		} else {
		
			//COLLISION WITH platform
			//set to a cloud that may be one pixel beneath me
			collidewith = instance_place(x, y + dir, obj_plat_level_1);
			//if we're going to collide w/ a cloud
			if(collidewith != noone) {
				//and if we've not already overlapped w/ that cloud
				if(place_meeting(x, y, collidewith) == false) {
					//track that we've hit something
					colliding = true;
					audio_play_sound(snd_platform_sound,false,0)
					image_index = 0;
				}
			}
			
			collidewith = instance_place(x, y + dir, obj_cloud);
			//if we're going to collide w/ a cloud
			if(collidewith != noone) {
				//and if we've not already overlapped w/ that cloud
				if(place_meeting(x, y, collidewith) == false) {
					//track that we've hit something
					colliding = true;
					audio_play_sound(snd_platform_sound,false,0)
					image_index = 0;
				}
			}
			collidewith = instance_place(x, y + dir, obj_plat_level_2);
			//if we're going to collide w/ a cloud
			if(collidewith != noone) {
				//and if we've not already overlapped w/ that cloud
				if(place_meeting(x, y, collidewith) == false) {
					//track that we've hit something
					colliding = true;
					audio_play_sound(snd_platform_sound,false,0)
					image_index = 0;
				}
			}
			collidewith = instance_place(x, y + dir, obj_bird);
			//if we're going to collide w/ a cloud
			if(collidewith != noone) {
				//and if we've not already overlapped w/ that cloud
				if(place_meeting(x, y, collidewith) == false) {
					//track that we've hit something
					colliding = true;
					audio_play_sound(snd_platform_sound,false,0)
					image_index = 0;
				}
			}
		} 
		
	}
	
	//NO COLLISION
	// if we're NOT colliding w/ anything
	if(!colliding) {
		//move one pixel in the direction we're moving
		y += dir;
		//remove that pixel from the pixels we're tracking this frame
		to_move_y -= dir;
	} else {
		
		//COLLIDING WITH SOMETHING
		
		//if we did collide w/ something
		//move one pixel in the direction we've moving
		y = y + dir;
		//change our y velocity to the bouncing velocity
		y_vel = bounce_vel;
		//reset our remaining pixels to move
		//(since we're bouncing in another direction, we don't care about the leftovers)
		r_y = 0;
		//break out of this while loop
		break;
	}
	
}
//CONTROL RELATED

//if we hit the left key
if(keyboard_check(ord(left_key))) {
	//decrease our x velocity by the acceleration
	x_vel -= accel;
	image_xscale = -1;
	
}
//if we hit the right eye
if(keyboard_check(ord(right_key))) {
	//increase our x velocity by the acceleration
	x_vel += accel;
	image_xscale = 1;
}

//RESPAWN

var camera_height = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

show_debug_message(respawn_wait);
if(y > camera_height)
{
	if(!invincible) {
		player_lives -= 1;
		invincible = true;
	}
	if(respawn_wait <= 0) {
		respawn_wait = respawn_time;
	}
	if(player_lives = 0) {
	room_goto(rm_game_over);
	player_lives = 3;
}
}

if(respawn_wait > 0)
{
	//typically I make a time limit, do a ++ and have it stop at the duration. This counts down.
	respawn_wait -= 1;
	if(respawn_wait == 0)
	{
		x=round(random_range(room_width*0.25,room_width*0.75)); //spawn x is whatever the game rounds from the random ranges
		y=camera_height;//spawn y is the room height
		
		x_vel = (x-room_width*0.5) * random_range(0.1,0.2);
		y_vel = -10;
		r_x = 0;
		r_y = 0;
		//audio_play_sound(snd_spawn,false,0)
		image_index = 0;
	}
}


if(invincible) {
	invincibility_timer++;
	if(invincibility_timer > invincibility_duration) {
		invincible = false;
		second_chance_timer++;
		invincibility_timer = 0;
		if(y > camera_height && second_chance_timer < second_chance_duration) {
			invincible = true;
			second_chance_timer = 0;
		} else if(second_chance_timer > second_chance_duration) {
			second_chance_timer = 0;
		}
	}
}

show_debug_message(invincible);

