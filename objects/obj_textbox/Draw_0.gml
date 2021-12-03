//Draw textbox
draw_sprite(spr_textbox, 0, x, y);

//Setup text font
draw_set_font(fnt_text);

//Use another string as a buffer to allow for text to write one character at a time
if(char_count < string_length(text[text_set][text_page])) {
	char_count++;
	text_part = string_copy(text[text_set][text_page], 1, char_prefix + char_count);
}

//Draw text
draw_text_ext(x + x_buffer, y + y_buffer, text_part, text_height + y_buffer, box_width);