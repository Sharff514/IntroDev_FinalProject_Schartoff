stagnate_timer = 0;
stagnate_duration = 0; //3 seconds = 180 frames?

stagnate1 = false;
stagnate2 = false;

function platform_growth(stagnate, image_beginning, image_end)
{
	stagnate1 = stagnate;
	image_beginning = 4;
	image_end = 5;
	

	if(image_index > 4) && (image_index < 5)//if animation is complete, stagnate.
		{
			stagnate = true;
		}

	if(stagnate = true)//if its stagnate, timer starts, image speed is 0, 4th frame
	{
		stagnate_timer++;
		image_speed = 0;
		if(stagnate_timer > stagnate_duration) 
		//if the timer reaches the duration, its no longer stagnate, timer is set to 0
		{
			stagnate = false;
			stagnate_timer = 0;
			image_speed = 1;
		}
	}
}