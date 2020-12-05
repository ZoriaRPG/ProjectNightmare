/// @description smf_quat_create(angle, ax, ay, az,)
/// @param angle
/// @param ax
/// @param ay
/// @param az
//Creates a quaternion from axis angle
var T, c, s, Q, TR, i;
argument0 /= 2;
c = cos(argument0);
s = sin(argument0);

Q[0] = argument1 * s;
Q[1] = argument2 * s;
Q[2] = argument3 * s;
Q[3] = c

return Q;


