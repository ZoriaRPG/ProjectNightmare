///mouse_look(vertical)
if (window_has_focus())
{
    var gW = window_get_x() + window_get_width() * 0.5, gH = window_get_y() + window_get_height() * 0.5;
    faceDir -= (display_mouse_get_x() - gW) / sensX;
    if (argument0)
        pitch = clamp(pitch - ((display_mouse_get_y() - gH) / sensY), -89.95, 89.95);
    display_mouse_set(gW, gH);
}
