/// @description smf_matrix_orthogonalize_up(Matrix)
/// @param 4x4matrix
//Orthogonalizes and normalizes a given matrix
/*
Script made by TheSnidr

www.thesnidr.com
*/
var M = argument0;
smf_normalize(M[8], M[9], M[10]);
M[@ 8] = returnX;
M[@ 9] = returnY;
M[@ 10] = returnZ;
M[@ 11] = 0;
smf_orthogonalize(M[8], M[9], M[10], M[0], M[1], M[2]);
smf_normalize(returnX, returnY, returnZ);
M[@ 0] = returnX;
M[@ 1] = returnY;
M[@ 2] = returnZ;
M[@ 3] = 0;
smf_cross_product(M[8], M[9], M[10], M[0], M[1], M[2]);
smf_normalize(returnX, returnY, returnZ);
M[@ 4] = returnX;
M[@ 5] = returnY;
M[@ 6] = returnZ;
M[@ 7] = 0;
M[@ 15] = 1;


