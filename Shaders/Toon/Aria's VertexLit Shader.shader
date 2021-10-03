// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Arias VertexLit Shader"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 2
		[HideInInspector]_outline_width("_outline_width", Float) = 0
		[Header(Dont clean keywords after selecting)][Toggle(TINTED_OUTLINE)]_VRCFallbackDoublesided("VRC Fallback Doublesided", Float) = 0
		[Toggle(_ALPHATEST_ON)]_VRCFallbackCutout("VRC Fallback Cutout", Float) = 0
		[Enum(LessVisible,0.25,Visible,0.5,MoreVisible,0.75,Invisible,2)][Space(5)]_Cutoff("Fallback Cutoff", Float) = 0.75
		[Header(.  Main  .)]_MainTex("Texture (RGB,A)", 2D) = "white" {}
		[Toggle(MAINSS_ON)] _SuperSample("SuperSample (expensive)", Float) = 0
		_TexSSBias("Mip Sample Bias", Float) = 0
		[HDR][Space(5)]_Color("> Color", Color) = (1,1,1,1)
		_Hue("Hue", Range( 0 , 360)) = 0
		_Saturation("Saturation", Range( -2 , 5)) = 1
		_MaintexPower("Power", Float) = 1
		[Space(5)]_Alpha("Alpha", Range( 0 , 1)) = 1
		_AlphaCutoff("Alpha Cutoff", Float) = 1
		[Space (5)][Toggle(COVERAGE_ON)] _AlphaToCoverage("AlphaToCoverage (antialiased override)", Float) = 1
		_A2CSampleBias("A2C Sample Bias", Float) = 1
		[Header(. Lighting .)]_LightMulti("Light Multiplier", Float) = 0.75
		_MaxLight("Max Light (x2)", Range( 0 , 1)) = 1
		_MinLight("Min Light", Range( 0 , 1)) = 0.025
		_LightSaturationLimiter("Light Saturation Limiter", Float) = 0.75
		_LightSatTotal("Light Saturation Max", Float) = 1
		_LightColourBias("LightColour Bias (keep white)", Color) = (1,1,1,0)
		[Space(5)][Toggle(_DISABLELIGHT_ON)] _DisableLight("Unlit (warning - disables all light)", Float) = 0
		[Space(5)][Header(.  Shadow  .)][ToggleOff(SHADING_OFF)] _UseShading("Use Shading", Float) = 0
		[Enum(Surface,0,Object2World,1)]_LightMode("Lighting Mode", Float) = 0
		[Space(5)]_ShadowColour("Shadow Colour", Color) = (0.85,0.85,0.85,1)
		_OffsetDot("Offset Dot", Range( -1 , 1)) = 0
		_ShadowSharpness("Shadow Sharpness", Float) = 20
		_ShadowPower("Shadow Power", Range( 0 , 10)) = 1
		[ToggleUI][Space(5)]_StepTwo("Use Second Step", Float) = 0
		_ShadowColour2("Shadow Colour 2", Color) = (0.9,0.9,0.9,1)
		_OffsetDot2("Offset Dot 2", Range( -1 , 1)) = 0.1
		_ShadowSharpness2("Shadow Sharpness 2", Float) = 20
		_ShadowPower2("Shadow Power 2", Range( 0 , 10)) = 1
		[Space(5)]_ShadowDarkness("Shadow Darkness", Float) = 0.15
		_ShadowSaturation("Shadow Saturation", Range( -2 , 2)) = 0.85
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.68
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.55
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.44
		[Space(5)][Header(.  Emission  .)]_Emission("Emission Map (RGB,A)", 2D) = "white" {}
		[HDR]_EmissionColor("> Colour", Color) = (0,0,0,0)
		_FullBright("FullBright", Float) = 0
		_EmissionHue("Hue", Range( 0 , 360)) = 0
		_EmissionIntensity("Emission Intensity", Float) = 1
		_ShadedEmission("Shaded Emission", Range( 0 , 1)) = 0
		[HDR]_ShadedColour("Shaded Colour", Color) = (0,0,0,0)
		[ToggleUI]_ShadedOnly("Shaded Only", Float) = 0
		_ScrollX("Scroll X", Float) = 0
		_ScrollY("Scroll Y", Float) = 0
		[Normal][Space(5)][Header(.  Normal  .)]_Normal("Normal (N)", 2D) = "bump" {}
		[Toggle(NORMSS_ON)] _NormSuperSample("SuperSample (expensive)", Float) = 0
		_NormSSBias("Mip Sample Bias", Float) = 0
		[Space(5)]_NorDist("Normal Distance Modifier", Float) = 0
		_NormalScale("Scale Normal", Float) = 1
		_NormalPower("Normal Power", Range( 0 , 2)) = 1
		_NormalPowerSpecular("Normal Specular", Range( 0 , 10)) = 2
		_NormalPowerMatCap("Normal MatCap", Range( 0 , 5)) = 1
		_NormalPowerSubSurface("Normal SubSurface", Range( 0 , 2)) = 0.5
		[Header(Normal Mask)][SingleLineTexture]_NormalMask("(R)NormalMask, (A)Lightmask", 2D) = "white" {}
		[ToggleUI]_LightMaskEnable("Use Light Mask", Float) = 0
		[ToggleUI]_LightMaskOnly("Light Mask Only (for alpha8)", Float) = 0
		_LightMaskLevel("Light Mask Level", Float) = 1
		[Space(5)][Header(.  Soft Shading  .)][ToggleOff(SOFTSHADE_OFF)] _SoftShadeEnable("SoftShade Enable", Float) = 0
		[Enum(FixedColour,0,LightColour,1)]_ShadeColorDynamic("ShadeColor Dynamic", Float) = 1
		_ShadeColour("Shade Colour", Color) = (0,0,0,0)
		_ShadeLevel("Shade Level", Range( 0 , 1)) = 0.5
		_SoftPower("Soft Power", Range( 0.5 , 4)) = 0.75
		_SoftScale("Soft Scale", Range( 0.5 , 2)) = 1
		[Space(5)][Header(. SubSurface Light .)][Toggle(SUBSURFACE_ON)] _UseSubSurface("Use SubSurface/Deflected Light", Float) = 0
		_OffsetSS("Offset", Range( -1 , 1)) = 0
		_SSIntensity("SubSurface Intensity", Float) = 5
		[ToggleUI][Space(5)]_SSDouble("Use Second Step", Float) = 0
		_OffsetSS2("Offset 2", Range( -1 , 1)) = 0
		_SSIntensity2("SubSurface Intensity 2", Float) = 5
		[Space(5)]_SSBrightness("SubSurface Brightness", Float) = 10
		_ShadeMaskSS("Shade Mask", Range( 0 , 1)) = 0.5
		[ToggleUI]_UseLightMaskSS("Use Light Mask", Float) = 1
		_SSTransmission("Transmission", Range( 0 , 1)) = 0
		[ToggleUI]_Spherize("Spherize SS Normal", Float) = 0
		_SSAliasFix("SS Edge Alias Fix (dist pow limit)", Vector) = (-0.03,4,0.075,0)
		[Space(5)][Header(.  Specular  .)]_SpecularOpacity("Specular Opacity", Range( 0 , 1)) = 0.5
		_SpecularSize("Specular Size", Range( 0 , 10)) = 1
		_SpecularStrength("Specular Strength", Float) = 1
		[HDR]_SpecMatCapColor1("Specular Colour", Color) = (1,1,1,1)
		[Enum(Additive,0,Multipliet,1,Off,2)]_SpecMode("Specular Mode", Float) = 2
		[ToggleUI]_StereoFixSpec("Stereo Converge (flatten)", Float) = 0
		[Space(5)][Header(. Specular Overlay)][Toggle(SPECMATCAP_ON)] _UseSpecularMatCap("Use Specular MatCap", Float) = 0
		_SpecularMatcap("Specular Matcap (RGB)", 2D) = "black" {}
		[ToggleUI]_StereoFixSpecCap("Stereo Converge (flatten)", Float) = 0
		_SpecMatcapMultiply("SpecMatcap Multiply", Float) = 1
		_SpecMatcapPower("SpecMatcap Power", Float) = 1
		_SpecMatcapSaturation("SpecMatcap Saturation", Float) = 1
		[HDR]_SpecMatCapColor("SpecMatCap Colour", Color) = (1,1,1,1)
		[Enum(Additive,0,Multiplied,1)]_SpecMatCapMode("SpecMatCap Mode", Float) = 0
		_SpecMatcapOpacity("SpecMatcap Opacity", Float) = 1
		[ToggleUI]_Legacy2("Legacy", Float) = 0
		[SingleLineTexture][Space(10)]_SpecularMask("Specular Mask (R,A)", 2D) = "white" {}
		_SpecMaskPower("SpecMask Power", Float) = 1
		_SpecularLevel("Specular Level", Float) = 1
		[ToggleUI][Space(5)][Header(. Roughness . Glossiness)]_Roughness("Use Roughness", Float) = 0
		_Glossiness("Roughness Map (R,A)", 2D) = "black" {}
		_RoughnessLevel("Roughness Level", Float) = 1
		_RoughnessPower("Roughness Power", Float) = 1
		[ToggleUI]_RoughnessInvert("Roughness Invert", Float) = 1
		[Space(5)][Header(. Reflection Probe)][Toggle(SPECULARHIGHLIGHTS_ON)] _UseReflection("Use Reflection", Float) = 0
		_ProbeSmoothness("Probe Smoothness", Float) = 0.75
		_ReflectionOpacity("Reflection Opacity", Float) = 0.5
		_ReflectionIntensity("Reflection Intensity", Float) = 0.5
		_ReflectionPower("Reflection Power", Float) = 1
		_ReflectionSaturation("Reflection Saturation", Float) = 1
		[Space(5)][Header(.  Sparkles  .)][Toggle(SPARKLE_ON)] UseSparkleShimmer("Use Sparkle/Shimmer", Float) = 0
		[HDR]_SparkleColor("Color", Color) = (1,1,1,0)
		[Enum(Additive,0,Multiply,1)]_SparkleMode("Sparkle Mode", Float) = 1
		_SparkleHDRMax("Sparkle Max HDR Value", Float) = 10
		_SparklePattern("Sparkle Pattern (RGB)", 2D) = "black" {}
		[Toggle(SPARKLESS_ON)] _SparkleSuperSample("SuperSample (expensive)", Float) = 0
		_SparkleSSBias("SuperSample Bias", Float) = 0
		[Space(5)]_SparkleTexColour("SparkleTex Saturation", Range( 0 , 2)) = 2
		_Threshold("Threshold", Range( 0 , 1)) = 0
		_Range("Range", Range( 0.001 , 1)) = 0.3
		_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.05
		[Enum(Interpolated,0,Flattened,1,None,2)]_StereoCorrect("Stereo Correction", Float) = 1
		_WorldPosContribution("WorldPos Contribution", Range( 0 , 1)) = 0.3
		[Enum(Linear,0,Circular,1)][Space(5)]_MotionType("Motion Type", Float) = 0
		_MotionSpeed("Motion Speed", Float) = 0
		_RotateLinear("Rotate Linear", Range( 0 , 1)) = 0
		_MotionIntensity("Motion Intensity", Float) = 0.01
		[Space(5)]_SparkleMask("Sparkle Mask (R,A)", 2D) = "white" {}
		_SparkleMaskPower("Sparkle Mask Power", Float) = 1
		_SparkleMaskMultiply("Sparkle Mask Multiply", Float) = 1
		_SparkleFresnel("Fresnel Bias, Scale, Power", Vector) = (0,11,5,0)
		[Space(5)][Header(.  Rim Fresnel  .)][Toggle(RIMLIGHT_ON)] _UseRim("Use Rim", Float) = 0
		_RimOutlineColour("Rim/Outline Colour", Color) = (0,0,0,0)
		[Enum(Blend_Lerp,0,Multiply,1,AddSubtract,2)]_RimMode("Rim Mode", Float) = 0
		_Amount("Rim Opacity", Float) = 0
		_Power("Rim Power", Float) = 0
		_Scale("Rim Scale", Float) = 0
		_Min("Rim Min", Float) = 0
		_Max("Rim Max", Float) = 0
		[ToggleUI]_RimNormal("Rim Normal", Float) = 0
		_Scale1("Rim Normal Power", Range( 0 , 1)) = 0
		[ToggleUI]_MaskFresnel("Emission Alpha Mask", Float) = 0
		[Space(10)][Header(.  MatCap  .)][Toggle(MATCAP_ON)] _UseMatcap("Use Matcap", Float) = 0
		_Matcap("Matcap (RGB,A)", 2D) = "black" {}
		[ToggleUI]_StereoFix("Stereo Converge (flatten)", Float) = 0
		_MatcapOpacity("Matcap Opacity", Range( 0 , 1)) = 5
		_MatcapIntensity("Matcap Intensity", Float) = 0
		_MatcapSaturation("Matcap Saturation", Range( -1 , 5)) = 1
		_MatcapSpin("MatcapSpin", Float) = 0
		[HDR]_MatCapColor("MatCap Colour", Color) = (1,1,1,1)
		[ToggleUI]_Legacy("Legacy", Float) = 0
		[SingleLineTexture][Space(5)]_MatCapMask("MatCap Mask (R,A)", 2D) = "white" {}
		_MatcapMaskLevel1("Mask Level", Float) = 1
		[Space(10)][Header(.  Parallax  .)][Toggle(PARALLAX_ON)] _UseParallax("Use Parallax", Float) = 0
		[Enum(Normal,0,Planar,1)]_ParallaxType("Parallax Type", Float) = 0
		[HDR]_ParallaxColour("Parallax Colour", Color) = (1,1,1,1)
		_ParallaxTexture("Parallax Texture (RGB,A)", 2D) = "black" {}
		_ParallaxHeight("Parallax Height", Float) = 0.5
		_ParallaxScale("Parallax Scale", Float) = 1
		_ParallaxMask("Parallax Mask (R)", 2D) = "white" {}
		_ParallaxMaskPower("Parallax Mask Power", Float) = 1
		[ToggleUI][Space(20)][Header(VRC Friends Only)]_FriendsOnly("Friends Only ON/OFF", Float) = 0
		[SingleLineTexture]_FriendsOnlyRT("FriendsOnly RenderTexture (clear to white)", 2D) = "black" {}
		[Header(enable without cam for override)][ToggleUI]_InvertFriendsOnly("Invert Friends Only", Float) = 0
		[Space(10)][Toggle(FRIENDTEX_ON)] _FriendsOnlyTexture("Friends Only Texture", Float) = 0
		_MainTexFriends("FriendsOnly Texture (RGB,A)", 2D) = "white" {}
		[Toggle(FRIENDSS_ON)] _FriendsSuperSample("SuperSample (expensive)", Float) = 0
		_FriendTexSSBias("Mip Sample Bias", Float) = 0
		[ToggleUI][Space(10)][Header(Mirror)]_MirrorSystem("Use Mirror System", Float) = 0
		[IntRange]_IsInMirror("In Mirror", Range( 0 , 1)) = 1
		[IntRange]_IsNotMirror("Not Mirror", Range( 0 , 1)) = 1
		[ToggleUI][Space(10)][Header(.  Advanced  .)]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space(5)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask (non-zero)", Float) = 255
		_ReadMask("ReadMask (non-zero)", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(Debug)]_SrcBlend("Source Blend (One)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (Zero)", Float) = 10
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 0

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		AlphaToMask Off
		Cull [_Culling]
		ColorMask RGBA
		ZWrite [_ZWriteMode]
		ZTest [_ZTestMode]
		Stencil
		{
			Ref [_StencilRef]
			ReadMask [_ReadMask]
			WriteMask [_WriteMask]
			Comp [_StencilComparison]
			Pass [_StencilOp]
			Fail [_StencilFail]
			ZFail [_StencilZFail]
		}
		
		
		Pass
		{
			Name "VertexLit"
			Tags { "LightMode"="ForwardBase" "Queue"="Geometry" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma target 5.0
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#include "UnityStandardUtils.cginc"
			#include "Lighting.cginc"
			#include "UnityStandardBRDF.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local MATCAP_ON
			#pragma shader_feature_local RIMLIGHT_ON
			#pragma shader_feature_local FRIENDTEX_ON
			#pragma shader_feature_local MAINSS_ON
			#pragma shader_feature_local FRIENDSS_ON
			#pragma shader_feature_local SHADING_OFF
			#pragma shader_feature_local NORMSS_ON
			#pragma multi_compile __ VERTEXLIGHT_ON
			#pragma shader_feature_local _DISABLELIGHT_ON
			#pragma shader_feature_local SUBSURFACE_ON
			#pragma shader_feature_local SOFTSHADE_OFF
			#pragma shader_feature_local SPECMATCAP_ON
			#pragma shader_feature_local SPECULARHIGHLIGHTS_ON
			#pragma shader_feature_local SPARKLE_ON
			#pragma shader_feature_local SPARKLESS_ON
			#pragma shader_feature_local PARALLAX_ON
			#pragma shader_feature_local COVERAGE_ON


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _StencilRef;
			uniform half _DstBlend;
			uniform int _StencilZFail;
			uniform half _outline_width;
			uniform half _Cutoff;
			uniform half _VRCFallbackDoublesided;
			uniform half _VRCFallbackCutout;
			uniform half _SrcBlend;
			uniform int _StencilOp;
			uniform half _ZTestMode;
			uniform half _ReadMask;
			uniform half _ZWriteMode;
			uniform half _WriteMask;
			uniform int _Culling;
			uniform int _StencilFail;
			uniform int _StencilComparison;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform half _TexSSBias;
			uniform half _InvertFriendsOnly;
			uniform sampler2D _FriendsOnlyRT;
			uniform float4 _FriendsOnlyRT_ST;
			uniform sampler2D _MainTexFriends;
			uniform half _FriendTexSSBias;
			uniform half4 _Color;
			uniform half _MaintexPower;
			uniform float _Hue;
			uniform half _Saturation;
			uniform half _LightMaskEnable;
			uniform sampler2D _NormalMask;
			uniform float4 _NormalMask_ST;
			uniform half _LightMaskLevel;
			uniform half _StepTwo;
			uniform float4 _ShadowColour;
			uniform float _ShadowSharpness;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform float _NormalScale;
			uniform float _NorDist;
			uniform half _NormSSBias;
			uniform half _LightMaskOnly;
			uniform float _NormalPower;
			uniform half _StaticLightX;
			uniform half _StaticLightY;
			uniform half _StaticLightZ;
			uniform half _LightMode;
			uniform half _OffsetDot;
			uniform float _ShadowPower;
			uniform half4 _ShadowColour2;
			uniform float _ShadowSharpness2;
			uniform half _OffsetDot2;
			uniform float _ShadowPower2;
			uniform half _ShadowSaturation;
			uniform half _SSBrightness;
			uniform half _Spherize;
			uniform float _SSTransmission;
			uniform half _ShadeMaskSS;
			uniform half _SSDouble;
			uniform float _NormalPowerSubSurface;
			uniform half _OffsetSS;
			uniform half _SSIntensity;
			uniform half _OffsetSS2;
			uniform half _SSIntensity2;
			uniform half _UseLightMaskSS;
			uniform float3 _SSAliasFix;
			uniform half _LightMulti;
			uniform half4 _LightColourBias;
			uniform float _MinLight;
			uniform half _MaxLight;
			uniform float _LightSaturationLimiter;
			uniform half _LightSatTotal;
			uniform float _ShadowDarkness;
			uniform half _ShadeColorDynamic;
			uniform half4 _ShadeColour;
			uniform float _SoftScale;
			uniform float _SoftPower;
			uniform half _ShadeLevel;
			uniform half _RimMode;
			uniform float4 _RimOutlineColour;
			uniform float _Min;
			uniform float _Max;
			uniform half _RimNormal;
			uniform float _Scale1;
			uniform float _Scale;
			uniform float _Power;
			uniform half _Amount;
			uniform half _MaskFresnel;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;
			uniform half _ScrollX;
			uniform half _ScrollY;
			uniform half _ShadedOnly;
			uniform float _EmissionHue;
			uniform half4 _ShadedColour;
			uniform float _ShadedEmission;
			uniform half4 _EmissionColor;
			uniform float _EmissionIntensity;
			uniform half _FullBright;
			uniform sampler2D _Matcap;
			uniform half _Legacy;
			uniform half _StereoFix;
			uniform float _NormalPowerMatCap;
			uniform float _MatcapSpin;
			uniform float _MatcapIntensity;
			uniform half4 _MatCapColor;
			uniform half _MatcapSaturation;
			uniform half _MatcapOpacity;
			uniform sampler2D _MatCapMask;
			uniform float4 _MatCapMask_ST;
			uniform half _MatcapMaskLevel1;
			uniform half _SpecMode;
			uniform float4 _SpecMatCapColor1;
			uniform half _StereoFixSpec;
			uniform float _NormalPowerSpecular;
			uniform half _SpecularSize;
			uniform half _SpecularStrength;
			uniform half _Roughness;
			uniform half _RoughnessInvert;
			uniform sampler2D _Glossiness;
			uniform float4 _Glossiness_ST;
			uniform half _RoughnessLevel;
			uniform half _RoughnessPower;
			uniform half _SpecularOpacity;
			uniform half _SpecMatCapMode;
			uniform sampler2D _SpecularMatcap;
			uniform half _Legacy2;
			uniform half _StereoFixSpecCap;
			uniform half _SpecMatcapSaturation;
			uniform half _SpecMatcapPower;
			uniform half _SpecMatcapMultiply;
			uniform half4 _SpecMatCapColor;
			uniform half _SpecMatcapOpacity;
			uniform float _ReflectionIntensity;
			uniform half _ProbeSmoothness;
			uniform half _ReflectionOpacity;
			uniform float _ReflectionPower;
			uniform float _ReflectionSaturation;
			uniform half _SpecularLevel;
			uniform sampler2D _SpecularMask;
			uniform float4 _SpecularMask_ST;
			uniform half _SpecMaskPower;
			uniform half _SparkleMode;
			uniform sampler2D _SparkleMask;
			uniform float4 _SparkleMask_ST;
			uniform half _SparkleMaskMultiply;
			uniform half _SparkleMaskPower;
			uniform float _Threshold;
			uniform float _Range;
			uniform sampler2D _SparklePattern;
			uniform float4 _SparklePattern_ST;
			uniform half _SparkleSSBias;
			uniform half _SparkleTexColour;
			uniform half _StereoCorrect;
			uniform half _ScreenContribution;
			uniform half _MotionIntensity;
			uniform half _MotionType;
			uniform float _MotionSpeed;
			uniform half _RotateLinear;
			uniform half _WorldPosContribution;
			uniform half4 _SparkleColor;
			uniform float3 _SparkleFresnel;
			uniform half _SparkleHDRMax;
			uniform sampler2D _ParallaxMask;
			uniform float4 _ParallaxMask_ST;
			uniform half _ParallaxMaskPower;
			uniform sampler2D _ParallaxTexture;
			uniform half _ParallaxType;
			uniform float4 _ParallaxTexture_ST;
			uniform float _ParallaxHeight;
			uniform float _ParallaxScale;
			uniform half4 _ParallaxColour;
			uniform float _Alpha;
			uniform float _A2CSampleBias;
			uniform float _AlphaCutoff;
			uniform half _MirrorSystem;
			uniform half _IsInMirror;
			uniform half _IsNotMirror;
			uniform half _FriendsOnly;
			float4 supersample2x2( sampler2D texvalue, float2 uvin, float2 dx, float2 dy, float bias )
			{
				half4 col = 0;
				col += tex2Dbias(texvalue, float4(uvin.xy + dx + dy, 0.0, bias));
				col += tex2Dbias(texvalue, float4(uvin.xy - dx + dy, 0.0, bias));
				col += tex2Dbias(texvalue, float4(uvin.xy + dx - dy, 0.0, bias));
				col += tex2Dbias(texvalue, float4(uvin.xy - dx - dy, 0.0, bias));
				col *= 0.25;
				return col;
			}
			
			float3 HueShifter1_g6555( float3 aColor, float aHue )
			{
				    float angle = radians(aHue);
				    float3 k = float3(0.57735, 0.57735, 0.57735);
				    float cosAngle = cos(angle);
				    //Rodrigues' rotation formula
				    return aColor * cosAngle + cross(k, aColor) * sin(angle) + k * dot(k, aColor) * (1 - cosAngle);
			}
			
			float3 CenterEye1_g589(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			int isCamera14_g588(  )
			{
				return unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f;
			}
			
			float3 CenterEye1_g6473(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			half3 SHArgbambientDir(  )
			{
				return float4(Unity_SafeNormalize(unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz), 1.0);
			}
			
			float4 VertexLightPosX3_g590(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g590(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g590(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g590(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol114_g590(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightCol215_g590(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g590(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g590(  )
			{
				return unity_LightColor[3];
			}
			
			float3 CenterEye1_g6478(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 unity_SHArgb3_g6475(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			
			float3 CenterEye1_g6582(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 HueShifter1_g6512( float3 aColor, float aHue )
			{
				    float angle = radians(aHue);
				    float3 k = float3(0.57735, 0.57735, 0.57735);
				    float cosAngle = cos(angle);
				    //Rodrigues' rotation formula
				    return aColor * cosAngle + cross(k, aColor) * sin(angle) + k * dot(k, aColor) * (1 - cosAngle);
			}
			
			float3 CenterEye1_g6590(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 CenterEye1_g6588(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 CenterEye1_g6554(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 CenterEye1_g6579(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 CenterEye1_g6577(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 CenterEye1_g556(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 CenterEye1_g552(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 CenterEye1_g554(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 CenterEye1_g550(  )
			{
				#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			half4 StereoScreenUV1_g6752( half4 screenuv )
			{
				                #if UNITY_SINGLE_PASS_STEREO
				                    screenuv.xy *= half2(_ScreenParams.x * 2, _ScreenParams.y);
				                #else
				                    screenuv.xy *= _ScreenParams.xy;
				                #endif
				    
				                return screenuv;
			}
			
			half Dither8x8Bayer( int x, int y )
			{
				const half dither[64] = {
				1, 49, 13, 61, 4, 52, 16, 64,
				33, 17, 45, 29, 36, 20, 48, 32,
				9, 57, 5, 53, 12, 60, 8, 56,
				41, 25, 37, 21, 44, 28, 40, 24,
				3, 51, 15, 63, 2, 50, 14, 62,
				35, 19, 47, 31, 34, 18, 46, 30,
				11, 59, 7, 55, 10, 58, 6, 54,
				43, 27, 39, 23, 42, 26, 38, 22
				                };
				int r = y * 8 + x;
				return dither[r] / 65; // Use 65 instead of 64 to get better centering
			}
			
			int RenderSampleCount(  )
			{
				uint samplecount = GetRenderTargetSampleCount();
				return samplecount;
			}
			
			int isCamera1_g6751(  )
			{
				return unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f;
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldTangent = UnityObjectToWorldDir(v.ase_tangent);
				o.ase_texcoord2.xyz = ase_worldTangent;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord6 = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord5 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i , out uint cov : SV_Coverage) : SV_Target
			{
				UNITY_INITIALIZE_OUTPUT(uint,cov)
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				sampler2D texvalue34_g6500 = _MainTex;
				float2 temp_output_4_0_g6500 = uv_MainTex;
				float2 uvin34_g6500 = temp_output_4_0_g6500;
				float2 dx34_g6500 = ( ddx( temp_output_4_0_g6500 ) * float2( 0.25,0.25 ) );
				float2 dy34_g6500 = ( ddy( temp_output_4_0_g6500 ) * float2( 0.25,0.25 ) );
				float bias34_g6500 = _TexSSBias;
				float4 localsupersample2x234_g6500 = supersample2x2( texvalue34_g6500 , uvin34_g6500 , dx34_g6500 , dy34_g6500 , bias34_g6500 );
				#ifdef MAINSS_ON
				float4 staticSwitch4923 = localsupersample2x234_g6500;
				#else
				float4 staticSwitch4923 = tex2D( _MainTex, uv_MainTex );
				#endif
				float2 uv_FriendsOnlyRT = i.ase_texcoord1.xy * _FriendsOnlyRT_ST.xy + _FriendsOnlyRT_ST.zw;
				float4 tex2DNode349 = tex2D( _FriendsOnlyRT, uv_FriendsOnlyRT );
				float temp_output_351_0 = ceil( saturate( ( tex2DNode349.r + tex2DNode349.g + tex2DNode349.b ) ) );
				float ifLocalVar3506 = 0;
				if( _InvertFriendsOnly == 1.0 )
				ifLocalVar3506 = ( 1.0 - temp_output_351_0 );
				else if( _InvertFriendsOnly < 1.0 )
				ifLocalVar3506 = temp_output_351_0;
				half FriendsOnlyInvert3333 = ifLocalVar3506;
				sampler2D texvalue34_g6501 = _MainTexFriends;
				float2 temp_output_4_0_g6501 = uv_FriendsOnlyRT;
				float2 uvin34_g6501 = temp_output_4_0_g6501;
				float2 dx34_g6501 = ( ddx( temp_output_4_0_g6501 ) * float2( 0.25,0.25 ) );
				float2 dy34_g6501 = ( ddy( temp_output_4_0_g6501 ) * float2( 0.25,0.25 ) );
				float bias34_g6501 = _FriendTexSSBias;
				float4 localsupersample2x234_g6501 = supersample2x2( texvalue34_g6501 , uvin34_g6501 , dx34_g6501 , dy34_g6501 , bias34_g6501 );
				#ifdef FRIENDSS_ON
				float4 staticSwitch4922 = localsupersample2x234_g6501;
				#else
				float4 staticSwitch4922 = tex2D( _MainTexFriends, uv_FriendsOnlyRT );
				#endif
				float4 ifLocalVar3504 = 0;
				UNITY_BRANCH 
				if( FriendsOnlyInvert3333 >= 1.0 )
				ifLocalVar3504 = staticSwitch4922;
				else
				ifLocalVar3504 = staticSwitch4923;
				#ifdef FRIENDTEX_ON
				float4 staticSwitch4936 = ifLocalVar3504;
				#else
				float4 staticSwitch4936 = staticSwitch4923;
				#endif
				float3 saferPower4850 = max( ( (staticSwitch4936).rgb * (_Color).rgb ) , 0.0001 );
				float3 temp_cast_2 = (_MaintexPower).xxx;
				float3 aColor1_g6555 = pow( saferPower4850 , temp_cast_2 );
				float aHue1_g6555 = _Hue;
				float3 localHueShifter1_g6555 = HueShifter1_g6555( aColor1_g6555 , aHue1_g6555 );
				float3 desaturateInitialColor2917 = localHueShifter1_g6555;
				float desaturateDot2917 = dot( desaturateInitialColor2917, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2917 = lerp( desaturateInitialColor2917, desaturateDot2917.xxx, ( 1.0 - _Saturation ) );
				float2 uv_NormalMask = i.ase_texcoord1.xy * _NormalMask_ST.xy + _NormalMask_ST.zw;
				float4 tex2DNode3059 = tex2D( _NormalMask, uv_NormalMask );
				float lerpResult3262 = lerp( 1.0 , tex2DNode3059.a , _LightMaskLevel);
				float ifLocalVar4801 = 0;
				UNITY_BRANCH 
				if( _LightMaskEnable == 1.0 )
				ifLocalVar4801 = lerpResult3262;
				else if( _LightMaskEnable < 1.0 )
				ifLocalVar4801 = 1.0;
				half LightMaskValue4804 = ifLocalVar4801;
				float2 uv_Normal = i.ase_texcoord1.xy * _Normal_ST.xy + _Normal_ST.zw;
				float3 localCenterEye1_g589 = CenterEye1_g589();
				float temp_output_4_0_g588 = distance( WorldPosition , ( (float)1 == 0.0 ? localCenterEye1_g589 : _WorldSpaceCameraPos ) );
				int localisCamera14_g588 = isCamera14_g588();
				float clampResult4354 = clamp( ( ( temp_output_4_0_g588 * ( 1.0 - ( (float)localisCamera14_g588 == 0.0 ? 0.5 : 1.0 ) ) ) * 2.0 * _NorDist ) , 0.05 , 3.0 );
				float ifLocalVar3495 = 0;
				if( _NorDist >= 0.001 )
				ifLocalVar3495 = clampResult4354;
				else
				ifLocalVar3495 = 1.0;
				half NormalDist3459 = ifLocalVar3495;
				float temp_output_4352_0 = ( _NormalScale * NormalDist3459 );
				sampler2D texvalue34_g6472 = _Normal;
				float2 temp_output_4_0_g6472 = uv_Normal;
				float2 uvin34_g6472 = temp_output_4_0_g6472;
				float2 dx34_g6472 = ( ddx( temp_output_4_0_g6472 ) * float2( 0.25,0.25 ) );
				float2 dy34_g6472 = ( ddy( temp_output_4_0_g6472 ) * float2( 0.25,0.25 ) );
				float bias34_g6472 = ( _NormSSBias * saturate( NormalDist3459 ) );
				float4 localsupersample2x234_g6472 = supersample2x2( texvalue34_g6472 , uvin34_g6472 , dx34_g6472 , dy34_g6472 , bias34_g6472 );
				float3 localUnpackNormal47_g6472 = UnpackScaleNormal( localsupersample2x234_g6472, temp_output_4352_0 );
				#ifdef NORMSS_ON
				float3 staticSwitch4930 = localUnpackNormal47_g6472;
				#else
				float3 staticSwitch4930 = UnpackScaleNormal( tex2D( _Normal, uv_Normal ), temp_output_4352_0 );
				#endif
				float temp_output_4203_0 = ( _LightMaskOnly + tex2DNode3059.r );
				float3 lerpResult430 = lerp( float3( 0,0,1 ) , staticSwitch4930 , ( temp_output_4203_0 * _NormalPower ));
				float3 ase_worldTangent = i.ase_texcoord2.xyz;
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float3 ase_worldBitangent = i.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal1235 = lerpResult430;
				float3 worldNormal1235 = float3(dot(tanToWorld0,tanNormal1235), dot(tanToWorld1,tanNormal1235), dot(tanToWorld2,tanNormal1235));
				float3 NormalShade962 = worldNormal1235;
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float4 transform2147 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 normalizeResult1233 = normalize( ( _WorldSpaceLightPos0.xyz - ( _WorldSpaceLightPos0.w * (transform2147).xyz ) ) );
				float3 appendResult248 = (float3(_StaticLightX , _StaticLightY , _StaticLightZ));
				float3 localCenterEye1_g6473 = CenterEye1_g6473();
				float3 temp_output_4_0_g6473 = ( localCenterEye1_g6473 - WorldPosition );
				float3 normalizeResult5_g6473 = normalize( temp_output_4_0_g6473 );
				float3 lerpResult2635 = lerp( appendResult248 , normalizeResult5_g6473 , float3( 0.3333,0.3333,0.3333 ));
				half3 Dir_LightDir2215 = ( ( ase_lightColor.rgb * ase_lightColor.a ) > float3( 0,0,0 ) ? normalizeResult1233 : lerpResult2635 );
				half3 localSHArgbambientDir6_g6474 = SHArgbambientDir();
				float dotResult5 = dot( NormalShade962 , ( Dir_LightDir2215 + localSHArgbambientDir6_g6474 ) );
				float NdotL1296 = dotResult5;
				float4 localVertexLightPosX3_g590 = VertexLightPosX3_g590();
				float4 break4_g590 = localVertexLightPosX3_g590;
				float4 localVertexLightPosY2_g590 = VertexLightPosY2_g590();
				float4 break5_g590 = localVertexLightPosY2_g590;
				float4 localVertexLightPosZ1_g590 = VertexLightPosZ1_g590();
				float4 break6_g590 = localVertexLightPosZ1_g590;
				float3 appendResult7_g590 = (float3(break4_g590.x , break5_g590.x , break6_g590.x));
				half3 VertLightPos12017 = appendResult7_g590;
				float4 transform2153 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 ifLocalVar3496 = 0;
				UNITY_BRANCH 
				if( _LightMode == 1.0 )
				ifLocalVar3496 = (transform2153).xyz;
				else if( _LightMode < 1.0 )
				ifLocalVar3496 = WorldPosition;
				half3 Lightmode2159 = ifLocalVar3496;
				float3 normalizeResult1382 = normalize( ( VertLightPos12017 - Lightmode2159 ) );
				float dotResult1381 = dot( NormalShade962 , normalizeResult1382 );
				float Vert_NdotL1389 = dotResult1381;
				float3 pos188_g590 = appendResult7_g590;
				float3 objToWorld139_g590 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_155_0_g590 = pow( distance( pos188_g590 , objToWorld139_g590 ) , 2.0 );
				float4 localVertexLightAttenuation86_g590 = VertexLightAttenuation86_g590();
				float4 break87_g590 = localVertexLightAttenuation86_g590;
				float attenx96_g590 = break87_g590.x;
				float temp_output_60_0_g590 = saturate( ( 1.0 - ( ( temp_output_155_0_g590 * attenx96_g590 ) / 25.0 ) ) );
				float temp_output_3408_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g590 ) * attenx96_g590 ) ) , ( temp_output_60_0_g590 * temp_output_60_0_g590 ) );
				float3 appendResult8_g590 = (float3(break4_g590.y , break5_g590.y , break6_g590.y));
				float3 pos290_g590 = appendResult8_g590;
				float3 objToWorld140_g590 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_75_0_g590 = pow( distance( pos290_g590 , objToWorld140_g590 ) , 2.0 );
				float atteny97_g590 = break87_g590.y;
				float temp_output_107_0_g590 = saturate( ( 1.0 - ( ( temp_output_75_0_g590 * atteny97_g590 ) / 25.0 ) ) );
				float temp_output_3408_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g590 ) * atteny97_g590 ) ) , ( temp_output_107_0_g590 * temp_output_107_0_g590 ) );
				float3 appendResult9_g590 = (float3(break4_g590.z , break5_g590.z , break6_g590.z));
				float3 pos389_g590 = appendResult9_g590;
				float3 objToWorld141_g590 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_79_0_g590 = pow( distance( pos389_g590 , objToWorld141_g590 ) , 2.0 );
				float attenz98_g590 = break87_g590.z;
				float temp_output_125_0_g590 = saturate( ( 1.0 - ( ( temp_output_79_0_g590 * attenz98_g590 ) / 25.0 ) ) );
				float temp_output_3408_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g590 ) * attenz98_g590 ) ) , ( temp_output_125_0_g590 * temp_output_125_0_g590 ) );
				float3 appendResult10_g590 = (float3(break4_g590.w , break5_g590.w , break6_g590.w));
				float3 pos491_g590 = appendResult10_g590;
				float3 objToWorld138_g590 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_83_0_g590 = pow( distance( pos491_g590 , objToWorld138_g590 ) , 2.0 );
				float attenw99_g590 = break87_g590.w;
				float temp_output_116_0_g590 = saturate( ( 1.0 - ( ( temp_output_83_0_g590 * attenw99_g590 ) / 25.0 ) ) );
				float temp_output_3408_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g590 ) * attenw99_g590 ) ) , ( temp_output_116_0_g590 * temp_output_116_0_g590 ) );
				half VertAtten2014 = ( temp_output_3408_23 + temp_output_3408_29 + temp_output_3408_30 + temp_output_3408_31 );
				float4 localVertexLightCol114_g590 = VertexLightCol114_g590();
				float4 temp_output_3408_16 = localVertexLightCol114_g590;
				float4 localVertexLightCol215_g590 = VertexLightCol215_g590();
				float4 temp_output_3408_17 = localVertexLightCol215_g590;
				float4 localVertexLightCol319_g590 = VertexLightCol319_g590();
				float4 temp_output_3408_18 = localVertexLightCol319_g590;
				float4 localVertexLightCol421_g590 = VertexLightCol421_g590();
				float4 temp_output_3408_20 = localVertexLightCol421_g590;
				float4 break1551 = ( temp_output_3408_16 + temp_output_3408_17 + temp_output_3408_18 + temp_output_3408_20 );
				#ifdef VERTEXLIGHT_ON
				float staticSwitch1905 = ( VertAtten2014 * saturate( ( break1551.x + break1551.y + break1551.z ) ) * break1551.w );
				#else
				float staticSwitch1905 = 0.0;
				#endif
				half VertTotal1665 = staticSwitch1905;
				float lerpResult2140 = lerp( VertTotal1665 , VertAtten2014 , VertTotal1665);
				float temp_output_2033_0 = ( 1.0 - saturate( ( 1.0 / pow( ( lerpResult2140 * 10.0 ) , 2.0 ) ) ) );
				float lerpResult1994 = lerp( NdotL1296 , Vert_NdotL1389 , temp_output_2033_0);
				#ifdef SHADING_OFF
				float staticSwitch4929 = 1.0;
				#else
				float staticSwitch4929 = lerpResult1994;
				#endif
				half OffsetDot4139 = _OffsetDot;
				float temp_output_1106_0 = ( staticSwitch4929 - OffsetDot4139 );
				float temp_output_1118_0 = ( _ShadowSharpness * temp_output_1106_0 );
				float saferPower4103 = max( temp_output_1118_0 , 0.0001 );
				float temp_output_1254_0 = saturate( pow( saferPower4103 , _ShadowPower ) );
				float3 lerpResult1016 = lerp( (_ShadowColour).rgb , float3( 1,1,1 ) , temp_output_1254_0);
				float saferPower4366 = max( ( _ShadowSharpness2 * ( temp_output_1106_0 - _OffsetDot2 ) ) , 0.0001 );
				float3 lerpResult4371 = lerp( (_ShadowColour2).rgb , float3( 1,1,1 ) , saturate( pow( saferPower4366 , _ShadowPower2 ) ));
				float saferPower4392 = max( temp_output_1254_0 , 0.0001 );
				float3 lerpResult4383 = lerp( float3( 1,1,1 ) , lerpResult4371 , pow( saferPower4392 , 0.75 ));
				float3 RampShade979 = ( LightMaskValue4804 * ( _StepTwo == 1.0 ? ( lerpResult1016 * lerpResult4383 ) : lerpResult1016 ) );
				float3 desaturateInitialColor581 = desaturateVar2917;
				float desaturateDot581 = dot( desaturateInitialColor581, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar581 = lerp( desaturateInitialColor581, desaturateDot581.xxx, ( ( 1.0 - RampShade979 ) * ( 1.0 - _ShadowSaturation ) ).x );
				float3 MaintexRGB3074 = desaturateVar581;
				half3 Vert_LightDir1491 = normalizeResult1382;
				float3 lerpResult2213 = lerp( Dir_LightDir2215 , Vert_LightDir1491 , temp_output_2033_0);
				half3 FinalLightDir2218 = lerpResult2213;
				float SphereizeVar3735 = _Spherize;
				float3 objToWorldDir3737 = mul( unity_ObjectToWorld, float4( i.ase_texcoord5.xyz, 0 ) ).xyz;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult3687 = dot( -( FinalLightDir2218 + ( SphereizeVar3735 == 1.0 ? objToWorldDir3737 : ase_worldNormal ) ) , ase_worldViewDir );
				float FinalDot4125 = saturate( temp_output_1118_0 );
				float lerpResult4129 = lerp( 0.0 , ( ( FinalDot4125 * 2.0 ) - OffsetDot4139 ) , _ShadeMaskSS);
				float3 objToWorldDir3646 = mul( unity_ObjectToWorld, float4( i.ase_texcoord5.xyz, 0 ) ).xyz;
				float3 lerpResult3593 = lerp( float3( 0,0,1 ) , staticSwitch4930 , ( temp_output_4203_0 * _NormalPowerSubSurface ));
				float3 tanNormal3594 = lerpResult3593;
				float3 worldNormal3594 = float3(dot(tanToWorld0,tanNormal3594), dot(tanToWorld1,tanNormal3594), dot(tanToWorld2,tanNormal3594));
				float3 ifLocalVar3644 = 0;
				UNITY_BRANCH 
				if( SphereizeVar3735 == 1.0 )
				ifLocalVar3644 = objToWorldDir3646;
				else if( SphereizeVar3735 < 1.0 )
				ifLocalVar3644 = worldNormal3594;
				float3 normalizeResult3595 = normalize( ifLocalVar3644 );
				float3 NormalSubSurface3596 = normalizeResult3595;
				float dotResult3589 = dot( ase_worldViewDir , -( FinalLightDir2218 + NormalSubSurface3596 ) );
				float temp_output_3797_0 = ( dotResult3589 - _OffsetSS );
				float4 transform5_g6477 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 localCenterEye1_g6478 = CenterEye1_g6478();
				float temp_output_4_0_g6477 = distance( transform5_g6477 , float4( ( (float)0 == 0.0 ? localCenterEye1_g6478 : _WorldSpaceCameraPos ) , 0.0 ) );
				float temp_output_3839_0 = temp_output_4_0_g6477;
				float temp_output_3720_0 = pow( (0.0 + (temp_output_3839_0 - 0.0) * (1.0 - 0.0) / (0.5 - 0.0)) , 0.25 );
				float temp_output_3608_0 = pow( ( temp_output_3797_0 * temp_output_3720_0 ) , _SSIntensity );
				float saferPower4685 = max( temp_output_3797_0 , 0.0001 );
				float lerpResult4686 = lerp( 1.0 , pow( ( ( temp_output_3797_0 - _OffsetSS2 ) * temp_output_3720_0 ) , _SSIntensity2 ) , pow( saferPower4685 , 0.75 ));
				float dotResult3702 = dot( ase_worldViewDir , -( FinalLightDir2218 + NormalSubSurface3596 ) );
				float saferPower3694 = max( ( ( 1.0 - ( temp_output_3839_0 * _SSAliasFix.x ) ) * 0.3 * ( dotResult3702 - _OffsetSS ) ) , 0.0001 );
				float smoothstepResult3721 = smoothstep( 0.0 , _SSAliasFix.z , saturate( pow( saferPower3694 , _SSAliasFix.y ) ));
				#ifdef SUBSURFACE_ON
				float staticSwitch4934 = ( _SSBrightness * ( saturate( ( dotResult3687 * 0.5 * _SSTransmission ) ) + saturate( ( ( lerpResult4129 + 1.0 ) * max( ( _SSDouble == 1.0 ? ( temp_output_3608_0 * lerpResult4686 ) : temp_output_3608_0 ) , 1E-05 ) ) ) ) * ( _UseLightMaskSS == 1.0 ? LightMaskValue4804 : 1.0 ) * ( ( 1.0 - smoothstepResult3721 ) * 0.75 ) );
				#else
				float staticSwitch4934 = 0.0;
				#endif
				float SubSurface3603 = staticSwitch4934;
				float temp_output_2082_0 = ( 1.0 - _WorldSpaceLightPos0.w );
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch1908 = ( ( temp_output_3408_16 * temp_output_3408_23 ) + ( temp_output_3408_17 * temp_output_3408_29 ) + ( temp_output_3408_18 * temp_output_3408_30 ) + ( temp_output_3408_20 * temp_output_3408_31 ) );
				#else
				float4 staticSwitch1908 = half4(0,0,0,0);
				#endif
				float4 VertLight1406 = staticSwitch1908;
				float3 localunity_SHArgb3_g6475 = unity_SHArgb3_g6475();
				float3 saferPower4200 = max( ( ( ( ase_lightColor.rgb * float3( 1,1,1 ) * temp_output_2082_0 ) + ( (VertLight1406).xyz * float3( 0.5,0.5,0.5 ) * temp_output_2082_0 ) + ( localunity_SHArgb3_g6475 * float3( 1.25,1.25,1.25 ) ) ) * _LightMulti * (_LightColourBias).rgb ) , 0.0001 );
				float3 temp_cast_8 = (_MinLight).xxx;
				float3 clampResult3331 = clamp( pow( saferPower4200 , 0.8 ) , temp_cast_8 , float3( 2,2,2 ) );
				float3 break5_g6476 = clampResult3331;
				float3 clampResult1914 = clamp( clampResult3331 , float3( 0,0,0 ) , ( ( _MaxLight * 2.0 * max( max( break5_g6476.x , break5_g6476.y ) , max( break5_g6476.y , break5_g6476.z ) ) ) / clampResult3331 ) );
				float3 break5_g6480 = clampResult1914;
				float saferPower3564 = max( saturate( max( max( break5_g6480.x , break5_g6480.y ) , max( break5_g6480.y , break5_g6480.z ) ) ) , 0.0001 );
				float3 break5_g6479 = clampResult1914;
				float clampResult3551 = clamp( ( pow( saferPower3564 , 3.0 ) - ( ( 1.0 - saturate( min( min( break5_g6479.x , break5_g6479.y ) , min( break5_g6479.y , break5_g6479.z ) ) ) ) * _LightSaturationLimiter ) ) , ( ( 1.0 - _LightSatTotal ) + 0.2 ) , 1.0 );
				float3 desaturateInitialColor1777 = clampResult1914;
				float desaturateDot1777 = dot( desaturateInitialColor1777, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1777 = lerp( desaturateInitialColor1777, desaturateDot1777.xxx, clampResult3551 );
				float3 temp_cast_9 = (( ( 1.0 - temp_output_1106_0 ) * _ShadowDarkness )).xxx;
				float3 clampResult30 = clamp( ( RampShade979 - temp_cast_9 ) , float3( 0,0,0 ) , float3( 0.8,0.8,0.8 ) );
				float3 AllLight3270 = clampResult1914;
				float3 ifLocalVar3502 = 0;
				if( _ShadeColorDynamic == 1.0 )
				ifLocalVar3502 = (float3( 0.5,0.5,0.5 ) + ((AllLight3270).xyz - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.5,0.5,0.5 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				else if( _ShadeColorDynamic < 1.0 )
				ifLocalVar3502 = (float3( 0.5,0.5,0.5 ) + ((_ShadeColour).rgb - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.5,0.5,0.5 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float dotResult4424 = dot( NormalShade962 , ase_worldViewDir );
				float clampResult4423 = clamp( dotResult4424 , 1E-05 , 1.99999 );
				float3 ifLocalVar4422 = 0;
				if( clampResult4423 > 0.0 )
				ifLocalVar4422 = NormalShade962;
				else if( clampResult4423 < 0.0 )
				ifLocalVar4422 = -NormalShade962;
				float fresnelNdotV645 = dot( normalize( ifLocalVar4422 ), FinalLightDir2218 );
				float fresnelNode645 = ( 0.0 + _SoftScale * pow( max( 1.0 - fresnelNdotV645 , 0.0001 ), _SoftPower ) );
				float fresnelNdotV662 = dot( normalize( ifLocalVar4422 ), ase_worldViewDir );
				float fresnelNode662 = ( 0.0 + _SoftScale * pow( max( 1.0 - fresnelNdotV662 , 0.0001 ), _SoftPower ) );
				float lerpResult669 = lerp( 1.0 , ( 1.0 - ( saturate( fresnelNode645 ) * 0.5 * ( saturate( fresnelNode662 ) * 0.5 ) ) ) , _ShadeLevel);
				float3 lerpResult3285 = lerp( ( ifLocalVar3502 * float3( 0.1,0.1,0.1 ) ) , float3( 1,1,1 ) , lerpResult669);
				#ifdef SOFTSHADE_OFF
				float3 staticSwitch4926 = half3(1,1,1);
				#else
				float3 staticSwitch4926 = lerpResult3285;
				#endif
				float3 LightShaded2289 = ( clampResult30 * staticSwitch4926 );
				float3 LightColour968 = ( desaturateVar1777 * LightShaded2289 );
				float3 saferPower3799 = max( LightColour968 , 0.0001 );
				float3 temp_cast_10 = (1.0).xxx;
				#ifdef _DISABLELIGHT_ON
				float3 staticSwitch4927 = temp_cast_10;
				#else
				float3 staticSwitch4927 = ( ( SubSurface3603 * pow( saferPower3799 , 2.0 ) ) + LightColour968 );
				#endif
				float3 PostDesaturation1276 = ( ( MaintexRGB3074 * staticSwitch4927 ) + float3( 0.0001,0.0001,0.0001 ) );
				float3 lerpResult1536 = lerp( ase_worldNormal , NormalShade962 , _Scale1);
				float3 ifLocalVar3505 = 0;
				if( _RimNormal == 1.0 )
				ifLocalVar3505 = lerpResult1536;
				else if( _RimNormal < 1.0 )
				ifLocalVar3505 = ase_worldNormal;
				float fresnelNdotV360 = dot( ifLocalVar3505, ase_worldViewDir );
				float fresnelNode360 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV360, _Power ) );
				float smoothstepResult379 = smoothstep( _Min , _Max , fresnelNode360);
				float3 temp_output_382_0 = ( (_RimOutlineColour).rgb * smoothstepResult379 );
				float4 transform5_g6581 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 localCenterEye1_g6582 = CenterEye1_g6582();
				float temp_output_4_0_g6581 = distance( transform5_g6581 , float4( ( (float)0 == 0.0 ? localCenterEye1_g6582 : _WorldSpaceCameraPos ) , 0.0 ) );
				float dotResult17_g6580 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_23_0_g6580 = ( ( 1.0 - ( temp_output_4_0_g6581 * 0.25 ) ) * 8.0 * dotResult17_g6580 );
				float temp_output_19_0_g6580 = saturate( temp_output_23_0_g6580 );
				float temp_output_3773_0 = ( ( temp_output_19_0_g6580 + 0.25 ) * _Amount );
				float3 lerpResult388 = lerp( PostDesaturation1276 , ( temp_output_382_0 + PostDesaturation1276 ) , temp_output_3773_0);
				float temp_output_383_0 = ( smoothstepResult379 * temp_output_3773_0 );
				float3 lerpResult390 = lerp( PostDesaturation1276 , temp_output_382_0 , temp_output_383_0);
				float3 lerpResult372 = lerp( PostDesaturation1276 , temp_output_382_0 , temp_output_383_0);
				float3 ifLocalVar1284 = 0;
				if( _RimMode > 1.0 )
				ifLocalVar1284 = lerpResult388;
				else if( _RimMode == 1.0 )
				ifLocalVar1284 = lerpResult390;
				else if( _RimMode < 1.0 )
				ifLocalVar1284 = lerpResult372;
				float2 uv_Emission = i.ase_texcoord1.xy * _Emission_ST.xy + _Emission_ST.zw;
				float mulTime4888 = _Time.y * _ScrollX;
				float mulTime4893 = _Time.y * _ScrollY;
				float2 appendResult4890 = (float2(( uv_Emission.x + mulTime4888 ) , ( uv_Emission.y + mulTime4893 )));
				float4 tex2DNode328 = tex2D( _Emission, appendResult4890 );
				float EmissionMask4679 = tex2DNode328.a;
				#ifdef RIMLIGHT_ON
				float3 staticSwitch4919 = ( ifLocalVar1284 * ( _MaskFresnel == 1.0 ? EmissionMask4679 : 1.0 ) );
				#else
				float3 staticSwitch4919 = PostDesaturation1276;
				#endif
				float3 aColor1_g6512 = (tex2DNode328).rgb;
				float aHue1_g6512 = _EmissionHue;
				float3 localHueShifter1_g6512 = HueShifter1_g6512( aColor1_g6512 , aHue1_g6512 );
				float3 temp_output_4845_0 = localHueShifter1_g6512;
				float3 lerpResult450 = lerp( temp_output_4845_0 , ( ( temp_output_4845_0 * saturate( LightColour968 ) ) + ( temp_output_4845_0 * (_ShadedColour).rgb * ( 1.0 - saturate( LightColour968 ) ) ) ) , _ShadedEmission);
				float grayscale4853 = (LightColour968.r + LightColour968.g + LightColour968.b) / 3;
				float3 lerpResult4317 = lerp( lerpResult450 , float3( 0,0,0 ) , saturate( grayscale4853 ));
				float3 temp_cast_13 = (3.0).xxx;
				float3 clampResult331 = clamp( ( ( _ShadedOnly == 1.0 ? lerpResult4317 : lerpResult450 ) * EmissionMask4679 * (_EmissionColor).rgb * _EmissionIntensity ) , float3( 0,0,0 ) , temp_cast_13 );
				float3 Emission1285 = clampResult331;
				float luminance4320 = Luminance(Emission1285);
				float lerpResult4852 = lerp( luminance4320 , _FullBright , _FullBright);
				float3 lerpResult4234 = lerp( staticSwitch4919 , Emission1285 , lerpResult4852);
				float3 PostRimLight1292 = lerpResult4234;
				float3 localCenterEye1_g6590 = CenterEye1_g6590();
				float3 ifLocalVar50_g6589 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar50_g6589 = localCenterEye1_g6590;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar50_g6589 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g6589 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g6589 - WorldPosition ), 0 ) ).xyz );
				float3 lerpResult3086 = lerp( float3( 0,0,1 ) , staticSwitch4930 , ( _NormalPowerMatCap * temp_output_4203_0 ));
				float3 tanNormal3090 = lerpResult3086;
				float3 worldNormal3090 = float3(dot(tanToWorld0,tanNormal3090), dot(tanToWorld1,tanNormal3090), dot(tanToWorld2,tanNormal3090));
				float3 normalizeResult3091 = normalize( worldNormal3090 );
				float3 NormalMatCap3089 = normalizeResult3091;
				float3 worldToViewDir13_g6589 = normalize( mul( UNITY_MATRIX_V, float4( NormalMatCap3089, 0 ) ).xyz );
				float mulTime2208 = _Time.y * _MatcapSpin;
				float cos2210 = cos( mulTime2208 );
				float sin2210 = sin( mulTime2208 );
				float2 rotator2210 = mul( (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g6589 ) , worldToViewDir13_g6589 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) - float2( 0.5,0.5 ) , float2x2( cos2210 , -sin2210 , sin2210 , cos2210 )) + float2( 0.5,0.5 );
				float3 localCenterEye1_g6588 = CenterEye1_g6588();
				float3 ifLocalVar32_g6587 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar32_g6587 = localCenterEye1_g6588;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar32_g6587 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g6587 = normalize( ( ifLocalVar32_g6587 - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g6587 = normalize( cross( normalizeResult19_g6587 , _worldUp ) );
				float3 temp_output_21_0_g6587 = NormalMatCap3089;
				float dotResult10_g6587 = dot( normalizeResult8_g6587 , temp_output_21_0_g6587 );
				float dotResult2_g6587 = dot( _worldUp , normalizeResult19_g6587 );
				float3 normalizeResult7_g6587 = normalize( ( _worldUp - ( dotResult2_g6587 * normalizeResult19_g6587 ) ) );
				float dotResult9_g6587 = dot( normalizeResult7_g6587 , temp_output_21_0_g6587 );
				float2 appendResult11_g6587 = (float2(dotResult10_g6587 , dotResult9_g6587));
				float cos2207 = cos( mulTime2208 );
				float sin2207 = sin( mulTime2208 );
				float2 rotator2207 = mul( ( ( appendResult11_g6587 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) - float2( 0.5,0.5 ) , float2x2( cos2207 , -sin2207 , sin2207 , cos2207 )) + float2( 0.5,0.5 );
				float2 ifLocalVar3528 = 0;
				UNITY_BRANCH 
				if( _Legacy == 1.0 )
				ifLocalVar3528 = rotator2210;
				else if( _Legacy < 1.0 )
				ifLocalVar3528 = rotator2207;
				float4 tex2DNode2175 = tex2D( _Matcap, ifLocalVar3528 );
				float3 desaturateInitialColor1516 = ( (tex2DNode2175).rgb * _MatcapIntensity * (_MatCapColor).rgb );
				float desaturateDot1516 = dot( desaturateInitialColor1516, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1516 = lerp( desaturateInitialColor1516, desaturateDot1516.xxx, ( 1.0 - _MatcapSaturation ) );
				float2 uv_MatCapMask = i.ase_texcoord1.xy * _MatCapMask_ST.xy + _MatCapMask_ST.zw;
				float4 tex2DNode3109 = tex2D( _MatCapMask, uv_MatCapMask );
				float lerpResult3268 = lerp( 1.0 , ( tex2DNode3109.r * tex2DNode3109.a ) , _MatcapMaskLevel1);
				float3 lerpResult405 = lerp( PostRimLight1292 , ( PostRimLight1292 * desaturateVar1516 ) , ( _MatCapColor.a * (tex2DNode2175).a * _MatcapOpacity * lerpResult3268 ));
				float3 PostMatcap1274 = lerpResult405;
				#ifdef MATCAP_ON
				float3 staticSwitch4916 = PostMatcap1274;
				#else
				float3 staticSwitch4916 = PostRimLight1292;
				#endif
				float3 desaturateInitialColor2291 = LightColour968;
				float desaturateDot2291 = dot( desaturateInitialColor2291, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2291 = lerp( desaturateInitialColor2291, desaturateDot2291.xxx, 1.0 );
				float3 temp_output_2287_0 = (desaturateVar2291).xyz;
				float3 localCenterEye1_g6554 = CenterEye1_g6554();
				float3 temp_output_4_0_g6554 = ( localCenterEye1_g6554 - WorldPosition );
				float3 normalizeResult5_g6554 = normalize( temp_output_4_0_g6554 );
				float3 ifLocalVar3493 = 0;
				if( _StereoFixSpec == 1.0 )
				ifLocalVar3493 = normalizeResult5_g6554;
				else if( _StereoFixSpec < 1.0 )
				ifLocalVar3493 = ase_worldViewDir;
				float3 normalizeResult1783 = normalize( ( ifLocalVar3493 + FinalLightDir2218 ) );
				float3 lerpResult602 = lerp( float3( 0,0,1 ) , staticSwitch4930 , ( temp_output_4203_0 * _NormalPowerSpecular ));
				float3 tanNormal1234 = lerpResult602;
				float3 worldNormal1234 = float3(dot(tanToWorld0,tanNormal1234), dot(tanToWorld1,tanNormal1234), dot(tanToWorld2,tanNormal1234));
				float3 normalizeResult3055 = normalize( worldNormal1234 );
				float3 NormalSpecular965 = normalizeResult3055;
				float dotResult551 = dot( normalizeResult1783 , NormalSpecular965 );
				float saferPower545 = max( dotResult551 , 0.0001 );
				float saferPower556 = max( 10.0 , 0.0001 );
				float temp_output_4188_0 = ( 1.0 - _Roughness );
				float2 uv_Glossiness = i.ase_texcoord1.xy * _Glossiness_ST.xy + _Glossiness_ST.zw;
				float4 tex2DNode4148 = tex2D( _Glossiness, uv_Glossiness );
				float temp_output_4149_0 = ( tex2DNode4148.r * tex2DNode4148.a * _RoughnessLevel );
				float saferPower4154 = max( ( _RoughnessInvert == 1.0 ? ( 1.0 - temp_output_4149_0 ) : temp_output_4149_0 ) , 0.0001 );
				float ifLocalVar4181 = 0;
				UNITY_BRANCH 
				if( _Roughness == 1.0 )
				ifLocalVar4181 = saturate( pow( saferPower4154 , _RoughnessPower ) );
				else if( _Roughness < 1.0 )
				ifLocalVar4181 = 0.0;
				float RoughnessSpec4785 = ( temp_output_4188_0 + ifLocalVar4181 );
				float clampResult2294 = clamp( ( pow( saferPower545 , exp( ( 10.0 - _SpecularSize ) ) ) * pow( saferPower556 , ( _SpecularStrength * RoughnessSpec4785 ) ) ) , 0.0001 , 5.0 );
				float saferPower3056 = max( _SpecularOpacity , 0.0001 );
				float lerpResult816 = lerp( 0.0 , clampResult2294 , saturate( pow( saferPower3056 , 2.0 ) ));
				float3 appendResult2234 = (float3(lerpResult816 , lerpResult816 , lerpResult816));
				float3 temp_output_3064_0 = ( (_SpecMatCapColor1).rgb * saturate( appendResult2234 ) );
				float3 ifLocalVar3482 = 0;
				UNITY_BRANCH 
				if( _SpecMode == 1.0 )
				ifLocalVar3482 = ( temp_output_3064_0 * ( ( (LightColour968).xyz * MaintexRGB3074 ) + MaintexRGB3074 ) );
				else if( _SpecMode < 1.0 )
				ifLocalVar3482 = temp_output_3064_0;
				float3 localCenterEye1_g6579 = CenterEye1_g6579();
				float3 ifLocalVar50_g6578 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar50_g6578 = localCenterEye1_g6579;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar50_g6578 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g6578 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g6578 - WorldPosition ), 0 ) ).xyz );
				float3 worldToViewDir13_g6578 = normalize( mul( UNITY_MATRIX_V, float4( NormalSpecular965, 0 ) ).xyz );
				float3 localCenterEye1_g6577 = CenterEye1_g6577();
				float3 ifLocalVar32_g6576 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar32_g6576 = localCenterEye1_g6577;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar32_g6576 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g6576 = normalize( ( ifLocalVar32_g6576 - WorldPosition ) );
				float3 normalizeResult8_g6576 = normalize( cross( normalizeResult19_g6576 , _worldUp ) );
				float3 temp_output_21_0_g6576 = NormalSpecular965;
				float dotResult10_g6576 = dot( normalizeResult8_g6576 , temp_output_21_0_g6576 );
				float dotResult2_g6576 = dot( _worldUp , normalizeResult19_g6576 );
				float3 normalizeResult7_g6576 = normalize( ( _worldUp - ( dotResult2_g6576 * normalizeResult19_g6576 ) ) );
				float dotResult9_g6576 = dot( normalizeResult7_g6576 , temp_output_21_0_g6576 );
				float2 appendResult11_g6576 = (float2(dotResult10_g6576 , dotResult9_g6576));
				float2 ifLocalVar3491 = 0;
				UNITY_BRANCH 
				if( _Legacy2 == 1.0 )
				ifLocalVar3491 = (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g6578 ) , worldToViewDir13_g6578 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 )));
				else if( _Legacy2 < 1.0 )
				ifLocalVar3491 = ( ( appendResult11_g6576 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) );
				float saferPower4196 = max( ( ( 1.0 - RoughnessSpec4785 ) * 3.0 ) , 0.0001 );
				float3 desaturateInitialColor1920 = (tex2Dlod( _SpecularMatcap, float4( ifLocalVar3491, 0, pow( saferPower4196 , 2.0 )) )).rgb;
				float desaturateDot1920 = dot( desaturateInitialColor1920, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1920 = lerp( desaturateInitialColor1920, desaturateDot1920.xxx, ( 1.0 - _SpecMatcapSaturation ) );
				float3 saferPower4728 = max( desaturateVar1920 , 0.0001 );
				float3 temp_cast_18 = (_SpecMatcapPower).xxx;
				float3 temp_output_690_0 = ( pow( saferPower4728 , temp_cast_18 ) * _SpecMatcapMultiply * (_SpecMatCapColor).rgb );
				float3 ifLocalVar3489 = 0;
				UNITY_BRANCH 
				if( _SpecMatCapMode == 1.0 )
				ifLocalVar3489 = ( temp_output_690_0 * MaintexRGB3074 );
				else if( _SpecMatCapMode < 1.0 )
				ifLocalVar3489 = temp_output_690_0;
				float3 lerpResult4340 = lerp( float3( 0,0,0 ) , ifLocalVar3489 , _SpecMatcapOpacity);
				#ifdef SPECMATCAP_ON
				float3 staticSwitch4932 = lerpResult4340;
				#else
				float3 staticSwitch4932 = float3( 0,0,0 );
				#endif
				UnityGIInput data;
				UNITY_INITIALIZE_OUTPUT( UnityGIInput, data );
				data.worldPos = WorldPosition;
				data.worldViewDir = ase_worldViewDir;
				data.probeHDR[0] = unity_SpecCube0_HDR;
				data.probeHDR[1] = unity_SpecCube1_HDR;
				#if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION //specdataif0
				data.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif //specdataif0
				#if UNITY_SPECCUBE_BOX_PROJECTION //specdataif1
				data.boxMax[0] = unity_SpecCube0_BoxMax;
				data.probePosition[0] = unity_SpecCube0_ProbePosition;
				data.boxMax[1] = unity_SpecCube1_BoxMax;
				data.boxMin[1] = unity_SpecCube1_BoxMin;
				data.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif //specdataif1
				Unity_GlossyEnvironmentData g3174 = UnityGlossyEnvironmentSetup( ( _ProbeSmoothness * ( temp_output_4188_0 + ( ifLocalVar4181 * 2.0 ) ) ), ase_worldViewDir, NormalSpecular965, float3(0,0,0));
				float3 indirectSpecular3174 = UnityGI_IndirectSpecular( data, ( 0.5 * _ReflectionOpacity ), NormalSpecular965, g3174 );
				float3 temp_cast_19 = (_ReflectionPower).xxx;
				float3 desaturateInitialColor4747 = pow( ( _ReflectionIntensity * indirectSpecular3174 ) , temp_cast_19 );
				float desaturateDot4747 = dot( desaturateInitialColor4747, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar4747 = lerp( desaturateInitialColor4747, desaturateDot4747.xxx, ( 1.0 - _ReflectionSaturation ) );
				#ifdef SPECULARHIGHLIGHTS_ON
				float3 staticSwitch4931 = max( desaturateVar4747 , float3( 0.0001,0.0001,0.0001 ) );
				#else
				float3 staticSwitch4931 = float3( 0,0,0 );
				#endif
				float2 uv_SpecularMask = i.ase_texcoord1.xy * _SpecularMask_ST.xy + _SpecularMask_ST.zw;
				float4 tex2DNode695 = tex2D( _SpecularMask, uv_SpecularMask );
				float3 lerpResult560 = lerp( float3( 0,0,0 ) , ( ifLocalVar3482 + ( staticSwitch4932 + staticSwitch4931 ) ) , pow( ( _SpecularLevel * tex2DNode695.r * tex2DNode695.a ) , _SpecMaskPower ));
				float3 SpecularOut983 = lerpResult560;
				float2 uv_SparkleMask = i.ase_texcoord1.xy * _SparkleMask_ST.xy + _SparkleMask_ST.zw;
				float4 tex2DNode87_g1 = tex2D( _SparkleMask, uv_SparkleMask );
				float3 temp_cast_20 = (_Threshold).xxx;
				float3 localCenterEye1_g556 = CenterEye1_g556();
				float temp_output_4_0_g555 = distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g556 : _WorldSpaceCameraPos ) );
				float temp_output_102_0_g1 = temp_output_4_0_g555;
				float3 temp_cast_22 = (saturate( ( _Threshold + pow( _Range , ( 1.0 - (0.0 + (temp_output_102_0_g1 - 0.0) * (0.1 - 0.0) / (1.0 - 0.0)) ) ) ) )).xxx;
				float2 uv_SparklePattern = i.ase_texcoord1.xy * _SparklePattern_ST.xy + _SparklePattern_ST.zw;
				sampler2D texvalue34_g548 = _SparklePattern;
				float2 temp_output_4_0_g548 = uv_SparklePattern;
				float2 uvin34_g548 = temp_output_4_0_g548;
				float2 dx34_g548 = ( ddx( temp_output_4_0_g548 ) * float2( 0.25,0.25 ) );
				float2 dy34_g548 = ( ddy( temp_output_4_0_g548 ) * float2( 0.25,0.25 ) );
				float bias34_g548 = _SparkleSSBias;
				float4 localsupersample2x234_g548 = supersample2x2( texvalue34_g548 , uvin34_g548 , dx34_g548 , dy34_g548 , bias34_g548 );
				#ifdef SPARKLESS_ON
				float4 staticSwitch195_g1 = localsupersample2x234_g548;
				#else
				float4 staticSwitch195_g1 = tex2D( _SparklePattern, uv_SparklePattern );
				#endif
				float grayscale107_g1 = dot(staticSwitch195_g1.rgb, float3(0.299,0.587,0.114));
				float3 appendResult113_g1 = (float3(grayscale107_g1 , grayscale107_g1 , grayscale107_g1));
				float3 lerpResult109_g1 = lerp( appendResult113_g1 , (staticSwitch195_g1).rgb , _SparkleTexColour);
				float2 break22_g1 = uv_SparklePattern;
				float2 appendResult39_g1 = (float2(-break22_g1.x , break22_g1.y));
				float4 screenPos = i.ase_texcoord6;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 temp_output_18_0_g1 = (ase_screenPosNorm).xy;
				float3 localCenterEye1_g552 = CenterEye1_g552();
				float4 appendResult76_g551 = (float4(( WorldPosition - localCenterEye1_g552 ) , 0.0));
				float4 temp_output_77_0_g551 = mul( UNITY_MATRIX_V, appendResult76_g551 );
				float2 break83_g551 = ( (temp_output_77_0_g551).xy / (temp_output_77_0_g551).z );
				float2 appendResult86_g551 = (float2(( ( _ScreenParams.z / _ScreenParams.w ) * break83_g551.x ) , ( break83_g551.y * 2.0 )));
				float2 appendResult101_g551 = (float2(1.0 , 1.0));
				float2 appendResult102_g551 = (float2(0.0 , 0.0));
				float2 temp_output_16_0_g1 = ( ( ( ( -appendResult86_g551 * float2( 1,0.5 ) ) + float2( 0.5,0.5 ) ) * appendResult101_g551 ) + appendResult102_g551 );
				float3 localCenterEye1_g554 = CenterEye1_g554();
				float temp_output_4_0_g553 = distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g554 : _WorldSpaceCameraPos ) );
				float saferPower189_g1 = max( temp_output_4_0_g553 , 0.0001 );
				float2 lerpResult183_g1 = lerp( temp_output_18_0_g1 , temp_output_16_0_g1 , ( saturate( ( 1.0 / pow( saferPower189_g1 , 2.0 ) ) ) + 0.1 ));
				float2 ifLocalVar27_g1 = 0;
				UNITY_BRANCH 
				if( _StereoCorrect > 1.0 )
				ifLocalVar27_g1 = temp_output_18_0_g1;
				else if( _StereoCorrect == 1.0 )
				ifLocalVar27_g1 = temp_output_16_0_g1;
				else if( _StereoCorrect < 1.0 )
				ifLocalVar27_g1 = lerpResult183_g1;
				float mulTime7_g1 = _Time.y * _MotionSpeed;
				float2 appendResult24_g1 = (float2(mulTime7_g1 , 0.0));
				float cos25_g1 = cos( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float sin25_g1 = sin( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float2 rotator25_g1 = mul( appendResult24_g1 - float2( 0.5,0.5 ) , float2x2( cos25_g1 , -sin25_g1 , sin25_g1 , cos25_g1 )) + float2( 0.5,0.5 );
				float2 appendResult28_g1 = (float2(sin( mulTime7_g1 ) , cos( mulTime7_g1 )));
				float2 ifLocalVar40_g1 = 0;
				UNITY_BRANCH 
				if( _MotionType == 0.0 )
				ifLocalVar40_g1 = rotator25_g1;
				else if( _MotionType < 0.0 )
				ifLocalVar40_g1 = appendResult28_g1;
				float temp_output_26_0_g1 = ( ( WorldPosition.x + WorldPosition.y + WorldPosition.z ) * ( _WorldPosContribution / 10.0 ) );
				float2 appendResult46_g1 = (float2(-temp_output_26_0_g1 , temp_output_26_0_g1));
				float2 temp_output_50_0_g1 = ( ( appendResult39_g1 + ( ifLocalVar27_g1 * _ScreenContribution ) ) + float2( 0.25,0.25 ) + ( _MotionIntensity * ifLocalVar40_g1 ) + appendResult46_g1 );
				sampler2D texvalue34_g549 = _SparklePattern;
				float2 temp_output_4_0_g549 = temp_output_50_0_g1;
				float2 uvin34_g549 = temp_output_4_0_g549;
				float2 dx34_g549 = ( ddx( temp_output_4_0_g549 ) * float2( 0.25,0.25 ) );
				float2 dy34_g549 = ( ddy( temp_output_4_0_g549 ) * float2( 0.25,0.25 ) );
				float bias34_g549 = _SparkleSSBias;
				float4 localsupersample2x234_g549 = supersample2x2( texvalue34_g549 , uvin34_g549 , dx34_g549 , dy34_g549 , bias34_g549 );
				#ifdef SPARKLESS_ON
				float4 staticSwitch196_g1 = localsupersample2x234_g549;
				#else
				float4 staticSwitch196_g1 = tex2D( _SparklePattern, temp_output_50_0_g1 );
				#endif
				float grayscale108_g1 = dot(staticSwitch196_g1.rgb, float3(0.299,0.587,0.114));
				float3 appendResult114_g1 = (float3(grayscale108_g1 , grayscale108_g1 , grayscale108_g1));
				float3 lerpResult110_g1 = lerp( appendResult114_g1 , (staticSwitch196_g1).rgb , _SparkleTexColour);
				float3 localCenterEye1_g550 = CenterEye1_g550();
				float3 smoothstepResult93_g1 = smoothstep( temp_cast_20 , temp_cast_22 , ( lerpResult109_g1 * lerpResult110_g1 * ( 1.0 - pow( ( distance( WorldPosition , localCenterEye1_g550 ) / 10000.0 ) , 0.5 ) ) ));
				float3 clampResult151_g1 = clamp( smoothstepResult93_g1 , float3( 0,0,0 ) , float3( 3,3,3 ) );
				float clampResult139_g1 = clamp( (1.0 + (temp_output_102_0_g1 - 0.0) * (100.0 - 1.0) / (2.0 - 0.0)) , 0.0 , 100.0 );
				float saferPower143_g1 = max( clampResult139_g1 , 0.0001 );
				float3 normalizeResult64_g1 = normalize( ase_worldViewDir );
				float3 temp_output_97_0_g1 = NormalSpecular965;
				float dotResult176_g1 = dot( temp_output_97_0_g1 , ase_worldViewDir );
				float clampResult177_g1 = clamp( dotResult176_g1 , 1E-05 , 1.99999 );
				float3 ifLocalVar178_g1 = 0;
				if( clampResult177_g1 > 0.0 )
				ifLocalVar178_g1 = temp_output_97_0_g1;
				else if( clampResult177_g1 < 0.0 )
				ifLocalVar178_g1 = -temp_output_97_0_g1;
				float3 break66_g1 = (float3( 0,0,0 ) + (_SparkleFresnel - float3( 0,0,0 )) * (float3( 0.1,0.1,0.1 ) - float3( 0,0,0 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float fresnelNdotV73_g1 = dot( ifLocalVar178_g1, normalizeResult64_g1 );
				float fresnelNode73_g1 = ( break66_g1.x + break66_g1.y * pow( max( 1.0 - fresnelNdotV73_g1 , 0.0001 ), break66_g1.z ) );
				float3 temp_output_95_0_g1 = ( pow( ( tex2DNode87_g1.r * tex2DNode87_g1.a * _SparkleMaskMultiply ) , _SparkleMaskPower ) * clampResult151_g1 * ( (_SparkleColor).rgb * ( ( saturate( ( 1.0 / temp_output_102_0_g1 ) ) * 2.0 ) * pow( saferPower143_g1 , 1.85 ) ) ) * ( 1.0 - saturate( fresnelNode73_g1 ) ) );
				float3 temp_cast_28 = (_SparkleHDRMax).xxx;
				float3 clampResult193_g1 = clamp( ( _SparkleMode == 1.0 ? ( MaintexRGB3074 * temp_output_95_0_g1 ) : temp_output_95_0_g1 ) , float3( 1E-05,1E-05,1E-05 ) , temp_cast_28 );
				#ifdef SPARKLE_ON
				float3 staticSwitch4933 = clampResult193_g1;
				#else
				float3 staticSwitch4933 = float3( 0,0,0 );
				#endif
				float3 SparkleOut971 = staticSwitch4933;
				float2 uv_ParallaxMask = i.ase_texcoord1.xy * _ParallaxMask_ST.xy + _ParallaxMask_ST.zw;
				float2 uv_ParallaxTexture = i.ase_texcoord1.xy * _ParallaxTexture_ST.xy + _ParallaxTexture_ST.zw;
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = Unity_SafeNormalize( ase_tanViewDir );
				float2 Offset29_g6750 = ( ( _ParallaxHeight - 1 ) * ase_tanViewDir.xy * _ParallaxScale ) + uv_ParallaxTexture;
				float2 Offset57_g6750 = ( ( _ParallaxHeight - 1 ) * ( ase_tanViewDir.xy / ase_tanViewDir.z ) * _ParallaxScale ) + uv_ParallaxTexture;
				float2 temp_output_59_0_g6750 = ( (float)(int)_ParallaxType == 0.0 ? Offset29_g6750 : Offset57_g6750 );
				float4 tex2DNode41_g6750 = tex2D( _ParallaxTexture, temp_output_59_0_g6750 );
				#ifdef PARALLAX_ON
				float3 staticSwitch4920 = ( pow( tex2D( _ParallaxMask, uv_ParallaxMask ).r , _ParallaxMaskPower ) * (( tex2DNode41_g6750 * _ParallaxColour * tex2DNode41_g6750.a * _ParallaxColour.a )).rgb );
				#else
				float3 staticSwitch4920 = float3( 0,0,0 );
				#endif
				float localbits18_g6752 = ( 0.0 );
				float Alpha1262 = (staticSwitch4936).a;
				float temp_output_333_0 = ( _Alpha * Alpha1262 );
				float temp_output_3_0_g6752 = temp_output_333_0;
				half4 screenuv1_g6752 = ( screenPos / screenPos.w );
				half4 localStereoScreenUV1_g6752 = StereoScreenUV1_g6752( screenuv1_g6752 );
				float4 break8_g6752 = localStereoScreenUV1_g6752;
				int x11_g6752 = (int)fmod( break8_g6752.x , 8.0 );
				int y11_g6752 = (int)fmod( break8_g6752.y , 8.0 );
				half localDither8x8Bayer11_g6752 = Dither8x8Bayer( x11_g6752 , y11_g6752 );
				int localRenderSampleCount4_g6752 = RenderSampleCount();
				#ifdef COVERAGE_ON
				float staticSwitch65_g6752 = ( ( temp_output_3_0_g6752 + ( ( 1.0 - localDither8x8Bayer11_g6752 ) / ( localRenderSampleCount4_g6752 / _A2CSampleBias ) ) ) * localRenderSampleCount4_g6752 );
				#else
				float staticSwitch65_g6752 = 0.0;
				#endif
				float covtoggle18_g6752 = ceil( saturate( staticSwitch65_g6752 ) );
				float finalAlpha18_g6752 = staticSwitch65_g6752;
				float preFinalAlpha18_g6752 = temp_output_3_0_g6752;
				{
				// Shift and subtract to get the needed amount of positive bits
				  if (covtoggle18_g6752 == 1)
				{
				cov = (1u << (uint)(finalAlpha18_g6752)) - 1u;
				finalAlpha18_g6752 = 1;
				}
				  if (covtoggle18_g6752 == 0)
				{
				cov = 0xFF;
				finalAlpha18_g6752 = preFinalAlpha18_g6752;
				}
				}
				int localisCamera1_g6751 = isCamera1_g6751();
				int Cam17_g6751 = localisCamera1_g6751;
				int temp_output_5_0_g6751 = (int)_IsInMirror;
				int temp_output_6_0_g6751 = (int)_IsNotMirror;
				float ifLocalVar3478 = 0;
				UNITY_BRANCH 
				if( _MirrorSystem == 1.0 )
				ifLocalVar3478 = (float)( (float)Cam17_g6751 == 1.0 ? ( (float)temp_output_5_0_g6751 == 1.0 ? ( Cam17_g6751 + temp_output_5_0_g6751 ) : ( Cam17_g6751 * temp_output_5_0_g6751 ) ) : ( (float)temp_output_6_0_g6751 == 0.0 ? ( Cam17_g6751 * temp_output_6_0_g6751 ) : ( Cam17_g6751 + temp_output_6_0_g6751 ) ) );
				else
				ifLocalVar3478 = 1.0;
				half FriendsOnlyToggle3353 = _FriendsOnly;
				float ifLocalVar4144 = 0;
				if( FriendsOnlyToggle3353 == 1.0 )
				ifLocalVar4144 = ( FriendsOnlyInvert3333 * 2.0 );
				else if( FriendsOnlyToggle3353 < 1.0 )
				ifLocalVar4144 = 1.0;
				clip( ( ( temp_output_333_0 * _AlphaCutoff ) * ifLocalVar3478 * ifLocalVar4144 ) - 0.005);
				float4 appendResult1923 = (float4(( staticSwitch4916 + ( ( float3( 0.05,0.05,0.05 ) + temp_output_2287_0 ) * SpecularOut983 ) + ( ( temp_output_2287_0 + float3( 0.1,0.1,0.1 ) ) * float3( 2,2,2 ) * SparkleOut971 ) + ( ( temp_output_2287_0 + float3( 0.03,0.03,0.03 ) ) * staticSwitch4920 ) ) , finalAlpha18_g6752));
				
				
				finalColor = appendResult1923;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback "Legacy Shaders/Transparent/Cutout/VertexLit"
}
/*ASEBEGIN
Version=18912
42;268;1671;626;2285.199;-160.6358;1.741677;True;False
Node;AmplifyShaderEditor.CommentaryNode;1237;-8058.104,-540.3135;Inherit;False;2494.556;1518.161;;56;4356;1861;1856;3089;3091;3090;3086;3087;3647;965;3576;3088;3648;3055;1234;602;3451;603;3596;3595;3644;3735;3594;3646;3650;3593;3645;3598;3597;962;1235;430;3061;4074;2958;428;2957;3432;4079;4352;3599;4203;4351;3459;3059;4302;4354;3495;3527;3458;3464;3838;4357;4360;4797;4930;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;3464;-6713.078,-496.6083;Float;False;Property;_NorDist;Normal Distance Modifier;53;0;Create;False;0;0;0;False;1;Space(5);False;0;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3838;-6731.679,-426.2333;Inherit;False;View Distance;-1;;588;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,0,17,1;1;9;INT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1378;-5470.776,-1542.995;Inherit;False;2099.93;995.9517;;33;2150;1491;1406;1908;1910;1682;1631;1630;1629;1684;1381;1382;1380;1383;2017;1665;1905;1911;1879;1891;1890;2014;1589;1886;1551;1878;2152;2153;2154;2159;3408;3496;1389;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3458;-6379.837,-438.2522;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3408;-5275.098,-1115.571;Inherit;False;VertexLightData;-1;;590;d6cc1c00f5d200e45903717e6fa3d55c;0;0;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.ClampOpNode;4354;-6210.413,-433.6178;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.05;False;2;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3527;-6376.406,-316.2013;Half;False;Constant;_Dist_Null;Dist_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-4858.046,-688.5619;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ConditionalIfNode;3495;-6006.938,-487.4892;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0.001;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3459;-5816.017,-491.8634;Half;False;NormalDist;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-4729.315,-686.6694;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TexturePropertyNode;4302;-8039.959,-498.8184;Inherit;True;Property;_NormalMask;(R)NormalMask, (A)Lightmask;59;2;[Header];[SingleLineTexture];Create;False;1;Normal Mask;0;0;False;0;False;None;None;False;white;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode;281;-7727.429,-1488.688;Inherit;False;1883.061;637.1891;Uses directional light or uses the static light direction;20;3817;2215;1296;5;1165;1076;1876;2635;1233;248;1247;633;3511;252;251;1246;249;2148;1232;2147;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;4357;-7945.234,285.7778;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-4989.162,-749.3232;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-4573.709,-681.1406;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4202;-7675.835,-623.1803;Half;False;Property;_LightMaskOnly;Light Mask Only (for alpha8);61;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4079;-7864.842,217.3564;Half;False;Property;_NormSSBias;Mip Sample Bias;52;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1891;-4427.027,-593.6627;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3059;-7723.908,-498.8709;Inherit;True;Property;_NormalMask1;Normal Mask (RG,A);45;2;[Header];[SingleLineTexture];Create;False;1;G Heightmap . A LightMask;0;0;False;0;False;4302;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2147;-7717.332,-1314.462;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4351;-7828.752,673.2659;Float;False;Property;_NormalScale;Scale Normal;54;0;Create;False;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1890;-4444.542,-682.0359;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3599;-7845.934,743.8638;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2014;-4658.913,-763.0379;Half;False;VertAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;4360;-7752.234,291.7778;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1911;-4313.964,-813.201;Half;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2957;-7856.168,363.2319;Inherit;True;Property;_Normal;Normal (N);50;1;[Normal];Create;False;0;0;0;False;2;Space(5);Header(.  Normal  .);False;None;b6a3ebb8f4b838246a2682935ed52019;True;bump;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4356;-7570.413,284.3822;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2148;-7517.332,-1273.462;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3432;-7829.767,554.5219;Inherit;False;0;2957;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-7719.888,-1424.848;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4352;-7628.604,673.8654;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-4243.309,-724.0883;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4203;-7360.916,-494.2256;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2153;-5444.693,-1473.717;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;4074;-7412.292,301.2196;Inherit;False;NormalTextureSuperSample;-1;;6472;c5e7d95f0a9b898419b29857c25ecde5;0;5;4;FLOAT2;0,0;False;1;SAMPLER2D;_Sampler14074;False;50;SAMPLERSTATE;0;False;28;FLOAT;0;False;49;FLOAT;1;False;4;FLOAT3;0;FLOAT;39;FLOAT;40;FLOAT;41
Node;AmplifyShaderEditor.RangedFloatNode;252;-7702.605,-981.8108;Half;False;Property;_StaticLightZ;Static Light Z;39;0;Create;True;0;0;0;False;0;False;0.44;0.44;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-7297.19,-1303.903;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2958;-7421.229,623.9562;Inherit;True;Property;_TextureSample1;Texture Sample 1;100;0;Create;True;0;0;0;False;0;False;2957;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;249;-7704.227,-1128.136;Half;False;Property;_StaticLightX;Static Light X;37;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;0.68;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-7217.398,875.9929;Float;False;Property;_NormalPower;Normal Power;55;0;Create;True;0;0;0;False;0;False;1;0.25;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-7704.32,-1053.852;Half;False;Property;_StaticLightY;Static Light Y;38;0;Create;True;0;0;0;False;0;False;0.55;0.55;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4797;-7090.431,667.088;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1905;-4064.213,-758.4907;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2150;-5367.876,-1288.946;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;248;-7370.771,-1066.555;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-7151.503,-1347.665;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2154;-5228.796,-1400.215;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;633;-7391.807,-1183.175;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-3805.671,-756.8867;Half;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2152;-5202.665,-1502.879;Half;False;Property;_LightMode;Lighting Mode;25;1;[Enum];Create;False;0;2;Surface;0;Object2World;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3061;-6921.231,859.7995;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3511;-7384.249,-956.1778;Inherit;False;VR_Center_Eye;-1;;6473;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.StaticSwitch;4930;-7069.038,452.5261;Inherit;False;Property;_NormSuperSample;SuperSample (expensive);51;0;Create;False;0;0;0;False;0;False;0;0;0;True;NORMSS_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3820;-5471.558,15.06701;Inherit;False;1832.555;536.1137;LightDir Threshold;15;2218;2213;2217;2216;1994;1480;2033;1297;2025;2035;2026;2034;2140;1490;2121;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-4828.565,-917.2657;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-7058.847,-1222.26;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3496;-4999.127,-1397.673;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-5182.543,304.4393;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-7176.812,-1142.179;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2635;-7060.641,-1046.892;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.3333,0.3333,0.3333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;430;-6702.103,826.3912;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-4828.483,-1008.795;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-4828.009,-827.705;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-4824.539,-1098.841;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;2121;-5404.258,358.4309;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1235;-6336.934,657.5127;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;2159;-4837.238,-1400.862;Half;False;Lightmode;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-4549.161,-990.8787;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Vector4Node;1910;-4344.37,-1135.226;Half;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;1076;-6887.841,-1137;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2140;-4966.812,342.2583;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2017;-4894.916,-1220.842;Half;False;VertLightPos1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-4657.188,-1232.291;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2215;-6739.414,-1136.314;Half;False;Dir_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-6017.448,657.5467;Float;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2034;-4783.742,339.7534;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4796;-6738.559,-1065.653;Inherit;False;GetBakedLight;-1;;6474;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.StaticSwitch;1908;-4141.791,-1019.448;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-3856.618,-1017.988;Float;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;3819;-3274.496,-263.8208;Inherit;False;2081.032;521.23;;21;1914;3332;3301;1915;3325;3331;1916;4200;2867;1489;4394;2870;3803;1486;4204;4393;1484;2082;3314;1408;2081;Light Colour;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-4543.707,-1324.866;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-6711.897,-1207.774;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2026;-4620.37,337.0211;Inherit;False;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1382;-4525.547,-1230.729;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3817;-6527.182,-1131.418;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-3250.2,-5.162955;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;2081;-3216.024,-227.5092;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.DotProductOpNode;5;-6274.125,-1203.03;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-4264.826,-1285.479;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2035;-4456.742,309.7534;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-4116.64,-1288.897;Float;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2082;-2953.804,-204.7403;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3597;-7631.967,25.00762;Float;False;Property;_NormalPowerSubSurface;Normal SubSurface;58;0;Create;False;0;0;0;False;0;False;0.5;0.333;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4795;-3051.458,107.8395;Inherit;False;GetBakedLight;-1;;6475;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-6072.649,-1209.666;Float;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3314;-3065.906,-5.699965;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;2025;-4329.63,309.4951;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;1484;-3017.25,-133.7456;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-2743.616,-111.4937;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4204;-2740.95,108.7541;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1.25,1.25,1.25;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4226.845,222.8561;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2033;-4189.742,309.7534;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4212.73,130.2954;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3803;-2744.464,0.1149235;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3598;-7352.949,10.63496;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4393;-2566.912,-218.4333;Half;False;Property;_LightColourBias;LightColour Bias (keep white);22;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;3593;-6598.423,220.7052;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;4394;-2284.912,-218.4333;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-2534.736,-43.49431;Inherit;False;3;3;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;3645;-6638.365,79.06295;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3618.435,420.752;Half;False;Property;_OffsetDot;Offset Dot;27;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3500;-3622.069,304.071;Half;False;Constant;_Shading_Null;Shading_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3650;-6663.688,-0.520067;Half;False;Property;_Spherize;Spherize SS Normal;79;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2870;-2517.678,127.5551;Half;False;Property;_LightMulti;Light Multiplier;17;0;Create;False;1;;0;0;False;1;Header(. Lighting .);False;0.75;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1994;-3911.592,236.6205;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-4113.357,-1210.121;Half;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;3594;-6404.448,217.9523;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TransformDirectionNode;3646;-6443.365,74.06295;Inherit;False;Object;World;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;4139;-3335.503,420.6663;Half;False;OffsetDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2867;-2280.816,-32.62532;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4929;-3461.396,242.2067;Inherit;False;Property;_UseShading;Use Shading;24;0;Create;True;0;0;0;False;2;Space(5);Header(.  Shadow  .);False;0;0;1;True;SHADING_OFF;ToggleOff;2;Key0;Key1;Create;True;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3735;-6423.647,-1.613451;Inherit;False;SphereizeVar;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1916;-2289.808,148.3686;Float;False;Property;_MinLight;Min Light;19;0;Create;True;0;0;0;False;0;False;0.025;0.03;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2216;-4230.755,476.6841;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;4362;-3175.192,1096.499;Inherit;False;1045.672;436.533;;9;4373;4371;4370;4369;4366;4365;4364;4363;4392;Light Ramp2;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;4384;-3584.337,1194.918;Half;False;Property;_OffsetDot2;Offset Dot 2;32;0;Create;True;1;;0;0;False;0;False;0.1;0.1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3093.231,386.0079;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4200;-2136.958,50.43401;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3644;-6128.333,88.90162;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2217;-4228.138,413.6643;Inherit;False;2215;Dir_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;573;-2875.857,606.9181;Inherit;False;1217.672;436.533;;14;4125;4170;4105;1016;1010;1254;4134;4103;1008;1118;4104;4379;4380;4385;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.WireNode;4361;-2950.68,661.7152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4377;-3315.481,1177.744;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;793;-1642.86,946.416;Inherit;False;2134.762;909.7648;;29;1123;3289;4422;1492;641;3285;954;3283;669;3502;3287;684;1035;680;679;3290;3273;811;3291;3281;3282;645;646;3271;662;642;4428;4430;4926;Soft Shading;0,0,0,1;0;0
Node;AmplifyShaderEditor.LerpOp;2213;-3993.74,417.9181;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4105;-2863.56,649.2585;Float;False;Property;_ShadowSharpness;Shadow Sharpness;28;0;Create;True;0;0;0;False;0;False;20;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4373;-3162.896,1138.84;Float;False;Property;_ShadowSharpness2;Shadow Sharpness 2;33;0;Create;True;0;0;0;False;0;False;20;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;3595;-5962.148,89.51568;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;3331;-1973.433,54.36884;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3596;-5792.493,85.46589;Float;False;NormalSubSurface;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3325;-1821.575,21.86576;Inherit;False;Float3 Max;-1;;6476;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4104;-2867.56,793.9585;Float;False;Property;_ShadowPower;Shadow Power;29;0;Create;True;0;0;0;False;0;False;1;0.8;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2218;-3839.579,413.1346;Half;False;FinalLightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4364;-2904.447,1161.274;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1915;-1876.359,-49.38095;Half;False;Property;_MaxLight;Max Light (x2);18;0;Create;False;0;0;0;False;0;False;1;0.666;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1123;-1619.275,1577.359;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;4430;-1590.505,1438.687;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-2605.111,671.6934;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;4428;-1411.75,1464.915;Inherit;False;298;157;instead of VFACE;2;4424;4423;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;4363;-3166.896,1283.54;Float;False;Property;_ShadowPower2;Shadow Power 2;34;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3585;-3918.748,-3596.103;Inherit;False;2668.956;1416.32;;59;3603;3619;3610;3684;4690;3657;4689;3683;4137;3682;4127;3743;4130;3687;4136;4138;3681;4129;4131;3686;4688;4132;4123;4687;3741;4693;4686;3685;4133;4140;3608;3740;4685;3736;3733;3737;3717;4126;3611;4695;4694;4696;3739;4691;3720;3801;3797;3719;4692;3798;3589;3839;3588;3586;3587;3601;4786;4857;4934;SubSurface;1,1,0,1;0;0
Node;AmplifyShaderEditor.ColorNode;4365;-3157.073,1371.866;Half;False;Property;_ShadowColour2;Shadow Colour 2;31;0;Create;True;0;0;0;False;0;False;0.9,0.9,0.9,1;0.9294118,0.8806177,0.8643529,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;3587;-3898.262,-2995.078;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3301;-1591.901,-23.41244;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4366;-2762.796,1258.44;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4103;-2463.461,768.8585;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;4171;-7163.67,-767.3676;Inherit;False;880.3169;218.002;LightMask;5;4801;4802;4803;3263;3262;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;3601;-3904.241,-2912.523;Inherit;False;3596;NormalSubSurface;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;4424;-1403.75,1514.915;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;4423;-1243.75,1514.915;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1E-05;False;2;FLOAT;1.99999;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;3332;-1539.253,142.9249;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4786;-3673.058,-2981.227;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;4369;-2619.175,1262.269;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1254;-2319.839,772.6883;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;4370;-2801.18,1377.535;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;1008;-2819.737,881.2854;Float;False;Property;_ShadowColour;Shadow Colour;26;0;Create;True;0;0;0;False;1;Space(5);False;0.85,0.85,0.85,1;0.85,0.85,0.85,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NegateNode;3289;-1111.005,1642.329;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3263;-7157.753,-636.7223;Half;False;Property;_LightMaskLevel;Light Mask Level;62;0;Create;False;0;0;0;False;0;False;1;0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;571;2177.812,311.4184;Inherit;False;1410.604;490.6661;;15;3333;1998;627;1999;351;1425;3335;3336;1424;349;3352;3353;3499;3506;4144;VRChat Friends-Only;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;642;-1101.673,1726.919;Float;False;Property;_SoftPower;Soft Power;67;0;Create;True;0;0;0;False;0;False;0.75;0.5;0.5;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;3586;-3896.965,-3140.19;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2501.845,887.9539;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;3588;-3563.45,-3015.973;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3262;-6942.57,-678.7188;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4392;-2311.964,1117.203;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;4422;-989.4501,1544.215;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-1337.035,121.727;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4371;-2367.95,1284.903;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4802;-6827.625,-734.9689;Half;False;Property;_LightMaskEnable;Use Light Mask;60;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4803;-6794.79,-620.928;Half;False;Constant;_LMask_Null;LMask_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;641;-1093.941,1462.783;Float;False;Property;_SoftScale;Soft Scale;68;0;Create;True;0;0;0;False;0;False;1;1;0.5;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1016;-2180.615,898.3222;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3839;-3887.979,-2688.387;Inherit;False;View Distance;-1;;6477;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,1,17,0;1;9;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3270;-1178.349,70.11365;Float;False;AllLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FresnelNode;662;-630.9115,1630.624;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4383;-2099.337,1077.918;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3801;-3901.84,-2573.009;Inherit;False;2118.357;333.0564;Edge Correction;16;3702;3699;3700;3698;3696;3710;3705;3694;3666;3721;3715;3724;3711;4855;4856;4858;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1492;-1031.505,1384.075;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;4801;-6639.97,-717.5508;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;349;2184.863,609.2041;Inherit;True;Property;_FriendsOnlyRT;FriendsOnly RenderTexture (clear to white);165;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3798;-3481.317,-3168.773;Half;False;Property;_OffsetSS;Offset;70;0;Create;False;0;0;0;False;0;False;0;-0.1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;3589;-3427.223,-3091.871;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;569;-7686.428,-3696.532;Inherit;False;3175.115;1665.677;;117;4188;983;560;3251;4345;4344;696;695;701;4346;3482;4340;3069;3489;4746;3072;824;3085;3101;3064;3104;4747;3103;3081;4749;4744;3068;2301;2234;3067;4748;690;3075;3080;4337;4745;3079;4728;691;816;4336;3174;838;2294;1920;4727;837;4350;3177;4159;4161;4191;4162;817;554;1921;3179;3182;556;1919;3057;2900;4177;545;551;553;3056;4163;4196;2899;3491;4160;2236;1783;2905;3521;1051;3520;555;561;4174;967;1928;546;4176;2898;3529;3493;2219;4192;1909;2225;3512;4189;4181;4195;4155;4178;4154;4156;4185;4187;4152;4150;4151;4149;4148;4199;4198;4197;4785;4807;4808;4809;4854;4931;4932;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4804;-6484.523,-721.417;Half;False;LightMaskValue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4385;-2052.63,782.1949;Half;False;Property;_StepTwo;Use Second Step;30;1;[ToggleUI];Create;False;1;;0;0;False;1;Space(5);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4858;-3877.391,-2399.183;Inherit;False;3596;NormalSubSurface;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;3719;-3449.423,-2738.7;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;646;-1258.644,1242.367;Half;False;Property;_ShadeColour;Shade Colour;65;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;645;-631.8545,1454.263;Inherit;False;Standard;WorldNormal;LightDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3797;-3221.191,-3050.301;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4380;-1968.337,931.9177;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3282;-407.2178,1630.677;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1424;2487.822,638.8231;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3696;-3854.8,-2476.689;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4692;-3481.864,-2881.277;Half;False;Property;_OffsetSS2;Offset 2;73;0;Create;False;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3271;-1262.157,1058.597;Inherit;False;3270;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;4134;-2455.679,672.9282;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3720;-3240.081,-2737.552;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3291;-263.4023,1631.329;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;4379;-1838.337,783.9177;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4170;-2052.649,664.921;Inherit;False;4804;LightMaskValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4691;-3135.171,-2877.808;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3698;-3639.477,-2427.307;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4197;-7617.365,-2579.519;Inherit;False;0;4148;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;3273;-1085.648,1058.568;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3281;-413.863,1455.69;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3336;2583.442,625.3341;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;811;-1056.165,1241.783;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3567;-1133.719,222.6608;Inherit;False;1140.277;405.8864;Light Saturation Bias;13;3551;3566;3553;3564;3255;3558;3120;2093;3557;3253;3326;3554;3552;;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector3Node;4855;-2892.987,-2400.57;Inherit;False;Property;_SSAliasFix;SS Edge Alias Fix (dist pow limit);80;0;Create;False;0;0;0;False;0;False;-0.03,4,0.075;-0.5,2.9,0.075;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;4696;-3002.893,-2787.153;Half;False;Property;_SSIntensity2;SubSurface Intensity 2;74;0;Create;False;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3552;-1027.829,386.7633;Inherit;False;Float3 Min;-1;;6479;61474a8b2b91ea8409c96a71133ac9bc;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;679;-630.6565,1251.428;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4805;-1697.429,766.9059;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4198;-7368.365,-2483.519;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;3700;-3509.543,-2508.434;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;3335;2273.578,574.4047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4694;-3008.31,-2877.926;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;3699;-3461.246,-2355.506;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4125;-2312.328,666.9188;Float;False;FinalDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3290;-115.0057,1417.329;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;680;-617.7404,1037.144;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;3739;-3905.665,-3470.544;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1035;-410.2329,1163.722;Half;False;Property;_ShadeColorDynamic;ShadeColor Dynamic;64;1;[Enum];Create;True;0;2;FixedColour;0;LightColour;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3736;-3653.92,-3287.273;Inherit;False;3735;SphereizeVar;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1425;2302.188,528.9548;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3554;-831.9614,386.1028;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3710;-3245.504,-2534.467;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-1514.38,762.4016;Float;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3611;-3184.193,-3126.346;Half;False;Property;_SSIntensity;SubSurface Intensity;71;0;Create;False;0;0;0;False;0;False;5;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;684;-70.85945,1538.038;Half;False;Property;_ShadeLevel;Shade Level;66;0;Create;True;0;0;0;False;0;False;0.5;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3733;-3909.514,-3327.564;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;4126;-3091.971,-3308.564;Inherit;False;4125;FinalDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;3702;-3259.167,-2438.471;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;3737;-3672.913,-3476.846;Inherit;False;Object;World;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;3287;18.67233,1417.496;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4199;-7513.365,-2471.519;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3717;-3022.535,-3057.215;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3326;-1031.638,299.8147;Inherit;False;Float3 Max;-1;;6480;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4685;-3026.695,-2969.439;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4695;-2884.475,-2877.378;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1470;-2370.866,382.0723;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-2422.695,452.5153;Float;False;Property;_ShadowDarkness;Shadow Darkness;35;0;Create;True;0;0;0;False;1;Space(5);False;0.15;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3502;-181.6468,1165.368;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4857;-3221.082,-2942.6;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4856;-3045.696,-2390.491;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4140;-3126.677,-3238.799;Inherit;False;4139;OffsetDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3253;-943.6758,534.3596;Half;False;Property;_LightSatTotal;Light Saturation Max;21;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3608;-2892.7,-3058.668;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2186.292,395.4066;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3120;-936.0833,454.5085;Float;False;Property;_LightSaturationLimiter;Light Saturation Limiter;20;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3685;-3905.437,-3553.21;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4686;-2711.354,-2972.069;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3283;-15.32754,1266.496;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;3557;-696.9614,386.1028;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1295;1235.858,-2190.196;Inherit;False;2185.261;746.0269;;44;4245;4240;4239;970;4241;1285;331;329;330;326;805;4259;327;4258;4256;4317;4257;450;461;4246;462;808;328;3433;4329;4331;4332;4679;4680;4815;4816;4847;4848;4849;4853;4888;4890;4891;4892;4893;4897;4898;4899;4900;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;669;214.2497,1453.005;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.618;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4133;-2928.931,-3303.936;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3711;-3101.504,-2534.467;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;3740;-3416.216,-3468.25;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2336.51,308.7788;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;2093;-824.1577,298.775;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;351;2438.834,530.2476;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;4148;-7492.645,-2455.904;Inherit;True;Property;_Glossiness;Roughness Map (R,A);101;0;Create;False;1;;0;0;False;0;False;-1;None;None;True;0;False;black;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4854;-7387.663,-2269.62;Half;False;Property;_RoughnessLevel;Roughness Level;102;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4897;1235.926,-1872.894;Half;False;Property;_ScrollX;Scroll X;48;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4693;-2623.713,-3123.746;Half;False;Property;_SSDouble;Use Second Step;72;1;[ToggleUI];Create;False;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3705;-2895.427,-2532.838;Inherit;False;3;3;0;FLOAT;1;False;1;FLOAT;0.3;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-1880.116,355.17;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3818;-3091.722,-1669.933;Inherit;False;1976.64;1150.999;;23;1262;2993;19;813;812;3504;18;2984;4166;4076;3338;3345;4167;3343;2982;3430;4078;3431;4850;4851;4922;4923;4936;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;3285;329.6724,1254.496;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;3255;-721.8646,539.6962;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;954;33.12944,1108.552;Half;False;Constant;_Shade_Null;Shade_Null;65;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;3564;-687.6791,297.944;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4123;-2795.165,-3259.229;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4898;1236.926,-1801.894;Half;False;Property;_ScrollY;Scroll Y;49;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1999;2582.737,445.6081;Half;False;Property;_InvertFriendsOnly;Invert Friends Only;166;2;[Header];[ToggleUI];Create;True;1;enable without cam for override;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4687;-2571.222,-2993.059;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4132;-2927.271,-3164.763;Half;False;Property;_ShadeMaskSS;Shade Mask;76;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4149;-7189.934,-2422.441;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;627;2651.175,516.637;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3741;-3253.496,-3529.68;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3558;-506.6614,382.3028;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;3686;-3135.939,-3526.808;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3566;-570.4897,538.5253;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3431;-3021.868,-1356.35;Inherit;False;0;349;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;2982;-2897.292,-1057.195;Inherit;True;Property;_MainTex;Texture (RGB,A);5;0;Create;False;1;;0;0;False;1;Header(.  Main  .);False;None;c39e2926f34d34e489f086986a1b2a36;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;4167;-2892.048,-869.2392;Half;False;Property;_TexSSBias;Mip Sample Bias;7;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3506;2868.115,456.9816;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;3343;-2994.644,-1562.763;Inherit;True;Property;_MainTexFriends;FriendsOnly Texture (RGB,A);168;0;Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.LerpOp;4129;-2622.271,-3266.763;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3694;-2741.212,-2527.024;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4131;-3467.062,-3227.766;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4926;280.4877,1004.305;Inherit;False;Property;_SoftShadeEnable;SoftShade Enable;63;0;Create;True;0;0;0;False;2;Space(5);Header(.  Soft Shading  .);False;0;0;0;True;SOFTSHADE_OFF;ToggleOff;2;Key0;Key1;Create;True;False;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3430;-2918.114,-779.3569;Inherit;False;0;2982;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4078;-2887.72,-1127.688;Half;False;Property;_FriendTexSSBias;Mip Sample Bias;170;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3433;1239.484,-1988.45;Inherit;False;0;328;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;4893;1355.926,-1799.894;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4150;-7048.934,-2445.441;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;4688;-2435.059,-3123.295;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4151;-7102.896,-2520.128;Half;False;Property;_RoughnessInvert;Roughness Invert;104;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3553;-369.5294,317.9633;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;30;-1140.387,638.8184;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;4888;1354.106,-1866.6;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;3687;-3003.852,-3530.373;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4900;1554.926,-1831.894;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4166;-2556.025,-750.4381;Inherit;False;TextureSuperSample;-1;;6500;23a6a6e8fbe28134cac41513630794b1;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;_Sampler14166;False;48;SAMPLERSTATE;0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.GetLocalVarNode;4136;-1749.463,-2943.644;Inherit;False;4804;LightMaskValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3666;-2590.354,-2535.582;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4899;1556.926,-1919.894;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2984;-2592.779,-940.1937;Inherit;True;Property;_TextureSample7;Texture Sample 7;101;0;Create;True;0;0;0;False;0;False;2982;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;3551;-186.5141,321.9888;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4138;-1728.809,-3022.776;Half;False;Property;_UseLightMaskSS;Use Light Mask;77;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3345;-2622.792,-1392.613;Inherit;True;Property;_TextureSample4;Texture Sample 4;101;0;Create;True;0;0;0;False;0;False;3343;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;4076;-2580.782,-1191.95;Inherit;False;TextureSuperSample;-1;;6501;23a6a6e8fbe28134cac41513630794b1;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;48;SAMPLERSTATE;0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.SimpleMaxOpNode;3743;-2298.051,-3118.265;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1E-05;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;4152;-6886.896,-2496.678;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4130;-2453.271,-3267.763;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3333;3031.998,456.1588;Half;False;FriendsOnlyInvert;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3681;-2796.941,-3418.857;Inherit;False;Property;_SSTransmission;Transmission;78;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1500;333.6703,648.8381;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3682;-2509.188,-3496.466;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4127;-2187.172,-3139.764;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4922;-2290.96,-1222.589;Inherit;False;Property;_FriendsSuperSample;SuperSample (expensive);169;0;Create;False;0;0;0;False;0;False;0;0;0;True;FRIENDSS_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;4187;-6750.4,-2383.834;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4923;-2267.316,-924.5552;Inherit;False;Property;_SuperSample;SuperSample (expensive);6;0;Create;False;0;0;0;False;0;False;0;0;0;True;MAINSS_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;4137;-1522.549,-3019.08;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3338;-2260.994,-1301.157;Inherit;False;3333;FriendsOnlyInvert;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2289;455.516,643.5714;Float;False;LightShaded;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1777;68.71701,152.1802;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;4890;1696.926,-1917.894;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode;3721;-2383.552,-2535.538;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.075;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4185;-7074.4,-2355.834;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4689;-1401.307,-3037.031;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3657;-2041.054,-3133.752;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3504;-2013.441,-1259.02;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;3683;-2168.42,-3232.26;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;703.9747,626.15;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;3715;-2153.311,-2533.543;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4892;1812.926,-1946.894;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;4156;-7317.442,-2196.989;Half;False;Property;_RoughnessPower;Roughness Power;103;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3684;-2009.421,-3232.26;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3724;-1916.974,-2540.905;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4891;1485.926,-1963.894;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;4936;-1867.608,-1043.746;Inherit;False;Property;_FriendsOnlyTexture;Friends Only Texture;167;0;Create;True;0;0;0;False;1;Space(10);False;0;0;0;True;FRIENDTEX_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;18;-1931.582,-688.5779;Half;False;Property;_Color;> Color;8;1;[HDR];Create;True;0;0;0;False;1;Space(5);False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;848.3743,620.0181;Float;False;LightColour;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-7577.759,185.6187;Float;False;Property;_NormalPowerSpecular;Normal Specular;56;0;Create;False;0;0;0;False;0;False;2;2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3610;-2129.062,-3310.276;Half;False;Property;_SSBrightness;SubSurface Brightness;75;0;Create;False;0;0;0;False;1;Space(5);False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4154;-7058.615,-2334.215;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4690;-1889.89,-3085.002;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4178;-6903.27,-2572.587;Half;False;Property;_Roughness;Use Roughness;100;1;[ToggleUI];Create;False;1;. Roughness . Glossiness;0;0;False;2;Space(5);Header(. Roughness . Glossiness);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;328;1511.872,-2136.573;Inherit;True;Property;_Emission;Emission Map (RGB,A);40;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3451;-7254.936,169.4958;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4195;-6885.705,-2260.975;Half;False;Constant;_Rough_Null;Rough_Null;128;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-1640.978,-895.97;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;4155;-6880.695,-2333.2;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-1687.044,-688.024;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3619;-1850.596,-3280.815;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4815;2043.859,-1740.305;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;4181;-6681.522,-2464.697;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;970;2046.266,-1912.224;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;602;-6580,492.511;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;4848;2234.133,-1735.038;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4329;2005.556,-2152.258;Inherit;False;Property;_EmissionHue;Hue;43;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;1795.846,-2136.406;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1347;-973.6296,-417.7522;Inherit;False;1534.475;525.8724;hue & saturation;11;585;1330;581;2917;2918;325;2910;3241;3244;3249;4846;;1,1,1,1;0;0
Node;AmplifyShaderEditor.StaticSwitch;4934;-1653.437,-3310.428;Inherit;False;Property;_UseSubSurface;Use SubSurface/Deflected Light;69;0;Create;False;0;0;0;False;2;Space(5);Header(. SubSurface Light .);False;0;0;1;True;SUBSURFACE_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4239;1828.553,-1830.483;Half;False;Property;_ShadedColour;Shaded Colour;46;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4851;-1437.917,-803.6598;Half;False;Property;_MaintexPower;Power;11;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4188;-6666.592,-2559.503;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1435.95,-891.937;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;325;-951.03,-274.2717;Half;False;Property;_Saturation;Saturation;10;0;Create;True;0;0;0;False;0;False;1;1;-2;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1234;-6365.733,514.0275;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SaturateNode;4847;2245.349,-1909.083;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4850;-1276.917,-890.6598;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;4241;2404.553,-1797.483;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;4845;2261.308,-2035.513;Inherit;False;Hue;-1;;6512;f67b9beab09edcf45b951dcecf2a24fd;0;2;3;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1330;-894.7972,-124.3827;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2910;-772.6611,-359.2978;Float;False;Property;_Hue;Hue;9;0;Create;True;0;0;0;False;0;False;0;358;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;4240;2033.553,-1831.483;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3603;-1437.323,-3392.163;Float;False;SubSurface;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-929.3052,-37.33464;Half;False;Property;_ShadowSaturation;Shadow Saturation;36;0;Create;True;0;0;0;False;0;False;0.85;1;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4189;-6395.056,-2405.511;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4785;-5900.34,-2384.067;Inherit;False;RoughnessSpec;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4816;2710.859,-1838.305;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;3055;-6177.866,515.8373;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;3799;1054.92,404.4882;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2918;-634.3347,-223.8553;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3249;-604.4844,-31.81404;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-7378.962,-3586.764;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;3607;1001.601,332.3544;Inherit;False;3603;SubSurface;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3512;-7397.276,-3441.804;Inherit;False;VR_Center_Eye;-1;;6554;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.RangedFloatNode;2225;-7385.962,-3666.764;Half;False;Property;_StereoFixSpec;Stereo Converge (flatten);86;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4846;-425.894,-371.7213;Inherit;False;Hue;-1;;6555;f67b9beab09edcf45b951dcecf2a24fd;0;2;3;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;2547.781,-2013.615;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4245;2549.939,-1921.656;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;3244;-599.8806,-120.5177;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4332;2516.952,-2058.379;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3529;-6950.092,-3696.397;Inherit;False;199;135;blinn-phong;1;2237;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCGrayscale;4853;2709.116,-1906.31;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;393;-249.2973,-1286.792;Inherit;False;1847.51;780.355;;30;1537;1284;1281;388;390;372;383;370;1291;382;384;1290;379;376;360;2299;2300;3505;368;369;1536;1533;1530;1534;3773;3940;4682;4681;4683;4743;Rim/Outline;1,0.141,0.141,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;4192;-7274.563,-2752.768;Inherit;False;4785;RoughnessSpec;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4331;2761.177,-2067.101;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4246;2695.34,-2012.656;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;2917;101.1179,-185.2206;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3241;-342.8801,-70.51768;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-6023.241,508.9706;Float;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;461;2568.326,-2143.493;Inherit;False;Property;_ShadedEmission;Shaded Emission;45;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3493;-7120.24,-3662.946;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2219;-7403.962,-3347.764;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3617;1211.368,346.4321;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3648;-6848.766,-31.11045;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3576;-7013.509,-162.2782;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;967;-7416.839,-2859.251;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1534;-233.7685,-1158.188;Float;False;Property;_Scale1;Rim Normal Power;142;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2237;-6916.962,-3654.764;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;581;384.9778,-6.735202;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;450;2850.573,-2038.597;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3643;1351.192,347.2688;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1537;-216.4528,-985.8127;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SaturateNode;4849;2894.759,-1903.024;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1928;-7418.291,-2937.432;Half;False;Property;_StereoFixSpecCap;Stereo Converge (flatten);89;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4176;-7052.099,-2745.981;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4928;1331.428,437.9441;Half;False;Constant;_Light_Null;Light_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1530;-234.8218,-1243.55;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-7027.299,-3439.203;Half;False;Property;_SpecularSize;Specular Size;82;0;Create;True;0;0;0;False;0;False;1;6;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2898;-7416.839,-3019.249;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3088;-6983.516,-234.9572;Float;False;Property;_NormalPowerMatCap;Normal MatCap;57;0;Create;False;0;0;0;False;0;False;1;0.5;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2905;-7025.973,-3047.97;Half;False;Property;_Legacy2;Legacy;96;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4160;-6593.61,-3371.674;Inherit;False;4785;RoughnessSpec;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4927;1469.935,344.1245;Inherit;False;Property;_DisableLight;Unlit (warning - disables all light);23;0;Create;False;0;0;0;False;1;Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-6822.793,-3538.437;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4317;3025.649,-1980.989;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4174;-6889.063,-2744.131;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3647;-6556.766,-63.11047;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3520;-7121.375,-2879.649;Inherit;False;VR MatCap;-1;;6576;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-6155.207,-3396.169;Half;False;Property;_SpecularOpacity;Specular Opacity;81;0;Create;True;0;0;0;False;2;Space(5);Header(.  Specular  .);False;0.5;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3521;-7124.838,-2975.249;Inherit;False;Matcap (legacy);-1;;6578;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1533;-213.9822,-1078.708;Half;False;Property;_RimNormal;Rim Normal;141;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-6576.253,-3449.951;Half;False;Property;_SpecularStrength;Specular Strength;83;0;Create;True;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4257;2978.525,-2142.362;Half;False;Property;_ShadedOnly;Shaded Only;47;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3087;-6672.956,-170.1118;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2236;-6748.479,-3463.191;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3074;1086.244,126.0905;Float;False;MaintexRGB;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1536;89.8206,-1219.545;Inherit;False;3;0;FLOAT3;0.5,0.5,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-6754.962,-3657.764;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3491;-6776.543,-2994.289;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4163;-6343.61,-3456.674;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4196;-6732.639,-2742.995;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ExpOpNode;553;-6559.444,-3547.329;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3056;-6014.082,-3492.834;Inherit;False;True;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;551;-6598.899,-3659.65;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2899;-7416.125,-3216.585;Inherit;True;Property;_SpecularMatcap;Specular Matcap (RGB);88;0;Create;False;0;0;0;False;0;False;None;2fd71d1172fbfbd4a8351aec0cc94921;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;368;-36.0433,-838.2465;Float;False;Property;_Power;Rim Power;137;0;Create;False;0;0;0;False;0;False;0;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3077;1668.051,176.084;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;4256;3183.226,-2112.462;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;369;-29.45917,-912.2149;Float;False;Property;_Scale;Rim Scale;138;0;Create;False;0;0;0;False;0;False;0;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3505;51.23543,-1073.101;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3086;-6457.389,-175.3638;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;556;-6220.795,-3552.08;Inherit;False;True;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3057;-5871.791,-3498.834;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-6552.526,-2829.277;Half;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;92;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4177;-6409.354,-2500.432;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;545;-6455.841,-3658.2;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3090;-6306.413,-174.117;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;3796;1890.35,178.912;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.0001,0.0001,0.0001;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FresnelNode;360;235.6319,-1073.383;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;2394.186,-1652.982;Half;False;Property;_EmissionColor;> Colour;41;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;376;258.5829,-1246.025;Float;False;Property;_RimOutlineColour;Rim/Outline Colour;134;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.6544117,0.3560732,0.448663,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;4679;1793.507,-2044.954;Inherit;False;EmissionMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2299;264.225,-903.2711;Float;False;Property;_Min;Rim Min;139;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2300;291.2249,-822.2711;Float;False;Property;_Max;Rim Max;140;0;Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4258;3334.361,-1709.301;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2900;-6615.44,-3021.295;Inherit;True;Property;_TextureSample3;Texture Sample 3;90;0;Create;True;0;0;0;False;0;False;2899;None;None;True;0;False;white;Auto;False;Instance;-1;MipLevel;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;326;2589.138,-1562.149;Float;False;Property;_EmissionIntensity;Emission Intensity;44;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3179;-6214.565,-2633.61;Half;False;Property;_ProbeSmoothness;Probe Smoothness;106;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;379;459.2831,-1073.074;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;2021.824,174.6748;Float;False;PostDesaturation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;4743;275.8679,-738.7574;Inherit;False;Fresnel Edge Pixel Fix;-1;;6580;e37ec5be3c94a1b4e99e2c04f776c418;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3940;501.0678,-1246.686;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4162;-5751.61,-3514.674;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;805;2594.742,-1651.286;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;384;341.9415,-662.4603;Half;False;Property;_Amount;Rim Opacity;136;0;Create;False;0;0;0;False;0;False;0;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;817;-6317.908,-3021.908;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4191;-6128.622,-2569.752;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4259;2860.044,-1677.973;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;3091;-6120.263,-171.6671;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3182;-5894.325,-2531.991;Half;False;Property;_ReflectionOpacity;Reflection Opacity;107;0;Create;True;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4680;2585.026,-1720.165;Inherit;False;4679;EmissionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1921;-6281.92,-2917.436;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-6156.965,-3648.934;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4161;-5900.61,-3530.674;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;735.8066,-1096.133;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3089;-5950.61,-175.7171;Float;False;NormalMatCap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;437;892.2847,1064.665;Inherit;False;2518.223;840.2;Comment;35;3264;3266;3109;1274;405;414;807;1278;2180;1279;406;1516;1517;407;408;2920;1518;810;2919;2175;2166;2210;2181;2207;2208;2209;963;1930;2873;3268;3528;3524;3523;4087;4088;Matcap > Alpha Supported;0.8221117,0.184,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;330;2862.486,-1513.824;Half;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4350;-5657.062,-2552.622;Inherit;False;2;2;0;FLOAT;0.5;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4159;-5984.53,-2623.413;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3177;-6055.082,-2717.442;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;837;-6428.229,-3261.911;Half;False;Property;_SpecMatCapColor;SpecMatCap Colour;93;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4727;-6118.311,-2926.089;Half;False;Property;_SpecMatcapPower;SpecMatcap Power;91;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;2879.695,-1652.056;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;645.6138,-664.4472;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3773;608.8083,-764.6856;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-6123.6,-3018.904;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;2294;-6030.043,-3622.294;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.0001;False;2;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3079;-5677.334,-3428.282;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1930;915.5886,1496.31;Half;False;Property;_StereoFix;Stereo Converge (flatten);146;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-6132.557,-3093.087;Half;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;90;0;Create;True;0;0;0;False;0;False;1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4336;-5805.736,-2757.688;Float;False;Property;_ReflectionIntensity;Reflection Intensity;108;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;963;943.4739,1593.267;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;816;-5871.147,-3629.949;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;331;3056.105,-1612.421;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IndirectSpecularLight;3174;-5825.58,-2676.816;Inherit;False;World;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4728;-5890.88,-3017.935;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;838;-6197.613,-3257.238;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;370;897.4287,-818.2839;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1291;738.1032,-1226.505;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2873;941.0436,1378.15;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;383;737.9038,-986.7241;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2209;1116.906,1750.81;Float;False;Property;_MatcapSpin;MatcapSpin;150;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3523;1191.654,1597.406;Inherit;False;VR MatCap;-1;;6587;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1281;1330.427,-1088.367;Half;False;Property;_RimMode;Rim Mode;135;1;[Enum];Create;True;0;3;Blend_Lerp;0;Multiply;1;AddSubtract;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;372;1127.13,-1124.279;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4681;1066.112,-630.5405;Inherit;False;4679;EmissionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3075;-5481.085,-3352.097;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-5720.989,-3100.645;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3524;1184.139,1381.841;Inherit;False;Matcap (legacy);-1;;6589;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2234;-5734.7,-3628.97;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3103;-5810.023,-2925.869;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;3210.374,-1617.435;Float;False;Emission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;388;1131.605,-824.6456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;3067;-5409.305,-3650.217;Float;False;Property;_SpecMatCapColor1;Specular Colour;84;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;0.2,0.2,0.2,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;2208;1316.732,1714.177;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3080;-5490.655,-3425.499;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;390;1129.204,-949.8493;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4337;-5587.589,-2698.792;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4682;1045.983,-701.6169;Half;False;Property;_MaskFresnel;Emission Alpha Mask;143;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4745;-5506.13,-2577.891;Float;False;Property;_ReflectionPower;Reflection Power;109;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4748;-5669.058,-2842.41;Float;False;Property;_ReflectionSaturation;Reflection Saturation;110;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4749;-5468.661,-2775.41;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3081;-5267.155,-3415.7;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;3068;-5200.512,-3650.048;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4233;1884.343,-1228.883;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;2210;1437.392,1383.942;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3104;-5600.548,-2943.924;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2166;1492.586,1303.037;Half;False;Property;_Legacy;Legacy;152;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1284;1334.598,-1008.555;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4744;-5456.228,-2695.347;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3101;-5692.583,-3245.292;Half;False;Property;_SpecMatCapMode;SpecMatCap Mode;94;1;[Enum];Create;True;0;2;Additive;0;Multiplied;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;2207;1502.244,1596.886;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;2301;-5403.591,-3490.974;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;4683;1357.661,-701.0093;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4684;1526.918,-854.7245;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LuminanceNode;4320;1894.664,-1150.978;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3085;-5091.718,-3399.804;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;1616.801,-926.2392;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;4747;-5267.367,-2714.475;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2181;952.0762,1125.57;Inherit;True;Property;_Matcap;Matcap (RGB,A);145;0;Create;False;0;0;0;False;0;False;None;None;False;black;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;824;-5438.834,-3116.537;Half;False;Property;_SpecMatcapOpacity;SpecMatcap Opacity;95;0;Create;False;0;0;0;False;0;False;1;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3489;-5431.479,-3016.634;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4387;1671.975,-1002.542;Half;False;Property;_FullBright;FullBright;42;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3528;1659.882,1345.644;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1518;2606.495,1400.255;Half;False;Property;_MatcapSaturation;Matcap Saturation;149;0;Create;True;0;0;0;False;0;False;1;0.25;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3064;-5154.751,-3515.175;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;2919;2144.814,1376.165;Half;False;Property;_MatCapColor;MatCap Colour;151;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;1517;2871.899,1406.693;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3072;-5003.825,-3556.349;Half;False;Property;_SpecMode;Specular Mode;85;1;[Enum];Create;False;0;3;Additive;0;Multipliet;1;Off;2;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4919;1868.085,-893.8206;Inherit;False;Property;_UseRim;Use Rim;133;0;Create;False;0;0;0;False;2;Space(5);Header(.  Rim Fresnel  .);False;0;0;0;True;RIMLIGHT_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2175;1835.501,1240.226;Inherit;True;Property;_TextureSample0;Texture Sample 0;90;0;Create;True;0;0;0;False;0;False;2181;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;4852;1897.426,-1018.983;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;4746;-5228.688,-2801.999;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.0001,0.0001,0.0001;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4340;-5224.519,-3037.322;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3069;-4946.259,-3445.153;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;20,20,20;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;408;2253.908,1246.997;Float;False;Property;_MatcapIntensity;Matcap Intensity;148;0;Create;True;0;0;0;False;0;False;0;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4088;2997.216,1382.797;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2920;2370.102,1376.667;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4931;-5122.433,-2815.662;Inherit;False;Property;_UseReflection;Use Reflection;105;0;Create;True;0;0;0;False;2;Space(5);Header(. Reflection Probe);False;0;0;0;True;SPECULARHIGHLIGHTS_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4932;-5055.917,-3066.893;Inherit;False;Property;_UseSpecularMatCap;Use Specular MatCap;87;0;Create;True;0;0;0;False;2;Space(5);Header(. Specular Overlay);False;0;0;1;True;SPECMATCAP_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;810;2211.938,1128.838;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3482;-4782.573,-3560.253;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4234;2125.458,-889.7113;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;3109;2462.534,1643.783;Inherit;True;Property;_MatCapMask;MatCap Mask (R,A);153;1;[SingleLineTexture];Create;False;0;0;0;False;1;Space(5);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;4087;2624.869,1331.051;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4346;-5521.875,-2334.445;Half;False;Property;_SpecularLevel;Specular Level;99;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1292;2273.109,-894.487;Float;False;PostRimLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;2493.767,1227.171;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;695;-5615.913,-2252.418;Inherit;True;Property;_SpecularMask;Specular Mask (R,A);97;1;[SingleLineTexture];Create;False;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;4808;-4611.934,-2899.785;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;-4852.837,-2826.096;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3264;2591.987,1833.009;Half;False;Property;_MatcapMaskLevel1;Mask Level;154;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3266;2755.871,1673.178;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;870;-7651.327,-4408.726;Inherit;False;904.2734;277.1521;;4;3582;971;3943;4933;Sparkle/Shimmer Effect;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;3943;-7632.481,-4222.708;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;-5301.884,-2246.428;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3582;-7633.339,-4294.249;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2993;-1647.175,-1049.329;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1516;2651.149,1257.198;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4809;-5081.002,-2361.384;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2264;1605.616,-686.7376;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4807;-5047.43,-2361.583;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2180;2141.381,1542.556;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1279;2457.407,1118.502;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4344;-5305.144,-2127.66;Half;False;Property;_SpecMaskPower;SpecMask Power;98;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;406;2732.131,1572.698;Half;False;Property;_MatcapOpacity;Matcap Opacity;147;0;Create;True;0;0;0;False;0;False;5;0.55;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3268;2913.392,1649.218;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;-1451.09,-1049.236;Float;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1278;2741.659,1099.732;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;2846.342,1207.257;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4345;-5074.842,-2200.461;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4951;-7412.162,-4271.959;Inherit;False;Aria Sparkles Include;112;;1;fe78986b6250d1d46955dfaed2c4e629;0;2;97;FLOAT3;0,0,0;False;156;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1998;2844.131,369.513;Half;False;Property;_FriendsOnly;Friends Only ON/OFF;164;1;[ToggleUI];Create;False;0;0;0;False;2;Space(20);Header(VRC Friends Only);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;2291;1788.852,-681.9444;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;807;3067.739,1475.301;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3137;2485.022,-235.2012;Inherit;False;832.0293;300.472;MirrorSystem;6;3159;3142;3140;3429;3478;3498;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3251;-5049.71,-2286.884;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3142;2512.518,-62.54065;Half;False;Property;_IsNotMirror;Not Mirror;173;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3352;3265.358,462.7127;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3140;2514.843,-144.3769;Half;False;Property;_IsInMirror;In Mirror;172;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;560;-4895.786,-2308.863;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4933;-7174.735,-4302.004;Inherit;False;Property;UseSparkleShimmer;Use Sparkle/Shimmer;111;0;Create;False;0;0;0;False;2;Space(5);Header(.  Sparkles  .);False;0;0;1;True;SPARKLE_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;334;2732.537,-414.5922;Float;False;Property;_Alpha;Alpha;12;0;Create;True;0;0;0;False;1;Space(5);False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;405;3006.8,1149.914;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;2829.321,-339.5449;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3353;3076.334,369.1404;Half;False;FriendsOnlyToggle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2287;1967.472,-687.7989;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3499;3186.839,554.0785;Half;False;Constant;_FriendsOnly_Null;FriendsOnly_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4207;1525.46,-295.8469;Half;False;Property;_ParallaxType;Parallax Type;156;1;[Enum];Create;True;0;2;Normal;0;Planar;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;-4709.572,-2315.263;Float;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1274;3204.849,1145.099;Float;False;PostMatcap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;3041.638,-421.8068;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4396;1734.248,-291.7196;Inherit;False;Aria Parallax Include;157;;6750;972a5d25f3151a4479be2dcc9b9e75fa;2,55,0,56,0;1;60;INT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3429;2793.888,-108.2387;Inherit;False;VRCMirrorToggle;-1;;6751;906fee1dc8310a745a0658d5f2fa3fb4;0;2;5;INT;1;False;6;INT;1;False;1;INT;7
Node;AmplifyShaderEditor.ConditionalIfNode;4144;3428.671,421.2903;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;3045.575,-312.6735;Float;False;Property;_AlphaCutoff;Alpha Cutoff;13;0;Create;False;0;0;0;True;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4116;2149.498,-420.4897;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3498;2926.394,-8.762839;Half;False;Constant;_Camera_Null;Camera_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3159;2905.996,-187.0988;Half;False;Property;_MirrorSystem;Use Mirror System;171;1;[ToggleUI];Create;False;0;0;0;False;2;Space(10);Header(Mirror);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;971;-6954.112,-4298.991;Float;False;SparkleOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3252;2194.56,-706.762;Inherit;False;2;2;0;FLOAT3;0.05,0.05,0.05;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4920;1978.952,-319.9636;Inherit;False;Property;_UseParallax;Use Parallax;155;0;Create;True;0;0;0;False;2;Space(10);Header(.  Parallax  .);False;0;0;0;True;PARALLAX_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3478;3139.753,-155.9204;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;INT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2163;2288.118,-821.1033;Inherit;False;1274;PostMatcap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;1955.717,-597.9395;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1702;2186.417,-491.9396;Inherit;False;971;SparkleOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4666;3369.72,-405.6686;Inherit;False;Property;_A2CSampleBias;A2C Sample Bias;16;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3956;2265.263,-587.0474;Inherit;False;2;2;0;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4141;3606.088,307.2644;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4120;3227.466,-339.5276;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4117;2214.498,-410.4897;Inherit;False;2;2;0;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0.03,0.03,0.03;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3955;2415.263,-542.0474;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;4918;3549.489,-503.7678;Inherit;False;Custom A2C;14;;6752;445f8ff28d1a9f44092743e0eb84a83d;0;3;19;FLOAT;1;False;3;FLOAT;1;False;16;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2284;2332.472,-683.7989;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4084;2354.149,-387.397;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3144;3390.542,-179.4297;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4916;2491.815,-887.7996;Inherit;False;Property;_UseMatcap;Use Matcap;144;0;Create;False;0;0;0;False;2;Space(10);Header(.  MatCap  .);False;0;0;0;True;MATCAP_ON;Toggle;2;Key0;Key1;Create;True;False;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1346;2859.333,-1342.923;Inherit;False;670.9946;746.3742;custom properties;12;1345;1335;1344;1342;1431;1340;1339;1337;1432;1343;1338;1341;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2807.245,-579.6193;Inherit;False;4;4;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClipNode;1430;3841.154,-504.6726;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.005;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3099;3610.803,-975.708;Half;False;Property;_outline_width;_outline_width;1;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1431;2886.58,-820.4198;Half;False;Property;_SrcBlend;Source Blend (One);183;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1335;3215.875,-918.9951;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;2;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;4121;3618.063,-1066.698;Half;False;Property;_VRCFallbackCutout;VRC Fallback Cutout;3;0;Create;True;0;0;0;True;1;Toggle(_ALPHATEST_ON);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-6370.277,802.1259;Float;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;2882.479,-1280.823;Half;False;Property;_StencilRef;Stencil ID;176;0;Create;False;0;0;0;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3151.765,-825.441;Half;False;Property;_DstBlend;Destination Blend (Zero);184;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-6360.543,427.3455;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3098;3608.803,-1141.708;Half;False;Property;_VRCFallbackDoublesided;VRC Fallback Doublesided;2;0;Create;True;0;0;0;True;2;Header(Dont clean keywords after selecting);Toggle(TINTED_OUTLINE);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;2875.299,-1112.257;Half;False;Property;_WriteMask;WriteMask (non-zero);177;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1342;3202.625,-1136.015;Inherit;False;Property;_StencilFail;StencilFail;181;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;2876.299,-1194.834;Half;False;Property;_ReadMask;ReadMask (non-zero);178;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;2882.308,-1002.382;Half;False;Property;_ZWriteMode;ZWrite (write to depth buffer);174;1;[ToggleUI];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3269;3610.792,-886.0767;Half;False;Property;_Cutoff;Fallback Cutoff;4;0;Create;False;0;0;0;True;2;Enum(LessVisible,0.25,Visible,0.5,MoreVisible,0.75,Invisible,2);Space(5);False;0.75;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1340;3181.625,-1281.015;Inherit;False;Property;_StencilComparison;Stencil Comparison;179;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1344;2882.237,-914.3182;Half;False;Property;_ZTestMode;ZTestMode (LEqual);175;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1341;3206.338,-1208.357;Inherit;False;Property;_StencilOp;StencilOp;180;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1923;4194.73,-582.2905;Inherit;True;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;1343;3201.625,-1061.015;Inherit;False;Property;_StencilZFail;StencilZFail;182;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4436;4407.33,-582.501;Float;False;True;-1;2;ASEMaterialInspector;0;12;.GenesisAria/Arias VertexLit Shader;9367a06897b8873449e3ea0a525cc048;True;Unlit;0;0;VertexLit;2;True;True;1;0;True;1431;0;True;1432;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;1469;True;True;0;True;1335;True;True;True;True;True;True;0;True;-1;False;False;False;False;False;False;True;True;True;255;True;1337;255;True;1338;255;True;1339;7;True;1340;1;True;1341;1;True;1342;1;True;1343;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;True;1345;True;3;True;1344;True;False;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;7;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;LightMode=ForwardBase;Queue=Geometry=Queue=0;True;7;False;0;Legacy Shaders/Transparent/Cutout/VertexLit;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;3458;0;3838;0
WireConnection;3458;2;3464;0
WireConnection;4354;0;3458;0
WireConnection;1878;0;3408;16
WireConnection;1878;1;3408;17
WireConnection;1878;2;3408;18
WireConnection;1878;3;3408;20
WireConnection;3495;0;3464;0
WireConnection;3495;2;4354;0
WireConnection;3495;3;4354;0
WireConnection;3495;4;3527;0
WireConnection;3459;0;3495;0
WireConnection;1551;0;1878;0
WireConnection;1886;0;3408;23
WireConnection;1886;1;3408;29
WireConnection;1886;2;3408;30
WireConnection;1886;3;3408;31
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;1891;0;1551;3
WireConnection;3059;0;4302;0
WireConnection;1890;0;1589;0
WireConnection;2014;0;1886;0
WireConnection;4360;0;4357;0
WireConnection;4356;0;4079;0
WireConnection;4356;1;4360;0
WireConnection;2148;0;2147;0
WireConnection;4352;0;4351;0
WireConnection;4352;1;3599;0
WireConnection;1879;0;2014;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;4203;0;4202;0
WireConnection;4203;1;3059;1
WireConnection;4074;4;3432;0
WireConnection;4074;1;2957;0
WireConnection;4074;28;4356;0
WireConnection;4074;49;4352;0
WireConnection;1246;0;1232;2
WireConnection;1246;1;2148;0
WireConnection;2958;0;2957;0
WireConnection;2958;1;3432;0
WireConnection;2958;5;4352;0
WireConnection;4797;0;4203;0
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;2154;0;2153;0
WireConnection;1665;0;1905;0
WireConnection;3061;0;4797;0
WireConnection;3061;1;428;0
WireConnection;4930;1;2958;0
WireConnection;4930;0;4074;0
WireConnection;1631;0;3408;18
WireConnection;1631;1;3408;30
WireConnection;1233;0;1247;0
WireConnection;3496;0;2152;0
WireConnection;3496;3;2154;0
WireConnection;3496;4;2150;0
WireConnection;1876;0;633;1
WireConnection;1876;1;633;2
WireConnection;2635;0;248;0
WireConnection;2635;1;3511;2
WireConnection;430;1;4930;0
WireConnection;430;2;3061;0
WireConnection;1630;0;3408;17
WireConnection;1630;1;3408;29
WireConnection;1684;0;3408;20
WireConnection;1684;1;3408;31
WireConnection;1629;0;3408;16
WireConnection;1629;1;3408;23
WireConnection;1235;0;430;0
WireConnection;2159;0;3496;0
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;2635;0
WireConnection;2140;0;2121;0
WireConnection;2140;1;1490;0
WireConnection;2140;2;2121;0
WireConnection;2017;0;3408;0
WireConnection;1383;0;2017;0
WireConnection;1383;1;2159;0
WireConnection;2215;0;1076;0
WireConnection;962;0;1235;0
WireConnection;2034;0;2140;0
WireConnection;1908;1;1910;0
WireConnection;1908;0;1682;0
WireConnection;1406;0;1908;0
WireConnection;2026;0;2034;0
WireConnection;1382;0;1383;0
WireConnection;3817;0;2215;0
WireConnection;3817;1;4796;7
WireConnection;5;0;1165;0
WireConnection;5;1;3817;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;2035;1;2026;0
WireConnection;1389;0;1381;0
WireConnection;2082;0;2081;2
WireConnection;1296;0;5;0
WireConnection;3314;0;1408;0
WireConnection;2025;0;2035;0
WireConnection;1486;0;1484;1
WireConnection;1486;2;2082;0
WireConnection;4204;0;4795;0
WireConnection;2033;0;2025;0
WireConnection;3803;0;3314;0
WireConnection;3803;2;2082;0
WireConnection;3598;0;4203;0
WireConnection;3598;1;3597;0
WireConnection;3593;1;4930;0
WireConnection;3593;2;3598;0
WireConnection;4394;0;4393;0
WireConnection;1489;0;1486;0
WireConnection;1489;1;3803;0
WireConnection;1489;2;4204;0
WireConnection;1994;0;1480;0
WireConnection;1994;1;1297;0
WireConnection;1994;2;2033;0
WireConnection;1491;0;1382;0
WireConnection;3594;0;3593;0
WireConnection;3646;0;3645;0
WireConnection;4139;0;1107;0
WireConnection;2867;0;1489;0
WireConnection;2867;1;2870;0
WireConnection;2867;2;4394;0
WireConnection;4929;1;1994;0
WireConnection;4929;0;3500;0
WireConnection;3735;0;3650;0
WireConnection;1106;0;4929;0
WireConnection;1106;1;4139;0
WireConnection;4200;0;2867;0
WireConnection;3644;0;3735;0
WireConnection;3644;3;3646;0
WireConnection;3644;4;3594;0
WireConnection;4361;0;1106;0
WireConnection;4377;0;1106;0
WireConnection;4377;1;4384;0
WireConnection;2213;0;2217;0
WireConnection;2213;1;2216;0
WireConnection;2213;2;2033;0
WireConnection;3595;0;3644;0
WireConnection;3331;0;4200;0
WireConnection;3331;1;1916;0
WireConnection;3596;0;3595;0
WireConnection;3325;7;3331;0
WireConnection;2218;0;2213;0
WireConnection;4364;0;4373;0
WireConnection;4364;1;4377;0
WireConnection;1118;0;4105;0
WireConnection;1118;1;4361;0
WireConnection;3301;0;1915;0
WireConnection;3301;2;3325;0
WireConnection;4366;0;4364;0
WireConnection;4366;1;4363;0
WireConnection;4103;0;1118;0
WireConnection;4103;1;4104;0
WireConnection;4424;0;1123;0
WireConnection;4424;1;4430;0
WireConnection;4423;0;4424;0
WireConnection;3332;0;3301;0
WireConnection;3332;1;3331;0
WireConnection;4786;0;3587;0
WireConnection;4786;1;3601;0
WireConnection;4369;0;4366;0
WireConnection;1254;0;4103;0
WireConnection;4370;0;4365;0
WireConnection;3289;0;1123;0
WireConnection;1010;0;1008;0
WireConnection;3588;0;4786;0
WireConnection;3262;1;3059;4
WireConnection;3262;2;3263;0
WireConnection;4392;0;1254;0
WireConnection;4422;0;4423;0
WireConnection;4422;2;1123;0
WireConnection;4422;4;3289;0
WireConnection;1914;0;3331;0
WireConnection;1914;2;3332;0
WireConnection;4371;0;4370;0
WireConnection;4371;2;4369;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;3270;0;1914;0
WireConnection;662;0;4422;0
WireConnection;662;2;641;0
WireConnection;662;3;642;0
WireConnection;4383;1;4371;0
WireConnection;4383;2;4392;0
WireConnection;4801;0;4802;0
WireConnection;4801;3;3262;0
WireConnection;4801;4;4803;0
WireConnection;3589;0;3586;0
WireConnection;3589;1;3588;0
WireConnection;4804;0;4801;0
WireConnection;3719;0;3839;0
WireConnection;645;0;4422;0
WireConnection;645;4;1492;0
WireConnection;645;2;641;0
WireConnection;645;3;642;0
WireConnection;3797;0;3589;0
WireConnection;3797;1;3798;0
WireConnection;4380;0;1016;0
WireConnection;4380;1;4383;0
WireConnection;3282;0;662;0
WireConnection;1424;0;349;1
WireConnection;1424;1;349;2
WireConnection;1424;2;349;3
WireConnection;4134;0;1118;0
WireConnection;3720;0;3719;0
WireConnection;3291;0;3282;0
WireConnection;4379;0;4385;0
WireConnection;4379;2;4380;0
WireConnection;4379;3;1016;0
WireConnection;4691;0;3797;0
WireConnection;4691;1;4692;0
WireConnection;3698;0;3696;0
WireConnection;3698;1;4858;0
WireConnection;3273;0;3271;0
WireConnection;3281;0;645;0
WireConnection;3336;0;1424;0
WireConnection;811;0;646;0
WireConnection;3552;7;1914;0
WireConnection;679;0;811;0
WireConnection;4805;0;4170;0
WireConnection;4805;1;4379;0
WireConnection;4198;0;4197;0
WireConnection;3335;0;3336;0
WireConnection;4694;0;4691;0
WireConnection;4694;1;3720;0
WireConnection;3699;0;3698;0
WireConnection;4125;0;4134;0
WireConnection;3290;0;3281;0
WireConnection;3290;2;3291;0
WireConnection;680;0;3273;0
WireConnection;1425;0;3335;0
WireConnection;3554;0;3552;0
WireConnection;3710;0;3839;0
WireConnection;3710;1;4855;1
WireConnection;979;0;4805;0
WireConnection;3702;0;3700;0
WireConnection;3702;1;3699;0
WireConnection;3737;0;3739;0
WireConnection;3287;0;3290;0
WireConnection;4199;0;4198;0
WireConnection;3717;0;3797;0
WireConnection;3717;1;3720;0
WireConnection;3326;7;1914;0
WireConnection;4685;0;3797;0
WireConnection;4695;0;4694;0
WireConnection;4695;1;4696;0
WireConnection;1470;0;1106;0
WireConnection;3502;0;1035;0
WireConnection;3502;3;680;0
WireConnection;3502;4;679;0
WireConnection;4857;0;3798;0
WireConnection;4856;0;3702;0
WireConnection;4856;1;4857;0
WireConnection;3608;0;3717;0
WireConnection;3608;1;3611;0
WireConnection;344;0;1470;0
WireConnection;344;1;335;0
WireConnection;4686;1;4695;0
WireConnection;4686;2;4685;0
WireConnection;3283;0;3502;0
WireConnection;3557;0;3554;0
WireConnection;669;1;3287;0
WireConnection;669;2;684;0
WireConnection;4133;0;4126;0
WireConnection;3711;0;3710;0
WireConnection;3740;0;3736;0
WireConnection;3740;2;3737;0
WireConnection;3740;3;3733;0
WireConnection;2093;0;3326;0
WireConnection;351;0;1425;0
WireConnection;4148;1;4199;0
WireConnection;3705;0;3711;0
WireConnection;3705;2;4856;0
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;3285;0;3283;0
WireConnection;3285;2;669;0
WireConnection;3255;0;3253;0
WireConnection;3564;0;2093;0
WireConnection;4123;0;4133;0
WireConnection;4123;1;4140;0
WireConnection;4687;0;3608;0
WireConnection;4687;1;4686;0
WireConnection;4149;0;4148;1
WireConnection;4149;1;4148;4
WireConnection;4149;2;4854;0
WireConnection;627;0;351;0
WireConnection;3741;0;3685;0
WireConnection;3741;1;3740;0
WireConnection;3558;0;3557;0
WireConnection;3558;1;3120;0
WireConnection;3686;0;3741;0
WireConnection;3566;0;3255;0
WireConnection;3506;0;1999;0
WireConnection;3506;3;627;0
WireConnection;3506;4;351;0
WireConnection;4129;1;4123;0
WireConnection;4129;2;4132;0
WireConnection;3694;0;3705;0
WireConnection;3694;1;4855;2
WireConnection;4131;0;3586;0
WireConnection;4926;1;3285;0
WireConnection;4926;0;954;0
WireConnection;4893;0;4898;0
WireConnection;4150;0;4149;0
WireConnection;4688;0;4693;0
WireConnection;4688;2;4687;0
WireConnection;4688;3;3608;0
WireConnection;3553;0;3564;0
WireConnection;3553;1;3558;0
WireConnection;30;0;346;0
WireConnection;4888;0;4897;0
WireConnection;3687;0;3686;0
WireConnection;3687;1;4131;0
WireConnection;4900;0;3433;2
WireConnection;4900;1;4893;0
WireConnection;4166;4;3430;0
WireConnection;4166;1;2982;0
WireConnection;4166;28;4167;0
WireConnection;3666;0;3694;0
WireConnection;4899;0;3433;1
WireConnection;4899;1;4888;0
WireConnection;2984;0;2982;0
WireConnection;2984;1;3430;0
WireConnection;3551;0;3553;0
WireConnection;3551;1;3566;0
WireConnection;3345;0;3343;0
WireConnection;3345;1;3431;0
WireConnection;4076;4;3431;0
WireConnection;4076;1;3343;0
WireConnection;4076;28;4078;0
WireConnection;3743;0;4688;0
WireConnection;4152;0;4151;0
WireConnection;4152;2;4150;0
WireConnection;4152;3;4149;0
WireConnection;4130;0;4129;0
WireConnection;3333;0;3506;0
WireConnection;1500;0;30;0
WireConnection;1500;1;4926;0
WireConnection;3682;0;3687;0
WireConnection;3682;2;3681;0
WireConnection;4127;0;4130;0
WireConnection;4127;1;3743;0
WireConnection;4922;1;3345;0
WireConnection;4922;0;4076;0
WireConnection;4187;0;4152;0
WireConnection;4923;1;2984;0
WireConnection;4923;0;4166;0
WireConnection;4137;0;4138;0
WireConnection;4137;2;4136;0
WireConnection;2289;0;1500;0
WireConnection;1777;0;1914;0
WireConnection;1777;1;3551;0
WireConnection;4890;0;4899;0
WireConnection;4890;1;4900;0
WireConnection;3721;0;3666;0
WireConnection;3721;2;4855;3
WireConnection;4185;0;4187;0
WireConnection;4689;0;4137;0
WireConnection;3657;0;4127;0
WireConnection;3504;0;3338;0
WireConnection;3504;2;4922;0
WireConnection;3504;3;4922;0
WireConnection;3504;4;4923;0
WireConnection;3683;0;3682;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;2289;0
WireConnection;3715;0;3721;0
WireConnection;4892;0;4890;0
WireConnection;3684;0;3683;0
WireConnection;3684;1;3657;0
WireConnection;3724;0;3715;0
WireConnection;4891;0;4892;0
WireConnection;4936;1;4923;0
WireConnection;4936;0;3504;0
WireConnection;968;0;1922;0
WireConnection;4154;0;4185;0
WireConnection;4154;1;4156;0
WireConnection;4690;0;4689;0
WireConnection;328;1;4891;0
WireConnection;3451;0;4203;0
WireConnection;3451;1;603;0
WireConnection;812;0;4936;0
WireConnection;4155;0;4154;0
WireConnection;813;0;18;0
WireConnection;3619;0;3610;0
WireConnection;3619;1;3684;0
WireConnection;3619;2;4690;0
WireConnection;3619;3;3724;0
WireConnection;4181;0;4178;0
WireConnection;4181;3;4155;0
WireConnection;4181;4;4195;0
WireConnection;602;1;4930;0
WireConnection;602;2;3451;0
WireConnection;4848;0;4815;0
WireConnection;808;0;328;0
WireConnection;4934;0;3619;0
WireConnection;4188;0;4178;0
WireConnection;19;0;812;0
WireConnection;19;1;813;0
WireConnection;1234;0;602;0
WireConnection;4847;0;970;0
WireConnection;4850;0;19;0
WireConnection;4850;1;4851;0
WireConnection;4241;0;4848;0
WireConnection;4845;3;808;0
WireConnection;4845;2;4329;0
WireConnection;4240;0;4239;0
WireConnection;3603;0;4934;0
WireConnection;4189;0;4188;0
WireConnection;4189;1;4181;0
WireConnection;4785;0;4189;0
WireConnection;3055;0;1234;0
WireConnection;3799;0;968;0
WireConnection;2918;0;325;0
WireConnection;3249;0;585;0
WireConnection;4846;3;4850;0
WireConnection;4846;2;2910;0
WireConnection;462;0;4845;0
WireConnection;462;1;4847;0
WireConnection;4245;0;4845;0
WireConnection;4245;1;4240;0
WireConnection;4245;2;4241;0
WireConnection;3244;0;1330;0
WireConnection;4332;0;4845;0
WireConnection;4853;0;4816;0
WireConnection;4331;0;4332;0
WireConnection;4246;0;462;0
WireConnection;4246;1;4245;0
WireConnection;2917;0;4846;0
WireConnection;2917;1;2918;0
WireConnection;3241;0;3244;0
WireConnection;3241;1;3249;0
WireConnection;965;0;3055;0
WireConnection;3493;0;2225;0
WireConnection;3493;3;3512;2
WireConnection;3493;4;1909;0
WireConnection;3617;0;3607;0
WireConnection;3617;1;3799;0
WireConnection;3648;0;4930;0
WireConnection;3576;0;4203;0
WireConnection;2237;0;3493;0
WireConnection;2237;1;2219;0
WireConnection;581;0;2917;0
WireConnection;581;1;3241;0
WireConnection;450;0;4331;0
WireConnection;450;1;4246;0
WireConnection;450;2;461;0
WireConnection;3643;0;3617;0
WireConnection;3643;1;968;0
WireConnection;4849;0;4853;0
WireConnection;4176;0;4192;0
WireConnection;4927;1;3643;0
WireConnection;4927;0;4928;0
WireConnection;4317;0;450;0
WireConnection;4317;2;4849;0
WireConnection;4174;0;4176;0
WireConnection;3647;0;3648;0
WireConnection;3520;21;967;0
WireConnection;3520;27;1928;0
WireConnection;3521;9;2898;0
WireConnection;3521;45;1928;0
WireConnection;3087;0;3088;0
WireConnection;3087;1;3576;0
WireConnection;2236;1;546;0
WireConnection;3074;0;581;0
WireConnection;1536;0;1537;0
WireConnection;1536;1;1530;0
WireConnection;1536;2;1534;0
WireConnection;1783;0;2237;0
WireConnection;3491;0;2905;0
WireConnection;3491;3;3521;0
WireConnection;3491;4;3520;0
WireConnection;4163;0;555;0
WireConnection;4163;1;4160;0
WireConnection;4196;0;4174;0
WireConnection;553;0;2236;0
WireConnection;3056;0;561;0
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;3077;0;3074;0
WireConnection;3077;1;4927;0
WireConnection;4256;0;4257;0
WireConnection;4256;2;4317;0
WireConnection;4256;3;450;0
WireConnection;3505;0;1533;0
WireConnection;3505;3;1536;0
WireConnection;3505;4;1537;0
WireConnection;3086;1;3647;0
WireConnection;3086;2;3087;0
WireConnection;556;1;4163;0
WireConnection;3057;0;3056;0
WireConnection;4177;0;4181;0
WireConnection;545;0;551;0
WireConnection;545;1;553;0
WireConnection;3090;0;3086;0
WireConnection;3796;0;3077;0
WireConnection;360;0;3505;0
WireConnection;360;2;369;0
WireConnection;360;3;368;0
WireConnection;4679;0;328;4
WireConnection;4258;0;4256;0
WireConnection;2900;0;2899;0
WireConnection;2900;1;3491;0
WireConnection;2900;2;4196;0
WireConnection;379;0;360;0
WireConnection;379;1;2299;0
WireConnection;379;2;2300;0
WireConnection;1276;0;3796;0
WireConnection;3940;0;376;0
WireConnection;4162;0;3057;0
WireConnection;805;0;327;0
WireConnection;817;0;2900;0
WireConnection;4191;0;4188;0
WireConnection;4191;1;4177;0
WireConnection;4259;0;4258;0
WireConnection;3091;0;3090;0
WireConnection;1921;0;1919;0
WireConnection;554;0;545;0
WireConnection;554;1;556;0
WireConnection;4161;0;4162;0
WireConnection;382;0;3940;0
WireConnection;382;1;379;0
WireConnection;3089;0;3091;0
WireConnection;4350;1;3182;0
WireConnection;4159;0;3179;0
WireConnection;4159;1;4191;0
WireConnection;329;0;4259;0
WireConnection;329;1;4680;0
WireConnection;329;2;805;0
WireConnection;329;3;326;0
WireConnection;3773;0;4743;0
WireConnection;3773;1;384;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;2294;0;554;0
WireConnection;816;1;2294;0
WireConnection;816;2;4161;0
WireConnection;331;0;329;0
WireConnection;331;2;330;0
WireConnection;3174;0;3177;0
WireConnection;3174;1;4159;0
WireConnection;3174;2;4350;0
WireConnection;4728;0;1920;0
WireConnection;4728;1;4727;0
WireConnection;838;0;837;0
WireConnection;370;0;382;0
WireConnection;370;1;1290;0
WireConnection;383;0;379;0
WireConnection;383;1;3773;0
WireConnection;3523;21;963;0
WireConnection;3523;27;1930;0
WireConnection;372;0;1291;0
WireConnection;372;1;382;0
WireConnection;372;2;383;0
WireConnection;690;0;4728;0
WireConnection;690;1;691;0
WireConnection;690;2;838;0
WireConnection;3524;9;2873;0
WireConnection;3524;45;1930;0
WireConnection;2234;0;816;0
WireConnection;2234;1;816;0
WireConnection;2234;2;816;0
WireConnection;1285;0;331;0
WireConnection;388;0;1290;0
WireConnection;388;1;370;0
WireConnection;388;2;3773;0
WireConnection;2208;0;2209;0
WireConnection;3080;0;3079;0
WireConnection;390;0;1291;0
WireConnection;390;1;382;0
WireConnection;390;2;383;0
WireConnection;4337;0;4336;0
WireConnection;4337;1;3174;0
WireConnection;4749;0;4748;0
WireConnection;3081;0;3080;0
WireConnection;3081;1;3075;0
WireConnection;3068;0;3067;0
WireConnection;2210;0;3524;0
WireConnection;2210;2;2208;0
WireConnection;3104;0;690;0
WireConnection;3104;1;3103;0
WireConnection;1284;0;1281;0
WireConnection;1284;2;388;0
WireConnection;1284;3;390;0
WireConnection;1284;4;372;0
WireConnection;4744;0;4337;0
WireConnection;4744;1;4745;0
WireConnection;2207;0;3523;0
WireConnection;2207;2;2208;0
WireConnection;2301;0;2234;0
WireConnection;4683;0;4682;0
WireConnection;4683;2;4681;0
WireConnection;4684;0;1284;0
WireConnection;4684;1;4683;0
WireConnection;4320;0;4233;0
WireConnection;3085;0;3081;0
WireConnection;3085;1;3075;0
WireConnection;4747;0;4744;0
WireConnection;4747;1;4749;0
WireConnection;3489;0;3101;0
WireConnection;3489;3;3104;0
WireConnection;3489;4;690;0
WireConnection;3528;0;2166;0
WireConnection;3528;3;2210;0
WireConnection;3528;4;2207;0
WireConnection;3064;0;3068;0
WireConnection;3064;1;2301;0
WireConnection;1517;0;1518;0
WireConnection;4919;1;1515;0
WireConnection;4919;0;4684;0
WireConnection;2175;0;2181;0
WireConnection;2175;1;3528;0
WireConnection;4852;0;4320;0
WireConnection;4852;1;4387;0
WireConnection;4852;2;4387;0
WireConnection;4746;0;4747;0
WireConnection;4340;1;3489;0
WireConnection;4340;2;824;0
WireConnection;3069;0;3064;0
WireConnection;3069;1;3085;0
WireConnection;4088;0;1517;0
WireConnection;2920;0;2919;0
WireConnection;4931;0;4746;0
WireConnection;4932;0;4340;0
WireConnection;810;0;2175;0
WireConnection;3482;0;3072;0
WireConnection;3482;3;3069;0
WireConnection;3482;4;3064;0
WireConnection;4234;0;4919;0
WireConnection;4234;1;4233;0
WireConnection;4234;2;4852;0
WireConnection;4087;0;4088;0
WireConnection;1292;0;4234;0
WireConnection;407;0;810;0
WireConnection;407;1;408;0
WireConnection;407;2;2920;0
WireConnection;4808;0;3482;0
WireConnection;701;0;4932;0
WireConnection;701;1;4931;0
WireConnection;3266;0;3109;1
WireConnection;3266;1;3109;4
WireConnection;696;0;4346;0
WireConnection;696;1;695;1
WireConnection;696;2;695;4
WireConnection;2993;0;4936;0
WireConnection;1516;0;407;0
WireConnection;1516;1;4087;0
WireConnection;4809;0;701;0
WireConnection;4807;0;4808;0
WireConnection;2180;0;2175;0
WireConnection;3268;1;3266;0
WireConnection;3268;2;3264;0
WireConnection;1262;0;2993;0
WireConnection;414;0;1279;0
WireConnection;414;1;1516;0
WireConnection;4345;0;696;0
WireConnection;4345;1;4344;0
WireConnection;4951;97;3582;0
WireConnection;4951;156;3943;0
WireConnection;2291;0;2264;0
WireConnection;807;0;2919;4
WireConnection;807;1;2180;0
WireConnection;807;2;406;0
WireConnection;807;3;3268;0
WireConnection;3251;0;4807;0
WireConnection;3251;1;4809;0
WireConnection;3352;0;3333;0
WireConnection;560;1;3251;0
WireConnection;560;2;4345;0
WireConnection;4933;0;4951;0
WireConnection;405;0;1278;0
WireConnection;405;1;414;0
WireConnection;405;2;807;0
WireConnection;3353;0;1998;0
WireConnection;2287;0;2291;0
WireConnection;983;0;560;0
WireConnection;1274;0;405;0
WireConnection;333;0;334;0
WireConnection;333;1;1265;0
WireConnection;4396;60;4207;0
WireConnection;3429;5;3140;0
WireConnection;3429;6;3142;0
WireConnection;4144;0;3353;0
WireConnection;4144;3;3352;0
WireConnection;4144;4;3499;0
WireConnection;4116;0;2287;0
WireConnection;971;0;4933;0
WireConnection;3252;1;2287;0
WireConnection;4920;0;4396;0
WireConnection;3478;0;3159;0
WireConnection;3478;2;3498;0
WireConnection;3478;3;3429;7
WireConnection;3478;4;3498;0
WireConnection;3956;0;2287;0
WireConnection;4141;0;4144;0
WireConnection;4120;0;333;0
WireConnection;4120;1;1433;0
WireConnection;4117;0;4116;0
WireConnection;3955;0;3956;0
WireConnection;3955;2;1702;0
WireConnection;4918;3;333;0
WireConnection;4918;16;4666;0
WireConnection;2284;0;3252;0
WireConnection;2284;1;1701;0
WireConnection;4084;0;4117;0
WireConnection;4084;1;4920;0
WireConnection;3144;0;4120;0
WireConnection;3144;1;3478;0
WireConnection;3144;2;4141;0
WireConnection;4916;1;1292;0
WireConnection;4916;0;2163;0
WireConnection;470;0;4916;0
WireConnection;470;1;2284;0
WireConnection;470;2;3955;0
WireConnection;470;3;4084;0
WireConnection;1430;0;4918;0
WireConnection;1430;1;3144;0
WireConnection;1861;0;430;0
WireConnection;1856;0;602;0
WireConnection;1923;0;470;0
WireConnection;1923;3;1430;0
WireConnection;4436;0;1923;0
ASEEND*/
//CHKSM=B34D6FC71444241CBEC665966A922E5248D8B13C
