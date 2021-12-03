function get_menu_input(){
	
	if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
		index--;
	}
	else if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
		index++;	
	}
	else if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
		
		switch(index) {
			
			case 2:
				room_goto(rm_2_2);
				instance_destroy();
				break;
			
			case 1:
				room_goto(rm_game_info);
				break;
			
			case 0:
				game_end();
				break;
			
			default:
				game_end();
				break;
			
		}
		
	}
	
	if(index < 0) {
		index = 2;	
	}
	else if(index > 2) {
		index = 0	
	}
	
}