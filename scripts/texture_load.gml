///texture_load(background/sprite, animated)
/*Loads a texture. If animated is true, the texture must be an animated sprite. Otherwise just put a background.
Returns void, but creates 4 variables:

    global.tex[tid(, frame)] = the texture itself (2nd array slot is available if animated)
    global.tSize[tid(, dimension)] = the size of the texture, divided by 2. dimension 0 is width and 1 is height
    global.tFrames[tid] = the amount of frames a texture has, if it's animated
    global.tAnimated[tid] = bool for checking if the texture is animated or not
*/
//First, check if the texture is set to be animated.
if (argument1) //If it is, set the texture's variable to a 2D array, containing the texture ID and all of its frames.
{
    for (i = 0; i < sprite_get_number(argument0); i++)
        global.tex[global.textures, i] = sprite_get_texture(argument0, i);
    global.tSize[global.textures, 0] = sprite_get_width(argument0) * 0.5;
    global.tSize[global.textures, 1] = sprite_get_height(argument0) * 0.5;
    global.tFrames[global.textures] = sprite_get_number(argument0);
}
else
{   //If it's not animated, set its variable to a 1D array.
    global.tex[global.textures] = background_get_texture(argument0);
    global.tSize[global.textures, 0] = background_get_width(argument0) * 0.5;
    global.tSize[global.textures, 1] = background_get_height(argument0) * 0.5;
}
global.tAnimated[global.textures] = argument1;
global.textures++;
