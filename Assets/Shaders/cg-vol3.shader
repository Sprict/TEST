Shader "Costom/cg-vol3"
{
    Properties
    {
        _MainColor("Color", Color) = (1, 0, 0, 1)
    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque" 
            "LightMode" = "ForwardBase" // フォワードレンダリング，ディファードレンダリング
        }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "Lighting.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color : TEXCOORD0;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _MainColor;

            v2f vert (appdata_base v)
            {
                float3 normal = normalize(UnityObjectToWorldNormal(v.normal));
                float3 light = normalize(_WorldSpaceLightPos0.xyz);
                float diffuse = saturate(dot(normal, light));
                float4 ambient = unity_AmbientSky;
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color = diffuse * _MainColor * _LightColor0
                            + ambient * _MainColor;
                
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
