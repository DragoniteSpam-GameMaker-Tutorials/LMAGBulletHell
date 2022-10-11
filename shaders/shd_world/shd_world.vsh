attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;

varying vec4 v_vColour;

const float light_ambient = 0.35;

void main() {
    vec3 light_direction = normalize(vec3(-1, -1, -1));
    vec3 light_secondary = normalize(vec3(1, -1, -1));
    float light_secondary_intensity = 0.4;
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1);
    vec3 world_normal = normalize(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Normal, 0)).xyz;
    float NdotL = max(dot(world_normal, light_direction), 0.0);
    float NdotL2 = max(dot(world_normal, light_secondary * light_secondary_intensity), 0.0);
    v_vColour = in_Colour * clamp(NdotL + NdotL2, light_ambient, 1.0);
    v_vColour.a = in_Colour.a;
}