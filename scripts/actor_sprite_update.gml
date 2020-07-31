//Loop the animation every time the end is reached.
//As a failsafe, check if the actor has a sprite. If not, abort.
if (sprite != -1)
{
    var nums;
    if (rotate)
        nums = sprite_get_number(sprite) * 0.25;
    else
        nums = sprite_get_number(sprite) - 1;
    if (nums != 0)
        frame = (frame + frameSpd) mod (nums);
}
