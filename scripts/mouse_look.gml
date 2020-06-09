///mouse_look(vertical)
if (window_has_focus())
{
    var gX=display_mouse_get_x(),gW=display_get_width()*0.5,
        gY=display_mouse_get_y(),gH=display_get_height()*0.5;
    faceDir-=(gX-gW)/sensX;
    if (argument0)
        pitch=clamp(pitch-((gY-gH)/sensY),-89.95,89.95);
    display_mouse_set(gW,gH);
}
