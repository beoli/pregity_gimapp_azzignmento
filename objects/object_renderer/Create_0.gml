layer_set_visible("ground", false);
layer_set_visible("water", false);
layer_set_visible("collision", false);

global.wholeMap = ds_grid_create(MAP_W, MAP_H);
global.waterMap = ds_grid_create(MAP_W, MAP_H);

loadTileMap("ground", global.wholeMap);
loadTileMap("water", global.waterMap);

global.collisionMap = ds_grid_create(MAP_W, MAP_H);
var collisionTileMap = layer_tilemap_get_id("collision");

for (var i = 0; i < MAP_W; i++)
{
    for (var j = 0; j < MAP_H; j++)
    {
        global.collisionMap[# i, j] = tilemap_get(collisionTileMap, i, j);
    }
}