/// @description smf_quat_normalize(Q)
/// @param Q[4]
var Q, l, d;
Q = argument0;
l = sqrt(sqr(Q[0]) + sqr(Q[1]) + sqr(Q[2]) + sqr(Q[3]));
if l < 0.00001
{
	l = 1;
	Q[0] = 1;
	Q[1] = 0;
	Q[2] = 0;
	Q[3] = 0;
}
l = 1 / l;
Q[0] *= l
Q[1] *= l
Q[2] *= l
Q[3] *= l

return Q;


