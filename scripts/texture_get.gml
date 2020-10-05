///texture_get(texture_id)
//Returns a static/animated texture based on the entered texture ID.
var frames = image_get_number(global.tex[argument0, 0]);
if (frames != 1) //If the texture is animated, return the animated texture with a prepared frame
    return (global.tex[argument0, 1 + (current_time * 0.008) mod (frames)])
return (global.tex[argument0, 1]) //Otherwise just return a static texture
