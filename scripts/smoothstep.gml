/// smoothstep(upper_bound, lower_bound, value)
/*Returns 0 when (x < a), 1 when (x >= b), a smooth transition from 0 to 1 otherwise, or
(-1) on error (a == b).

GMLscripts.com/license*/
if (argument2 < argument0)
    return (0)
if (argument2 >= argument1)
    return (1)
if (argument0 == argument1)
    return (-1)
var p = (argument2 - argument0) / (argument1 - argument0);
return (p * p * (3 - 2 * p))
