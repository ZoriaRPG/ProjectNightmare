///texture_get(textureID)
//Returns a static/animated texture based on the entered texture ID.
var texData = global.tex[| argument0], frames = image_get_number(texData[| 0]);
if (frames != 1) return (texData[| 2 + (current_time * texData[| 1]) mod (frames)]) //If the texture is animated, return the animated texture with a prepared frame
return (texData[| 2]) //Otherwise just return a static texture
