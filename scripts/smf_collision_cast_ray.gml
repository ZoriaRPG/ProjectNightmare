/// @description smf_collision_cast_ray(collisionBuffer, x1, y1, z1, x2, y2, z2)
/// @param collisionBuffer
/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/*
Casts a ray from one point to another and returns the position of the first collision with geometry

Script made by TheSnidr
www.TheSnidr.com
*/
var colBuffer = argument0, regionSize = 65535, progress = 0, stack = ds_stack_create();
var a, b, n, i, j, k, l, t, tri, tris, modelX, modelY, modelZ, modelSize, transformScale, lineStart, lineEnd, regionPos, bufferPos, halfRegionSize, region, intersect;
buffer_seek(colBuffer, buffer_seek_start, 0);
bufferPos = buffer_read(colBuffer, buffer_s32);
modelX = buffer_read(colBuffer, buffer_f32);
modelY = buffer_read(colBuffer, buffer_f32);
modelZ = buffer_read(colBuffer, buffer_f32);
modelSize = buffer_read(colBuffer, buffer_f32);
transformScale = regionSize / modelSize;
lineStart[0] = transformScale * (argument1 - modelX);
lineStart[1] = transformScale * (argument2 - modelY);
lineStart[2] = transformScale * (argument3 - modelZ);
lineEnd[0] = transformScale * (argument4 - modelX);
lineEnd[1] = transformScale * (argument5 - modelY);
lineEnd[2] = transformScale * (argument6 - modelZ);
regionPos[2] = 0;
returnNormal = -1;
returnNormal[2] = 1;
while true
{
    if (bufferPos > 0)
    {   //Iterate through the octree
        halfRegionSize = regionSize / 2;
        for (l = progress; l < 4; l ++)
        {
            if l == 0
            {   //Check either the starting region of the ray or the first region it intersects
                region[0] = (lineStart[0] > regionPos[0] + halfRegionSize);
                region[1] = (lineStart[1] > regionPos[1] + halfRegionSize);
                region[2] = (lineStart[2] > regionPos[2] + halfRegionSize);
                for (i = 0; i < 3; i ++)
                {
                    if (lineEnd[i] == lineStart[i]) continue;
                    if (lineStart[i] >= regionPos[i] and lineStart[i] <= regionPos[i] + regionSize) continue;
                    t = (regionPos[i] + region[i] * regionSize - lineStart[i]) / (lineEnd[i] - lineStart[i]);
                    if (t <= 0 or t >= 1) continue;
                    j = (i + 1) mod 3; k = (i + 2) mod 3;
                    intersect[j] = lerp(lineStart[j], lineEnd[j], t) - regionPos[j];
                    intersect[k] = lerp(lineStart[k], lineEnd[k], t) - regionPos[k];
                    if (intersect[j] < 0 or intersect[j] > regionSize or intersect[k] < 0 or intersect[k] > regionSize) continue;
                    region[j] = (intersect[j] > halfRegionSize);
                    region[k] = (intersect[k] > halfRegionSize);
                    break;
                }
            }
            else
            {   //Check for intersections with the middle plane of each dimension
                i = l - 1;
                if (lineEnd[i] == lineStart[i]) continue;
                t = (regionPos[i] + halfRegionSize - lineStart[i]) / (lineEnd[i] - lineStart[i]);
                if (t <= 0 or t >= 1) continue;
                j = (i + 1) mod 3; k = (i + 2) mod 3;
                intersect[j] = lerp(lineStart[j], lineEnd[j], t) - regionPos[j];
                intersect[k] = lerp(lineStart[k], lineEnd[k], t) - regionPos[k];
                if (intersect[j] < 0 or intersect[j] > regionSize or intersect[k] < 0 or intersect[k] > regionSize) continue;
                region[i] = (lineStart[i] < regionPos[i] + halfRegionSize);
                region[j] = (intersect[j] >= halfRegionSize);
                region[k] = (intersect[k] >= halfRegionSize);
            }
            //Push this region to stack
            ds_stack_push(stack, bufferPos);
            ds_stack_push(stack, regionPos[0]);
            ds_stack_push(stack, regionPos[1]);
            ds_stack_push(stack, regionPos[2]);
            ds_stack_push(stack, l);
            //Go to intersected child region
            if (region[0]){regionPos[0] += halfRegionSize; bufferPos += 4;}
            if (region[1]){regionPos[1] += halfRegionSize; bufferPos += 8;}
            if (region[2]){regionPos[2] += halfRegionSize; bufferPos += 16;}
            buffer_seek(colBuffer, buffer_seek_start, bufferPos);
            bufferPos = buffer_read(colBuffer, buffer_s32);
            regionSize /= 2;
            progress = 0;
            break;
        }
        if (l < 4) continue; //If we ended the for-loop prematurely, we should also restart the while-loop
    }
    else
    {   //If this is a leaf region, check for intersections with the triangles in this leaf
        l = 0;
        buffer_seek(colBuffer, buffer_seek_start, -bufferPos);
        repeat buffer_read(colBuffer, buffer_u16) tris[l++] = buffer_read(colBuffer, buffer_u16);
        repeat l
        {   //Find intersection with triangle plane
            tri = smf_collision_get_triangle(colBuffer, tris[--l]);
            t = dot_product_3d(tri[9], tri[10], tri[11], lineEnd[0] - lineStart[0], lineEnd[1] - lineStart[1], lineEnd[2] - lineStart[2]);
            if (t == 0) continue;
            t = dot_product_3d(tri[9], tri[10], tri[11], tri[0] - lineStart[0], tri[1] - lineStart[1], tri[2] - lineStart[2]) / t;
            if (t <= 0 or t >= 1) continue;
            intersect[0] = lerp(lineStart[0], lineEnd[0], t);
            intersect[1] = lerp(lineStart[1], lineEnd[1], t);
            intersect[2] = lerp(lineStart[2], lineEnd[2], t);
            //Check if the intersection is inside the triangle. If not, discard and continue.
            a[0] = intersect[0] - tri[0]; a[1] = intersect[1] - tri[1]; a[2] = intersect[2] - tri[2];
            b[0] = tri[3] - tri[0]; b[1] = tri[4] - tri[1]; b[2] = tri[5] - tri[2];
            if (dot_product_3d(tri[9], tri[10], tri[11], a[2] * b[1] - a[1] * b[2], a[0] * b[2] - a[2] * b[0], a[1] * b[0] - a[0] * b[1]) <= 0) continue;
            a[0] = intersect[0] - tri[3]; a[1] = intersect[1] - tri[4]; a[2] = intersect[2] - tri[5];
            b[0] = tri[6] - tri[3]; b[1] = tri[7] - tri[4]; b[2] = tri[8] - tri[5];
            if (dot_product_3d(tri[9], tri[10], tri[11], a[2] * b[1] - a[1] * b[2], a[0] * b[2] - a[2] * b[0], a[1] * b[0] - a[0] * b[1]) <= 0) continue;
            a[0] = intersect[0] - tri[6]; a[1] = intersect[1] - tri[7]; a[2] = intersect[2] - tri[8];
            b[0] = tri[0] - tri[6]; b[1] = tri[1] - tri[7]; b[2] = tri[2] - tri[8];
            if (dot_product_3d(tri[9], tri[10], tri[11], a[2] * b[1] - a[1] * b[2], a[0] * b[2] - a[2] * b[0], a[1] * b[0] - a[0] * b[1]) <= 0) continue;
            //The line intersects the triangle. Save the triangle normal and intersection.
            returnNormal[0] = tri[9];
            returnNormal[1] = tri[10];
            returnNormal[2] = tri[11];
            lineEnd = intersect;
            intersect = -1;
        }
    }
    if !ds_stack_size(stack) break; //If the stack is empty, break the loop
    //Pop the previous region from stack
    progress = ds_stack_pop(stack) + 1;
    regionPos[2] = ds_stack_pop(stack);
    regionPos[1] = ds_stack_pop(stack);
    regionPos[0] = ds_stack_pop(stack);
    bufferPos = ds_stack_pop(stack);
    regionSize *= 2;
}
ds_stack_destroy(stack);
returnX = modelX + lineEnd[0] / transformScale;
returnY = modelY + lineEnd[1] / transformScale;
returnZ = modelZ + lineEnd[2] / transformScale;


