// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function win(){
	room_goto(rm_win);
	obj_player.sprite_index = spr_player_win;
	global.talking = true;
}

function lose() {
	room_goto(rm_lose);
	obj_player.sprite_index = spr_player_lose;
	global.talking = true;
}