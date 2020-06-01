///draw_wall(x1,y1,z1,x2,y2,z2,texture)
/*An optimized version of d3d_draw_wall. Uses vertex functions instead of using the bloated
preset primitive d3d_draw_* functions, and doesn't draw if outside the camera's view. Can
only be used in objCamera, because drawing 3D things must be kept in a single draw batch.*/
var x1=argument0,y1=argument1,z1=argument2,x2=argument3,y2=argument4,z2=argument5,
    tex=argument6,absP=-abs(global.cP)-350,left=global.cD-45,right=global.cD+45,
    dist=global.maxRender+absP;
//Check if the wall is in view.
if (rectangle_in_triangle(x1,y1,x2,y2,global.cX+lengthdir_x(absP,global.cD),
                          global.cY+lengthdir_y(absP,global.cD),
                          global.cX+lengthdir_x(dist,left),
                          global.cY+lengthdir_y(dist,left),
                          global.cX+lengthdir_x(dist,right),
                          global.cY+lengthdir_y(dist,right)))
{
    d3d_primitive_begin_texture(pr_trianglelist,tex);
    d3d_vertex_texture(x1,y1,z1,0,0);
    d3d_vertex_texture(x2,y2,z1,1,0);
    d3d_vertex_texture(x1,y1,z2,0,1);
    d3d_vertex_texture(x2,y2,z1,1,0);
    d3d_vertex_texture(x2,y2,z2,1,1);
    d3d_vertex_texture(x1,y1,z2,0,1);
    d3d_primitive_end();
}
