/// @description smf_collision_avoid(collisionBuffer, x, y, z, radius, xup, yup, zupx)
/// @param collisionBuffer
/// @param x
/// @param y
/// @param z
/// @param radius
/// @param xup
/// @param yup
/// @param zup
/*
Makes the sphere (x, y, z) with the given radius avoid the given model.
Returns true if there is a collision and false if there isn't.
This script includes calculations to avoid sliding down shallow slopes
[returnX, returnY, returnZ] are the modified coordinates after avoiding the model
[returnXup, returnYup, returnZup] is the up-vector the most similar to the given up-vector

Script made by TheSnidr
www.TheSnidr.com
*/
var i, j, k, newX, newY, newZ, dx, dy, dz, tris, addRadius, success, colBuffer, modelX, modelY, modelZ, modelSize, transformScale, tempDistance, tempXup, tempYup, tempZup, tx, ty, tz, vx, vy, vz, uu, dp, tempX, tempY, tempZ, minDp, maxDp, minDist, nearest, nearestUp, vert;

//Read collision buffer header
colBuffer = argument0;
buffer_seek(colBuffer, buffer_seek_start, 4);
modelX = buffer_read(colBuffer, buffer_f32);
modelY = buffer_read(colBuffer, buffer_f32);
modelZ = buffer_read(colBuffer, buffer_f32);
modelSize = buffer_read(colBuffer, buffer_f32);

//Transform player coordinates to u16 integer space
transformScale = 65535 / modelSize;
newX = transformScale * (argument1 - modelX);
newY = transformScale * (argument2 - modelY);
newZ = transformScale * (argument3 - modelZ);
addRadius = transformScale * argument4;

success = false;

maxDp = -1;

returnXup = 0;
returnYup = 0;
returnZup = 1;

tris = smf_collision_get_region(colBuffer, newX, newY, newZ);
for (var i = 0; i < array_length_1d(tris); i ++)
{
vert = smf_collision_get_triangle(colBuffer, tris[i]);
    //----------------------------------Check if the object is inside the triangle (we need to check each line in the triangle)
    for (var j = 0; j < 9; j += 3)
    {
        k = (j + 3) mod 9;
        tx = newX - vert[j];
        ty = newY - vert[j+1];
        tz = newZ - vert[j+2];
        
        vx = vert[k] - vert[j];
        vy = vert[k+1] - vert[j+1];
        vz = vert[k+2] - vert[j+2];
        //------------------------------If the object is not inside the triangle, the nearest point will be on one of the lines
        if dot_product_3d(tz * vy - ty * vz, tx * vz - tz * vx, ty * vx - tx * vy, vert[9], vert[10], vert[11]) < 0
        {
            dp = median(dot_product_3d(vx, vy, vz, tx, ty, tz) / (sqr(vx) + sqr(vy) + sqr(vz)), 0, 1)
            tempX = vert[j] + vx * dp
            tempY = vert[j+1] + vy * dp
            tempZ = vert[j+2] + vz * dp
            break;
        }
    }
    //----------------------------------If the object is indeed inside the triangle, simply orthogonalize (project) the coordinates to the plane defined by the triangle
    if j == 9
    {
        var l = vert[9] * tx + vert[10] * ty + vert[11] * tz;
        tempX = newX - vert[9] * l
        tempY = newY - vert[10] * l
        tempZ = newZ - vert[11] * l
    }
    //----------------------------------Now, if the object is closer than it's supposed to, push it away from the model and return the new coordinates
    tempDistance = point_distance_3d(newX, newY, newZ, tempX, tempY, tempZ);
    tempXup = (newX - tempX);
    tempYup = (newY - tempY);
    tempZup = (newZ - tempZ);
    if tempDistance <= addRadius and tempDistance > 0
    {
        tempXup /= tempDistance;
        tempYup /= tempDistance;
        tempZup /= tempDistance;
        dx = tempX + tempXup * addRadius - newX;
        dy = tempY + tempYup * addRadius - newY;
        dz = tempZ + tempZup * addRadius - newZ;
l = max(point_distance_3d(0, 0, 0, dx, dy, dz), 0.00001);
        dp = dot_product_3d(argument5, argument6, argument7, dx, dy, dz) / l;
        //-------------------------------The triangle that has the most similar normal to the player's up-vector gets saved to the up-vector (and is not used in this script)
        if dp >= maxDp
        {
            maxDp = dp
            returnXup = tempXup
            returnYup = tempYup
            returnZup = tempZup
        }
        newX += dx;
        newY += dy;
        newZ += dz;
        success = true;
    }
}

//Transform player coordinates back into object space
returnX = modelX + newX / transformScale;
returnY = modelY + newY / transformScale;
returnZ = modelZ + newZ / transformScale;
return success;


