/// @description smf_dualquat_get_conjugate(Q)
/// @param Q[8]
var Q = argument0;
Q[0] = -Q[0];
Q[1] = -Q[1];
Q[2] = -Q[2];
Q[4] = -Q[4];
Q[5] = -Q[5];
Q[6] = -Q[6];
return Q;


