/// @description smf_collision_get_region(collisionBuffer, x, y, z)
/// @param collisionBuffer
/// @param x
/// @param y
/// @param z
/*
Returns an array containing the buffer positions of all triangles in this region

Script made by TheSnidr
www.TheSnidr.com
*/
var r, n, s = 65535, ret = -1;
buffer_seek(argument0, buffer_seek_start, 0);
r = buffer_read(argument0, buffer_s32);
while r
{
	s /= 2;
	if (argument1 >= s){argument1 -= s; r += 4;}
	if (argument2 >= s){argument2 -= s; r += 8;}
	if (argument3 >= s){argument3 -= s; r += 16;}
	buffer_seek(argument0, buffer_seek_start, r)
	r = buffer_read(argument0, buffer_s32);
}
buffer_seek(argument0, buffer_seek_start, -r);
n = buffer_read(argument0, buffer_u16);
repeat n{ret[--n] = buffer_read(argument0, buffer_u16);}
return ret;


