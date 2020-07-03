///draw_floor(x1, y1, z1, x2, y2, z2, texture, hrepeat, vrepeat)
var x1 = argument0, y1 = argument1, z1 = argument2, x2 = argument3, y2 = argument4, z2 = argument5, tex = argument6, hR = argument7, vR = argument8;
//Check if the floor is in view.
d3d_primitive_begin_texture(pr_trianglelist, tex);
d3d_vertex_texture(x1, y1, z1, 0, 0);
d3d_vertex_texture(x2, y1, z2, hR, 0);
d3d_vertex_texture(x1, y2, z1, 0, vR);
d3d_vertex_texture(x2, y1, z2, hR, 0);
d3d_vertex_texture(x2, y2, z2, hR, vR);
d3d_vertex_texture(x1, y2, z1, 0, vR);
d3d_primitive_end();
