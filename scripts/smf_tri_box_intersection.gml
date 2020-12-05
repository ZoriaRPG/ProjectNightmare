/// @description smf_tri_box_intersection(boxCenterX, boxCenterY, boxCenterZ, boxhalfW, boxhalfL, boxhalfH, triVerts[9])
/// @param boxCenterX
/// @param boxCenterY
/// @param boxCenterZ
/// @param boxhalfW
/// @param boxhalfL
/// @param boxhalfH
/// @param triVerts[9]

/********************************************************/
/* AABB-triangle overlap test code                      */
/* by Tomas Akenine-Möller                              */
/* Function: int triBoxOverlap(float boxcenter[3],      */
/*          float boxhalfsize[3],float triverts[3][3]); */
/* History:                                             */
/*   2001-03-05: released the code in its first version */
/*   2001-06-18: changed the order of the tests, faster */
/*                                                      */
/* Acknowledgement: Many thanks to Pierre Terdiman for  */
/* suggestions and discussions on how to optimize code. */
/* Thanks to David Hunt for finding a ">="-bug!         */
/********************************************************/
/*    
Use separating axis theorem to test overlap between triangle and box
need to test for overlap in these directions:
1) the {x,y,z}-directions (actually, since we use the AABB of the triangle we do not even need to test these)
2) normal of the triangle
3) crossproduct(edge from tri, {x,y,z}-directin)
this gives 3x3=9 more tests 
*/
var _X = 0;
var _Y = 1;
var _Z = 2;

var boxCenter, boxhalfsize, triVerts;
boxCenter[0] = argument0;
boxCenter[1] = argument1;
boxCenter[2] = argument2;
boxhalfsize[0] = argument3;
boxhalfsize[1] = argument4;
boxhalfsize[2] = argument5;
triVerts = argument6;

var fex, fey, fez, p0, p1, p2;
var rad, Min, Max, normal, vmin, vmax, d;
var v0, v1, v2;
v0[_X] = triVerts[0] - boxCenter[0];
v0[_Y] = triVerts[1] - boxCenter[1];
v0[_Z] = triVerts[2] - boxCenter[2];
v1[_X] = triVerts[3] - boxCenter[0];
v1[_Y] = triVerts[4] - boxCenter[1];
v1[_Z] = triVerts[5] - boxCenter[2];
v2[_X] = triVerts[6] - boxCenter[0];
v2[_Y] = triVerts[7] - boxCenter[1];
v2[_Z] = triVerts[8] - boxCenter[2];

/* compute triangle edges */
var e0, e1, e2;
e0[_X] = v1[_X] - v0[_X];
e0[_Y] = v1[_Y] - v0[_Y];
e0[_Z] = v1[_Z] - v0[_Z];
e1[_X] = v2[_X] - v1[_X];
e1[_Y] = v2[_Y] - v1[_Y];
e1[_Z] = v2[_Z] - v1[_Z];
e2[_X] = v0[_X] - v2[_X];
e2[_Y] = v0[_Y] - v2[_Y];
e2[_Z] = v0[_Z] - v2[_Z];

/* Bullet 3:  */
/*  test the 9 tests first (this was faster) */
fex = abs(e0[_X]);
fey = abs(e0[_Y]);
fez = abs(e0[_Z]);
   
p0 = e0[_Z]*v0[_Y] - e0[_Y]*v0[_Z];
p2 = e0[_Z]*v2[_Y] - e0[_Y]*v2[_Z];
rad = fez * boxhalfsize[_Y] + fey * boxhalfsize[_Z];
if(min(p0, p2) > rad || max(p0, p2) <- rad) return 0;
   
p0 = -e0[_Z]*v0[_X] + e0[_X]*v0[_Z];
p2 = -e0[_Z]*v2[_X] + e0[_X]*v2[_Z];
rad = fez * boxhalfsize[_X] + fex * boxhalfsize[_Z];
if(min(p0, p2) > rad || max(p0, p2) <- rad) return 0;
           
p1 = e0[_Y]*v1[_X] - e0[_X]*v1[_Y];                 
p2 = e0[_Y]*v2[_X] - e0[_X]*v2[_Y];                 
rad = fey * boxhalfsize[_X] + fex * boxhalfsize[_Y];
if(min(p1, p2) > rad || max(p1, p2) <- rad) return 0;

fex = abs(e1[_X]);
fey = abs(e1[_Y]);
fez = abs(e1[_Z]);
	      
p0 = e1[_Z]*v0[_Y] - e1[_Y]*v0[_Z];
p2 = e1[_Z]*v2[_Y] - e1[_Y]*v2[_Z];
rad = fez * boxhalfsize[_Y] + fey * boxhalfsize[_Z];
if(min(p0, p2) > rad || max(p0, p2) <- rad) return 0;
          
p0 = -e1[_Z]*v0[_X] + e1[_X]*v0[_Z];
p2 = -e1[_Z]*v2[_X] + e1[_X]*v2[_Z];
rad = fez * boxhalfsize[_X] + fex * boxhalfsize[_Z];
if(min(p0, p2) > rad || max(p0, p2) <- rad) return 0;
	
p0 = e1[_Y]*v0[_X] - e1[_X]*v0[_Y];
p1 = e1[_Y]*v1[_X] - e1[_X]*v1[_Y];
rad = fey * boxhalfsize[_X] + fex * boxhalfsize[_Y];
if(min(p0, p1) > rad || max(p0, p1) <- rad) return 0;

fex = abs(e2[_X]);
fey = abs(e2[_Y]);
fez = abs(e2[_Z]);

p0 = e2[_Z]*v0[_Y] - e2[_Y]*v0[_Z];
p1 = e2[_Z]*v1[_Y] - e2[_Y]*v1[_Z];
rad = fez * boxhalfsize[_Y] + fey * boxhalfsize[_Z];
if(min(p0, p1) > rad || max(p0, p1) <- rad) return 0;

p0 = -e2[_Z]*v0[_X] + e2[_X]*v0[_Z];
p1 = -e2[_Z]*v1[_X] + e2[_X]*v1[_Z];
rad = fez * boxhalfsize[_X] + fex * boxhalfsize[_Z];
if(min(p0, p1) > rad || max(p0, p1) <- rad) return 0;
	
p1 = e2[_Y]*v1[_X] - e2[_X]*v1[_Y];
p2 = e2[_Y]*v2[_X] - e2[_X]*v2[_Y];
rad = fey * boxhalfsize[_X] + fex * boxhalfsize[_Y];
if(min(p1, p2) > rad || max(p1, p2) <- rad) return 0;

/* Bullet 1: */
/*  first test overlap in the {x,y,z}-directions */
/*  find min, max of the triangle each direction, and test for overlap in */
/*  that direction -- this is equivalent to testing a minimal AABB around */
/*  the triangle against the AABB */

/* test in X-direction */
if(min(v0[_X], v1[_X], v2[_X]) > boxhalfsize[_X] || max(v0[_X], v1[_X], v2[_X]) < -boxhalfsize[_X]) return 0;

/* test in Y-direction */
if(min(v0[_Y], v1[_Y], v2[_Y]) > boxhalfsize[_Y] || max(v0[_Y], v1[_Y], v2[_Y]) < -boxhalfsize[_X]) return 0;

/* test in Z-direction */
if(min(v0[_Z], v1[_Z], v2[_Z]) > boxhalfsize[_Z] || max(v0[_Z], v1[_Z], v2[_Z]) < -boxhalfsize[_X]) return 0;

/* Bullet 2: */
/*  test if the box intersects the plane of the triangle */
/*  compute plane equation of triangle: normal*x+d=0 */
//CROSS(normal,e0,e1);
normal[_X] = e0[_Y] * e1[_Z] - e0[_Z] * e1[_Y];
normal[_Y] = e0[_Z] * e1[_X] - e0[_X] * e1[_Z];
normal[_Z] = e0[_X] * e1[_Y] - e0[_Y] * e1[_X];
d = -dot_product_3d(normal[_X], normal[_Y], normal[_Z], v0[_X], v0[_Y], v0[_Z]);
	  
for(var q = 0; q < 3; q++)
{
	if (normal[q] > 0)
	{
		vmin[q] = -boxhalfsize[q];
		vmax[q] = boxhalfsize[q];
	}
	else
	{
		vmin[q] = boxhalfsize[q];
		vmax[q] = -boxhalfsize[q];
	}
}
if(dot_product_3d(normal[_X], normal[_Y], normal[_Z], vmin[_X], vmin[_Y], vmin[_Z]) + d > 0) return 0;
if(dot_product_3d(normal[_X], normal[_Y], normal[_Z], vmax[_X], vmax[_Y], vmax[_Z]) + d >= 0) return 1;

return 0;


