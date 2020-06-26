//Loop the animation every time the end is reached.
//As a failsafe, check if the actor has a sprite. If not, abort.
if (sprite!=-1)
{
    var nums;
    if (rotate)
        nums=global.sFrames[sprite,0];
    else
        nums=global.sFrames[sprite,1];
    if (nums!=0)
        frame=(frame+frameSpd) mod (nums);
}
