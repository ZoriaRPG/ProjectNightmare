///lerp_delta(val1, val2, amount)
//Works like lerp, but it's based on delta time.
var l = argument2;
if (l != 1)
    l = min(l * global.deltaTime, 1);
return (lerp(argument0, argument1, l))
