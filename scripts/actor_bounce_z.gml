if (fBounce)
{
    //Prevent division by zero error if a holdable is not bouncy at all.
    if (bounciness)
    {
        hSpeed/=bounciness;
        vSpeed/=bounciness;
        if (zSpeed>=0.5)
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
