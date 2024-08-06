//making numplatforms local so we can clear the data with fresh data
var num_platforms = instance_number(obj_cloud);//number of platforms in instance

frames_since_platform += 1;

if(frames_since_platform > frames_bt_platform || num_platforms < 2)
//if its been the set amount of frames since last star 
//or theres less than 2 on screen
{
	if(num_platforms < max_platforms)//if its less than max amount of platforms
	{
		//variable "new platform" is local to this if statement and anything under
		//maker a new platform
		var new_platforms = instance_create_layer(
			//randomly between these points
			random_range(5, room_width - 5),
			random_range(20,room_height - 100), 
			"Instances", 
			//in instances
			obj_cloud
		)
		
		//with changes the scope of the variables
		with(new_platforms)
		{
			var tries = 0;
			//if its less than 3000 tries of finding a space
			//and not within the collision
			while(tries < 3000 && collision_rectangle( 
			x-20,y-20,
			x+20,y+20,
			obj_cloud,
			false,true) != noone){
				//then spawn
				x = random_range(30, room_width - 30);
				y = random_range(100, room_height - 200);
				tries +=1;
			}
		}
	}
	frames_since_platform = 0;
}

