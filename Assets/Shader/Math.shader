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

        float distortion(float target, float offset, float seed) {
            return target + cos(offset * 2 + seed) / 10;
        }

        float4 frag(v2f_img i) : SV_Target {
            float3 col = float3(0, 0, 0);
            // -1 - 0 正規化
            float2 p = (i.uv - 0.5) * 2;

            // Y軸を起点にxを歪ませる
            float prex = p.x;
            p.x = distortion(p.x, p.y, _Time.z);
            p.y = distortion(p.y, prex, _Time.z);

            float2 t = float2(0, -0.6);
            if (distance(p, t) < 0.2) {
                col.rgb = 1;
            }
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
