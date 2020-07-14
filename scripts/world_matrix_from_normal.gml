///world_matrix_from_normal(nx,ny,nz,px,py,pz,scale)
//Made by Snidr
var nx = argument0, ny = argument1, nz = argument2, px = argument3, py = argument4, pz = argument5, scale = argument6;
//Normalize the input normal
var l = nx * nx + ny * ny + nz * nz;
if (l != 0 && l != 1)
{
    l = 1 / sqrt(l);
    nx *= l;
    ny *= l; 
    nz *= l;
}
//Orthogonalize x-axis to the normal
var xx = 1 - nx * nx, xy = - ny * nx, xz = - nz * nx, l = xx * xx + xy * xy + xz * xz;
if (l != 0 && l != 1)
{
    l = 1 / sqrt(l);
    xx *= l;
    xy *= l; 
    xz *= l;
}
//Orthogonalize y-axis to the normal
var yx = - nx * ny, yy = 1 - ny * ny, yz = - nz * ny, l = yx * yx + yy * yy + yz * yz;
if (l != 0 && l != 1)
{
    l = 1 / sqrt(l);
    yx *= l;
    yy *= l; 
    yz *= l;
}
//Construct matrix
var M = array_create(16);
M[0] = xx * scale;
M[1] = xy * scale;
M[2] = xz * scale;
M[4] = yx * scale;
M[5] = yy * scale;
M[6] = yz * scale;
M[8] = nx * scale;
M[9] = ny * scale;
M[10] = nz * scale;
M[12] = px;
M[13] = py;
M[14] = pz;
M[15] = 1;
return (M)
