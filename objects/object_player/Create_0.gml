depth = -1000;
global.playerblockX = floor(x / CELL_SIZE) + 0.5;
global.playerblockY = floor(y / CELL_SIZE) + 0.5;

global.chargeTime = 0;   
global.jumpDirectionX = 0;     
global.jumpDirectionY = 0;
global.canBeJumped = false;

drawX = global.playerblockX;
drawY = global.playerblockY;

lastGridX = global.playerblockX;
lastGridY = global.playerblockY;

startX = drawX;
startY = drawY;
endX = drawX;
endY = drawY;

animating = false;
animIsJump = false;
animTime = 0;
animDuration = 0.1;

jumpOffset = 0;        

walkDuration = 0.12;  
jumpDuration = 0.35;   
jumpHeight = 24;       