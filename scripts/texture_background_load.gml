///texture_background_load(background)
global.tex[global.textures] = background_get_texture(argument0);
//Prepare size values for real world measuring
global.tSize[global.textures, 0] = background_get_width(argument0) * 0.5;
global.tSize[global.textures, 1] = background_get_height(argument0) * 0.5;
global.textures++;
