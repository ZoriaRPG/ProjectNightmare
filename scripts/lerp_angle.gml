///lerp_angle(angle1, angle2, amount)
//Lerps the angle correctly by converting them to vectors and then back to angles. Returns the new angle.
return (point_direction(0, 0, lerp(lengthdir_x(1, argument0), lengthdir_x(1, argument1), argument2), lerp(lengthdir_y(1, argument0), lengthdir_y(1, argument1), argument2)))
