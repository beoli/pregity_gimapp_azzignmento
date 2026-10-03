var stepX = 0;
var stepY = 0;

if (keyboard_check_pressed(ord("W"))) { stepX =  0; stepY = -1; }
if (keyboard_check_pressed(ord("S"))) { stepX =  0; stepY =  1; }
if (keyboard_check_pressed(ord("A"))) { stepX = -1; stepY =  0; }
if (keyboard_check_pressed(ord("D"))) { stepX =  1; stepY =  0; }

if (keyboard_check(vk_shift))
{
    global.chargeTime += delta_time / 333333;
    if (stepX != 0 || stepY != 0)
    {
        global.jumpDirectionX = stepX;
        global.jumpDirectionY = stepY;
    }
}

else if (keyboard_check_released(vk_shift))
{
    var jumpDistance = clamp(floor(global.chargeTime), 0, 3);

    if (jumpDistance >= 1 && (global.jumpDirectionX != 0 || global.jumpDirectionY != 0))
    {
        var landX1 = global.playerblockX + global.jumpDirectionX * 1;
        var landY1 = global.playerblockY + global.jumpDirectionY * 1;

        var landX2 = global.playerblockX + global.jumpDirectionX * 2;
        var landY2 = global.playerblockY + global.jumpDirectionY * 2;

        var landX3 = global.playerblockX + global.jumpDirectionX * 3;
        var landY3 = global.playerblockY + global.jumpDirectionY * 3;
		
		if (jumpDistance == 3)
        {
            if (collisionCheck(landX3, landY3) == false)
            {
                global.playerblockX = landX3;
                global.playerblockY = landY3;
            }
            else
            {
                if (collisionCheck(landX2, landY2) == false)
                {
                    global.playerblockX = landX2;
                    global.playerblockY = landY2;
                }
                else
                {
                    if (collisionCheck(landX1, landY1) == false)
                    {
                        global.playerblockX = landX1;
                        global.playerblockY = landY1;
                    }
                }
            }
        }
        else if (jumpDistance == 2)
        {
            if (collisionCheck(landX2, landY2) == false)
            {
                global.playerblockX = landX2;
                global.playerblockY = landY2;
            }
            else
            {
                if (collisionCheck(landX1, landY1) == false)
                {
                    global.playerblockX = landX1;
                    global.playerblockY = landY1;
                }
            }
        }
        else if (jumpDistance == 1)
        {
            if (collisionCheck(landX1, landY1) == false)
            {
                global.playerblockX = landX1;
                global.playerblockY = landY1;
            }
        }
    }

    global.chargeTime = 0;
    global.jumpDirectionX = 0;
    global.jumpDirectionY = 0;
}

else
{
    var nextX = global.playerblockX + stepX;
    var nextY = global.playerblockY + stepY;

    if (collisionCheck(nextX, nextY) == false)
    {
        global.playerblockX = nextX;
        global.playerblockY = nextY;
    }
}





// verity hamil part
global.sprite_player_rightnow = sprite_index;

if (keyboard_check_pressed(vk_space)) 
{
    if (sprite_index == sprite_player) {
        sprite_index = sprite_player_pregnant;
		global.sprite_player_rightnow = sprite_index;
    }
    else if (sprite_index == sprite_player_pregnant) {
        sprite_index = sprite_player;    
		global.sprite_player_rightnow = sprite_index;
		var spawnX = global.playerblockX + 1;
		var spawnY = global.playerblockY;
		instance_create_layer(spawnX * CELL_SIZE, spawnY * CELL_SIZE, "Instances", object_veritybaby);
   
    }
}



// this animation part, i swear i [DEEPLY WORKING TOGETHER] me, and claude, but i swear everything else mostly written by my hand and claude only for debugging

if (global.playerblockX != lastGridX || global.playerblockY != lastGridY)
{
    
    startX = drawX;
    startY = drawY;
    endX = global.playerblockX;
    endY = global.playerblockY;

    
    var distanceMoved = abs(global.playerblockX - lastGridX) + abs(global.playerblockY - lastGridY);

    if (distanceMoved > 1)
    {
        animIsJump = true;
        animDuration = jumpDuration;
    }
    else
    {
        animIsJump = false;
        animDuration = walkDuration;
    }

    animTime = 0;
    animating = true;

    lastGridX = global.playerblockX;
    lastGridY = global.playerblockY;
}



if (animating == true)
{
    animTime += delta_time / 1000000;

    
    var t = animTime / animDuration;

    if (t >= 1)
    {
        t = 1;
        animating = false;
    }

    
    drawX = lerp(startX, endX, t);
    drawY = lerp(startY, endY, t);

    
    if (animIsJump == true)
    {
        jumpOffset = -jumpHeight * 4 * t * (1 - t);
    }
    else
    {
        jumpOffset = 0;
    }
}