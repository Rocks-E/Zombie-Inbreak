if(!global.talking) {
	global.win_timer -= delta_time / 1000000;
}
if(global.win_timer < 0) {
	lose();	
}