///draw_floor(x1,y1,z1,x2,y2,z2,texture,alwaysdraw,hrepeat,vrepeat)
var x1=argument0,y1=argument1,z1=argument2,x2=argument3,y2=argument4,z2=argument5,
    tex=argument6,hR=argument8,vR=argument9,absP=-abs(global.cP)-350,left=global.cD-45,
    right=global.cD+45,dist=global.maxRender+absP;
//Check if the floor is in view.
if (argument7 || rectangle_in_view(x1,y1,x2,y2))
{
    d3d_primitive_begin_texture(pr_trianglelist,tex);
    d3d_vertex_texture(x1,y1,z1,0,0);
    d3d_vertex_texture(x2,y1,z2,hR,0);
    d3d_vertex_texture(x1,y2,z1,0,vR);
    d3d_vertex_texture(x2,y1,z2,hR,0);
    d3d_vertex_texture(x2,y2,z2,hR,vR);
    d3d_vertex_texture(x1,y2,z1,0,vR);
    d3d_primitive_end();
}
