//clouds growing
image_speed = 1;

//CLOUDS DO NOT MOVE CODE


//PHASE 1
if(image_index > 3) && (image_index < 4)//if animation is complete, stagnate.
	{
		stagnate1= true;
	}

if(stagnate1 = true)//if its stagnate, timer starts, image speed is 0, 4th frame
{
	stagnate_timer++;
	image_speed = 0;
	image_index = 3;
	if(stagnate_timer > stagnate_duration) 
	//if the timer reaches the duration, its no longer stagnate, timer is set to 0
	{
		stagnate1 = false;
		stagnate_timer = 0;
		image_speed = 1;
		image_index = 5;
	}
}

//PHASE 2
if(image_index > 7) && (image_index < 8)
	{
		stagnate2 = true;
	}

if(stagnate2 = true)
{
	stagnate_timer++;
	image_speed = 0;
	image_index = 7;
	if(stagnate_timer > stagnate_duration) 
	{
		stagnate2 = false;
		stagnate_timer = 0;
		image_speed = 1;
		image_index = 9;
	}
}

//PHASE 3
if(image_index > 11) && (image_index < 12)
	{
		stagnate3 = true;
	}

if(stagnate3 = true)
{
	stagnate_timer++;
	image_speed = 0;
	image_index = 11;
	if(stagnate_timer > stagnate_duration) 
	{
		stagnate3 = false;
		stagnate_timer = 0;
		image_speed = 1;
		image_index = 13;
	}
}	

//PHASE 4 (Final)
if(image_index > 15) && (image_index < 16)
{
	image_speed = 0;
	image_index = 15;
}
	
