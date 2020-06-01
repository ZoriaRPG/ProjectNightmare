///rectangle_in_view(x1,y1,x2,y2)
var absP=-abs(global.cP)-350,left=global.cD-45,right=global.cD+45,
    dist=global.maxRender+absP;
//Check if it's in view.
return (rectangle_in_triangle(argument0,argument1,argument2,argument3,
                              global.cX+lengthdir_x(absP,global.cD),
                              global.cY+lengthdir_y(absP,global.cD),
                              global.cX+lengthdir_x(dist,left),
                              global.cY+lengthdir_y(dist,left),
                              global.cX+lengthdir_x(dist,right),
                              global.cY+lengthdir_y(dist,right)))
