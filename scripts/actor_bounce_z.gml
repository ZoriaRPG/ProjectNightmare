///Returns the actor's new zSpeed after bouncing.
if (fBounce)
{
    //Prevent division by zero error if a holdable is not bouncy at all.
    if (bounciness)
    {
        hSpeed/=bounciness;
        vSpeed/=bounciness;
        if (round(abs(zSpeed)))
            zSpeed/=-bounciness;
        else
            zSpeed=0;
    }
    else
    {
        hSpeed=0;
        vSpeed=0;
        zSpeed=0;
    }
}
else
    zSpeed=0;
return (zSpeed)
