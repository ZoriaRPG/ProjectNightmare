///draw_floor(x1,y1,z1,x2,y2,z2,texture,alwaysdraw)
var x1=argument0,y1=argument1,z1=argument2,x2=argument3,y2=argument4,z2=argument5,
    tex=argument6,absP=-abs(global.cP),left=global.cD-45,right=global.cD+45;
var dist=global.maxRender+absP;
//Check if the floor is in view.
if (argument7 || rectangle_in_triangle(x1,y1,x2,y2,global.cX+lengthdir_x(absP,global.cD),
                          global.cY+lengthdir_y(absP,global.cD),
                          global.cX+lengthdir_x(dist,left),
                          global.cY+lengthdir_y(dist,left),
                          global.cX+lengthdir_x(dist,right),
                          global.cY+lengthdir_y(dist,right)))
{
    d3d_primitive_begin_texture(pr_trianglelist,tex);
    d3d_vertex_texture(x1,y1,z1,0,0);
    d3d_vertex_texture(x2,y1,z2,1,0);
    d3d_vertex_texture(x1,y2,z1,0,1);
    d3d_vertex_texture(x2,y1,z2,1,0);
    d3d_vertex_texture(x2,y2,z2,1,1);
    d3d_vertex_texture(x1,y2,z1,0,1);
    d3d_primitive_end();
}
