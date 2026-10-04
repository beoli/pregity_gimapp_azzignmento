
var hovering = point_in_rectangle(mouse_x, mouse_y, x - buttonWidth / 2, y - buttonHeight / 2, x + buttonWidth / 2, y + buttonHeight / 2);

if (hovering)
{
    scale = 1.25;
	if(!audio_is_playing(sound_buttonClick)){
		audio_play_sound(sound_buttonClick, 1, 0);	
	}
}
else
{
    scale = 1;
}

if (hovering == true && mouse_check_button_pressed(mb_left))
{
    room_goto(Room1);
	
}