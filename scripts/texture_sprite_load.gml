///texture_sprite_load(slot,sprite)
for (var i=0;i<sprite_get_number(argument1);i++)
    global.spr[argument0,i]=sprite_get_texture(argument1,i);
//Prepare size values for real world measuring
global.sSize[argument0,0]=sprite_get_width(argument1)/2;
global.sSize[argument0,1]=sprite_get_height(argument1)/2;
//Prepare frames values for animations
var frames=sprite_get_number(argument1);
global.sFrames[argument0,0]=frames/4;
global.sFrames[argument0,1]=frames-1;
