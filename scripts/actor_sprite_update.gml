//Loop the animation every time the end is reached.
//As a failsafe, check if the actor has a sprite. If not, abort.
if (sprite != -1)
{
    var nums;
    if (global.spr[sprite, 1])
        nums = image_get_number(global.spr[sprite, 0]) * 0.25;
    else
        nums = image_get_number(global.spr[sprite, 0]) - 1;
    if (nums != 0)
        frame = (frame + frameSpd) mod (nums);
}
