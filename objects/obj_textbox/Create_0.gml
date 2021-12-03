x_buffer = 5;
y_buffer = 5;
box_width = (sprite_get_width(spr_textbox) >> 1) - x_buffer << 1;
text_height = string_height(text);

char_prefix = 0;
char_count = 0;
text_page = 0;
text_set = 0;
text = [[]];

creator = noone;