varying vec2 v_vTexcoord;

uniform vec2 texSize;

uniform vec3 outlineColor;

void main()
{
    mat3 sobelx = mat3(
         1.0,  2.0,  1.0,
         0.0,  0.0,  0.0,
        -1.0, -2.0, -1.0
    );
    mat3 sobely = mat3(
         1.0,  0.0,  -1.0,
         2.0,  0.0,  -2.0,
         1.0,  0.0,  -1.0
    );
    mat3 magnitudes;// = mat3(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            vec2 coords = vec2(v_vTexcoord.x + (float(i) - 1.0) / texSize.x, v_vTexcoord.y + (float(j) - 1.0) / texSize.y);
            //magnitudes[i][j] = length(texture2D(gm_BaseTexture, coords).rgb);
            magnitudes[i][j] = texture2D(gm_BaseTexture, coords).a;
        }
    }
    
    float x = dot(sobelx[0], magnitudes[0]) + dot(sobelx[1], magnitudes[1]) + dot(sobelx[2], magnitudes[2]);
    float y = dot(sobely[0], magnitudes[0]) + dot(sobely[1], magnitudes[1]) + dot(sobely[2], magnitudes[2]);
    
    float final = pow(sqrt(x * x + y * y) / 2.0, 2.);
    //final = 1.0 - clamp(final, 0.0, 1.0);
    
    gl_FragColor = vec4(outlineColor, final);
}