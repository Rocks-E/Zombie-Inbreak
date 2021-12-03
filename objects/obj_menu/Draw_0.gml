draw_set_halign(fa_center);
draw_set_font(fnt_menu);

var _spacing = 36;

for(var _c = 0; _c < array_length_1d(menu); _c++) {
	
	draw_set_color(c_white);
	
	if(index == _c) {
		draw_set_color(c_purple);	
	}
	
	draw_text(room_width >> 1, room_height * 0.4 + _c * _spacing, menu[_c]);
}