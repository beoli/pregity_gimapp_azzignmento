function collisionCheck(_tx, _ty)
{
    var cellX = floor(_tx);
    var cellY = floor(_ty);

    if (cellX < 0 || cellX >= MAP_W || cellY < 0 || cellY >= MAP_H) return true;

    var groundTile = global.wholeMap[# cellX, cellY];
    if (groundTile[TILE.SPRITE] == 0) return true;

    if (hasVerityBaby(_tx, _ty)) return true;

    return false;
}