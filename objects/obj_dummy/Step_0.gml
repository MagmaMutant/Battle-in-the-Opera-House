if (kb == true){
	gravity = .5;
	//vspeed = -3
	//y-= lengthdir_y(kbpower,point_direction(x,y,obj_p1.x,obj_p1.y))
	if afacingb(obj_p1,obj_dummy){
		x -= lengthdir_x(kbpower,point_direction(x,y,obj_p1.x,obj_p1.y))
		y+= lengthdir_x(kbpower,point_direction(x,y,obj_p1.x,obj_p1.y))
	}
	else{
		x -= lengthdir_x(kbpower,point_direction(x,y,obj_p1.x,obj_p1.y))
		y-= lengthdir_x(kbpower,point_direction(x,y,obj_p1.x,obj_p1.y))
	}
}
gamepad_id2 = -1;

for (var i = 0; i < 12; i += 1;)
{
    if gamepad_is_connected(i)
    {
        gamepad_id2 = i;
        gamepad_set_axis_deadzone(gamepad_id2, 0.2);

        break;
    }
}
gamepad_id2=1
show_debug_message(gamepad_id2)
//show_debug_message("dummy is " + str(gamepad_id2));

	
	//establish controls
    var _h = gamepad_axis_value(gamepad_id2, gp_axislh);
	var _v = gamepad_axis_value(gamepad_id2, gp_axislv); // vertical stick
	var _x = gamepad_button_check_pressed(gamepad_id2, gp_face3); //jump
	//var _select = gamepad_button_check_pressed(gamepad_id,gp_select); // select
	var _a = gamepad_button_check_pressed(gamepad_id2, gp_face1); //special
	var _b = gamepad_button_check_pressed(gamepad_id2, gp_face2); //attk
	var _y = gamepad_button_check(gamepad_id2, gp_face4); //block

	if not blocking and not attacking and not dodging and not freefall
	{
		// walking
		if (_h != 0)
		{
			walking = true;
			x += _h * 4;
			image_speed = abs(_h) //add animation speed acording to |_h|
			sprite_index = spr_p1walk;
			
			
		}
		else if (_h = 0)
		{
			walking = false;
			image_speed = 1;
			fallingoridle();
		}
		
		//jumping
		if ((canjump) && (_x)) 
		{
			vspeed = -9;
			gravity = .3;
			canjump = false;
	
		}
		if (_b) //and canjump
		{
			attacking = true;
			if image_xscale == 1
			{
				instance_create_layer(x,y,"BattleFloor",obj_slash,{ Def : 1})
			}
			else
			{
				instance_create_layer(x,y,"BattleFloor",obj_slash,{ Def : -1})
			}
		}
		else
		{
			//attacking = false;
		}

		}
		
	
	
	
	
	//block
	if (_y) && canjump 
	{
		prevsprite = sprite_index
		sprite_index  = spr_shielded
		blocking = true;
	}
	else
	{
		blocking = false;
		if not walking{
			fallingoridle();
		}
	}
	
	// airdodge
	if not canjump and not attacking and not dodging and not freefall{
		if _y and abs(_h) > .3{
			dodging = true;
			freefall = true
			if _h > 0{
				dodgedirection = 1
			}
			else{
				dodgedirection =-1
			}
			image_alpha = .5
			
			alarm[4] = room_speed * .1;  //duration
			//if _h >0{//going right
			
		//}
		
		//else{//going left
			
		//}
		}
	}

	if dodging == true{
		x += lengthdir_x(15,point_direction(x,y,obj_p1.x,obj_p1.y)) * dodgedirection // change first num for power
	}
	//resize	
	// need if stattement
	//{
	//	show_debug_message("1")
	//	if window_get_fullscreen()
	//	{
	//		window_set_fullscreen(false);
	//	}
	//	else
	//	{
	//		window_set_fullscreen(true);
	//	}
	//}
	
	

