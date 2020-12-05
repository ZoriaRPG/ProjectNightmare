/// @description smf_matrix_create(x,y,z,xto,yto,zto,xup,yup,zup)
/// @param x
/// @param y
/// @param z
/// @param xto
/// @param yto
/// @param zto
/// @param xup
/// @param yup
/// @param zup
//Creates a 4x4 matrix with the to-direction as master
/*
Script made by TheSnidr

www.thesnidr.com
*/
var M;
smf_normalize(argument3, argument4, argument5)
M[0] = returnX
M[1] = returnY
M[2] = returnZ
M[3] = 0
smf_orthogonalize(M[0], M[1], M[2], argument6, argument7, argument8)
smf_normalize(returnX, returnY, returnZ);
M[8] = returnX
M[9] = returnY
M[10] = returnZ
M[11] = 0
smf_cross_product(M[8], M[9], M[10], M[0], M[1], M[2])
smf_normalize(returnX, returnY, returnZ)
M[4] = returnX
M[5] = returnY
M[6] = returnZ
M[7] = 0
M[12] = argument0
M[13] = argument1
M[14] = argument2
M[15] = 1
return M;


