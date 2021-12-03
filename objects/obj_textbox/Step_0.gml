if(keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"))) {
	
	//Move to the next text page if there are more in the text array
	//Note that each text page consists of two array entries, one for the text and the other for the
	// prefix length, if something should be printed immediately and not one character at a time
	if(text_page < array_length_2d(text, text_set) - 2) {
		text_page += 2;
		char_prefix = text[text_set][text_page + 1];
		char_count = 0;
	}
	else {
		
		//Destroy the textbox as it is no longer in use
		instance_destroy();	
		
		//Check if there are more text sets in this object
		//If so, increment the interactable object's talk counter
		//Otherwise, stay on the last set
		//To prevent new dialog, an empty set may be used
		if(text_set < array_height_2d(text) - 1) {
			creator.talk_counter++;
		}
		
		creator.alarm[1] = 1;
		
	}
}