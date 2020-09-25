///bind_check(bind, state)
/*Checks for mouse/keyboard/controller input for a specific bind.

bind - the control index to check inputs on
state values:
0 - held
1 - pressed
2 - released
3 - held, right side of axis
4 - held, left side of axis

Returns false by default, true if a button is pressed, or the value of an axis' threshold.*/
var con = gamepad_is_connected(0), keyBind = global.bind[argument0, 0], conBind = global.bind[argument0, 1], get = false;
switch (argument1)
{
    case (0): //Held
    case (3): //Held, positive axis
    case (4): //Held, negative axis
        if (con)
            switch (conBind)
            {
                //Check for analog sticks
                case (gp_axislv):
                case (gp_axislh):
                case (gp_axisrv):
                case (gp_axisrh):
                    get = gamepad_axis_value(0, conBind);
                    switch (argument1)
                    {
                        case (3): get = max(0, get); break //Right side of axis
                        case (4): get = abs(min(0, get)); break //Left side of axis
                        default: get = abs(get) >= 0.5; //Turned to any side
                    }
                break
                default: get = gamepad_button_check(0, conBind); //Normal buttons
            } 
        else
            switch (keyBind)
            {
                case (mb_left):
                case (mb_middle):
                case (mb_right):
                    get = mouse_check_button(keyBind);
                break
                default: get = keyboard_check(keyBind);
            }
    break
    case (1): get = bind_hardcode_pressed(keyBind, conBind); break //Pressed
    case (2):
        if (con)
            get = gamepad_button_check_released(0, conBind);
        else
            switch (keyBind)
            {
                case (mb_left):
                case (mb_middle):
                case (mb_right):
                    get = mouse_check_button_released(keyBind);
                break
                default: get = keyboard_check_released(keyBind);
            }
    break
}
return (get)
