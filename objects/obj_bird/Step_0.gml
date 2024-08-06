x += move_speed;

if(x > right_edge)
{
	move_speed = move_speed * -1;
	image_xscale = -1;
}

if(x < left_edge)
{
	move_speed = move_speed * -1;
	image_xscale = 1;
}
