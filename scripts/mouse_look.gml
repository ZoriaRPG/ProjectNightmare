///mouse_look(vertical)
if (gamepad_is_connected(0)) //Controller
{
    faceDir += (bind_check(11, 4) - bind_check(13, 3)) * 2.5;
    if (argument0) pitch = clamp(pitch + (bind_check(12, 3) - bind_check(10, 4)) * 2.5, -89.95, 89.95);
}
else
    if (window_has_focus()) //Mouse (hard-coded, why would you want to move the camera with keys anyway?)
    {
        var gW = window_get_x() + window_get_width() * 0.5, gH = window_get_y() + window_get_height() * 0.5;
        faceDir -= (display_mouse_get_x() - gW) / sensX;
        if (argument0) pitch = clamp(pitch - ((display_mouse_get_y() - gH) / sensY), -89.95, 89.95);
        display_mouse_set(gW, gH);
    }
