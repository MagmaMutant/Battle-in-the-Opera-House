if not hit
{
	kbpower = obj_slash.kbpower
	hit = true
	kb= true
	hp -=20
	alarm[3] =  room_speed * .2;

	//if afacingb(obj_p1,obj_dummy)
	//{
	//	//x += 4
	//	//hspeed = 5
	//}
	//else
	//{
	//	//x-= 4
	//	//hspeed =-5
	////}
}