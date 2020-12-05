/// @description smf_matrix_create_from_dualquat(Q[8])
/// @param Q[8]
//Dual quaternion must be normalized
//Source: http://en.wikipedia.org/wiki/Dual_quaternion
var Q, M;
Q = argument0;
M[15] = 1;

M[0] =  sqr(Q[3]) + sqr(Q[0]) - sqr(Q[1]) - sqr(Q[2]);
M[1] =  2 * (Q[0] * Q[1] + Q[2] * Q[3]);
M[2] =  2 * (Q[0] * Q[2] - Q[1] * Q[3]);

M[4] =  2 * (Q[0] * Q[1] - Q[2] * Q[3]);
M[5] =  sqr(Q[3]) - sqr(Q[0]) + sqr(Q[1]) - sqr(Q[2]);
M[6] =  2 * (Q[1] * Q[2] + Q[0] * Q[3]);

M[8] =  2 * (Q[0] * Q[2] + Q[1] * Q[3]);
M[9] =  2 * (Q[1] * Q[2] - Q[0] * Q[3]);
M[10] = sqr(Q[3]) - sqr(Q[0]) - sqr(Q[1]) + sqr(Q[2]);

M[12] = 2 * (-Q[7] * Q[0] + Q[4] * Q[3] + Q[6] * Q[1] - Q[5] * Q[2]);
M[13] = 2 * (-Q[7] * Q[1] + Q[5] * Q[3] + Q[4] * Q[2] - Q[6] * Q[0]);
M[14] = 2 * (-Q[7] * Q[2] + Q[6] * Q[3] + Q[5] * Q[0] - Q[4] * Q[1]);
return M;


