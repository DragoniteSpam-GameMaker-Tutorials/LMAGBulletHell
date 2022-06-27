attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;

varying vec4 v_vColour;

const float light_ambient = 0.3;

void main() {
    vec3 light_direction = normalize(vec3(-1, -1, -1));
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1);
    vec3 world_normal = normalize(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Normal, 0)).xyz;
    float NdotL = dot(world_normal, light_direction);
    v_vColour = in_Colour * max(light_ambient, NdotL);
    v_vColour.a = in_Colour.a;
}