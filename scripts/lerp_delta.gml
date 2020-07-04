///lerp_delta(val1, val2, amount)
//Works like lerp, but it will lerp based on the delta time.
var l = argument2;
if (l != 1)
    l *= global.deltaTime;
return (lerp(argument0, argument1, l))
