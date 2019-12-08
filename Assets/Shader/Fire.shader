Shader "ShaderSketches/Template" {

    // Unityから取得する関数
    Properties {
        _MainTex ("MainTex", 2D) = "white"{}
    }

    CGINCLUDE
    #include "UnityCG.cginc"
        // float 0-1
        float random (float2 st) {
            return frac(sin(dot(st.xy,
                                float2(12.9898,78.233)))*
                43758.5453123);
        }

        float poi(float2 uv) {
            float result = 0.3;
            for (float i = 0; i < 10.5; i += 0.5 ) {
                float randomRadius = random(float2(i, i)) / 2;

                float randomPositionX = random(float2(i, i));
                float randomPositionY = random(float2(i * 10, i * 10));
                randomPositionX = (cos(randomPositionX + _Time.y + i * 5) + 1) / 2;
                randomPositionY = (sin(randomPositionY + _Time.y + i * 2) + 1) / 2;
                float d = distance(float2(randomPositionX, randomPositionY), uv);
                if (d < randomRadius) {
                    result += (randomRadius - d) * (1 / randomRadius);
                }
            }
            return result;
        }

        float4 frag(v2f_img pos) : SV_Target {
            // float r = poi(pos.uv);
            // float g = poi(pos.uv - float2(-0.01, 0.01));
            // float b = poi(pos.uv - float2(0.01, -0.01));
            // if ( r > 0.9 ) r -= 0.5;
            // else r = 0;
            // if ( g > 0.9 ) g -= 0.5;
            // else g = 0;
            // if ( b > 0.9 ) b -= 0.5;
            // else b = 0;
            // float3 col = float3(r, g, b);

            float r = poi(pos.uv);
            float g = 0;
            float b = 0;
            if ( r > 1.3) {
                // g = r;
                r = r - 1.3;
                g = r * r;
                b = r * r * r;
                r = r * 2;
            } else {
                // r = 0;
                r = 0;
                g = 0;
                b = 0;
            }
            float3 col = float3(r, g, b);
            return float4(col, 1);
        }
    ENDCG

    SubShader {
        Pass {
            CGPROGRAM
            // vertex
            #pragma vertex vert_img
            // フラグメントシェーダーとして定義 右が関数
            #pragma fragment frag
            ENDCG
        }
    }
}
