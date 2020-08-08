///texture_get(texture_id)
//Returns a static/animated texture based on the entered texture ID.
if (global.tAnimated[argument0]) //If the texture is animated, return the animated texture with a prepared frame
    return (global.tex[argument0, (current_time * 0.008) mod (global.tFrames[argument0])])
return (global.tex[argument0]) //Otherwise just return a static texture
