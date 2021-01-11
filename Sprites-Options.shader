// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

Shader "Sprites-Options"
{
    Properties
    {
        [Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (default LEqual)", Float) = 4
		_OffsetFactor ("Z-Offset", Float) = 0
		[Space(5)]_MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
		[Toggle][Space (5)]_AlphaToCoverage("AlphaToCoverage (override alpha)", Float) = 1
		_Cutoff("Alpha Cutoff", Float) = 0
        PixelSnap ("Pixel snap", Float) = 0
        [HideInInspector] _RendererColor ("RendererColor", Color) = (1,1,1,1)
        _Flip ("Flip", Vector) = (1,1,1,1)
        _AlphaTex ("External Alpha", 2D) = "white" {}
        _EnableExternalAlpha ("Enable External Alpha", Float) = 0
		
    }

    SubShader
    {
        Tags
        {
            "Queue"="Transparent"
            "IgnoreProjector"="True"
            "RenderType"="Transparent"
            "PreviewType"="Plane"
            "CanUseSpriteAtlas"="True"
        }

        Cull [_CullMode]
		Lighting Off
        Blend One OneMinusSrcAlpha
		ZWrite [_ZWrite]
		ZTest [_ZTestMode]
		Offset [_OffsetFactor], 0

		Stencil
		{
			Ref [_Stencil]
			ReadMask [_ReadMask]
			WriteMask [_WriteMask]
			Comp [_StencilComp]
			Pass [_StencilOp]
			Fail [_StencilFail]
			ZFail [_StencilZFail]
		}

		AlphaToMask [_AlphaToCoverage]
        Pass
        {
        CGPROGRAM
            #pragma vertex SpriteVert
            #pragma fragment SpriteFrag
            #pragma target 2.0
            #pragma multi_compile_instancing
            #pragma multi_compile _ PIXELSNAP_ON
            #pragma multi_compile _ ETC1_EXTERNAL_ALPHA
            #include "UnitySprites.cginc"
        ENDCG
        }
    }
}
