///place_meeting_3d(x,y,z,obj);
with (argument3) {
    var xx = argument0, yy = argument1, zz = argument2,hw = other.sprite_width * 0.5,hl = other.sprite_height * 0.5,h  = other.height;
    if (xx > x - hw + 1 &&
        xx < x + sprite_width  + hw - 1 &&
        yy > y - hl + 1 &&
        yy < y + sprite_height + hl - 1 &&
        zz > z - h  + 1 &&
        zz < z + height - 1) {
            return true;
            }
    }
return false;
