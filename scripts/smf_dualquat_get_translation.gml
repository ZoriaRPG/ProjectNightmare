/// @description smf_dualquat_get_translation(Q)
/// @param Q[8]
//Returns the translation of a given dual quaternion
var Q = argument0, R;
R[0] = 2 * (-Q[7] * Q[0] + Q[4] * Q[3] + Q[6] * Q[1] - Q[5] * Q[2]);
R[1] = 2 * (-Q[7] * Q[1] + Q[5] * Q[3] + Q[4] * Q[2] - Q[6] * Q[0]);
R[2] = 2 * (-Q[7] * Q[2] + Q[6] * Q[3] + Q[5] * Q[0] - Q[4] * Q[1]);
return R;


