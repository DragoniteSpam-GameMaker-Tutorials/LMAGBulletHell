attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 scale_amount;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position.xy * scale_amount, in_Position.z, 1.0);
    v_vTexcoord = in_TextureCoord;
    v_vColour = in_Colour;
}