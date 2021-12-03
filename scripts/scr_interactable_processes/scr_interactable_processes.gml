function do_interaction(){
	display_text();	
}

function display_text() {

	var _player = instance_find(obj_player, 0);
	var _tb_height = sprite_get_height(spr_textbox);
	
	var _ypos = (_player.y - _player.sprite_height >> 1) < (_tb_height + 16) ? (room_height - 16 - _tb_height) : 16;
	
	var _tb = instance_create_layer(16, _ypos, "Text_Layer", obj_textbox);
	_tb.text = talk_text;
	_tb.char_prefix = talk_text[talk_counter][1];
	_tb.text_set = talk_counter;
	_tb.creator = self;
	
	global.talking = true;
	
}