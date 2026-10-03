var halfWidth = buttonWidth * scale / 2;
var halfHeight = buttonHeight * scale / 2;

draw_set_color(c_white);

draw_rectangle(x - halfWidth, y - halfHeight, x + halfWidth, y + halfHeight, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(x, y, buttonText, scale, scale, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);