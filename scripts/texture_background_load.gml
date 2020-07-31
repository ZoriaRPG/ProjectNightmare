///texture_background_load(slot, background)
global.tex[argument0] = background_get_texture(argument1);
//Prepare size values for real world measuring
global.tSize[argument0, 0] = background_get_width(argument1) * 0.5;
global.tSize[argument0, 1] = background_get_height(argument1) * 0.5;
