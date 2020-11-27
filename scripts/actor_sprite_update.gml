//Loop the animation every time the end is reached.
//As a failsafe, check if the actor has a sprite. If not, abort.
if (sprite != -1)
{
    var nums, getSprite = sprite_get(sprite);
    if (sprite_rotates(sprite)) nums = image_get_number(getSprite) * 0.25;
    else nums = image_get_number(getSprite) - 1;
    if (nums != 0) frame = (frame + frameSpd) mod (nums);
}
