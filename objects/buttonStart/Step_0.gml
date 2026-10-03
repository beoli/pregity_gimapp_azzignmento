
var hovering = point_in_rectangle(mouse_x, mouse_y, x - buttonWidth / 2, y - buttonHeight / 2, x + buttonWidth / 2, y + buttonHeight / 2);

if (hovering)
{
    scale = 1.25;
}
else
{
    scale = 1;
}

if (hovering == true && mouse_check_button_pressed(mb_left))
{
    room_goto(Room1);
}