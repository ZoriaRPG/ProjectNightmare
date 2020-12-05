/// @description smf_quat_get_conjugate(Q)
/// @param Q[4]
var Q = argument0;
Q[3] = -Q[3];
return Q;


