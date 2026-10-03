function drawTileMap(_grid, _yOffset)
{
    for (var i = 0; i < MAP_W; i++)
    {
        for (var j = 0; j < MAP_H; j++)
        {
            var tileData = _grid[# i, j];
            var tileIndex = tileData[TILE.SPRITE];

            if (tileIndex != 0)
            {
                var screenX = tileToScreenX(i, j);
                var screenY = tileToScreenY(i, j);

                draw_sprite(sprite_tilesetiso, tileIndex - 1, screenX, screenY + tileData[TILE.Z] + _yOffset);
            }
        }
    }
}