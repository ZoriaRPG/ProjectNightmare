///bind_axis(conBind, invert)
var get = gamepad_axis_value(0, global.bind[argument0, 1]), aGet = abs(get), pos = max(0, get), neg = abs(min(0, get));
if (aGet > 0.05)
{
    global.bind[argument0, 2] = aGet >= 0.5;
    if (argument1) //Other way around
    {
        global.bind[argument0, 5] = neg; //Negative side of axis
        global.bind[argument0, 6] = pos; //Positive side of axis
    }
    else //Normal
    {
        global.bind[argument0, 5] = pos; //Positive side of axis
        global.bind[argument0, 6] = neg; //Negative side of axis
    }
}
