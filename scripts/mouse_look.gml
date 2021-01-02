///mouse_look(vertical)
if (global.gamepad) //Controller
{
    faceDir += (global.bind[11, 6] - global.bind[13, 5]) * 2.5;
    if (argument0) facePitch = clamp(pitch + (global.bind[10, 5] - global.bind[12, 6]) * 2.5, -89.95, 89.95);
}
else if (window_has_focus()) //Mouse (hard-coded, why would you want to move the camera with keys anyway?)
{
    var gW = window_get_x() + window_get_width() * 0.5, gH = window_get_y() + window_get_height() * 0.5;
    faceDir -= (display_mouse_get_x() - gW) / sensX;
    if (argument0) facePitch = clamp(pitch - ((display_mouse_get_y() - gH) / sensY), -89.95, 89.95);
    display_mouse_set(gW, gH);
}
