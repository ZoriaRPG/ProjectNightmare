/// @description smf_quat_get_up(Q)
/// @param Q[4]
var Q = argument0, R;
R[0] = (Q[2] * Q[0] + Q[3] * Q[1]) * 2;
R[1] = (Q[2] * Q[1] - Q[3] * Q[0]) * 2;
R[2] = sqr(Q[3]) - sqr(Q[0]) - sqr(Q[1]) + sqr(Q[2]);
return R;


