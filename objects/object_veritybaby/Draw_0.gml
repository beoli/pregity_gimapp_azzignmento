var screenX = tileToScreenX(gridX, gridY) + TILE_W * 0.5;
var screenY = tileToScreenY(gridX, gridY);

draw_sprite(sprite_index, 0, screenX, screenY);