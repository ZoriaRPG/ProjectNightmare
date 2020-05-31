mzCheck=argument0+argument1;
rep=4;
for (i=0;i<rep;i++)
{
    xx=x+lengthdir_x(radius,(360/rep)*i);
    yy=y+lengthdir_y(radius,(360/rep)*i);
    zRefs[i]=p3dc_ray_split(xx,yy,mzCheck,0,0,-1);
}
zRefs[rep]=p3dc_ray_split(x,y,mzCheck,0,0,-1);
amtLowerThan1=0;
for (i=0;i<=rep;i++)
    if (zRefs[i]<2.5)
        amtLowerThan1++;
if (zRefs[rep]<1 || amtLowerThan1>2)
    canJump=true;
lowest=999;
for (i=0;i<=rep;i++)
    if (zRefs[i]<lowest)
        lowest=zRefs[i];
mRet=lowest-argument1;
return (mRet)
