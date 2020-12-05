/// @description smf_line_plane_intersection(lineStart, lineEnd, planePos, planeN)
/// @param lineStart
/// @param lineEnd
/// @param planePos
/// @param planeN
/*
Script made by TheSnidr

www.thesnidr.com
*/
var lineStart, lineEnd, planePos, planeN, d, t, ret;
lineStart = argument0;
lineEnd = argument1;
planePos = argument2;
planeN = argument3;
d[0] = (lineEnd[0] - lineStart[0]);
d[1] = (lineEnd[1] - lineStart[1]);
d[2] = (lineEnd[2] - lineStart[2]);
t = d[0] * planeN[0] + d[1] * planeN[1] + d[2] * planeN[2];
if t == 0{return false;}
t = ((planePos[0] - lineStart[0]) * planeN[0] + (planePos[1] - lineStart[1]) * planeN[1] + (planePos[2] - lineStart[2]) * planeN[2]) / t;
if t < 0 or t > 1{return false;}
ret[0] = lineStart[0] + d[0] * t;
ret[1] = lineStart[1] + d[1] * t;
ret[2] = lineStart[2] + d[2] * t;
return ret;


