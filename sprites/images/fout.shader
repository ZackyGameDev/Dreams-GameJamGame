float2 vec2(float x0, float x1)
{
    return float2(x0, x1);
}
// Varyings
static float2 _v_vTexcoord = {0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};


uniform float _blurSize : register(c3);
uniform float _gm_AlphaRefValue : register(c4);
uniform bool _gm_AlphaTestEnabled : register(c5);
uniform sampler2D _gm_BaseTexture : register(s0);
uniform float4 _gm_FogColour : register(c6);
uniform bool _gm_PS_FogEnabled : register(c7);
uniform float _intensity : register(c8);

float4 gl_texture2D(sampler2D s, float2 t)
{
    return tex2D(s, t);
}

#define GL_USES_FRAG_COLOR
;
;
;
;
;
void _DoAlphaTest(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
;
void _DoFog(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
;
;
;
;
;
void gl_main()
{
{
float4 _sum = float4(0.0, 0.0, 0.0, 0.0);
int _j = {0};
int _i = {0};
(_sum += (gl_texture2D(_gm_BaseTexture, vec2((_v_vTexcoord.x - (4.0 * _blurSize)), _v_vTexcoord.y)) * 0.050000001));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2((_v_vTexcoord.x - (3.0 * _blurSize)), _v_vTexcoord.y)) * 0.090000004));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2((_v_vTexcoord.x - (2.0 * _blurSize)), _v_vTexcoord.y)) * 0.12));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2((_v_vTexcoord.x - _blurSize), _v_vTexcoord.y)) * 0.15000001));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, _v_vTexcoord.y)) * 0.16));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2((_v_vTexcoord.x + _blurSize), _v_vTexcoord.y)) * 0.15000001));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2((_v_vTexcoord.x + (2.0 * _blurSize)), _v_vTexcoord.y)) * 0.12));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2((_v_vTexcoord.x + (3.0 * _blurSize)), _v_vTexcoord.y)) * 0.090000004));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2((_v_vTexcoord.x + (4.0 * _blurSize)), _v_vTexcoord.y)) * 0.050000001));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, (_v_vTexcoord.y - (4.0 * _blurSize)))) * 0.050000001));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, (_v_vTexcoord.y - (3.0 * _blurSize)))) * 0.090000004));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, (_v_vTexcoord.y - (2.0 * _blurSize)))) * 0.12));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, (_v_vTexcoord.y - _blurSize))) * 0.15000001));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, _v_vTexcoord.y)) * 0.16));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, (_v_vTexcoord.y + _blurSize))) * 0.15000001));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, (_v_vTexcoord.y + (2.0 * _blurSize)))) * 0.12));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, (_v_vTexcoord.y + (3.0 * _blurSize)))) * 0.090000004));
(_sum += (gl_texture2D(_gm_BaseTexture, vec2(_v_vTexcoord.x, (_v_vTexcoord.y + (4.0 * _blurSize)))) * 0.050000001));
(gl_Color[0] = ((_sum * _intensity) + gl_texture2D(_gm_BaseTexture, _v_vTexcoord)));
}
}
;
struct PS_INPUT
{
    float2 v0 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT input)
{
    _v_vTexcoord = input.v0.xy;

    gl_main();

    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];

    return output;
}
