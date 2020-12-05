/// @description smf_dualquat_create(angle, ax, ay, az, x, y, z)
/// @param angle
/// @param ax
/// @param ay
/// @param az
/// @param x
/// @param y
/// @param z
//Creates a dual quaternion from axis angle and a translation vector
//Source: http://en.wikipedia.org/wiki/Dual_quaternion
var T, c, s, Q, TR, i;
argument0 /= 2;
c = cos(argument0);
s = sin(argument0);

Q[0] = argument1 * s;
Q[1] = argument2 * s;
Q[2] = argument3 * s;
Q[3] = c

T[0] = argument4;
T[1] = argument5;
T[2] = argument6;
T[3] = 0;

TR = smf_quat_multiply(T, Q);
for (var i = 0; i < 4; i ++){Q[i + 4] = TR[i] / 2;}

return Q;


