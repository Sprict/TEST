Shader "Unlit/NewUnlitShader"
{
    Properties
    {
        _Color ("Color", Color)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            uniform float4 light_pos;
            uniform float k_diffuse;
            uniform float k_ambient;

            float4 _Color;

            v2f vert (appdata v)
            {
                v2f o;
                float3 vs_normal = mul(UNITY_MATRIX_IT_MV, float4(i.normal, 1));
                float3 vs_light = mul(UNITY_MATRIX_V, light_pos);
                float3 vs_pos = mul(UNITY_MATRIX_MV, i.vertex);
                float3 vs_l = normalize(vs_light - vs_pos);
                float r_diffuse = k_diffuse*max(dot(vs_normal, vs_l), 0);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color = _Color * r_diffuse + k_ambient;
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return i.color;
            }
            ENDCG
        }
    }
}
