Shader "MyShader/MyShader1"
{
    Properties
    {
    }
    SubShader
    {
        ZTest LEqual
        Offset 0, 9
        Cull Off
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);

                return o;
            }
            float _FloatValue;
            fixed4 _GCV;
            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 color = fixed4(_FloatValue,_FloatValue,_FloatValue,1);
                color *= _GCV;
                return color;
            }
            ENDCG
        }
    }
}
