///triangle_normal(x1, y1, z1, x2, y2, z2, x3, y3, z3)
var vec, normal;
vec[0] = argument3 - argument0;
vec[1] = argument4 - argument1;
vec[2] = argument5 - argument2;
vec[3] = argument6 - argument0;
vec[4] = argument7 - argument1;
vec[5] = argument8 - argument2;
normal[0] = vec[1] * vec[5] - vec[2] * vec[4];
normal[1] = vec[2] * vec[3] - vec[0] * vec[5];
normal[2] = vec[0] * vec[4] - vec[1] * vec[3];
d = sqrt(sqr(normal[0]) + sqr(normal[1]) + sqr(normal[2]));
normal[0] /= d;
normal[1] /= d;
normal[2] /= d;
return (normal)
