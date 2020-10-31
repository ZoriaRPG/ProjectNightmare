//By DragoniteSpam
attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;

varying vec4 v_vColour;
varying vec2 v_vTexcoord;

void main() {
    mat4 modelView = gm_Matrices[MATRIX_WORLD_VIEW];
    // Column 0:
    modelView[0][0] = 1.;
    modelView[0][1] = 0.;
    modelView[0][2] = 0.;
    
    // Column 1:
    modelView[1][0] = 0.;
    modelView[1][1] = 1.;
    modelView[1][2] = 0.;
    
    // Column 2:
    //modelView[2][0] = 0.;
    //modelView[2][1] = 0.;
    modelView[2][2] = 1.;
    
    gl_Position = gm_Matrices[MATRIX_PROJECTION] * (modelView * vec4(in_Position, 1.));
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

