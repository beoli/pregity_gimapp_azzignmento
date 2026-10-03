


if (keyboard_check(vk_shift))
{
    var previewDistance = clamp(floor(global.chargeTime), 0, 3);

    if (previewDistance >= 1 && (global.jumpDirectionX != 0 || global.jumpDirectionY != 0))
    {
        var previewX1 = global.playerblockX + global.jumpDirectionX * 1;
        var previewY1 = global.playerblockY + global.jumpDirectionY * 1;

        var previewX2 = global.playerblockX + global.jumpDirectionX * 2;
        var previewY2 = global.playerblockY + global.jumpDirectionY * 2;

        var previewX3 = global.playerblockX + global.jumpDirectionX * 3;
        var previewY3 = global.playerblockY + global.jumpDirectionY * 3;

        var hasTarget = false;
        var targetX = 0;
        var targetY = 0;

        if (previewDistance == 3)
        {
            if (collisionCheck(previewX3, previewY3) == false)
            {
                targetX = previewX3;
                targetY = previewY3;
                hasTarget = true;
            }
            else
            {
                if (collisionCheck(previewX2, previewY2) == false)
                {
                    targetX = previewX2;
                    targetY = previewY2;
                    hasTarget = true;
                }
                else
                {
                    if (collisionCheck(previewX1, previewY1) == false)
                    {
                        targetX = previewX1;
                        targetY = previewY1;
                        hasTarget = true;
                    }
                }
            }
        }
        else if (previewDistance == 2)
        {
            if (collisionCheck(previewX2, previewY2) == false)
            {
                targetX = previewX2;
                targetY = previewY2;
                hasTarget = true;
            }
            else
            {
                if (collisionCheck(previewX1, previewY1) == false)
                {
                    targetX = previewX1;
                    targetY = previewY1;
                    hasTarget = true;
                }
            }
        }
        else if (previewDistance == 1)
        {
            if (collisionCheck(previewX1, previewY1) == false)
            {
                targetX = previewX1;
                targetY = previewY1;
                hasTarget = true;
            }
        }

        
        if (hasTarget == true)
        {
            var highlightX = tileToScreenX(targetX, targetY) + TILE_W * 0.5;
            var highlightY = tileToScreenY(targetX, targetY) + TILE_H * 0.5;

            draw_sprite(jumpHighlight, 0, highlightX, highlightY);
        }
    }
}

var screenX = tileToScreenX(global.playerblockX, global.playerblockY) + TILE_W * 0.5;
var screenY = tileToScreenY(global.playerblockX, global.playerblockY)

for (var i = 0; i < MAP_W; i++)
{
    for (var j = 0; j < MAP_H; j++)
    {
        if (collisionCheck(i + 0.5, j + 0.5) == false)
        {
            var dotX = tileToScreenX(i + 0.5, j + 0.5) + TILE_W * 0.5;
            var dotY = tileToScreenY(i + 0.5, j + 0.5);

			
            //draw_set_color(c_red);
            //draw_circle(landX, landY, 1, false);
            //draw_set_color(c_white);
        }
    }
}

//draw_sprite(global.sprite_player_rightnow, 0, screenX, screenY);

var screenX = tileToScreenX(drawX, drawY) + TILE_W * 0.5;
var screenY = tileToScreenY(drawX, drawY) + jumpOffset;

draw_sprite(sprite_index, 0, screenX, screenY);