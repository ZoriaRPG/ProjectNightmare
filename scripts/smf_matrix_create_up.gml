/// @description smf_matrix_create_up(x,y,z,xto,yto,zto,xup,yup,zup)
/// @param x
/// @param y
/// @param z
/// @param xto
/// @param yto
/// @param zto
/// @param xup
/// @param yup
/// @param zup
//Creates a 4x4 matrix with the up-direction as master
/*
Script made by TheSnidr

www.thesnidr.com
*/
var M;
M[15] = 1
M[12] = argument0
M[13] = argument1
M[14] = argument2
smf_normalize(argument6, argument7, argument8);
M[8] = returnX;
M[9] = returnY;
M[10] = returnZ;
smf_orthogonalize(M[8], M[9], M[10], argument3, argument4, argument5);
smf_normalize(returnX, returnY, returnZ);
M[0] = returnX
M[1] = returnY
M[2] = returnZ
smf_cross_product(M[8], M[9], M[10], M[0], M[1], M[2])
smf_normalize(returnX, returnY, returnZ)
M[4] = returnX
M[5] = returnY
M[6] = returnZ
return M;


