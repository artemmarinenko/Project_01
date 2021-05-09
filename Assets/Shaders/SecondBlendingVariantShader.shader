Shader "Custom/SecondBlendingVariantShader"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _MaskTex("Albedo (RGB)", 2D) = "white" {}
        _Blend("Blend", Range(0,1)) = 0.0
    }
        SubShader
        {
            Tags { "RenderType" = "Opaque" }
            LOD 200

            CGPROGRAM
            // Physically based Standard lighting model, and enable shadows on all light types
            #pragma surface surf Standard fullforwardshadows

            // Use shader model 3.0 target, to get nicer looking lighting
            #pragma target 3.0

            sampler2D _MainTex;
            sampler2D _MaskTex;

            struct Input
            {
                float2 uv_MainTex;
                float2 uv_MaskTex;
            };

            half _Glossiness;
            half _Blend;
            fixed4 _Color;



            void surf(Input IN, inout SurfaceOutputStandard o)
            {
                fixed3 c = lerp(_Color, tex2D(_MaskTex, IN.uv_MaskTex), _Blend) * lerp(_Color, tex2D(_MainTex, IN.uv_MainTex), _Blend);
                o.Albedo = c.rgb;
                o.Smoothness = _Glossiness;
            }
            ENDCG
        }
            FallBack "Diffuse"
}
