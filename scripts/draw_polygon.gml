///draw_polygon(x1,y1,z1,x2,y2,z2,x3,y3,z3,texture,alwaysdraw,hrepeat,vrepeat)
var x1=argument0,y1=argument1,z1=argument2,x2=argument3,y2=argument4,z2=argument5,
    x3=argument6,y3=argument7,z3=argument8,tex=argument9,hR=argument11,vR=argument12,
    absP=-abs(global.cP)-350,left=global.cD-45,right=global.cD+45,
    dist=global.maxRender+absP;
//Check if the floor is in view.
if (argument10 || rectangle_in_triangle(x1,y1,x2,y2,global.cX+lengthdir_x(absP,global.cD),
                                       global.cY+lengthdir_y(absP,global.cD),
                                       global.cX+lengthdir_x(dist,left),
                                       global.cY+lengthdir_y(dist,left),
                                       global.cX+lengthdir_x(dist,right),
                                       global.cY+lengthdir_y(dist,right)))
{
    d3d_primitive_begin_texture(pr_trianglelist,tex);
    d3d_vertex_texture(x1,y1,z1,0,0);
    d3d_vertex_texture(x2,y2,z2,hR,0);
    d3d_vertex_texture(x3,y3,z3,0,vR);
    d3d_primitive_end();
}
