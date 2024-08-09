bounce_animation = spr_player_jump;
fall_animation = spr_p1;


bounce_vel = -10; //how high player bounces
grav = 0.5; //how fast player falls
accel = 0.5; //how fast player is

//Respawn Timer

respawn_wait = 0;//respawn timer
respawn_time = 60;//when respawn happens (1 second)

invincible = false;
invincibility_timer = 0;//timer for player invincibility when losing a life
invincibility_duration = 300;//limit for player invincibility

//if the player falls down within a certain time limit when invincible, invinciblity restarts
//this is to assure that if the player doesn't make it to a platform while invicible
//at least until reaching a platform
second_chance_timer = 0;
second_chance_duration = 120;

player_lives = 4;

beginning_invinciblity_timer = 0;
