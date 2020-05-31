///c_raycast_dist(xfrom,yfrom,zfrom,xto,yto,zto,mask)
/*Performs a raycast and returns the distance to the closest triangle.
Returns -1 if no triangle was hit.*/
if (c_raycast_world(argument0,argument1,argument2,argument3,argument4,argument5,argument6))
    return (point_distance_3d(argument0,argument1,argument2,c_hit_x(),c_hit_y(),c_hit_z()))
return (10000000)
