// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)
//Modified by GenesisAria

Shader "Sprites-Options-Advanced"
{
    Properties
    {
        [Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
	[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (default LEqual)", Float) = 5
	_OffsetFactor ("Z-Offset", Float) = 0
	[Space(5)]_MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
	[Toggle][Space (5)]_AlphaToCoverage("AlphaToCoverage (override alpha)", Float) = 1
	_Cutoff("Alpha Cutoff", Float) = 0
        [Toggle]PixelSnap ("Pixel snap", Float) = 0
        [HideInInspector] _RendererColor ("RendererColor", Color) = (1,1,1,1)
        _Flip ("Flip", Vector) = (1,1,1,1)
        _AlphaTex ("External Alpha", 2D) = "white" {}
        _EnableExternalAlpha ("Enable External Alpha", Float) = 0
	[Toggle][Space(10)][Header(.  Advanced)][Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("Source Blend (default SrcALpha)", Float) = 5
        [Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("Destination Blend (default OneMinusSrcALpha)", Float) = 10
	[Space(5)]_StencilRef("Stencil ID", Float) = 0
	_WriteMask("WriteMask", Float) = 0
	_ReadMask("ReadMask", Float) = 0
	[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
	[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
	[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
	[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
	[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(Debug)]_SrcBlend("Source Blend (One)", Float) = 1
	[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (Zero)", Float) = 10
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
	Blend [_SrcBlend] [_DstBlend]
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
