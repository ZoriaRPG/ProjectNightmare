/// @description smf_matrix_create_from_axisangle(a, b, c, angle)
/// @param a
/// @param b
/// @param c
/// @param angle
//Creates a rotation matrix
var u, v, w, a, c, s, d, M
u = argument0;
v = argument1;
w = argument2;
a = argument3;

c = cos(a);
s = sin(a);

M[15] = 1;

d = (1 - c) * u;
M[0] = c + u * d;
M[1] = v * d + w * s;
M[2] = w * d - v * s;

d = (1 - c) * v;
M[4] = u * d - w * s;
M[5] = c + v * d;
M[6] = w * d + u * s;

d = (1 - c) * w;
M[8] = u * d + v * s;
M[9] = v * d - u * s;
M[10] = c + w * d;

return M;


