function get_input() {
		
	//Vertical movement
	if(keyboard_check(ord("W")) || keyboard_check(vk_up)) {
		move_v = -1;
	}
	else if(keyboard_check(ord("S")) || keyboard_check(vk_down)) {
		move_v = 1;
	}
	
	//Horizontal movement
	if(keyboard_check(ord("A")) || keyboard_check(vk_left)) {
		move_h = -1;
	}
	else if(keyboard_check(ord("D")) || keyboard_check(vk_right)) {
		move_h = 1;
	}
	
	//Interact
	if(keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"))) {
		check_for_interaction();
	}
			
}

function reset_vars() {
	
	move_v = 0;
	move_h = 0;
	
}

function check_movement() {
	
	var _hmove, _vmove, _dir;
	
	//Slow down as items are grabbed as strength is fading
	var _effective_move_speed = global.move_speed - (0.2 * global.items_collected);
	
	if(move_h != 0 || move_v != 0) {
		
		_dir = point_direction(0, 0, move_h, move_v);
		last_dir = _dir;
		
		if(_dir % 90 == 0) {
			sprite_index = spr_player_card;
			image_angle = _dir + 90;	
		}
		else {
			sprite_index = spr_player_diag;
			image_angle = _dir + 45;
		}
		
		_hmove = lengthdir_x(_effective_move_speed, _dir);
		_vmove = lengthdir_y(_effective_move_speed, _dir);
		
		x += _hmove;
		y += _vmove;
		
	}
	
}

function collision() {

	//Set target values
	
	var _tx = x;
	var _ty = y;
	
	var _dx, _dy, _sign;
	
	x = xprevious;
	y = yprevious;
	
	_dx = abs(_tx - x);
	_dy = abs(_ty - y);
	
	repeat(_dx) {
		
		_sign = sign(_tx - x);
		
		if(!place_meeting(x + _sign, y, obj_wall) && !place_meeting(x + _sign, y, obj_interactable)) {
			x += _sign;	
		}
		
	}
	
	repeat(_dy) {
		
		_sign = sign(_ty - y);
		
		if(!place_meeting(x, y + _sign, obj_wall) && !place_meeting(x, y + _sign, obj_interactable)) {
			y += _sign;	
		}
		
	}

}

function check_for_interaction() {
	
	var _half_width = sprite_width >> 1;
	var _half_height = sprite_height >> 1;
	
	var _xcheck = x + lengthdir_x(sprite_width, last_dir);
	var _ycheck = y + lengthdir_y(sprite_height, last_dir);
	
	var _inst = instance_nearest(_xcheck, _ycheck, obj_interactable);
	
	var _inst_hw = _inst.sprite_width >> 1;
	var _inst_hh = _inst.sprite_height >> 1;
	
	//Check if there is an interactable object in the path of the player's last direction faced
	if(rectangle_in_rectangle(_xcheck - _half_width, _ycheck - _half_height, _xcheck + _half_width, _ycheck + _half_height, _inst.x - _inst_hw, _inst.y - _inst_hh, _inst.x + _inst_hw, _inst.y + _inst_hh) > 0) {
		with(_inst) {
			do_interaction();
		}
	}
	
}

function transition() {
	
	var _trans = instance_place(x, y, obj_transition);
	
	if(room == rm_1_1) {
		global.ian = 1;	
	}
	
	if(_trans != noone) {
		room_goto(_trans.target_room);
		global.spawn_x = _trans.sp_x;
		global.spawn_y = _trans.sp_y;
	}
	
}






