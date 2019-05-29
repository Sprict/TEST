#ifndef SAMPLE08LIB_INCLUDED
#define SAMPLE08LIB_INCLUDED

#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

struct v2f
{
    float4 vertex : SV_POSITION;
    float3 vertexW : TEXCOORD0;
    float3 normal : TEXCOORD1;
}

float4 _MainColor;

v2f vert(appdata_base v)
{
    v2f o;

    o.vertex = UnityObjectToClipPos(v.vertex);
    o.vertexW = mul(unity_ObjectToWorld, v.vertex);
    o.normal = UnityObjectToWorldNormal(v.vertex);

    return o;
}

fixed4 frag(v2f i) : SV_TARGET
{
    
}
#endif