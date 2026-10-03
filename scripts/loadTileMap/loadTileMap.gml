function loadTileMap(_layerName, _grid)
{
    var tileMap = layer_tilemap_get_id(_layerName);

    for (var i = 0; i < MAP_W; i++)
    {
        for (var j = 0; j < MAP_H; j++)
        {
            var tileData = [-1, 0];
            tileData[TILE.SPRITE] = tilemap_get(tileMap, i, j);
            tileData[TILE.Z] = 0;

            _grid[# i, j] = tileData;
        }
    }
}