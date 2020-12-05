/// @description smf_matrix_orthogonalize(4x4matrix)
/// @param 4x4matrix
/*
Script made by TheSnidr

www.thesnidr.com
*/
var M = argument0;
smf_normalize(M[0], M[1], M[2]);
M[@ 0] = returnX;
M[@ 1] = returnY;
M[@ 2] = returnZ;
M[@ 3] = 0;
smf_orthogonalize(M[0], M[1], M[2], M[8], M[9], M[10]);
smf_normalize(returnX, returnY, returnZ);
M[@ 8] = returnX;
M[@ 9] = returnY;
M[@ 10] = returnZ;
M[@ 11] = 0;
smf_cross_product(M[8], M[9], M[10], M[0], M[1], M[2]);
smf_normalize(returnX, returnY, returnZ);
M[@ 4] = returnX;
M[@ 5] = returnY;
M[@ 6] = returnZ;
M[@ 7] = 0;
M[@ 15] = 1;


