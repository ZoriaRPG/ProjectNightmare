//
// SMF animation shader
//
attribute vec3 in_Position;                // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)
attribute vec2 in_TextureCoord;            // (u,v)
attribute vec4 in_Colour;                  //(bone1, bone2, weight1, weight2)
attribute vec4 in_Colour2;                  //(bone1, bone2, weight1, weight2)

varying vec2 v_vTexcoord;
varying float v_vShading;

const int maxBones = 64;
uniform vec4 boneDQ[2*maxBones];
uniform vec3 lightDirection;

void main()
{
    v_vTexcoord = in_TextureCoord;

    //Get bone indices and bone weights
    int bone1 = int(in_Colour.r * 510.0);
    int bone2 = int(in_Colour.g * 510.0);
    int bone3 = int(in_Colour.b * 510.0);
    int bone4 = int(in_Colour.a * 510.0);
    float weight1 = in_Colour2.r;
    float weight2 = in_Colour2.g;
    float weight3 = in_Colour2.b;
    float weight4 = in_Colour2.a;
    
    //Blend bones
    vec4 blendReal = 
boneDQ[bone1] * weight1 + 
boneDQ[bone2] * weight2 + 
boneDQ[bone3] * weight3 + 
boneDQ[bone4] * weight4;
    vec4 blendDual = 
boneDQ[bone1+1] * weight1 + 
boneDQ[bone2+1] * weight2 + 
boneDQ[bone3+1] * weight3 + 
boneDQ[bone4+1] * weight4;
    
    //Normalize resulting dual quaternion
    float blendNormReal = 1.0 / length(blendReal);
    blendReal *= blendNormReal;
    blendDual = (blendDual - blendReal * dot(blendReal, blendDual)) * blendNormReal;

    //Transform vertex
    vec3 objectSpacePos = in_Position;
    //Rotation
    objectSpacePos += 2.0 * cross(blendReal.xyz, cross(blendReal.xyz, in_Position) + blendReal.w * in_Position);
    //Translation
    objectSpacePos += 2.0 * (blendReal.w * blendDual.xyz - blendDual.w * blendReal.xyz + cross(blendReal.xyz, blendDual.xyz));
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(objectSpacePos, 1.0);


    //Transform normal vector
    vec3 objectSpaceNormal = in_Normal + 2.0 * cross(blendReal.xyz, cross(blendReal.xyz, in_Normal) + blendReal.w * in_Normal);
vec3 worldSpaceNormal = mat3(gm_Matrices[MATRIX_WORLD]) * objectSpaceNormal;
v_vShading = 0.5 + 0.7 * max(dot(normalize(worldSpaceNormal), normalize(lightDirection)), 0.0);
}


//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying float v_vShading;

void main()
{
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
gl_FragColor.rgb *= v_vShading;
}




