function hasVerityBaby(_tx, _ty)
{
    with (object_veritybaby)
    {
        if (floor(gridX) == floor(_tx) && floor(gridY) == floor(_ty))
        {
            return true;
        }
    }
    return false;
}