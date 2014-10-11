//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~/**
 * shaderCamera
 * MIT Licenced
 * A compilation of shader effects for use in the game camera.
 * Blur, Color Correction, Gamma, Vertical Godrays/Glow,
 */
 
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
 /**************************************************
 * GLSL Perlin Noise
 * Forked from Stefan Gustavson under MIT Licence
 *************************************************/
vec3 mod289(vec3 x)
{
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec4 mod289(vec4 x)
{
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec4 permute(vec4 x)
{
    return mod289(((x * 34.0) + 1.0) * x);
}

vec4 taylorInvSqrt(vec4 r)
{
    return 1.79284291400159 - 0.85373472095314 * r;
}

vec3 fade(vec3 t)
{
    return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
}

float pnoise(vec3 P, vec3 rep)
{
    vec3 Pi0 = mod(floor(P), rep);
    vec3 Pi1 = mod(Pi0 + vec3(1.0), rep);
    Pi0 = mod289(Pi0);
    Pi1 = mod289(Pi1);
    vec3 Pf0 = fract(P);
    vec3 Pf1 = Pf0 - vec3(1.0);
    vec4 ix = vec4(Pi0.x, Pi1.x, Pi0.x, Pi1.x);
    vec4 iy = vec4(Pi0.yy, Pi1.yy);
    vec4 iz0 = Pi0.zzzz;
    vec4 iz1 = Pi1.zzzz;

    vec4 ixy = permute(permute(ix) + iy);
    vec4 ixy0 = permute(ixy + iz0);
    vec4 ixy1 = permute(ixy + iz1);

    vec4 gx0 = ixy0 * (1.0 / 7.0);
    vec4 gy0 = fract(floor(gx0) * (1.0 / 7.0)) - 0.5;
    gx0 = fract(gx0);
    vec4 gz0 = vec4(0.5) - abs(gx0) - abs(gy0);
    vec4 sz0 = step(gz0, vec4(0.0));
    gx0 -= sz0 * (step(0.0, gx0) - 0.5);
    gy0 -= sz0 * (step(0.0, gy0) - 0.5);

    vec4 gx1 = ixy1 * (1.0 / 7.0);
    vec4 gy1 = fract(floor(gx1) * (1.0 / 7.0)) - 0.5;
    gx1 = fract(gx1);
    vec4 gz1 = vec4(0.5) - abs(gx1) - abs(gy1);
    vec4 sz1 = step(gz1, vec4(0.0));
    gx1 -= sz1 * (step(0.0, gx1) - 0.5);
    gy1 -= sz1 * (step(0.0, gy1) - 0.5);

    vec3 g000 = vec3(gx0.x, gy0.x, gz0.x);
    vec3 g100 = vec3(gx0.y, gy0.y, gz0.y);
    vec3 g010 = vec3(gx0.z, gy0.z, gz0.z);
    vec3 g110 = vec3(gx0.w, gy0.w, gz0.w);
    vec3 g001 = vec3(gx1.x, gy1.x, gz1.x);
    vec3 g101 = vec3(gx1.y, gy1.y, gz1.y);
    vec3 g011 = vec3(gx1.z, gy1.z, gz1.z);
    vec3 g111 = vec3(gx1.w, gy1.w, gz1.w);

    vec4 norm0 = taylorInvSqrt(vec4(dot(g000, g000), dot(g010, g010), dot(g100, g100), dot(g110, g110)));
    g000 *= norm0.x;
    g010 *= norm0.y;
    g100 *= norm0.z;
    g110 *= norm0.w;
    vec4 norm1 = taylorInvSqrt(vec4(dot(g001, g001), dot(g011, g011), dot(g101, g101), dot(g111, g111)));
    g001 *= norm1.x;
    g011 *= norm1.y;
    g101 *= norm1.z;
    g111 *= norm1.w;

    float n000 = dot(g000, Pf0);
    float n100 = dot(g100, vec3(Pf1.x, Pf0.yz));
    float n010 = dot(g010, vec3(Pf0.x, Pf1.y, Pf0.z));
    float n110 = dot(g110, vec3(Pf1.xy, Pf0.z));
    float n001 = dot(g001, vec3(Pf0.xy, Pf1.z));
    float n101 = dot(g101, vec3(Pf1.x, Pf0.y, Pf1.z));
    float n011 = dot(g011, vec3(Pf0.x, Pf1.yz));
    float n111 = dot(g111, Pf1);

    vec3 fade_xyz = fade(Pf0);
    vec4 n_z = mix(vec4(n000, n100, n010, n110), vec4(n001, n101, n011, n111), fade_xyz.z);
    vec2 n_yz = mix(n_z.xy, n_z.zw, fade_xyz.y);
    float n_xyz = mix(n_yz.x, n_yz.y, fade_xyz.x);
    return 2.2 * n_xyz;
}

float turb(vec3 P, vec3 rep, float lacunarity, float gain)
{
    float sum = 0.0;
    float sc = 1.0;
    float totalgain = 1.0;
    for (float i = 0.0; i < 6.0; i++)
    {
        sum += totalgain * pnoise(P * sc, rep);
        sc *= lacunarity;
        totalgain *= gain;
    }

    return abs(sum);
}
/**************************************************
 * Perlin Effects
 *************************************************/
vec4 godray(float time)
{
    float angle = 30.0;
    float xx = cos(radians(angle));
    float yy = sin(radians(angle));
    vec3 dir = vec3((xx * v_vTexcoord.x) + (yy * v_vTexcoord.y), (xx * v_vTexcoord.x) + (yy * v_vTexcoord.y), 0.0);

    float noise = turb(dir + vec3(time, 0.0, 62.1 + time), vec3(480.0, 320.0, 32.0), 2.0, 0.5);
    noise = mix(noise, 0.0, 0.3);
    vec4 mist = vec4(noise, noise, noise, 1.0) * (1.0 - v_vTexcoord.y);
    return mist;
}

vec4 mist(float time)
{
    vec3 particle = vec3((v_vTexcoord.x + 0.5) + time, (v_vTexcoord.y + 0.5), 5.6 + time);
    float noise = turb(particle, vec3(480.0, 320.0, 32.0), 2.0, 0.5);
    noise = mix(noise, 0.5, 0.65);
    vec4 mist = vec4(noise, noise, noise, 1.0);
    return mist;
}

/**************************************************
 * Color Correction
 *************************************************/

vec4 curveColor(vec4 inColor, sampler2D texCurve)
{
    return vec4(texture2D(texCurve, vec2(inColor.r, 0.5)).r, texture2D(texCurve, vec2(inColor.g, 0.5)).g, texture2D(texCurve, vec2(inColor.b, 0.5)).b, inColor.a);
}

vec4 dodgeColor(vec4 inColor, vec4 blend)
{
    vec4 outColor = vec4(inColor.rgb / (1.0 - blend.rgb), inColor.a);
    return mix(inColor, outColor, blend.a);
}

vec4 overlayColor(vec4 inColor, vec4 blend)
{
    vec4 outColor = vec4(0.0, 0.0, 0.0, inColor.a);

    if (inColor.r > 0.5)
    {
        outColor.r = (1.0 - (1.0 - 2.0 * (inColor.r - 0.5)) * (1.0 - blend.r));
    }
    else
    {
        outColor.r = ((2.0 * inColor.r) * blend.r);
    }

    if (inColor.g > 0.5)
    {
        outColor.g = (1.0 - (1.0 - 2.0 * (inColor.g - 0.5)) * (1.0 - blend.g));
    }
    else
    {
        outColor.g = ((2.0 * inColor.g) * blend.g);
    }

    if (inColor.b > 0.5)
    {
        outColor.b = (1.0 - (1.0 - 2.0 * (inColor.b - 0.5)) * (1.0 - blend.b));
    }
    else
    {
        outColor.b = ((2.0 * inColor.b) * blend.b);
    }

    return mix(inColor, outColor, blend.a);
}

/**************************************************
 * Main Start
 *************************************************/


void main()
{
    vec4 baseTex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    float change = time * 0.00000005;
    
    gl_FragColor = baseTex;
    gl_FragColor = overlayColor(gl_FragColor, mist(change));
    gl_FragColor = dodgeColor(gl_FragColor, godray(change));
}

