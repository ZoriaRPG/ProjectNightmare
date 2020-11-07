///bind_hardcode_pressed(key/mbutton, controller)
if (global.gamepad) get = gamepad_button_check_pressed(0, argument1);
else
    switch (argument0)
    {
        //Check if bound to mouse (same for Released)
        case (mb_left):
        case (mb_middle):
        case (mb_right): get = mouse_check_button_pressed(argument0); break
        default: get = keyboard_check_pressed(argument0); //Just key buttons
    }
return (get)
