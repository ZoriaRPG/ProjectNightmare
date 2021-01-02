//By DragoniteSpam
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                    // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

uniform vec3 lightDirection;
uniform vec4 lightColor;
uniform vec4 lightAmbient;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec3 v_worldPosition;

void main() {
    vec4 object_space_pos = vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_worldPosition = (gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos).xyz;
    
    vec3 lightDir = normalize(-lightDirection);
    vec3 worldNormal = normalize(gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.)).xyz;
    
    float lightAngleDifference = max(dot(worldNormal, lightDir), 0.);
    
    v_vColour = in_Colour * vec4(min(lightAmbient + lightColor * lightAngleDifference, vec4(1.)).rgb, in_Colour.a);
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//By DragoniteSpam
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec3 v_worldPosition;

uniform float fogStart;
uniform float fogEnd;
uniform vec4 fogColor;

void main() {
    vec4 starting_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    float dist = length(v_worldPosition);
    
    float fraction = clamp((dist - fogStart) / (fogEnd - fogStart), 0.0, 1.0);
    
    vec4 final_color = mix(starting_color, fogColor, fraction);
    
    gl_FragColor = final_color;
}
