/// @description smf_orthogonalize(a, b, c, x, y, z)
/// @param a
/// @param b
/// @param c
/// @param x
/// @param y
/// @param z
/*
Script made by TheSnidr

www.thesnidr.com
*/
var l = argument0 * argument3 + argument1 * argument4 + argument2 * argument5;
returnX = argument3 - argument0 * l;
returnY = argument4 - argument1 * l;
returnZ = argument5 - argument2 * l;


