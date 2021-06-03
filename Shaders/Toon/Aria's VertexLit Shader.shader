// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Arias VertexLit Shader"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[HideInInspector]_outline_width("_outline_width", Float) = 0
		[Header(Dont clean keywords after selecting)][Toggle(TINTED_OUTLINE)]_VRCFallbackDoublesided("VRC Fallback Doublesided", Float) = 0
		[Toggle(_ALPHATEST_ON)]_VRCFallbackCutout("VRC Fallback Cutout", Float) = 0
		[Enum(LessVisible,0.25,Visible,0.5,MoreVisible,0.75,Invisible,2)][Space(5)]_Cutoff("Fallback Cutoff", Float) = 0.5
		[Header(.  Main  .)]_MainTex("Texture (RGB,A)", 2D) = "white" {}
		[Toggle(_)]_SuperSample("SuperSample (expensive)", Float) = 0
		_TexSSBias("Mip Sample Bias", Float) = 0
		[HDR][Space(5)]_Color("> Color", Color) = (1,1,1,1)
		_Hue("Hue", Range( 0 , 1)) = 0
		_Saturation("Saturation", Range( -2 , 5)) = 1
		[Space(5)]_Alpha("Alpha", Range( 0 , 1)) = 1
		_AlphaCutoff("Alpha Cutoff", Float) = 1
		[ToggleUI][Space (5)]_AlphaToCoverage("AlphaToCoverage (antialiased override)", Float) = 0
		_A2CSampleBias("A2C Sample Bias", Float) = 1
		[Header(. Lighting .)]_LightMulti("Light Multiplier", Float) = 1
		_MaxLight("Max Light (2)", Range( 0 , 1)) = 1
		_MinLight("Min Light", Range( 0 , 1)) = 0.05
		_LightSaturationLimiter("Light Saturation Limiter", Float) = 0.75
		_LightSatTotal("Light Saturation Max", Float) = 1
		_LightColourBias("LightColour Bias (keep white)", Color) = (1,1,1,0)
		[ToggleUI][Space(5)]_DisableLight("Unlit (warning - disables all light)", Float) = 0
		[ToggleUI][Space(5)][Deader(.  Shadow  .)]_UseShading("Use Shading", Float) = 1
		[Enum(Surface,0,Object2World,1)]_LightMode("Lighting Mode", Float) = 0
		[Space(5)]_ShadowColour("Shadow Colour", Color) = (0.7098039,0.7098039,0.7098039,1)
		_OffsetDot("Offset Dot", Range( -1 , 1)) = 0
		_ShadowSharpness("Shadow Sharpness", Float) = 20
		_ShadowPower("Shadow Power", Range( 0 , 10)) = 1
		[ToggleUI][Space(5)]_StepTwo("Use Second Step", Float) = 0
		_ShadowColour2("Shadow Colour 2", Color) = (0.9,0.9,0.9,1)
		_OffsetDot2("Offset Dot 2", Range( -1 , 1)) = 0.1
		_ShadowSharpness2("Shadow Sharpness 2", Float) = 20
		_ShadowPower2("Shadow Power 2", Range( 0 , 10)) = 1
		[Space(5)]_ShadowDarkness("Shadow Darkness", Float) = 0.22
		_ShadowSaturation("Shadow Saturation", Range( -2 , 2)) = 0.85
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.68
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.55
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.44
		[Space(5)][Header(.  Emission  .)]_Emission("Emission Map (RGB,A)", 2D) = "black" {}
		[HDR]_EmissionColor("> Colour", Color) = (0,0,0,0)
		_FullBright("FullBright", Float) = 0
		_EmissionHue("Hue", Range( 0 , 1)) = 0
		_EmissionIntensity("Emission Intensity", Float) = 1
		_ShadedEmission("Shaded Emission", Range( 0 , 1)) = 0
		[HDR]_ShadedColour("Shaded Colour", Color) = (0,0,0,0)
		[ToggleUI]_ShadedOnly("Shaded Only", Float) = 0
		[Normal][Space(5)][Header(.  Normal  .)]_Normal("Normal (N)", 2D) = "bump" {}
		[ToggleUI]_NormSuperSample("SuperSample (expensive)", Float) = 0
		_NormSSBias("Mip Sample Bias", Float) = 0
		[Space(5)]_NorDist("Normal Distance Modifier", Float) = 0
		_NormalScale("Scale Normal", Float) = 1
		_NormalPower("Normal Power", Range( 0 , 2)) = 0
		_NormalPowerSpecular("Normal Specular", Range( 0 , 10)) = 0.5
		_NormalPowerMatCap("Normal MatCap", Range( 0 , 5)) = 0.5
		_NormalPowerSubSurface("Normal SubSurface", Range( 0 , 2)) = 0.5
		[Header(Normal Mask)][SingleLineTexture]_NormalMask("(R)NormalMask, (A)Lightmask", 2D) = "white" {}
		[ToggleUI]_LightMaskOnly("Light Mask Only (for alpha8)", Float) = 0
		_LightMaskLevel("Light Mask Level", Float) = 1
		[ToggleUI][Space(5)][Header(.  Soft Shading  .)]_ShadeEnable("Shade Enable", Float) = 1
		[Enum(FixedColour,0,LightColour,1)]_ShadeColorDynamic("ShadeColor Dynamic", Float) = 1
		_ShadeColour("Shade Colour", Color) = (0,0,0,0)
		_ShadeLevel("Shade Level", Range( 0 , 1)) = 0.5
		_SoftPower("Soft Power", Range( 0.5 , 4)) = 0.75
		_SoftScale("Soft Scale", Range( 0.5 , 2)) = 1
		[ToggleUI][Space(5)][Header(. SubSurface Light .)]_UseSubSurface("Use SubSurface/Deflected Light", Float) = 0
		_OffsetSS("Offset", Range( -1 , 1)) = 0
		_SSIntensity("SubSurface Intensity", Float) = 5
		[ToggleUI][Space(5)]_SSDouble("Use Second Step", Float) = 0
		_OffsetSS2("Offset 2", Range( -1 , 1)) = 0
		_SSIntensity2("SubSurface Intensity 2", Float) = 5
		[Space(5)]_SSBrightness("SubSurface Brightness", Float) = 2
		_ShadeMaskSS("Shade Mask", Range( 0 , 1)) = 0.5
		[ToggleUI]_UseLightMaskSS("Use Light Mask", Float) = 1
		_SSTransmission("Transmission", Range( 0 , 1)) = 0
		[ToggleUI]_Spherize("Spherize SS Normal", Float) = 0
		[Space(5)][Header(.  Specular  .)]_SpecularOpacity("Specular Opacity", Range( 0 , 1)) = 1
		_SpecularSize("Specular Size", Range( 0 , 10)) = 1
		_SpecularStrength("Specular Strength", Float) = 0
		[HDR]_SpecMatCapColor1("Specular Colour", Color) = (1,1,1,1)
		[Enum(Additive,0,Multiplied,1)]_SpecMode("Specular Mode", Float) = 0
		[ToggleUI]_StereoFixSpec("Stereo Converge (flatten)", Float) = 0
		[ToggleUI][Space(5)][Header(. Specular Overlay)]_UseSpecularMatCap("Use Specular MatCap", Float) = 0
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
		_RoughnessPower("Roughness Power", Float) = 1
		[ToggleUI]_RoughnessInvert("Roughness Invert", Float) = 1
		[ToggleUI][Space(5)][Header(. Reflection Probe)]_UseReflection("Use Reflection", Float) = 0
		_ProbeSmoothness("Probe Smoothness", Float) = 0.75
		_ReflectionOpacity("Reflection Opacity", Float) = 0.5
		_ReflectionIntensity("Reflection Intensity", Float) = 0.5
		[ToggleUI][Space(5)][Header(.  Sparkles  .)]_UseSparkleShimmer("Use Sparkle/Shimmer", Float) = 0
		[HDR]_SparkleColor("Color", Color) = (1,1,1,0)
		[Enum(Additive,0,Multiply,1)]_SparkleMode("Sparkle Mode", Float) = 1
		_SparklePattern("Sparkle Pattern (RGB)", 2D) = "black" {}
		[ToggleUI]_SparkleSuperSample("SuperSample (expensive)", Float) = 0
		_SparkleSSBias("SuperSample Bias", Float) = 0
		[Space(5)]_SparkleTexColour("SparkleTex Saturation", Range( 0 , 2)) = 2
		_Threshold("Threshold", Range( 0 , 1)) = 0
		_Range("Range", Range( 0.001 , 1)) = 0.3
		_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.05
		[ToggleUI]_StereoCorrect("Stereo Correct", Float) = 1
		_WorldPosContribution("WorldPos Contribution", Range( 0 , 1)) = 0.3
		[Enum(Linear,0,Circular,1)][Space(5)]_MotionType("Motion Type", Float) = 0
		_MotionSpeed("Motion Speed", Float) = 0
		_RotateLinear("Rotate Linear", Range( 0 , 1)) = 0
		_MotionIntensity("Motion Intensity", Float) = 0.01
		[Space(5)]_SparkleMask("Sparkle Mask (R,A)", 2D) = "white" {}
		_SparkleMaskPower("Sparkle Mask Power", Float) = 1
		_SparkleFresnel("Fresnel Bias, Scale, Power", Vector) = (0,11,5,0)
		[ToggleUI][Space(5)][Header(.  Rim Fresnel  .)]_UseRim("Use Rim", Float) = 0
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
		[ToggleUI][Space(10)][Header(.  MatCap  .)]_UseMatcap("Use Matcap", Float) = 0
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
		[Toggle(_)][Space(10)][Header(.  Parallax  .)]_UseParallax("Use Parallax", Float) = 0
		[Enum(Normal,0,Planar,1)]_ParallaxType("Parallax Type", Float) = 0
		[HDR]_ParallaxColour("Parallax Colour", Color) = (1,1,1,1)
		_ParallaxTexture("Parallax Texture (RGB,A)", 2D) = "black" {}
		_ParallaxHeight("Parallax Height", Float) = 0.5
		_ParallaxScale("Parallax Scale", Float) = 1
		_ParallaxMask("Parallax Mask (R)", 2D) = "white" {}
		_ParallaxMaskPower("Parallax Mask Power", Float) = 1
		[ToggleUI][Space(20)][Header(VRC Friends Only)]_FriendsOnly("Friends Only ON/OFF", Float) = 0
		[SingleLineTexture]_FriendsOnlyRT("> FriendsOnly RenderTexture", 2D) = "black" {}
		[Header(enable without cam for always friendsonlytex)][ToggleUI]_InvertFriendsOnly("Invert Friends Only", Float) = 0
		[ToggleUI][Space(10)]_FriendsOnlyTexture("Friends Only Texture", Float) = 0
		_MainTexFriends("FriendsOnly Texture (RGB,A)", 2D) = "white" {}
		[Toggle(_)]_FriendsSuperSample("SuperSample (expensive)", Float) = 0
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
		
		UsePass "Hidden/Nature/Terrain/Utilities/PICKING"
	UsePass "Hidden/Nature/Terrain/Utilities/SELECTION"

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
			#define ASE_NEEDS_VERT_POSITION
			#pragma multi_compile __ VERTEXLIGHT_ON
			#pragma instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap forwardadd


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

			uniform int _StencilOp;
			uniform half _ZWriteMode;
			uniform half _WriteMask;
			uniform half _ReadMask;
			uniform half _SrcBlend;
			uniform half _Cutoff;
			uniform half _StencilRef;
			uniform int _StencilFail;
			uniform half _VRCFallbackDoublesided;
			uniform int _StencilComparison;
			uniform int _StencilZFail;
			uniform half _VRCFallbackCutout;
			uniform half _outline_width;
			uniform half _ZTestMode;
			uniform int _Culling;
			uniform half _DstBlend;
			uniform half _UseMatcap;
			uniform half _UseRim;
			uniform half _RimMode;
			uniform float _Hue;
			uniform half _FriendsOnlyTexture;
			uniform half _InvertFriendsOnly;
			uniform sampler2D _FriendsOnlyRT;
			uniform float4 _FriendsOnlyRT_ST;
			uniform half _FriendsSuperSample;
			uniform sampler2D _MainTexFriends;
			uniform float4 _MainTexFriends_ST;
			uniform half _FriendTexSSBias;
			uniform half _SuperSample;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform half _TexSSBias;
			uniform half4 _Color;
			uniform half _Saturation;
			uniform half _StepTwo;
			uniform float4 _ShadowColour;
			uniform float _ShadowSharpness;
			uniform half _UseShading;
			uniform half _NormSuperSample;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform half _NormSSBias;
			uniform float _NorDist;
			uniform float _NormalScale;
			uniform half _LightMaskOnly;
			uniform sampler2D _NormalMask;
			uniform float4 _NormalMask_ST;
			uniform float _NormalPower;
			uniform half _StaticLightX;
			uniform half _StaticLightY;
			uniform half _StaticLightZ;
			uniform half _LightMode;
			uniform half _OffsetDot;
			uniform half _LightMaskLevel;
			uniform float _ShadowPower;
			uniform half4 _ShadowColour2;
			uniform float _ShadowSharpness2;
			uniform half _OffsetDot2;
			uniform float _ShadowPower2;
			uniform half _ShadowSaturation;
			uniform half _DisableLight;
			uniform half _UseSubSurface;
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
			uniform half _LightMulti;
			uniform half4 _LightColourBias;
			uniform float _MinLight;
			uniform half _MaxLight;
			uniform float _LightSaturationLimiter;
			uniform half _LightSatTotal;
			uniform float _ShadowDarkness;
			uniform half _ShadeEnable;
			uniform half _ShadeColorDynamic;
			uniform half4 _ShadeColour;
			uniform float _SoftScale;
			uniform float _SoftPower;
			uniform half _ShadeLevel;
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
			uniform half _RoughnessPower;
			uniform half _SpecularOpacity;
			uniform half _SpecMatCapMode;
			uniform half _UseSpecularMatCap;
			uniform sampler2D _SpecularMatcap;
			uniform half _Legacy2;
			uniform half _StereoFixSpecCap;
			uniform half _SpecMatcapSaturation;
			uniform half _SpecMatcapPower;
			uniform half _SpecMatcapMultiply;
			uniform half4 _SpecMatCapColor;
			uniform half _SpecMatcapOpacity;
			uniform half _UseReflection;
			uniform float _ReflectionIntensity;
			uniform half _ProbeSmoothness;
			uniform half _ReflectionOpacity;
			uniform half _SpecularLevel;
			uniform sampler2D _SpecularMask;
			uniform float4 _SpecularMask_ST;
			uniform half _SpecMaskPower;
			uniform half _UseSparkleShimmer;
			uniform half _SparkleMode;
			uniform sampler2D _SparkleMask;
			uniform float4 _SparkleMask_ST;
			uniform half _SparkleMaskPower;
			uniform float _Threshold;
			uniform float _Range;
			uniform half _SparkleSuperSample;
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
			uniform half _UseParallax;
			uniform sampler2D _ParallaxMask;
			uniform float4 _ParallaxMask_ST;
			uniform half _ParallaxMaskPower;
			uniform sampler2D _ParallaxTexture;
			uniform half _ParallaxType;
			uniform float4 _ParallaxTexture_ST;
			uniform float _ParallaxHeight;
			uniform float _ParallaxScale;
			uniform half4 _ParallaxColour;
			uniform half _AlphaToCoverage;
			uniform float _Alpha;
			uniform float _A2CSampleBias;
			uniform float _AlphaCutoff;
			uniform half _MirrorSystem;
			uniform half _IsInMirror;
			uniform half _IsNotMirror;
			uniform half _FriendsOnly;
			#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
				sampler2D _TerrainHeightmapTexture;//ASE Terrain Instancing
				sampler2D _TerrainNormalmapTexture;//ASE Terrain Instancing
			#endif//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_START( Terrain )//ASE Terrain Instancing
				UNITY_DEFINE_INSTANCED_PROP( float4, _TerrainPatchInstanceData )//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_END( Terrain)//ASE Terrain Instancing
			CBUFFER_START( UnityTerrain)//ASE Terrain Instancing
				#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
					float4 _TerrainHeightmapRecipSize;//ASE Terrain Instancing
					float4 _TerrainHeightmapScale;//ASE Terrain Instancing
				#endif//ASE Terrain Instancing
			CBUFFER_END//ASE Terrain Instancing
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
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
			
			float3 CenterEye1_g586(  )
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
			
			int isCamera14_g585(  )
			{
				return unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f;
			}
			
			float3 CenterEye1_g1575(  )
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
			
			float3 SHArgbambientDir(  )
			{
				return float4(Unity_SafeNormalize(unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz), 1.0);
			}
			
			float4 VertexLightPosX3_g587(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g587(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g587(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g587(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol114_g587(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightCol215_g587(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g587(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g587(  )
			{
				return unity_LightColor[3];
			}
			
			float3 CenterEye1_g1597(  )
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
			
			float3 unity_SHArgb3_g1582(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			
			float3 CenterEye1_g2033(  )
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
			
			float3 CenterEye1_g2037(  )
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
			
			float3 CenterEye1_g2039(  )
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
			
			float3 CenterEye1_g1676(  )
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
			
			float3 CenterEye1_g1703(  )
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
			
			float3 CenterEye1_g1705(  )
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
			
			float3 CenterEye1_g2042(  )
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
			
			float3 CenterEye1_g2044(  )
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
			
			float3 CenterEye1_g2047(  )
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
			
			half4 StereoScreenUV1_g2050( half4 screenuv )
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
			
			int isCamera1_g2049(  )
			{
				return unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f;
			}
			
			appdata ApplyMeshModification( appdata v ){
			#ifdef UNITY_INSTANCING_ENABLED
				float2 patchVertex = v.vertex.xy;
				float4 instanceData = UNITY_ACCESS_INSTANCED_PROP( Terrain, _TerrainPatchInstanceData );
				float2 sampleCoords = ( patchVertex.xy + instanceData.xy ) * instanceData.z;
				v.ase_texcoord = float4( sampleCoords.xy * _TerrainHeightmapRecipSize.z, 0, 0 );
				float height = UnpackHeightmap( tex2Dlod( _TerrainHeightmapTexture, v.ase_texcoord ) );
				v.vertex.xz = sampleCoords * _TerrainHeightmapScale.xz;
				v.vertex.y = height * _TerrainHeightmapScale.y;
				v.ase_normal = tex2Dlod( _TerrainNormalmapTexture, v.ase_texcoord ).rgb * 2 - 1;
			#endif
			return v;
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				v = ApplyMeshModification(v);
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
				float2 uv_FriendsOnlyRT = i.ase_texcoord1.xy * _FriendsOnlyRT_ST.xy + _FriendsOnlyRT_ST.zw;
				float4 tex2DNode349 = tex2D( _FriendsOnlyRT, uv_FriendsOnlyRT );
				float temp_output_351_0 = ceil( saturate( ( tex2DNode349.r + tex2DNode349.g + tex2DNode349.b ) ) );
				float ifLocalVar3506 = 0;
				if( _InvertFriendsOnly == 1.0 )
				ifLocalVar3506 = ( 1.0 - temp_output_351_0 );
				else if( _InvertFriendsOnly < 1.0 )
				ifLocalVar3506 = temp_output_351_0;
				half FriendsOnlyInvert3333 = ifLocalVar3506;
				sampler2D texvalue34_g1674 = _MainTexFriends;
				float2 uv_MainTexFriends = i.ase_texcoord1.xy * _MainTexFriends_ST.xy + _MainTexFriends_ST.zw;
				float2 temp_output_4_0_g1674 = uv_MainTexFriends;
				float2 uvin34_g1674 = temp_output_4_0_g1674;
				float2 dx34_g1674 = ( ddx( temp_output_4_0_g1674 ) * float2( 0.25,0.25 ) );
				float2 dy34_g1674 = ( ddy( temp_output_4_0_g1674 ) * float2( 0.25,0.25 ) );
				float bias34_g1674 = _FriendTexSSBias;
				float4 localsupersample2x234_g1674 = supersample2x2( texvalue34_g1674 , uvin34_g1674 , dx34_g1674 , dy34_g1674 , bias34_g1674 );
				float4 ifLocalVar3475 = 0;
				UNITY_BRANCH 
				if( _FriendsSuperSample == 1.0 )
				ifLocalVar3475 = localsupersample2x234_g1674;
				else if( _FriendsSuperSample < 1.0 )
				ifLocalVar3475 = tex2D( _MainTexFriends, uv_MainTexFriends );
				sampler2D texvalue34_g1675 = _MainTex;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 temp_output_4_0_g1675 = uv_MainTex;
				float2 uvin34_g1675 = temp_output_4_0_g1675;
				float2 dx34_g1675 = ( ddx( temp_output_4_0_g1675 ) * float2( 0.25,0.25 ) );
				float2 dy34_g1675 = ( ddy( temp_output_4_0_g1675 ) * float2( 0.25,0.25 ) );
				float bias34_g1675 = _TexSSBias;
				float4 localsupersample2x234_g1675 = supersample2x2( texvalue34_g1675 , uvin34_g1675 , dx34_g1675 , dy34_g1675 , bias34_g1675 );
				float4 ifLocalVar4165 = 0;
				UNITY_BRANCH 
				if( _SuperSample == 1.0 )
				ifLocalVar4165 = localsupersample2x234_g1675;
				else if( _SuperSample < 1.0 )
				ifLocalVar4165 = tex2D( _MainTex, uv_MainTex );
				float4 ifLocalVar3504 = 0;
				UNITY_BRANCH 
				if( ( _FriendsOnlyTexture * FriendsOnlyInvert3333 ) >= 1.0 )
				ifLocalVar3504 = ifLocalVar3475;
				else
				ifLocalVar3504 = ifLocalVar4165;
				float3 hsvTorgb2909 = RGBToHSV( ( (ifLocalVar3504).xyz * (_Color).rgb ) );
				float3 hsvTorgb2908 = HSVToRGB( float3(( _Hue + hsvTorgb2909.x ),hsvTorgb2909.y,hsvTorgb2909.z) );
				float3 desaturateInitialColor2917 = hsvTorgb2908;
				float desaturateDot2917 = dot( desaturateInitialColor2917, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2917 = lerp( desaturateInitialColor2917, desaturateDot2917.xxx, ( 1.0 - _Saturation ) );
				sampler2D texvalue34_g1574 = _Normal;
				float2 uv_Normal = i.ase_texcoord1.xy * _Normal_ST.xy + _Normal_ST.zw;
				float2 temp_output_4_0_g1574 = uv_Normal;
				float2 uvin34_g1574 = temp_output_4_0_g1574;
				float2 dx34_g1574 = ( ddx( temp_output_4_0_g1574 ) * float2( 0.25,0.25 ) );
				float2 dy34_g1574 = ( ddy( temp_output_4_0_g1574 ) * float2( 0.25,0.25 ) );
				float3 localCenterEye1_g586 = CenterEye1_g586();
				float temp_output_4_0_g585 = distance( WorldPosition , ( (float)1 == 0.0 ? localCenterEye1_g586 : _WorldSpaceCameraPos ) );
				int localisCamera14_g585 = isCamera14_g585();
				float clampResult4354 = clamp( ( ( temp_output_4_0_g585 * ( 1.0 - ( (float)localisCamera14_g585 == 0.0 ? 0.5 : 1.0 ) ) ) * 2.0 * _NorDist ) , 0.05 , 3.0 );
				float ifLocalVar3495 = 0;
				if( _NorDist >= 0.001 )
				ifLocalVar3495 = clampResult4354;
				else
				ifLocalVar3495 = 1.0;
				float NormalDist3459 = ifLocalVar3495;
				float bias34_g1574 = ( _NormSSBias * saturate( NormalDist3459 ) );
				float4 localsupersample2x234_g1574 = supersample2x2( texvalue34_g1574 , uvin34_g1574 , dx34_g1574 , dy34_g1574 , bias34_g1574 );
				float temp_output_4352_0 = ( _NormalScale * NormalDist3459 );
				float3 localUnpackNormal47_g1574 = UnpackScaleNormal( localsupersample2x234_g1574, temp_output_4352_0 );
				float3 ifLocalVar3494 = 0;
				UNITY_BRANCH 
				if( _NormSuperSample == 1.0 )
				ifLocalVar3494 = localUnpackNormal47_g1574;
				else if( _NormSuperSample < 1.0 )
				ifLocalVar3494 = UnpackScaleNormal( tex2D( _Normal, uv_Normal ), temp_output_4352_0 );
				float2 uv_NormalMask = i.ase_texcoord1.xy * _NormalMask_ST.xy + _NormalMask_ST.zw;
				float4 tex2DNode3059 = tex2D( _NormalMask, uv_NormalMask );
				float temp_output_4203_0 = ( _LightMaskOnly + tex2DNode3059.r );
				float3 lerpResult430 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( temp_output_4203_0 * _NormalPower ));
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
				float3 localCenterEye1_g1575 = CenterEye1_g1575();
				float3 temp_output_4_0_g1575 = ( localCenterEye1_g1575 - WorldPosition );
				float3 normalizeResult5_g1575 = normalize( temp_output_4_0_g1575 );
				float3 lerpResult2635 = lerp( appendResult248 , normalizeResult5_g1575 , float3( 0.3333,0.3333,0.3333 ));
				half3 Dir_LightDir2215 = ( ( ase_lightColor.rgb * ase_lightColor.a ) > float3( 0,0,0 ) ? normalizeResult1233 : lerpResult2635 );
				float3 localSHArgbambientDir6_g1581 = SHArgbambientDir();
				float dotResult5 = dot( NormalShade962 , ( Dir_LightDir2215 + localSHArgbambientDir6_g1581 ) );
				float NdotL1296 = dotResult5;
				float4 localVertexLightPosX3_g587 = VertexLightPosX3_g587();
				float4 break4_g587 = localVertexLightPosX3_g587;
				float4 localVertexLightPosY2_g587 = VertexLightPosY2_g587();
				float4 break5_g587 = localVertexLightPosY2_g587;
				float4 localVertexLightPosZ1_g587 = VertexLightPosZ1_g587();
				float4 break6_g587 = localVertexLightPosZ1_g587;
				float3 appendResult7_g587 = (float3(break4_g587.x , break5_g587.x , break6_g587.x));
				float3 VertLightPos12017 = appendResult7_g587;
				float4 transform2153 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 ifLocalVar3496 = 0;
				UNITY_BRANCH 
				if( _LightMode == 1.0 )
				ifLocalVar3496 = (transform2153).xyz;
				else if( _LightMode < 1.0 )
				ifLocalVar3496 = WorldPosition;
				float3 Lightmode2159 = ifLocalVar3496;
				float3 normalizeResult1382 = normalize( ( VertLightPos12017 - Lightmode2159 ) );
				float dotResult1381 = dot( NormalShade962 , normalizeResult1382 );
				float Vert_NdotL1389 = dotResult1381;
				float3 pos188_g587 = appendResult7_g587;
				float3 objToWorld139_g587 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_155_0_g587 = pow( distance( pos188_g587 , objToWorld139_g587 ) , 2.0 );
				float4 localVertexLightAttenuation86_g587 = VertexLightAttenuation86_g587();
				float4 break87_g587 = localVertexLightAttenuation86_g587;
				float attenx96_g587 = break87_g587.x;
				float temp_output_60_0_g587 = saturate( ( 1.0 - ( ( temp_output_155_0_g587 * attenx96_g587 ) / 25.0 ) ) );
				float temp_output_3408_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g587 ) * attenx96_g587 ) ) , ( temp_output_60_0_g587 * temp_output_60_0_g587 ) );
				float3 appendResult8_g587 = (float3(break4_g587.y , break5_g587.y , break6_g587.y));
				float3 pos290_g587 = appendResult8_g587;
				float3 objToWorld140_g587 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_75_0_g587 = pow( distance( pos290_g587 , objToWorld140_g587 ) , 2.0 );
				float atteny97_g587 = break87_g587.y;
				float temp_output_107_0_g587 = saturate( ( 1.0 - ( ( temp_output_75_0_g587 * atteny97_g587 ) / 25.0 ) ) );
				float temp_output_3408_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g587 ) * atteny97_g587 ) ) , ( temp_output_107_0_g587 * temp_output_107_0_g587 ) );
				float3 appendResult9_g587 = (float3(break4_g587.z , break5_g587.z , break6_g587.z));
				float3 pos389_g587 = appendResult9_g587;
				float3 objToWorld141_g587 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_79_0_g587 = pow( distance( pos389_g587 , objToWorld141_g587 ) , 2.0 );
				float attenz98_g587 = break87_g587.z;
				float temp_output_125_0_g587 = saturate( ( 1.0 - ( ( temp_output_79_0_g587 * attenz98_g587 ) / 25.0 ) ) );
				float temp_output_3408_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g587 ) * attenz98_g587 ) ) , ( temp_output_125_0_g587 * temp_output_125_0_g587 ) );
				float3 appendResult10_g587 = (float3(break4_g587.w , break5_g587.w , break6_g587.w));
				float3 pos491_g587 = appendResult10_g587;
				float3 objToWorld138_g587 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_83_0_g587 = pow( distance( pos491_g587 , objToWorld138_g587 ) , 2.0 );
				float attenw99_g587 = break87_g587.w;
				float temp_output_116_0_g587 = saturate( ( 1.0 - ( ( temp_output_83_0_g587 * attenw99_g587 ) / 25.0 ) ) );
				float temp_output_3408_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g587 ) * attenw99_g587 ) ) , ( temp_output_116_0_g587 * temp_output_116_0_g587 ) );
				half VertAtten2014 = ( temp_output_3408_23 + temp_output_3408_29 + temp_output_3408_30 + temp_output_3408_31 );
				float4 localVertexLightCol114_g587 = VertexLightCol114_g587();
				float4 temp_output_3408_16 = localVertexLightCol114_g587;
				float4 localVertexLightCol215_g587 = VertexLightCol215_g587();
				float4 temp_output_3408_17 = localVertexLightCol215_g587;
				float4 localVertexLightCol319_g587 = VertexLightCol319_g587();
				float4 temp_output_3408_18 = localVertexLightCol319_g587;
				float4 localVertexLightCol421_g587 = VertexLightCol421_g587();
				float4 temp_output_3408_20 = localVertexLightCol421_g587;
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
				float ifLocalVar3497 = 0;
				UNITY_BRANCH 
				if( _UseShading == 1.0 )
				ifLocalVar3497 = lerpResult1994;
				else if( _UseShading < 1.0 )
				ifLocalVar3497 = 1.0;
				half OffsetDot4139 = _OffsetDot;
				float temp_output_1106_0 = ( ifLocalVar3497 - OffsetDot4139 );
				float lerpResult3262 = lerp( 1.0 , tex2DNode3059.a , _LightMaskLevel);
				float LightMask4135 = lerpResult3262;
				float temp_output_1118_0 = ( _ShadowSharpness * temp_output_1106_0 * LightMask4135 );
				float saferPower4103 = max( temp_output_1118_0 , 0.0001 );
				float temp_output_1254_0 = saturate( pow( saferPower4103 , _ShadowPower ) );
				float3 lerpResult1016 = lerp( (_ShadowColour).rgb , float3( 1,1,1 ) , temp_output_1254_0);
				float saferPower4366 = max( ( _ShadowSharpness2 * ( temp_output_1106_0 - _OffsetDot2 ) * LightMask4135 ) , 0.0001 );
				float3 lerpResult4371 = lerp( (_ShadowColour2).rgb , float3( 1,1,1 ) , saturate( pow( saferPower4366 , _ShadowPower2 ) ));
				float saferPower4392 = max( temp_output_1254_0 , 0.0001 );
				float3 lerpResult4383 = lerp( float3( 1,1,1 ) , lerpResult4371 , pow( saferPower4392 , 0.75 ));
				float3 RampShade979 = ( _StepTwo == 1.0 ? ( lerpResult1016 * lerpResult4383 ) : lerpResult1016 );
				float3 desaturateInitialColor581 = desaturateVar2917;
				float desaturateDot581 = dot( desaturateInitialColor581, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar581 = lerp( desaturateInitialColor581, desaturateDot581.xxx, ( ( 1.0 - RampShade979 ) * ( 1.0 - _ShadowSaturation ) ).x );
				float3 MaintexRGB3074 = desaturateVar581;
				float isUnlit3574 = _DisableLight;
				float3 temp_cast_5 = (isUnlit3574).xxx;
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
				float3 lerpResult3593 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( temp_output_4203_0 * _NormalPowerSubSurface ));
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
				float4 transform5_g1596 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 localCenterEye1_g1597 = CenterEye1_g1597();
				float temp_output_4_0_g1596 = distance( transform5_g1596 , float4( ( (float)0 == 0.0 ? localCenterEye1_g1597 : _WorldSpaceCameraPos ) , 0.0 ) );
				float temp_output_3839_0 = temp_output_4_0_g1596;
				float temp_output_3720_0 = pow( (0.0 + (temp_output_3839_0 - 0.0) * (1.0 - 0.0) / (0.5 - 0.0)) , 0.25 );
				float temp_output_3608_0 = pow( ( temp_output_3797_0 * temp_output_3720_0 ) , _SSIntensity );
				float saferPower4685 = max( temp_output_3797_0 , 0.0001 );
				float lerpResult4686 = lerp( 1.0 , pow( ( ( temp_output_3797_0 - _OffsetSS2 ) * temp_output_3720_0 ) , _SSIntensity2 ) , pow( saferPower4685 , 0.75 ));
				float dotResult3702 = dot( ase_worldViewDir , -( FinalLightDir2218 + ase_worldNormal ) );
				float saferPower3694 = max( ( ( 1.0 - ( temp_output_3839_0 * -0.25 ) ) * 0.3 * dotResult3702 ) , 0.0001 );
				float smoothstepResult3721 = smoothstep( 0.0 , 0.075 , saturate( pow( saferPower3694 , 3.0 ) ));
				float ifLocalVar3604 = 0;
				UNITY_BRANCH 
				if( _UseSubSurface == 1.0 )
				ifLocalVar3604 = ( _SSBrightness * ( saturate( ( dotResult3687 * 0.5 * _SSTransmission ) ) + saturate( ( ( lerpResult4129 + 1.0 ) * max( ( _SSDouble == 1.0 ? ( temp_output_3608_0 * lerpResult4686 ) : temp_output_3608_0 ) , 1E-05 ) ) ) ) * ( _UseLightMaskSS == 1.0 ? LightMask4135 : 1.0 ) * ( ( 1.0 - smoothstepResult3721 ) * 0.75 ) );
				float SubSurface3603 = ifLocalVar3604;
				float temp_output_2082_0 = ( 1.0 - _WorldSpaceLightPos0.w );
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch1908 = ( ( temp_output_3408_16 * temp_output_3408_23 ) + ( temp_output_3408_17 * temp_output_3408_29 ) + ( temp_output_3408_18 * temp_output_3408_30 ) + ( temp_output_3408_20 * temp_output_3408_31 ) );
				#else
				float4 staticSwitch1908 = half4(0,0,0,0);
				#endif
				float4 VertLight1406 = staticSwitch1908;
				float3 localunity_SHArgb3_g1582 = unity_SHArgb3_g1582();
				float3 saferPower4200 = max( ( ( ( ase_lightColor.rgb * float3( 1,1,1 ) * temp_output_2082_0 ) + ( (VertLight1406).xyz * float3( 0.5,0.5,0.5 ) * temp_output_2082_0 ) + ( localunity_SHArgb3_g1582 * float3( 1.25,1.25,1.25 ) ) ) * _LightMulti * (_LightColourBias).rgb ) , 0.0001 );
				float3 temp_cast_8 = (_MinLight).xxx;
				float3 clampResult3331 = clamp( pow( saferPower4200 , 0.8 ) , temp_cast_8 , float3( 2,2,2 ) );
				float3 break5_g1583 = clampResult3331;
				float3 clampResult1914 = clamp( clampResult3331 , float3( 0,0,0 ) , ( ( _MaxLight * 2.0 * max( max( break5_g1583.x , break5_g1583.y ) , max( break5_g1583.y , break5_g1583.z ) ) ) / clampResult3331 ) );
				float3 break5_g1599 = clampResult1914;
				float saferPower3564 = max( saturate( max( max( break5_g1599.x , break5_g1599.y ) , max( break5_g1599.y , break5_g1599.z ) ) ) , 0.0001 );
				float3 break5_g1598 = clampResult1914;
				float clampResult3551 = clamp( ( pow( saferPower3564 , 3.0 ) - ( ( 1.0 - saturate( min( min( break5_g1598.x , break5_g1598.y ) , min( break5_g1598.y , break5_g1598.z ) ) ) ) * _LightSaturationLimiter ) ) , ( ( 1.0 - _LightSatTotal ) + 0.2 ) , 1.0 );
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
				float3 ifLocalVar3503 = 0;
				UNITY_BRANCH 
				if( _ShadeEnable == 1.0 )
				ifLocalVar3503 = lerpResult3285;
				else if( _ShadeEnable < 1.0 )
				ifLocalVar3503 = half3(1,1,1);
				float3 LightShaded2289 = ( clampResult30 * ifLocalVar3503 );
				float3 LightColour968 = ( desaturateVar1777 * LightShaded2289 );
				float3 saferPower3799 = max( LightColour968 , 0.0001 );
				float3 ifLocalVar3568 = 0;
				UNITY_BRANCH 
				if( isUnlit3574 == 1.0 )
				ifLocalVar3568 = temp_cast_5;
				else if( isUnlit3574 < 1.0 )
				ifLocalVar3568 = ( ( SubSurface3603 * pow( saferPower3799 , 2.0 ) ) + LightColour968 );
				float3 PostDesaturation1276 = ( ( MaintexRGB3074 * ifLocalVar3568 ) + float3( 0.0001,0.0001,0.0001 ) );
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
				float4 transform5_g2032 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 localCenterEye1_g2033 = CenterEye1_g2033();
				float temp_output_4_0_g2032 = distance( transform5_g2032 , float4( ( (float)0 == 0.0 ? localCenterEye1_g2033 : _WorldSpaceCameraPos ) , 0.0 ) );
				float dotResult17_g2031 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_23_0_g2031 = ( ( 1.0 - ( temp_output_4_0_g2032 * 0.25 ) ) * 8.0 * dotResult17_g2031 );
				float temp_output_19_0_g2031 = saturate( temp_output_23_0_g2031 );
				float temp_output_3773_0 = ( ( temp_output_19_0_g2031 + 0.25 ) * _Amount );
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
				float4 tex2DNode328 = tex2D( _Emission, uv_Emission );
				float EmissionMask4679 = tex2DNode328.a;
				float3 ifLocalVar3507 = 0;
				UNITY_BRANCH 
				if( _UseRim == 1.0 )
				ifLocalVar3507 = ( ifLocalVar1284 * ( _MaskFresnel == 1.0 ? EmissionMask4679 : 1.0 ) );
				else if( _UseRim < 1.0 )
				ifLocalVar3507 = PostDesaturation1276;
				float3 hsvTorgb4326 = RGBToHSV( (tex2DNode328).rgb );
				float3 hsvTorgb4328 = HSVToRGB( float3(( _EmissionHue + hsvTorgb4326.x ),hsvTorgb4326.y,hsvTorgb4326.z) );
				float3 lerpResult450 = lerp( hsvTorgb4328 , ( ( hsvTorgb4328 * LightColour968 ) + ( hsvTorgb4328 * (_ShadedColour).rgb * ( 1.0 - LightColour968 ) ) ) , _ShadedEmission);
				float3 lerpResult4317 = lerp( lerpResult450 , float3( 0,0,0 ) , LightColour968);
				float3 temp_cast_12 = (3.0).xxx;
				float3 clampResult331 = clamp( ( ( _ShadedOnly == 1.0 ? lerpResult4317 : lerpResult450 ) * EmissionMask4679 * (_EmissionColor).rgb * _EmissionIntensity ) , float3( 0,0,0 ) , temp_cast_12 );
				float3 Emission1285 = clampResult331;
				float luminance4320 = Luminance(Emission1285);
				float3 lerpResult4234 = lerp( ifLocalVar3507 , Emission1285 , ( _FullBright > 0.0 ? _FullBright : luminance4320 ));
				float3 PostRimLight1292 = lerpResult4234;
				float3 localCenterEye1_g2037 = CenterEye1_g2037();
				float3 ifLocalVar50_g2036 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar50_g2036 = localCenterEye1_g2037;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar50_g2036 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g2036 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g2036 - WorldPosition ), 0 ) ).xyz );
				float3 lerpResult3086 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( _NormalPowerMatCap * NormalDist3459 * temp_output_4203_0 ));
				float3 tanNormal3090 = lerpResult3086;
				float3 worldNormal3090 = float3(dot(tanToWorld0,tanNormal3090), dot(tanToWorld1,tanNormal3090), dot(tanToWorld2,tanNormal3090));
				float3 normalizeResult3091 = normalize( worldNormal3090 );
				float3 NormalMatCap3089 = normalizeResult3091;
				float3 worldToViewDir13_g2036 = normalize( mul( UNITY_MATRIX_V, float4( NormalMatCap3089, 0 ) ).xyz );
				float mulTime2208 = _Time.y * _MatcapSpin;
				float cos2210 = cos( mulTime2208 );
				float sin2210 = sin( mulTime2208 );
				float2 rotator2210 = mul( (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g2036 ) , worldToViewDir13_g2036 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) - float2( 0.5,0.5 ) , float2x2( cos2210 , -sin2210 , sin2210 , cos2210 )) + float2( 0.5,0.5 );
				float3 localCenterEye1_g2039 = CenterEye1_g2039();
				float3 ifLocalVar32_g2038 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar32_g2038 = localCenterEye1_g2039;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar32_g2038 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g2038 = normalize( ( ifLocalVar32_g2038 - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g2038 = normalize( cross( normalizeResult19_g2038 , _worldUp ) );
				float3 temp_output_21_0_g2038 = NormalMatCap3089;
				float dotResult10_g2038 = dot( normalizeResult8_g2038 , temp_output_21_0_g2038 );
				float dotResult2_g2038 = dot( _worldUp , normalizeResult19_g2038 );
				float3 normalizeResult7_g2038 = normalize( ( _worldUp - ( dotResult2_g2038 * normalizeResult19_g2038 ) ) );
				float dotResult9_g2038 = dot( normalizeResult7_g2038 , temp_output_21_0_g2038 );
				float2 appendResult11_g2038 = (float2(dotResult10_g2038 , dotResult9_g2038));
				float cos2207 = cos( mulTime2208 );
				float sin2207 = sin( mulTime2208 );
				float2 rotator2207 = mul( ( ( appendResult11_g2038 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) - float2( 0.5,0.5 ) , float2x2( cos2207 , -sin2207 , sin2207 , cos2207 )) + float2( 0.5,0.5 );
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
				float3 ifLocalVar3477 = 0;
				UNITY_BRANCH 
				if( _UseMatcap == 1.0 )
				ifLocalVar3477 = PostMatcap1274;
				else if( _UseMatcap < 1.0 )
				ifLocalVar3477 = PostRimLight1292;
				float3 desaturateInitialColor2291 = LightColour968;
				float desaturateDot2291 = dot( desaturateInitialColor2291, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2291 = lerp( desaturateInitialColor2291, desaturateDot2291.xxx, 1.0 );
				float3 temp_output_2287_0 = (desaturateVar2291).xyz;
				float3 localCenterEye1_g1676 = CenterEye1_g1676();
				float3 temp_output_4_0_g1676 = ( localCenterEye1_g1676 - WorldPosition );
				float3 normalizeResult5_g1676 = normalize( temp_output_4_0_g1676 );
				float3 ifLocalVar3493 = 0;
				if( _StereoFixSpec == 1.0 )
				ifLocalVar3493 = normalizeResult5_g1676;
				else if( _StereoFixSpec < 1.0 )
				ifLocalVar3493 = ase_worldViewDir;
				float3 normalizeResult1783 = normalize( ( ifLocalVar3493 + FinalLightDir2218 ) );
				float3 lerpResult602 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( temp_output_4203_0 * _NormalPowerSpecular ));
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
				float temp_output_4149_0 = ( tex2DNode4148.r * tex2DNode4148.a );
				float saferPower4154 = max( ( _RoughnessInvert == 1.0 ? ( 1.0 - temp_output_4149_0 ) : temp_output_4149_0 ) , 0.0001 );
				float ifLocalVar4181 = 0;
				UNITY_BRANCH 
				if( _Roughness == 1.0 )
				ifLocalVar4181 = saturate( pow( saferPower4154 , _RoughnessPower ) );
				else if( _Roughness < 1.0 )
				ifLocalVar4181 = 0.0;
				float RoughnessSpec4179 = ( temp_output_4188_0 + ifLocalVar4181 );
				float clampResult2294 = clamp( ( pow( saferPower545 , exp( ( 10.0 - _SpecularSize ) ) ) * pow( saferPower556 , ( _SpecularStrength * RoughnessSpec4179 ) ) ) , 0.0001 , 5.0 );
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
				float3 localCenterEye1_g1703 = CenterEye1_g1703();
				float3 ifLocalVar50_g1702 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar50_g1702 = localCenterEye1_g1703;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar50_g1702 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g1702 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g1702 - WorldPosition ), 0 ) ).xyz );
				float3 worldToViewDir13_g1702 = normalize( mul( UNITY_MATRIX_V, float4( NormalSpecular965, 0 ) ).xyz );
				float3 localCenterEye1_g1705 = CenterEye1_g1705();
				float3 ifLocalVar32_g1704 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar32_g1704 = localCenterEye1_g1705;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar32_g1704 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g1704 = normalize( ( ifLocalVar32_g1704 - WorldPosition ) );
				float3 normalizeResult8_g1704 = normalize( cross( normalizeResult19_g1704 , _worldUp ) );
				float3 temp_output_21_0_g1704 = NormalSpecular965;
				float dotResult10_g1704 = dot( normalizeResult8_g1704 , temp_output_21_0_g1704 );
				float dotResult2_g1704 = dot( _worldUp , normalizeResult19_g1704 );
				float3 normalizeResult7_g1704 = normalize( ( _worldUp - ( dotResult2_g1704 * normalizeResult19_g1704 ) ) );
				float dotResult9_g1704 = dot( normalizeResult7_g1704 , temp_output_21_0_g1704 );
				float2 appendResult11_g1704 = (float2(dotResult10_g1704 , dotResult9_g1704));
				float2 ifLocalVar3491 = 0;
				UNITY_BRANCH 
				if( _Legacy2 == 1.0 )
				ifLocalVar3491 = (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g1702 ) , worldToViewDir13_g1702 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 )));
				else if( _Legacy2 < 1.0 )
				ifLocalVar3491 = ( ( appendResult11_g1704 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) );
				float saferPower4196 = max( ( ( 1.0 - RoughnessSpec4179 ) * 3.0 ) , 0.0001 );
				float3 desaturateInitialColor1920 = (tex2Dlod( _SpecularMatcap, float4( ifLocalVar3491, 0, pow( saferPower4196 , 2.0 )) )).rgb;
				float desaturateDot1920 = dot( desaturateInitialColor1920, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1920 = lerp( desaturateInitialColor1920, desaturateDot1920.xxx, ( 1.0 - _SpecMatcapSaturation ) );
				float3 temp_cast_17 = (_SpecMatcapPower).xxx;
				float3 ifLocalVar3492 = 0;
				UNITY_BRANCH 
				if( _UseSpecularMatCap == 1.0 )
				ifLocalVar3492 = ( pow( desaturateVar1920 , temp_cast_17 ) * _SpecMatcapMultiply * (_SpecMatCapColor).rgb );
				float3 ifLocalVar3489 = 0;
				UNITY_BRANCH 
				if( _SpecMatCapMode == 1.0 )
				ifLocalVar3489 = ( ifLocalVar3492 * MaintexRGB3074 );
				else if( _SpecMatCapMode < 1.0 )
				ifLocalVar3489 = ifLocalVar3492;
				float3 lerpResult4340 = lerp( float3( 0,0,0 ) , ifLocalVar3489 , _SpecMatcapOpacity);
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
				float3 ifLocalVar3483 = 0;
				UNITY_BRANCH 
				if( _UseReflection == 1.0 )
				ifLocalVar3483 = ( ( _ReflectionIntensity * indirectSpecular3174 ) < float3( 0.001,0.001,0.001 ) ? float3( 0,0,0 ) : indirectSpecular3174 );
				float2 uv_SpecularMask = i.ase_texcoord1.xy * _SpecularMask_ST.xy + _SpecularMask_ST.zw;
				float4 tex2DNode695 = tex2D( _SpecularMask, uv_SpecularMask );
				float3 lerpResult560 = lerp( float3( 0,0,0 ) , ( ifLocalVar3482 + ( lerpResult4340 + ifLocalVar3483 ) ) , pow( ( _SpecularLevel * tex2DNode695.r * tex2DNode695.a ) , _SpecMaskPower ));
				float3 SpecularOut983 = lerpResult560;
				float2 uv_SparkleMask = i.ase_texcoord1.xy * _SparkleMask_ST.xy + _SparkleMask_ST.zw;
				float4 tex2DNode87_g2040 = tex2D( _SparkleMask, uv_SparkleMask );
				float3 temp_cast_18 = (_Threshold).xxx;
				float3 localCenterEye1_g2042 = CenterEye1_g2042();
				float temp_output_4_0_g2041 = distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g2042 : _WorldSpaceCameraPos ) );
				float temp_output_102_0_g2040 = temp_output_4_0_g2041;
				float3 temp_cast_20 = (saturate( ( _Threshold + pow( _Range , ( 1.0 - (0.0 + (temp_output_102_0_g2040 - 0.0) * (0.1 - 0.0) / (1.0 - 0.0)) ) ) ) )).xxx;
				sampler2D texvalue34_g2046 = _SparklePattern;
				float2 uv_SparklePattern = i.ase_texcoord1.xy * _SparklePattern_ST.xy + _SparklePattern_ST.zw;
				float2 temp_output_4_0_g2046 = uv_SparklePattern;
				float2 uvin34_g2046 = temp_output_4_0_g2046;
				float2 dx34_g2046 = ( ddx( temp_output_4_0_g2046 ) * float2( 0.25,0.25 ) );
				float2 dy34_g2046 = ( ddy( temp_output_4_0_g2046 ) * float2( 0.25,0.25 ) );
				float bias34_g2046 = _SparkleSSBias;
				float4 localsupersample2x234_g2046 = supersample2x2( texvalue34_g2046 , uvin34_g2046 , dx34_g2046 , dy34_g2046 , bias34_g2046 );
				float4 ifLocalVar74_g2040 = 0;
				UNITY_BRANCH 
				if( _SparkleSuperSample == 1.0 )
				ifLocalVar74_g2040 = localsupersample2x234_g2046;
				else if( _SparkleSuperSample < 1.0 )
				ifLocalVar74_g2040 = tex2D( _SparklePattern, uv_SparklePattern );
				float grayscale107_g2040 = dot(ifLocalVar74_g2040.xyz, float3(0.299,0.587,0.114));
				float3 appendResult113_g2040 = (float3(grayscale107_g2040 , grayscale107_g2040 , grayscale107_g2040));
				float3 lerpResult109_g2040 = lerp( appendResult113_g2040 , (ifLocalVar74_g2040).xyz , _SparkleTexColour);
				sampler2D texvalue34_g2045 = _SparklePattern;
				float2 break22_g2040 = uv_SparklePattern;
				float2 appendResult39_g2040 = (float2(-break22_g2040.x , break22_g2040.y));
				float3 localCenterEye1_g2044 = CenterEye1_g2044();
				float4 appendResult76_g2043 = (float4(( WorldPosition - localCenterEye1_g2044 ) , 0.0));
				float4 temp_output_77_0_g2043 = mul( UNITY_MATRIX_V, appendResult76_g2043 );
				float2 break83_g2043 = ( (temp_output_77_0_g2043).xy / (temp_output_77_0_g2043).z );
				float2 appendResult86_g2043 = (float2(( ( _ScreenParams.z / _ScreenParams.w ) * break83_g2043.x ) , ( break83_g2043.y * 2.0 )));
				float2 appendResult101_g2043 = (float2(1.0 , 1.0));
				float2 appendResult102_g2043 = (float2(0.0 , 0.0));
				float4 screenPos = i.ase_texcoord6;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ifLocalVar27_g2040 = 0;
				UNITY_BRANCH 
				if( _StereoCorrect == 1.0 )
				ifLocalVar27_g2040 = ( ( ( ( -appendResult86_g2043 * float2( 1,0.5 ) ) + float2( 0.5,0.5 ) ) * appendResult101_g2043 ) + appendResult102_g2043 );
				else if( _StereoCorrect < 1.0 )
				ifLocalVar27_g2040 = (ase_screenPosNorm).xy;
				float mulTime7_g2040 = _Time.y * _MotionSpeed;
				float2 appendResult24_g2040 = (float2(mulTime7_g2040 , 0.0));
				float cos25_g2040 = cos( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float sin25_g2040 = sin( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float2 rotator25_g2040 = mul( appendResult24_g2040 - float2( 0.5,0.5 ) , float2x2( cos25_g2040 , -sin25_g2040 , sin25_g2040 , cos25_g2040 )) + float2( 0.5,0.5 );
				float2 appendResult28_g2040 = (float2(sin( mulTime7_g2040 ) , cos( mulTime7_g2040 )));
				float2 ifLocalVar40_g2040 = 0;
				UNITY_BRANCH 
				if( _MotionType == 0.0 )
				ifLocalVar40_g2040 = rotator25_g2040;
				else if( _MotionType < 0.0 )
				ifLocalVar40_g2040 = appendResult28_g2040;
				float temp_output_26_0_g2040 = ( ( WorldPosition.x + WorldPosition.y + WorldPosition.z ) * ( _WorldPosContribution / 10.0 ) );
				float2 appendResult46_g2040 = (float2(-temp_output_26_0_g2040 , temp_output_26_0_g2040));
				float2 temp_output_50_0_g2040 = ( ( appendResult39_g2040 + ( ifLocalVar27_g2040 * _ScreenContribution ) ) + float2( 0.25,0.25 ) + ( _MotionIntensity * ifLocalVar40_g2040 ) + appendResult46_g2040 );
				float2 temp_output_4_0_g2045 = temp_output_50_0_g2040;
				float2 uvin34_g2045 = temp_output_4_0_g2045;
				float2 dx34_g2045 = ( ddx( temp_output_4_0_g2045 ) * float2( 0.25,0.25 ) );
				float2 dy34_g2045 = ( ddy( temp_output_4_0_g2045 ) * float2( 0.25,0.25 ) );
				float bias34_g2045 = _SparkleSSBias;
				float4 localsupersample2x234_g2045 = supersample2x2( texvalue34_g2045 , uvin34_g2045 , dx34_g2045 , dy34_g2045 , bias34_g2045 );
				float4 ifLocalVar68_g2040 = 0;
				UNITY_BRANCH 
				if( _SparkleSuperSample == 1.0 )
				ifLocalVar68_g2040 = localsupersample2x234_g2045;
				else if( _SparkleSuperSample < 1.0 )
				ifLocalVar68_g2040 = tex2D( _SparklePattern, temp_output_50_0_g2040 );
				float grayscale108_g2040 = dot(ifLocalVar68_g2040.xyz, float3(0.299,0.587,0.114));
				float3 appendResult114_g2040 = (float3(grayscale108_g2040 , grayscale108_g2040 , grayscale108_g2040));
				float3 lerpResult110_g2040 = lerp( appendResult114_g2040 , (ifLocalVar68_g2040).xyz , _SparkleTexColour);
				float3 localCenterEye1_g2047 = CenterEye1_g2047();
				float3 smoothstepResult93_g2040 = smoothstep( temp_cast_18 , temp_cast_20 , ( lerpResult109_g2040 * lerpResult110_g2040 * ( 1.0 - pow( ( distance( WorldPosition , localCenterEye1_g2047 ) / 10000.0 ) , 0.5 ) ) ));
				float3 clampResult151_g2040 = clamp( smoothstepResult93_g2040 , float3( 0,0,0 ) , float3( 3,3,3 ) );
				float clampResult139_g2040 = clamp( (1.0 + (temp_output_102_0_g2040 - 0.0) * (100.0 - 1.0) / (2.0 - 0.0)) , 0.0 , 100.0 );
				float saferPower143_g2040 = max( clampResult139_g2040 , 0.0001 );
				float3 normalizeResult64_g2040 = normalize( ase_worldViewDir );
				float3 temp_output_97_0_g2040 = NormalSpecular965;
				float dotResult176_g2040 = dot( temp_output_97_0_g2040 , ase_worldViewDir );
				float clampResult177_g2040 = clamp( dotResult176_g2040 , 1E-05 , 1.99999 );
				float3 ifLocalVar178_g2040 = 0;
				if( clampResult177_g2040 > 0.0 )
				ifLocalVar178_g2040 = temp_output_97_0_g2040;
				else if( clampResult177_g2040 < 0.0 )
				ifLocalVar178_g2040 = -temp_output_97_0_g2040;
				float3 break66_g2040 = (float3( 0,0,0 ) + (_SparkleFresnel - float3( 0,0,0 )) * (float3( 0.1,0.1,0.1 ) - float3( 0,0,0 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float fresnelNdotV73_g2040 = dot( ifLocalVar178_g2040, normalizeResult64_g2040 );
				float fresnelNode73_g2040 = ( break66_g2040.x + break66_g2040.y * pow( max( 1.0 - fresnelNdotV73_g2040 , 0.0001 ), break66_g2040.z ) );
				float3 temp_output_95_0_g2040 = ( pow( ( tex2DNode87_g2040.r * tex2DNode87_g2040.a ) , _SparkleMaskPower ) * clampResult151_g2040 * ( (_SparkleColor).rgb * ( (0.0 + (saturate( ( 1.0 / temp_output_102_0_g2040 ) ) - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) * pow( saferPower143_g2040 , 1.5 ) ) ) * ( 1.0 - saturate( fresnelNode73_g2040 ) ) );
				float3 ifLocalVar3473 = 0;
				UNITY_BRANCH 
				if( _UseSparkleShimmer == 1.0 )
				ifLocalVar3473 = ( _SparkleMode == 1.0 ? ( MaintexRGB3074 * temp_output_95_0_g2040 ) : temp_output_95_0_g2040 );
				float3 SparkleOut971 = ifLocalVar3473;
				float2 uv_ParallaxMask = i.ase_texcoord1.xy * _ParallaxMask_ST.xy + _ParallaxMask_ST.zw;
				float2 uv_ParallaxTexture = i.ase_texcoord1.xy * _ParallaxTexture_ST.xy + _ParallaxTexture_ST.zw;
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = Unity_SafeNormalize( ase_tanViewDir );
				float2 Offset29_g2048 = ( ( _ParallaxHeight - 1 ) * ase_tanViewDir.xy * _ParallaxScale ) + uv_ParallaxTexture;
				float2 Offset57_g2048 = ( ( _ParallaxHeight - 1 ) * ( ase_tanViewDir.xy / ase_tanViewDir.z ) * _ParallaxScale ) + uv_ParallaxTexture;
				float2 temp_output_59_0_g2048 = ( (float)(int)_ParallaxType == 0.0 ? Offset29_g2048 : Offset57_g2048 );
				float4 tex2DNode41_g2048 = tex2D( _ParallaxTexture, temp_output_59_0_g2048 );
				float3 ifLocalVar4110 = 0;
				UNITY_BRANCH 
				if( _UseParallax == 1.0 )
				ifLocalVar4110 = ( pow( tex2D( _ParallaxMask, uv_ParallaxMask ).r , _ParallaxMaskPower ) * (( tex2DNode41_g2048 * _ParallaxColour * tex2DNode41_g2048.a * _ParallaxColour.a )).rgb );
				float localbits18_g2050 = ( 0.0 );
				float covtoggle18_g2050 = _AlphaToCoverage;
				float Alpha1262 = (ifLocalVar3504).w;
				float temp_output_333_0 = ( _Alpha * Alpha1262 );
				float temp_output_3_0_g2050 = temp_output_333_0;
				half4 screenuv1_g2050 = ( screenPos / screenPos.w );
				half4 localStereoScreenUV1_g2050 = StereoScreenUV1_g2050( screenuv1_g2050 );
				float4 break8_g2050 = localStereoScreenUV1_g2050;
				int x11_g2050 = (int)fmod( break8_g2050.x , 8.0 );
				int y11_g2050 = (int)fmod( break8_g2050.y , 8.0 );
				half localDither8x8Bayer11_g2050 = Dither8x8Bayer( x11_g2050 , y11_g2050 );
				int localRenderSampleCount4_g2050 = RenderSampleCount();
				float finalAlpha18_g2050 = ( ( temp_output_3_0_g2050 + ( ( 1.0 - localDither8x8Bayer11_g2050 ) / ( localRenderSampleCount4_g2050 / _A2CSampleBias ) ) ) * localRenderSampleCount4_g2050 );
				float preFinalAlpha18_g2050 = temp_output_3_0_g2050;
				{
				// Shift and subtract to get the needed amount of positive bits
				  if (covtoggle18_g2050 == 1)
				{
				cov = (1u << (uint)(finalAlpha18_g2050)) - 1u;
				finalAlpha18_g2050 = 1;
				}
				  if (covtoggle18_g2050 == 0)
				{
				cov = 0xFF;
				finalAlpha18_g2050 = preFinalAlpha18_g2050;
				}
				}
				int localisCamera1_g2049 = isCamera1_g2049();
				int Cam17_g2049 = localisCamera1_g2049;
				int temp_output_5_0_g2049 = (int)_IsInMirror;
				int temp_output_6_0_g2049 = (int)_IsNotMirror;
				float ifLocalVar3478 = 0;
				UNITY_BRANCH 
				if( _MirrorSystem == 1.0 )
				ifLocalVar3478 = (float)( (float)Cam17_g2049 == 1.0 ? ( (float)temp_output_5_0_g2049 == 1.0 ? ( Cam17_g2049 + temp_output_5_0_g2049 ) : ( Cam17_g2049 * temp_output_5_0_g2049 ) ) : ( (float)temp_output_6_0_g2049 == 0.0 ? ( Cam17_g2049 * temp_output_6_0_g2049 ) : ( Cam17_g2049 + temp_output_6_0_g2049 ) ) );
				else
				ifLocalVar3478 = 1.0;
				half FriendsOnlyToggle3353 = _FriendsOnly;
				float ifLocalVar4144 = 0;
				if( FriendsOnlyToggle3353 == 1.0 )
				ifLocalVar4144 = ( FriendsOnlyInvert3333 * 2.0 );
				else if( FriendsOnlyToggle3353 < 1.0 )
				ifLocalVar4144 = 1.0;
				clip( ( ( temp_output_333_0 * _AlphaCutoff ) * ifLocalVar3478 * ifLocalVar4144 ) - 0.005);
				float4 appendResult1923 = (float4(( ifLocalVar3477 + ( ( float3( 0.05,0.05,0.05 ) + temp_output_2287_0 ) * SpecularOut983 ) + ( ( temp_output_2287_0 + float3( 0.1,0.1,0.1 ) ) * float3( 2,2,2 ) * SparkleOut971 ) + ( ( temp_output_2287_0 + float3( 0.03,0.03,0.03 ) ) * ifLocalVar4110 ) ) , finalAlpha18_g2050));
				
				
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
Version=18908
-1557;132;1456;747;7410.277;1248.972;4.652529;True;False
Node;AmplifyShaderEditor.CommentaryNode;1237;-8058.104,-540.3135;Inherit;False;2494.556;1518.161;;59;4356;1861;1856;3089;3091;3090;3086;3087;3647;965;3576;3088;3648;3462;3055;1234;602;3451;603;3596;3595;3644;3735;3594;3646;3650;3593;3645;3598;3597;962;1235;430;3494;3061;2962;4074;2958;428;3062;2957;3600;3432;4079;4352;3599;4203;4351;3459;3059;4302;4354;3495;3527;3458;3464;3838;4357;4360;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;3838;-6731.679,-424.8531;Inherit;False;View Distance;-1;;585;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,0,17,1;1;9;INT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3464;-6713.078,-496.6083;Float;False;Property;_NorDist;Normal Distance Modifier;49;0;Create;False;0;0;0;False;1;Space(5);False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1378;-5470.776,-1542.995;Inherit;False;2099.93;995.9517;;33;2150;1491;1406;1908;1910;1682;1631;1630;1629;1684;1389;1381;1382;1380;1383;2017;1665;1905;1911;1879;1891;1890;2014;1589;1886;1551;1878;2152;2153;2154;2159;3408;3496;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3458;-6379.837,-438.2522;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3527;-6377.543,-317.338;Half;False;Constant;_Dist_Null;Dist_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;4354;-6210.413,-433.6178;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.05;False;2;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3408;-5275.098,-1115.571;Inherit;False;VertexLightData;-1;;587;d6cc1c00f5d200e45903717e6fa3d55c;0;0;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.ConditionalIfNode;3495;-6006.938,-487.4892;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0.001;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-4858.046,-688.5619;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-4729.315,-686.6694;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RegisterLocalVarNode;3459;-5816.017,-491.8634;Float;False;NormalDist;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;4302;-8039.959,-498.8184;Inherit;True;Property;_NormalMask;(R)NormalMask, (A)Lightmask;55;2;[Header];[SingleLineTexture];Create;False;1;Normal Mask;0;0;False;0;False;None;None;False;white;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-4989.162,-749.3232;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-4573.709,-681.1406;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3059;-7723.908,-498.8709;Inherit;True;Property;_NormalMask1;Normal Mask (RG,A);45;2;[Header];[SingleLineTexture];Create;False;1;G Heightmap . A LightMask;0;0;False;0;False;4302;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;281;-7727.429,-1488.688;Inherit;False;1883.061;637.1891;Uses directional light or uses the static light direction;21;3817;3415;2215;1296;5;1165;1076;1876;2635;1233;248;1247;633;3511;252;251;1246;249;2148;1232;2147;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;4202;-7670.152,-665.2393;Half;False;Property;_LightMaskOnly;Light Mask Only (for alpha8);56;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4357;-7945.234,285.7778;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1890;-4444.542,-682.0359;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2147;-7717.332,-1314.462;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;3599;-7845.934,743.8638;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4079;-7864.842,217.3564;Half;False;Property;_NormSSBias;Mip Sample Bias;48;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1891;-4427.027,-593.6627;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4351;-7828.752,673.2659;Float;False;Property;_NormalScale;Scale Normal;50;0;Create;False;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2014;-4658.913,-763.0379;Half;False;VertAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;4360;-7752.234,291.7778;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4203;-7360.916,-494.2256;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2957;-7856.168,363.2319;Inherit;True;Property;_Normal;Normal (N);46;1;[Normal];Create;False;0;0;0;False;2;Space(5);Header(.  Normal  .);False;None;6de7e95ea7231d74e880c76a5472134d;True;bump;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ComponentMaskNode;2148;-7517.332,-1273.462;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-7719.888,-1424.848;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-4243.309,-724.0883;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4352;-7628.604,673.8654;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3432;-7829.767,554.5219;Inherit;False;0;2957;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1911;-4313.964,-813.201;Half;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3600;-7139.852,152.9848;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4356;-7570.413,284.3822;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-7702.605,-981.8108;Half;False;Property;_StaticLightZ;Static Light Z;37;0;Create;True;0;0;0;False;0;False;0.44;0.44;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4074;-7412.292,301.2196;Inherit;False;NormalTextureSuperSample;-1;;1574;c5e7d95f0a9b898419b29857c25ecde5;0;5;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;50;SAMPLERSTATE;0;False;28;FLOAT;0;False;49;FLOAT;1;False;4;FLOAT3;0;FLOAT;39;FLOAT;40;FLOAT;41
Node;AmplifyShaderEditor.SamplerNode;2958;-7421.229,623.9562;Inherit;True;Property;_TextureSample1;Texture Sample 1;100;0;Create;True;0;0;0;False;0;False;2957;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-7297.19,-1303.903;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-4824.539,-1098.841;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-7704.32,-1053.852;Half;False;Property;_StaticLightY;Static Light Y;36;0;Create;True;0;0;0;False;0;False;0.55;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-7704.227,-1128.136;Half;False;Property;_StaticLightX;Static Light X;35;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;0.68;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-4828.565,-917.2657;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch;1905;-4064.213,-758.4907;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-4828.009,-827.705;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;2962;-7374.684,441.2066;Half;False;Property;_NormSuperSample;SuperSample (expensive);47;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3062;-7118.829,527.0123;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-4828.483,-1008.795;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2153;-5444.693,-1473.717;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;428;-7217.398,875.9929;Float;False;Property;_NormalPower;Normal Power;51;0;Create;True;0;0;0;False;0;False;0;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3511;-7384.249,-956.1778;Inherit;False;VR_Center_Eye;-1;;1575;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.CommentaryNode;3820;-5471.558,15.06701;Inherit;False;1832.555;536.1137;LightDir Threshold;16;1560;2218;2213;2217;2216;1994;1480;2033;1297;2025;2035;2026;2034;2140;1490;2121;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-4549.161,-990.8787;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-3805.671,-756.8867;Half;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3494;-7050.411,453.8959;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;633;-7391.807,-1183.175;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-7151.503,-1347.665;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector4Node;1910;-4344.37,-1135.226;Half;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2152;-5202.665,-1502.879;Half;False;Property;_LightMode;Lighting Mode;23;1;[Enum];Create;False;0;2;Surface;0;Object2World;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3061;-6921.231,859.7995;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2150;-5367.876,-1288.946;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;248;-7370.771,-1066.555;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2154;-5228.796,-1400.215;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-7058.847,-1222.26;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;430;-6702.103,826.3912;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3496;-4999.127,-1397.673;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2635;-7060.641,-1046.892;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.3333,0.3333,0.3333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1908;-4141.791,-1019.448;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-5182.543,304.4393;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-7176.812,-1142.179;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2121;-5404.258,358.4309;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1076;-6887.841,-1137;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1235;-6336.934,657.5127;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;2017;-4894.916,-1220.842;Inherit;False;VertLightPos1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3819;-3274.496,-263.8208;Inherit;False;2081.032;521.23;;22;1914;3332;3301;1915;3325;3331;1916;4200;2867;1489;4394;2870;3803;1486;4204;4393;1484;2082;3314;3416;1408;2081;Light Colour;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;2140;-4966.812,342.2583;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-3856.618,-1017.988;Float;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2159;-4837.238,-1400.862;Inherit;False;Lightmode;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-3250.2,-5.162955;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2215;-6739.414,-1136.314;Half;False;Dir_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-4657.188,-1232.291;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;2081;-3216.024,-227.5092;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2034;-4783.742,339.7534;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3415;-6738.559,-1065.653;Inherit;False;GetBakedLight;-1;;1581;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-6017.448,657.5467;Float;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2026;-4620.37,337.0211;Inherit;False;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-4543.707,-1324.866;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3817;-6527.182,-1131.418;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-6711.897,-1207.774;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;1484;-3017.25,-133.7456;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode;3416;-3051.458,107.8395;Inherit;False;GetBakedLight;-1;;1582;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.NormalizeNode;1382;-4525.547,-1230.729;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3597;-7631.967,25.00762;Float;False;Property;_NormalPowerSubSurface;Normal SubSurface;54;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3314;-3065.906,-5.699965;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2082;-2953.804,-204.7403;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3598;-7352.949,10.63496;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-4264.826,-1285.479;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4393;-2566.912,-218.4333;Half;False;Property;_LightColourBias;LightColour Bias (keep white);20;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,0.9490196,0.9575164,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-2743.616,-111.4937;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3803;-2744.464,0.1149235;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2035;-4456.742,309.7534;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;5;-6274.125,-1203.03;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4204;-2740.95,108.7541;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1.25,1.25,1.25;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-4111.573,-1290.663;Float;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;4394;-2284.912,-218.4333;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-6072.649,-1209.666;Float;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3593;-6598.423,220.7052;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3650;-6663.688,-0.520067;Half;False;Property;_Spherize;Spherize SS Normal;74;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-2534.736,-43.49431;Inherit;False;3;3;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2870;-2517.678,127.5551;Half;False;Property;_LightMulti;Light Multiplier;15;0;Create;False;1;;0;0;False;1;Header(. Lighting .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2025;-4329.63,309.4951;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;3645;-6638.365,79.06295;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TransformDirectionNode;3646;-6443.365,74.06295;Inherit;False;Object;World;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;4171;-7165.944,-726.4453;Inherit;False;645.0127;183.9;LightMask;3;4135;3262;3263;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4226.845,222.8561;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-4113.357,-1210.121;Half;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2033;-4189.742,309.7534;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3735;-6423.647,-1.613451;Inherit;False;SphereizeVar;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3594;-6404.448,217.9523;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4212.73,130.2954;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2867;-2280.816,-32.62532;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2217;-4228.138,413.6643;Inherit;False;2215;Dir_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1916;-2289.808,148.3686;Float;False;Property;_MinLight;Min Light;17;0;Create;True;0;0;0;False;0;False;0.05;0.03;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3644;-6128.333,88.90162;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2216;-4230.755,476.6841;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4200;-2136.958,50.43401;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3618.435,420.752;Half;False;Property;_OffsetDot;Offset Dot;25;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3263;-7152.07,-638.9957;Half;False;Property;_LightMaskLevel;Light Mask Level;57;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1058;-3622.957,205.0163;Half;False;Property;_UseShading;Use Shading;22;1;[ToggleUI];Create;True;1;;0;0;False;2;Space(5);Deader(.  Shadow  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1994;-3911.592,236.6205;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3500;-3626.069,339.071;Half;False;Constant;_Shading_Null;Shading_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;793;-1643.86,946.416;Inherit;False;2134.762;909.7648;;30;1123;3289;4422;1492;641;3503;2976;3285;954;3283;669;3502;3287;684;1035;680;679;3290;3273;811;3291;3281;3282;645;646;3271;662;642;4428;4430;Soft Shading;0,0,0,1;0;0
Node;AmplifyShaderEditor.NormalizeNode;3595;-5962.148,89.51568;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2213;-3993.74,417.9181;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3262;-6918.699,-676.4453;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3497;-3461.783,210.8541;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4139;-3335.503,420.6663;Half;False;OffsetDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3331;-1973.433,54.36884;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3325;-1821.575,21.86576;Inherit;False;Float3 Max;-1;;1583;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1915;-1876.359,-49.38095;Half;False;Property;_MaxLight;Max Light (2);16;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3596;-5792.493,85.46589;Float;False;NormalSubSurface;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3585;-4499.268,-3580.413;Inherit;False;2676.801;1659.511;;59;3611;3717;3608;3743;3797;3603;3604;3605;3619;4137;3610;3684;3657;4136;4138;3683;4127;3682;4130;3681;3687;4129;4131;3686;3741;4132;4123;3685;4140;3740;3720;4133;3798;3736;4126;3719;3589;3733;3737;3588;3739;3586;3839;3592;3801;3587;3601;4685;4686;4687;4688;4689;4690;4691;4692;4693;4694;4695;4696;SubSurface;1,1,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2218;-3839.579,413.1346;Half;False;FinalLightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;4362;-3175.192,1096.499;Inherit;False;1045.672;436.533;;10;4374;4373;4371;4370;4369;4366;4365;4364;4363;4392;Light Ramp2;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1123;-1620.275,1577.359;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4135;-6758.731,-679.871;Inherit;False;LightMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;4430;-1591.505,1438.687;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3098.956,384.0996;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;4428;-1412.75,1464.915;Inherit;False;298;157;instead of VFACE;2;4424;4423;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;4384;-3584.337,1194.918;Half;False;Property;_OffsetDot2;Offset Dot 2;30;0;Create;True;1;;0;0;False;0;False;0.1;0.1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;573;-2875.857,606.9181;Inherit;False;1217.672;436.533;;15;979;4125;4170;4105;1016;1010;1254;4134;4103;1008;1118;4104;4379;4380;4385;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4377;-3315.481,1177.744;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3301;-1591.901,-23.41244;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4373;-3162.896,1138.84;Float;False;Property;_ShadowSharpness2;Shadow Sharpness 2;31;0;Create;True;0;0;0;False;0;False;20;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3601;-4484.761,-2896.833;Inherit;False;3596;NormalSubSurface;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4105;-2863.56,649.2585;Float;False;Property;_ShadowSharpness;Shadow Sharpness;26;0;Create;True;0;0;0;False;0;False;20;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4170;-2862.919,721.6709;Inherit;False;4135;LightMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4361;-2950.68,661.7152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4374;-3162.254,1211.252;Inherit;False;4135;LightMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3587;-4478.782,-2979.388;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;4424;-1404.75,1514.915;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;3289;-1112.005,1642.329;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-2605.111,671.6934;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4104;-2867.56,793.9585;Float;False;Property;_ShadowPower;Shadow Power;27;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;3332;-1539.253,142.9249;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;4423;-1244.75,1514.915;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1E-05;False;2;FLOAT;1.99999;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3592;-4269.776,-3001.773;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4363;-3166.896,1283.54;Float;False;Property;_ShadowPower2;Shadow Power 2;32;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;571;2177.812,311.4184;Inherit;False;1410.604;490.6661;;15;3333;1998;627;1999;351;1425;3335;3336;1424;349;3352;3353;3499;3506;4144;VRChat Friends-Only;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4364;-2904.447,1161.274;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-1337.035,121.727;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4103;-2463.461,768.8585;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;3586;-4477.486,-3124.5;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;3588;-4143.97,-3000.283;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;4422;-990.4501,1544.215;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4366;-2762.796,1258.44;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4365;-3157.073,1371.866;Half;False;Property;_ShadowColour2;Shadow Colour 2;29;0;Create;True;0;0;0;False;0;False;0.9,0.9,0.9,1;0.82,0.82,0.82,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;642;-1102.673,1726.919;Float;False;Property;_SoftPower;Soft Power;62;0;Create;True;0;0;0;False;0;False;0.75;0.75;0.5;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;349;2184.863,609.2041;Inherit;True;Property;_FriendsOnlyRT;> FriendsOnly RenderTexture;154;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;82b3c1c318ad4cf47a66ffc8a2859a78;True;0;False;black;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;641;-1094.941,1462.783;Float;False;Property;_SoftScale;Soft Scale;63;0;Create;True;0;0;0;False;0;False;1;1;0.5;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;4370;-2801.18,1377.535;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1424;2471.822,636.8231;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1008;-2819.737,881.2854;Float;False;Property;_ShadowColour;Shadow Colour;24;0;Create;True;0;0;0;False;1;Space(5);False;0.7098039,0.7098039,0.7098039,1;0.8196079,0.8196079,0.8196079,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;662;-631.9115,1630.624;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1492;-1032.505,1384.075;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1254;-2319.839,772.6883;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3798;-4061.838,-3153.083;Half;False;Property;_OffsetSS;Offset;65;0;Create;False;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;4369;-2619.175,1262.269;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3839;-4468.499,-2672.697;Inherit;False;View Distance;-1;;1596;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,1,17,0;1;9;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3270;-1178.349,70.11365;Float;False;AllLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;3589;-4007.744,-3076.181;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4392;-2311.964,1117.203;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4371;-2367.95,1284.903;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;569;-7541.806,-3575.176;Inherit;False;2937.823;1659.745;;113;3179;3182;3174;3177;3181;2002;3101;983;560;696;824;701;695;3072;3069;3104;3085;3064;3103;2301;3068;3081;3080;3067;3075;690;2234;1920;838;691;816;3079;2294;837;817;1921;3057;3056;554;1919;561;545;2905;556;2900;555;551;553;2899;1051;1783;967;2898;1928;2236;546;2219;1909;2225;3251;3437;3438;3482;3483;3489;3491;3492;3493;3529;3520;3521;3512;3531;4148;4149;4151;4152;4150;4154;4155;4156;4159;4161;4162;4160;4163;4174;4176;4177;4178;4179;4181;4185;4187;4188;4189;4191;4192;4195;4196;4197;4198;4199;4336;4337;4340;4342;4344;4345;4346;4350;4727;4728;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;4692;-4062.385,-2865.587;Half;False;Property;_OffsetSS2;Offset 2;68;0;Create;False;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2501.845,887.9539;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;3719;-4029.944,-2723.01;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;646;-1259.644,1242.367;Half;False;Property;_ShadeColour;Shade Colour;60;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3797;-3801.712,-3034.611;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3801;-4482.361,-2557.319;Inherit;False;2118.357;333.0564;Edge Correction;14;3702;3699;3700;3698;3703;3696;3710;3705;3694;3666;3721;3715;3724;3711;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;3271;-1263.157,1058.597;Inherit;False;3270;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3282;-408.2178,1630.677;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;645;-632.8545,1454.263;Inherit;False;Standard;WorldNormal;LightDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3336;2567.442,623.3341;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3273;-1086.648,1058.568;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;811;-1057.165,1241.783;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3281;-414.863,1455.69;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4197;-7508.183,-2458.163;Inherit;False;0;4148;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4691;-3715.692,-2862.118;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3335;2273.578,574.4047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3720;-3820.601,-2721.862;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1016;-2180.615,898.3222;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3291;-264.4023,1631.329;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3703;-4464.625,-2388.149;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SaturateNode;4134;-2455.679,672.9282;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3696;-4471.545,-2460.999;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4383;-2099.337,1077.918;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4380;-1968.337,931.9177;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4694;-3588.83,-2862.236;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4696;-3583.413,-2771.463;Half;False;Property;_SSIntensity2;SubSurface Intensity 2;69;0;Create;False;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1425;2302.188,528.9548;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;680;-618.7404,1037.144;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;679;-631.6565,1251.428;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1035;-411.2329,1163.722;Half;False;Property;_ShadeColorDynamic;ShadeColor Dynamic;59;1;[Enum];Create;True;0;2;FixedColour;0;LightColour;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4385;-2052.63,782.1949;Half;False;Property;_StepTwo;Use Second Step;28;1;[ToggleUI];Create;False;1;;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;3739;-4486.185,-3454.854;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;4125;-2312.328,663.9188;Float;False;FinalDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3290;-116.0057,1417.329;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3698;-4256.221,-2411.617;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3567;-1133.719,222.6608;Inherit;False;1140.277;405.8864;Light Saturation Bias;13;3551;3566;3553;3564;3255;3558;3120;2093;3557;3253;3326;3554;3552;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WireNode;4198;-7259.183,-2362.163;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;3552;-1027.829,386.7633;Inherit;False;Float3 Min;-1;;1598;61474a8b2b91ea8409c96a71133ac9bc;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3287;17.67233,1417.496;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4199;-7404.183,-2350.163;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TransformDirectionNode;3737;-4253.433,-3461.156;Inherit;False;Object;World;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3710;-3826.025,-2518.777;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3611;-3764.714,-3110.656;Half;False;Property;_SSIntensity;SubSurface Intensity;66;0;Create;False;0;0;0;False;0;False;5;8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4126;-3672.492,-3292.874;Inherit;False;4125;FinalDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4695;-3464.995,-2861.688;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3502;-182.6468,1165.368;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3717;-3603.056,-3041.525;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;351;2438.834,530.2476;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;3700;-4090.064,-2492.744;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;3733;-4490.034,-3311.874;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;3736;-4234.441,-3271.583;Inherit;False;3735;SphereizeVar;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;4379;-1838.337,783.9177;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;3699;-4041.766,-2339.816;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;684;-71.85945,1538.038;Half;False;Property;_ShadeLevel;Shade Level;61;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4685;-3607.216,-2953.749;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3326;-1031.638,299.8147;Inherit;False;Float3 Max;-1;;1599;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3554;-831.9614,386.1028;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;4148;-7383.462,-2334.548;Inherit;True;Property;_Glossiness;Roughness Map (R,A);95;0;Create;False;1;;0;0;False;0;False;-1;None;None;True;0;False;black;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;1470;-2370.866,382.0723;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-1857.902,677.5862;Float;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;669;213.2497,1453.005;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.618;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3283;-16.32754,1266.496;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;3740;-3996.737,-3452.56;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;627;2651.175,516.637;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1999;2582.737,445.6081;Half;False;Property;_InvertFriendsOnly;Invert Friends Only;155;2;[Header];[ToggleUI];Create;True;1;enable without cam for always friendsonlytex;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4133;-3509.452,-3288.246;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3608;-3473.221,-3042.978;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-2422.695,452.5153;Float;False;Property;_ShadowDarkness;Shadow Darkness;33;0;Create;True;0;0;0;False;1;Space(5);False;0.22;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3711;-3682.025,-2518.777;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4686;-3291.874,-2956.379;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4140;-3707.198,-3223.109;Inherit;False;4139;OffsetDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3685;-4485.957,-3537.52;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;3702;-3691.893,-2438.72;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3253;-943.6758,534.3596;Half;False;Property;_LightSatTotal;Light Saturation Max;19;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3557;-696.9614,386.1028;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2093;-824.1577,298.775;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3120;-936.0833,454.5085;Float;False;Property;_LightSaturationLimiter;Light Saturation Limiter;18;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3818;-3091.722,-1669.933;Inherit;False;1836.64;1158.999;;24;3431;3430;1262;2993;19;812;813;3504;18;4165;3348;3475;3338;4166;3466;3340;4076;2984;4164;3345;2982;4078;3343;4167;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;3285;328.6724,1254.496;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3506;2868.115,456.9816;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4149;-7080.752,-2301.085;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;954;32.12944,1108.552;Half;False;Constant;_Shade_Null;Shade_Null;65;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;2976;18.15384,1030.491;Half;False;Property;_ShadeEnable;Shade Enable;58;1;[ToggleUI];Create;True;0;2;FixedColour;0;LightColour;1;0;False;2;Space(5);Header(.  Soft Shading  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4693;-3204.234,-3108.056;Half;False;Property;_SSDouble;Use Second Step;67;1;[ToggleUI];Create;False;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3705;-3475.948,-2517.148;Inherit;False;3;3;0;FLOAT;1;False;1;FLOAT;0.3;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2336.51,308.7788;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3741;-3834.016,-3513.99;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4687;-3151.743,-2977.369;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4123;-3375.685,-3243.539;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4132;-3507.792,-3149.073;Half;False;Property;_ShadeMaskSS;Shade Mask;71;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2186.292,395.4066;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3564;-687.6791,297.944;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3255;-721.8646,539.6962;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3558;-506.6614,382.3028;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4131;-4047.582,-3212.076;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4151;-6993.713,-2398.772;Half;False;Property;_RoughnessInvert;Roughness Invert;97;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2982;-2897.292,-1057.195;Inherit;True;Property;_MainTex;Texture (RGB,A);5;0;Create;False;1;;0;0;False;1;Header(.  Main  .);False;None;5bfa835c2acdbf34db98593ea20f81b2;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.NegateNode;3686;-3716.46,-3511.118;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;3343;-2994.644,-1562.763;Inherit;True;Property;_MainTexFriends;FriendsOnly Texture (RGB,A);157;0;Create;False;0;0;0;False;0;False;None;30f44e6c764737143a2cade4aa3aad40;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.Compare;4688;-3015.579,-3107.605;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-1880.116,355.17;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;3694;-3321.733,-2511.334;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4078;-2887.72,-1127.688;Half;False;Property;_FriendTexSSBias;Mip Sample Bias;159;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3431;-3021.868,-1356.35;Inherit;False;0;3343;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;4129;-3202.792,-3251.073;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4150;-6939.752,-2324.085;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3333;3031.998,456.1588;Half;False;FriendsOnlyInvert;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4167;-2892.048,-869.2392;Half;False;Property;_TexSSBias;Mip Sample Bias;7;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3503;316.8816,988.7086;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3430;-2918.114,-779.3569;Inherit;False;0;2982;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;3566;-570.4897,538.5253;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;3687;-3584.372,-3514.683;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4076;-2580.782,-1191.95;Inherit;False;TextureSuperSample;-1;;1674;23a6a6e8fbe28134cac41513630794b1;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;48;SAMPLERSTATE;0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3553;-369.5294,317.9633;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1295;1235.858,-2190.196;Inherit;False;2185.261;746.0269;;32;4326;4245;4240;4239;970;4241;1285;331;329;330;326;805;4259;327;4258;4256;4317;4257;450;461;4246;462;808;328;3433;4328;4329;4330;4331;4332;4679;4680;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;3681;-3377.462,-3403.167;Inherit;False;Property;_SSTransmission;Transmission;73;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3340;-1893.533,-1239.403;Half;False;Property;_FriendsOnlyTexture;Friends Only Texture;156;1;[ToggleUI];Create;True;0;0;0;False;1;Space(10);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4136;-2329.983,-2927.954;Inherit;False;4135;LightMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;30;-1140.387,638.8184;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4426;481.8724,927.6185;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3466;-2589.387,-1475.752;Half;False;Property;_FriendsSuperSample;SuperSample (expensive);158;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3338;-1890.994,-1169.257;Inherit;False;3333;FriendsOnlyInvert;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4130;-3033.792,-3252.073;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4138;-2327.329,-3014.086;Half;False;Property;_UseLightMaskSS;Use Light Mask;72;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;4152;-6777.713,-2375.322;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;3743;-2878.572,-3102.575;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1E-05;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3345;-2622.792,-1392.613;Inherit;True;Property;_TextureSample4;Texture Sample 4;101;0;Create;True;0;0;0;False;0;False;3343;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2984;-2587.909,-935.3246;Inherit;True;Property;_TextureSample7;Texture Sample 7;101;0;Create;True;0;0;0;False;0;False;2982;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;4166;-2556.025,-750.4381;Inherit;False;TextureSuperSample;-1;;1675;23a6a6e8fbe28134cac41513630794b1;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;_Sampler14166;False;48;SAMPLERSTATE;0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.SaturateNode;3666;-3170.875,-2519.892;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4164;-2577.465,-1010.837;Half;False;Property;_SuperSample;SuperSample (expensive);6;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3551;-186.5141,321.9888;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;4165;-2148.48,-908.1724;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;4187;-6641.218,-2262.478;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3475;-2171.438,-1270.381;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1500;333.6703,648.8381;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3433;1245.484,-2114.45;Inherit;False;0;328;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;4137;-2103.069,-3003.39;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;3721;-2964.073,-2519.848;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.075;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3682;-3089.708,-3480.776;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3348;-1627.803,-1216.012;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4127;-2767.693,-3124.074;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3683;-2748.941,-3216.57;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4185;-6965.218,-2234.478;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4156;-7295.26,-2145.633;Half;False;Property;_RoughnessPower;Roughness Power;96;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4689;-1981.827,-3021.341;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3715;-2733.831,-2517.853;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2289;455.516,643.5714;Float;False;LightShaded;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3504;-1855.441,-999.0197;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;18;-1931.582,-688.5779;Half;False;Property;_Color;> Color;8;1;[HDR];Create;True;0;0;0;False;1;Space(5);False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;3657;-2621.575,-3118.062;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;328;1511.872,-2136.573;Inherit;True;Property;_Emission;Emission Map (RGB,A);38;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;1777;68.71701,152.1802;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4690;-2470.41,-3069.312;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-1640.978,-895.97;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3724;-2497.494,-2525.215;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-1687.044,-688.024;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3684;-2589.941,-3216.57;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;1795.846,-2136.406;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-7577.759,185.6187;Float;False;Property;_NormalPowerSpecular;Normal Specular;52;0;Create;False;0;0;0;False;0;False;0.5;3;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3610;-2709.582,-3294.586;Half;False;Property;_SSBrightness;SubSurface Brightness;70;0;Create;False;0;0;0;False;1;Space(5);False;2;7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;703.9747,626.15;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4154;-6949.433,-2212.859;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3605;-2533.665,-3378.64;Half;False;Property;_UseSubSurface;Use SubSurface/Deflected Light;64;1;[ToggleUI];Create;False;0;2;Surface;0;Object2World;1;0;False;2;Space(5);Header(. SubSurface Light .);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4178;-6794.087,-2451.231;Half;False;Property;_Roughness;Use Roughness;94;1;[ToggleUI];Create;False;1;. Roughness . Glossiness;0;0;False;2;Space(5);Header(. Roughness . Glossiness);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1435.95,-891.937;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;848.3743,620.0181;Float;False;LightColour;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RGBToHSVNode;4326;2023.61,-2051.765;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;4329;2005.556,-2152.258;Inherit;False;Property;_EmissionHue;Hue;41;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3451;-7254.936,169.4958;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4195;-6776.523,-2139.619;Half;False;Constant;_Rough_Null;Rough_Null;128;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1347;-973.6296,-417.7522;Inherit;False;1534.475;525.8724;hue & saturation;12;585;1330;581;2917;2911;2908;2918;325;2910;3241;3244;3249;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SaturateNode;4155;-6771.513,-2211.844;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3619;-2431.116,-3265.125;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2910;-803.9288,-364.1082;Float;False;Property;_Hue;Hue;9;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;602;-6580,492.511;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;4188;-6553.743,-2427.149;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;4181;-6572.34,-2343.341;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;2909;-716.3676,-628.6263;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;4239;1853.553,-1872.483;Half;False;Property;_ShadedColour;Shaded Colour;44;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;970;2095.281,-1699.713;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4330;2287.798,-2144.329;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3604;-2207.074,-3334.885;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3603;-2044.843,-3342.473;Float;False;SubSurface;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4189;-6292.464,-2275.388;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-929.3052,-37.33464;Half;False;Property;_ShadowSaturation;Shadow Saturation;34;0;Create;True;0;0;0;False;0;False;0.85;0.9;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;325;-951.03,-274.2717;Half;False;Property;_Saturation;Saturation;10;0;Create;True;0;0;0;False;0;False;1;1.15;-2;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1234;-6365.733,514.0275;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;4240;2058.553,-1873.483;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.HSVToRGBNode;4328;2283.926,-2004.25;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;2911;-434.4628,-331.2577;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4241;2404.553,-1797.483;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1330;-894.7972,-124.3827;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2225;-7478.632,-3545.408;Half;False;Property;_StereoFixSpec;Stereo Converge (flatten);80;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3607;1001.601,332.3544;Inherit;False;3603;SubSurface;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3244;-599.8806,-120.5177;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-7471.632,-3465.408;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;2547.781,-2013.615;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;3799;1054.92,404.4882;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4245;2549.939,-1921.656;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;3055;-6177.866,515.8373;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2918;-634.3347,-223.8553;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3512;-7489.946,-3320.448;Inherit;False;VR_Center_Eye;-1;;1676;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.OneMinusNode;3249;-604.4844,-31.81404;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4332;2516.952,-2058.379;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.HSVToRGBNode;2908;-205.8781,-322.6284;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;4179;-6166.852,-2280.104;Float;False;RoughnessSpec;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4192;-7367.232,-2631.412;Inherit;False;4179;RoughnessSpec;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3569;904.3232,217.3129;Half;False;Property;_DisableLight;Unlit (warning - disables all light);21;1;[ToggleUI];Create;False;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3529;-7042.762,-3575.041;Inherit;False;199;135;blinn-phong;1;2237;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-6023.241,508.9706;Float;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;2917;101.1179,-185.2206;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3241;-342.8801,-70.51768;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3493;-7212.91,-3541.59;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;461;2568.326,-2143.493;Inherit;False;Property;_ShadedEmission;Shaded Emission;43;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4246;2695.34,-2012.656;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;393;-249.2973,-1286.792;Inherit;False;1847.51;780.355;;29;1537;1284;1281;388;390;372;383;370;1291;382;384;1290;379;376;360;2299;2300;3505;368;369;1536;1533;1530;1534;3773;3940;4682;4681;4683;Rim/Outline;1,0.141,0.141,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3617;1211.368,346.4321;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4331;2761.177,-2067.101;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2219;-7496.632,-3226.408;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3643;1351.192,347.2688;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-7119.969,-3317.847;Half;False;Property;_SpecularSize;Specular Size;76;0;Create;True;0;0;0;False;0;False;1;2.5;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4176;-7144.769,-2624.625;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3088;-6983.516,-234.9572;Float;False;Property;_NormalPowerMatCap;Normal MatCap;53;0;Create;False;0;0;0;False;0;False;0.5;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;581;384.9778,-6.735202;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1537;-216.4528,-985.8127;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;3576;-7014.984,-109.1849;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2898;-7509.509,-2897.893;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3648;-6848.766,-31.11045;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;967;-7509.509,-2737.895;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3574;1194.182,218.3409;Inherit;False;isUnlit;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1928;-7510.96,-2816.076;Half;False;Property;_StereoFixSpecCap;Stereo Converge (flatten);83;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;450;2850.573,-2038.597;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1530;-234.8218,-1243.55;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2237;-7009.632,-3533.408;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1534;-233.7685,-1158.188;Float;False;Property;_Scale1;Rim Normal Power;131;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3462;-6971.468,-160.8024;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3568;1490.085,247.9405;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2236;-6841.148,-3341.835;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4174;-6981.733,-2622.775;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-6247.876,-3274.813;Half;False;Property;_SpecularOpacity;Specular Opacity;75;0;Create;True;0;0;0;False;2;Space(5);Header(.  Specular  .);False;1;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3520;-7214.044,-2758.293;Inherit;False;VR MatCap;-1;;1704;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3087;-6672.956,-170.1118;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-6668.923,-3328.595;Half;False;Property;_SpecularStrength;Specular Strength;77;0;Create;True;0;0;0;False;0;False;0;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3647;-6556.766,-63.11047;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1533;-213.9822,-1078.708;Half;False;Property;_RimNormal;Rim Normal;130;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-6915.463,-3417.081;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3521;-7217.508,-2853.893;Inherit;False;Matcap (legacy);-1;;1702;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;4257;2978.525,-2142.362;Half;False;Property;_ShadedOnly;Shaded Only;45;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-6847.632,-3536.408;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3074;1086.244,126.0905;Float;False;MaintexRGB;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1536;89.8206,-1219.545;Inherit;False;3;0;FLOAT3;0.5,0.5,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2905;-7118.643,-2926.614;Half;False;Property;_Legacy2;Legacy;90;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4317;3025.649,-1980.989;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4160;-6686.28,-3250.318;Inherit;False;4179;RoughnessSpec;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;551;-6691.569,-3538.294;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3505;51.23543,-1073.101;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;369;28.54083,-908.2149;Float;False;Property;_Scale;Rim Scale;127;0;Create;False;0;0;0;False;0;False;0;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;4256;3183.226,-2112.462;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;3056;-6106.751,-3371.478;Inherit;False;True;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2899;-7508.794,-3095.229;Inherit;True;Property;_SpecularMatcap;Specular Matcap (RGB);82;0;Create;False;0;0;0;False;0;False;None;1bcd688c8a1424d4ab6cf87c8274c71d;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.PowerNode;4196;-6825.309,-2621.639;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4163;-6436.28,-3335.318;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3491;-6869.213,-2872.933;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ExpOpNode;553;-6652.114,-3425.973;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3077;1654.051,179.084;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;368;42.77901,-816.6483;Float;False;Property;_Power;Rim Power;126;0;Create;False;0;0;0;False;0;False;0;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3086;-6457.389,-175.3638;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2900;-6708.11,-2899.939;Inherit;True;Property;_TextureSample3;Texture Sample 3;90;0;Create;True;0;0;0;False;0;False;2899;None;None;True;0;False;white;Auto;False;Instance;-1;MipLevel;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;4679;1793.507,-2044.954;Inherit;False;EmissionMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4258;3328.326,-1955.763;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;545;-6548.511,-3536.844;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;376;258.5829,-1246.025;Float;False;Property;_RimOutlineColour;Rim/Outline Colour;123;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.6544117,0.3560711,0.448663,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;556;-6313.465,-3430.724;Inherit;False;True;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;360;235.6319,-1073.383;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3090;-6306.413,-174.117;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;3796;1890.35,178.912;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.0001,0.0001,0.0001;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3057;-5964.46,-3377.478;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-6645.196,-2707.921;Half;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;86;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2299;264.225,-903.2711;Float;False;Property;_Min;Rim Min;128;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2300;291.2249,-822.2711;Float;False;Property;_Max;Rim Max;129;0;Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;2436.667,-1634.771;Half;False;Property;_EmissionColor;> Colour;39;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;384;341.9415,-662.4603;Half;False;Property;_Amount;Rim Opacity;125;0;Create;False;0;0;0;False;0;False;0;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;2021.824,174.6748;Float;False;PostDesaturation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;379;459.2831,-1073.074;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-6249.635,-3527.578;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1921;-6374.59,-2796.08;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4259;2839.525,-1708.762;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;326;2631.619,-1543.938;Float;False;Property;_EmissionIntensity;Emission Intensity;42;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3940;501.0678,-1246.686;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;817;-6410.578,-2900.552;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4162;-5844.28,-3393.318;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4743;275.8679,-738.7574;Inherit;False;Fresnel Edge Pixel Fix;-1;;2031;e37ec5be3c94a1b4e99e2c04f776c418;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;3091;-6120.263,-171.6671;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4680;2627.507,-1701.954;Inherit;False;4679;EmissionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;805;2637.223,-1633.075;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;837;-6520.898,-3140.555;Half;False;Property;_SpecMatCapColor;SpecMatCap Colour;87;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,0.6114286,0.52,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3773;608.8083,-764.6856;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;645.6138,-664.4472;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3089;-5950.61,-175.7171;Float;False;NormalMatCap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4161;-5993.28,-3409.318;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;330;2857.451,-1532.286;Half;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;2294;-6122.713,-3500.938;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.0001;False;2;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-6216.27,-2897.548;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4727;-6210.98,-2804.733;Half;False;Property;_SpecMatcapPower;SpecMatcap Power;85;0;Create;True;0;0;0;False;0;False;1;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;735.8066,-1096.133;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4177;-6300.879,-2370.646;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;2870.176,-1671.845;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;437;892.2847,1064.665;Inherit;False;2518.223;840.2;Comment;35;3264;3266;3109;1274;405;414;807;1278;2180;1279;406;1516;1517;407;408;2920;1518;810;2919;2175;2166;2210;2181;2207;2208;2209;963;1930;2873;3268;3528;3524;3523;4087;4088;Matcap > Alpha Supported;0.8221117,0.184,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;383;737.9038,-986.7241;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;838;-6290.283,-3135.882;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;331;3051.07,-1630.883;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3179;-6236.418,-2503.824;Half;False;Property;_ProbeSmoothness;Probe Smoothness;99;0;Create;True;0;0;0;False;0;False;0.75;0.94;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1930;915.5886,1496.31;Half;False;Property;_StereoFix;Stereo Converge (flatten);135;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;816;-5963.817,-3508.593;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2873;941.0436,1378.15;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4728;-5983.55,-2896.579;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2209;1116.906,1750.81;Float;False;Property;_MatcapSpin;MatcapSpin;139;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-6222.227,-3030.731;Half;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;84;0;Create;True;0;0;0;False;0;False;1;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3182;-5851.155,-2438.359;Half;False;Property;_ReflectionOpacity;Reflection Opacity;100;0;Create;True;0;0;0;False;0;False;0.5;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3079;-5770.004,-3302.926;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;370;897.4287,-818.2839;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1291;738.1032,-1226.505;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4191;-6143.389,-2428.632;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;963;943.4739,1593.267;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4681;1066.112,-630.5405;Inherit;False;4679;EmissionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3177;-6076.934,-2587.656;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3524;1184.139,1381.841;Inherit;False;Matcap (legacy);-1;;2036;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;4682;1045.983,-701.6169;Half;False;Property;_MaskFresnel;Emission Alpha Mask;132;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2234;-5827.37,-3507.614;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1281;1330.427,-1088.367;Half;False;Property;_RimMode;Rim Mode;124;1;[Enum];Create;True;0;3;Blend_Lerp;0;Multiply;1;AddSubtract;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;3205.339,-1635.897;Float;False;Emission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4159;-6006.383,-2493.627;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2208;1316.732,1714.177;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3523;1191.654,1597.406;Inherit;False;VR MatCap;-1;;2038;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;3080;-5583.325,-3304.143;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;3067;-5501.975,-3528.861;Float;False;Property;_SpecMatCapColor1;Specular Colour;78;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,0.6117647,0.5215687,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4350;-5613.891,-2458.989;Inherit;False;2;2;0;FLOAT;0.5;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2002;-5941.028,-3189.552;Half;False;Property;_UseSpecularMatCap;Use Specular MatCap;81;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(. Specular Overlay);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3075;-5573.755,-3230.741;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;390;1129.204,-949.8493;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-5823.659,-3036.289;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;372;1127.13,-1124.279;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;388;1131.605,-824.6456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IndirectSpecularLight;3174;-5782.41,-2583.183;Inherit;False;World;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3081;-5359.825,-3294.344;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3492;-5656.999,-3106.317;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;2207;1502.244,1596.886;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;3103;-5789.693,-2818.513;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4233;1884.343,-1228.883;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2166;1492.586,1303.037;Half;False;Property;_Legacy;Legacy;141;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2301;-5496.261,-3369.618;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4336;-5761.566,-2660.055;Float;False;Property;_ReflectionIntensity;Reflection Intensity;101;0;Create;True;0;0;0;False;0;False;0.5;0.333333;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1284;1334.598,-1008.555;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;4683;1357.661,-701.0093;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;2210;1437.392,1383.942;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;3068;-5293.182,-3528.692;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LuminanceNode;4320;1894.664,-1150.978;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3528;1659.882,1345.644;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;1602.801,-772.2392;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4684;1525.918,-887.7245;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2181;952.0762,1125.57;Inherit;True;Property;_Matcap;Matcap (RGB,A);134;0;Create;False;0;0;0;False;0;False;None;f5303b4da8057574c84c7322a19702b7;False;black;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;4387;1723.975,-1047.542;Half;False;Property;_FullBright;FullBright;40;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4337;-5471.419,-2626.159;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1518;2606.495,1400.255;Half;False;Property;_MatcapSaturation;Matcap Saturation;138;0;Create;True;0;0;0;False;0;False;1;0.25;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3064;-5247.421,-3393.819;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3101;-5521.252,-2912.936;Half;False;Property;_SpecMatCapMode;SpecMatCap Mode;88;1;[Enum];Create;True;0;2;Additive;0;Multiplied;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3104;-5580.218,-2836.568;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3085;-5184.388,-3278.448;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1514;1679.954,-914.5024;Half;False;Property;_UseRim;Use Rim;122;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(.  Rim Fresnel  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3489;-5278.148,-2908.278;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3069;-5038.929,-3323.797;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;20,20,20;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2175;1835.501,1240.226;Inherit;True;Property;_TextureSample0;Texture Sample 0;90;0;Create;True;0;0;0;False;0;False;2181;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;1517;2871.899,1406.693;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3181;-5339.494,-2682.81;Half;False;Property;_UseReflection;Use Reflection;98;1;[ToggleUI];Create;False;0;0;0;False;2;Space(5);Header(. Reflection Probe);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;2919;2144.814,1376.165;Half;False;Property;_MatCapColor;MatCap Colour;140;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,0.3333333,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;4386;1911.42,-1047.829;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;3531;-5315.474,-2603.798;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0.001,0.001,0.001;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;824;-5340.504,-2981.181;Half;False;Property;_SpecMatcapOpacity;SpecMatcap Opacity;89;0;Create;False;0;0;0;False;0;False;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3072;-5096.495,-3434.993;Half;False;Property;_SpecMode;Specular Mode;79;1;[Enum];Create;False;0;2;Additive;0;Multiplied;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3507;1892.87,-888.715;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3483;-5110.55,-2677.417;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2920;2370.102,1376.667;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;408;2253.908,1246.997;Float;False;Property;_MatcapIntensity;Matcap Intensity;137;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3109;2462.534,1643.783;Inherit;True;Property;_MatCapMask;MatCap Mask (R,A);142;1;[SingleLineTexture];Create;False;0;0;0;False;1;Space(5);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;4340;-5081.188,-2927.966;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3482;-4875.243,-3438.897;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;810;2211.938,1128.838;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4088;2997.216,1382.797;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4234;2125.458,-889.7113;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;2493.767,1227.171;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3438;-4682.117,-2869.346;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;-4945.507,-2704.74;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1292;2273.109,-894.487;Float;False;PostRimLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3264;2591.987,1833.009;Half;False;Property;_MatcapMaskLevel1;Mask Level;143;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3266;2755.871,1673.178;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;695;-5708.583,-2131.062;Inherit;True;Property;_SpecularMask;Specular Mask (R,A);91;1;[SingleLineTexture];Create;False;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;870;-7520.95,-4176.61;Inherit;False;904.2734;277.1521;;5;3582;2003;971;3473;3943;Sparkle/Shimmer Effect;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;4346;-5614.545,-2213.089;Half;False;Property;_SpecularLevel;Specular Level;93;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4087;2624.869,1331.051;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4342;-5191.19,-2210.202;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3943;-7502.105,-3990.593;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2180;2141.381,1542.556;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3582;-7502.963,-4062.134;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2993;-1647.175,-1049.329;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3268;2913.392,1649.218;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2264;1605.616,-686.7376;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4344;-5397.813,-2006.304;Half;False;Property;_SpecMaskPower;SpecMask Power;92;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;-5394.554,-2125.072;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;406;2732.131,1572.698;Half;False;Property;_MatcapOpacity;Matcap Opacity;136;0;Create;True;0;0;0;False;0;False;5;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1516;2651.149,1257.198;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3437;-5161.487,-2198.393;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1279;2457.407,1118.502;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;4701;-7264.603,-4038.121;Inherit;False;Aria Sparkles Include;103;;2040;fe78986b6250d1d46955dfaed2c4e629;0;2;97;FLOAT3;0,0,0;False;156;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3137;2485.022,-235.2012;Inherit;False;832.0293;300.472;MirrorSystem;6;3159;3142;3140;3429;3478;3498;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3251;-5142.38,-2165.528;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2003;-7284.079,-4123.588;Half;False;Property;_UseSparkleShimmer;Use Sparkle/Shimmer;102;1;[ToggleUI];Create;True;0;0;0;False;3;Space(5);Header(.  Sparkles  .);;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1998;2844.131,369.513;Half;False;Property;_FriendsOnly;Friends Only ON/OFF;153;1;[ToggleUI];Create;False;0;0;0;False;2;Space(20);Header(VRC Friends Only);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;-1451.09,-1049.236;Float;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4345;-5167.512,-2079.105;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1278;2741.659,1099.732;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;2846.342,1207.257;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;807;3067.739,1475.301;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;2291;1788.852,-681.9444;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3140;2514.843,-144.3769;Half;False;Property;_IsInMirror;In Mirror;161;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;560;-4949.456,-2167.507;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3473;-7028.07,-4120.186;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;334;2732.537,-414.5922;Float;False;Property;_Alpha;Alpha;11;0;Create;True;0;0;0;False;1;Space(5);False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;2829.321,-339.5449;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;405;3006.8,1149.914;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2287;1967.472,-687.7989;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4207;1525.46,-295.8469;Half;False;Property;_ParallaxType;Parallax Type;145;1;[Enum];Create;True;0;2;Normal;0;Planar;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3353;3076.334,369.1404;Half;False;FriendsOnlyToggle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3352;3265.358,462.7127;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3499;3186.839,554.0785;Half;False;Constant;_FriendsOnly_Null;FriendsOnly_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3142;2512.518,-62.54065;Half;False;Property;_IsNotMirror;Not Mirror;162;1;[IntRange];Create;False;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;3041.638,-421.8068;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3498;2926.394,-8.762839;Half;False;Constant;_Camera_Null;Camera_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;3045.575,-312.6735;Float;False;Property;_AlphaCutoff;Alpha Cutoff;12;0;Create;False;0;0;0;True;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3429;2793.888,-108.2387;Inherit;False;VRCMirrorToggle;-1;;2049;906fee1dc8310a745a0658d5f2fa3fb4;0;2;5;INT;1;False;6;INT;1;False;1;INT;7
Node;AmplifyShaderEditor.ConditionalIfNode;4144;3428.671,421.2903;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4116;2149.498,-420.4897;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;971;-6846.393,-4119.851;Float;False;SparkleOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3159;2905.996,-187.0988;Half;False;Property;_MirrorSystem;Use Mirror System;160;1;[ToggleUI];Create;False;0;0;0;False;2;Space(10);Header(Mirror);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4109;1791.498,-365.4897;Half;False;Property;_UseParallax;Use Parallax;144;0;Create;True;0;0;0;False;3;Toggle(_);Space(10);Header(.  Parallax  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;-4803.242,-2172.907;Float;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1346;2859.333,-1342.923;Inherit;False;670.9946;746.3742;custom properties;13;1345;1335;1344;1342;1431;1340;1339;1337;1432;1343;1338;1341;1469;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1274;3204.849,1145.099;Float;False;PostMatcap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;4396;1734.248,-291.7196;Inherit;False;Aria Parallax Include;146;;2048;972a5d25f3151a4479be2dcc9b9e75fa;2,55,0,56,0;1;60;INT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2163;2289.118,-968.1033;Inherit;False;1274;PostMatcap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3478;3139.753,-155.9204;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;INT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1021;2397.924,-1042.542;Half;False;Property;_UseMatcap;Use Matcap;133;1;[ToggleUI];Create;True;0;0;0;False;2;Space(10);Header(.  MatCap  .);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4117;2214.498,-410.4897;Inherit;False;2;2;0;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0.03,0.03,0.03;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1702;2186.417,-491.9396;Inherit;False;971;SparkleOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3956;2265.263,-587.0474;Inherit;False;2;2;0;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4120;3227.466,-339.5276;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;4110;1978.498,-360.4897;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4666;3486.72,-386.6686;Inherit;False;Property;_A2CSampleBias;A2C Sample Bias;14;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;1955.717,-597.9395;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1469;2892.559,-694.9409;Half;False;Property;_AlphaToCoverage;AlphaToCoverage (antialiased override);13;1;[ToggleUI];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3252;2194.56,-706.762;Inherit;False;2;2;0;FLOAT3;0.05,0.05,0.05;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4141;3606.088,307.2644;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4726;3549.489,-503.7678;Inherit;False;Custom A2C;-1;;2050;445f8ff28d1a9f44092743e0eb84a83d;0;3;19;FLOAT;1;False;3;FLOAT;1;False;16;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3477;2611.016,-996.5475;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4084;2354.149,-387.397;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3144;3390.542,-179.4297;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2284;2332.472,-683.7989;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3955;2415.263,-542.0474;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2807.245,-579.6193;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClipNode;1430;3841.154,-504.6726;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.005;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4121;3618.063,-1066.698;Half;False;Property;_VRCFallbackCutout;VRC Fallback Cutout;3;0;Create;True;0;0;0;True;1;Toggle(_ALPHATEST_ON);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1344;2882.237,-914.3182;Half;False;Property;_ZTestMode;ZTestMode (LEqual);164;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;2882.308,-1002.382;Half;False;Property;_ZWriteMode;ZWrite (write to depth buffer);163;1;[ToggleUI];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;2882.479,-1280.823;Half;False;Property;_StencilRef;Stencil ID;165;0;Create;False;0;0;0;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1335;3215.875,-918.9951;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3151.765,-825.441;Half;False;Property;_DstBlend;Destination Blend (Zero);173;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1343;3201.625,-1061.015;Inherit;False;Property;_StencilZFail;StencilZFail;171;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1340;3181.625,-1281.015;Inherit;False;Property;_StencilComparison;Stencil Comparison;168;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;2876.299,-1194.834;Half;False;Property;_ReadMask;ReadMask (non-zero);167;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;2875.299,-1112.257;Half;False;Property;_WriteMask;WriteMask (non-zero);166;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1341;3206.338,-1208.357;Inherit;False;Property;_StencilOp;StencilOp;169;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1342;3202.625,-1136.015;Inherit;False;Property;_StencilFail;StencilFail;170;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;3269;3610.792,-886.0767;Half;False;Property;_Cutoff;Fallback Cutoff;4;0;Create;False;0;0;0;True;2;Enum(LessVisible,0.25,Visible,0.5,MoreVisible,0.75,Invisible,2);Space(5);False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-6370.277,802.1259;Float;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1560;-3915.225,78.05922;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.005;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3098;3608.803,-1141.708;Half;False;Property;_VRCFallbackDoublesided;VRC Fallback Doublesided;2;0;Create;True;0;0;0;True;2;Header(Dont clean keywords after selecting);Toggle(TINTED_OUTLINE);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-6360.543,427.3455;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;1923;4194.73,-582.2905;Inherit;True;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;3099;3610.803,-975.708;Half;False;Property;_outline_width;_outline_width;1;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1431;2886.58,-820.4198;Half;False;Property;_SrcBlend;Source Blend (One);172;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4436;4407.33,-582.501;Float;False;True;-1;2;ASEMaterialInspector;0;12;.GenesisAria/Arias VertexLit Shader;9367a06897b8873449e3ea0a525cc048;True;Unlit;0;0;VertexLit;2;True;True;1;0;True;1431;0;True;1432;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;1469;True;True;0;True;1335;True;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;True;True;True;255;True;1337;255;True;1338;255;True;1339;7;True;1340;1;True;1341;1;True;1342;1;True;1343;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;True;1345;True;3;True;1344;True;False;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;7;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;LightMode=ForwardBase;Queue=Geometry=Queue=0;True;7;0;Legacy Shaders/Transparent/Cutout/VertexLit;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;True;;False;0
WireConnection;3458;0;3838;0
WireConnection;3458;2;3464;0
WireConnection;4354;0;3458;0
WireConnection;3495;0;3464;0
WireConnection;3495;2;4354;0
WireConnection;3495;3;4354;0
WireConnection;3495;4;3527;0
WireConnection;1878;0;3408;16
WireConnection;1878;1;3408;17
WireConnection;1878;2;3408;18
WireConnection;1878;3;3408;20
WireConnection;1551;0;1878;0
WireConnection;3459;0;3495;0
WireConnection;1886;0;3408;23
WireConnection;1886;1;3408;29
WireConnection;1886;2;3408;30
WireConnection;1886;3;3408;31
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;3059;0;4302;0
WireConnection;1890;0;1589;0
WireConnection;1891;0;1551;3
WireConnection;2014;0;1886;0
WireConnection;4360;0;4357;0
WireConnection;4203;0;4202;0
WireConnection;4203;1;3059;1
WireConnection;2148;0;2147;0
WireConnection;1879;0;2014;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;4352;0;4351;0
WireConnection;4352;1;3599;0
WireConnection;3600;0;4203;0
WireConnection;4356;0;4079;0
WireConnection;4356;1;4360;0
WireConnection;4074;4;3432;0
WireConnection;4074;1;2957;0
WireConnection;4074;28;4356;0
WireConnection;4074;49;4352;0
WireConnection;2958;0;2957;0
WireConnection;2958;1;3432;0
WireConnection;2958;5;4352;0
WireConnection;1246;0;1232;2
WireConnection;1246;1;2148;0
WireConnection;1629;0;3408;16
WireConnection;1629;1;3408;23
WireConnection;1631;0;3408;18
WireConnection;1631;1;3408;30
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;1684;0;3408;20
WireConnection;1684;1;3408;31
WireConnection;3062;0;3600;0
WireConnection;1630;0;3408;17
WireConnection;1630;1;3408;29
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;1665;0;1905;0
WireConnection;3494;0;2962;0
WireConnection;3494;3;4074;0
WireConnection;3494;4;2958;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;3061;0;3062;0
WireConnection;3061;1;428;0
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;2154;0;2153;0
WireConnection;1233;0;1247;0
WireConnection;430;1;3494;0
WireConnection;430;2;3061;0
WireConnection;3496;0;2152;0
WireConnection;3496;3;2154;0
WireConnection;3496;4;2150;0
WireConnection;2635;0;248;0
WireConnection;2635;1;3511;2
WireConnection;1908;1;1910;0
WireConnection;1908;0;1682;0
WireConnection;1876;0;633;1
WireConnection;1876;1;633;2
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;2635;0
WireConnection;1235;0;430;0
WireConnection;2017;0;3408;0
WireConnection;2140;0;2121;0
WireConnection;2140;1;1490;0
WireConnection;2140;2;2121;0
WireConnection;1406;0;1908;0
WireConnection;2159;0;3496;0
WireConnection;2215;0;1076;0
WireConnection;1383;0;2017;0
WireConnection;1383;1;2159;0
WireConnection;2034;0;2140;0
WireConnection;962;0;1235;0
WireConnection;2026;0;2034;0
WireConnection;3817;0;2215;0
WireConnection;3817;1;3415;7
WireConnection;1382;0;1383;0
WireConnection;3314;0;1408;0
WireConnection;2082;0;2081;2
WireConnection;3598;0;4203;0
WireConnection;3598;1;3597;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;1486;0;1484;1
WireConnection;1486;2;2082;0
WireConnection;3803;0;3314;0
WireConnection;3803;2;2082;0
WireConnection;2035;1;2026;0
WireConnection;5;0;1165;0
WireConnection;5;1;3817;0
WireConnection;4204;0;3416;0
WireConnection;1389;0;1381;0
WireConnection;4394;0;4393;0
WireConnection;1296;0;5;0
WireConnection;3593;1;3494;0
WireConnection;3593;2;3598;0
WireConnection;1489;0;1486;0
WireConnection;1489;1;3803;0
WireConnection;1489;2;4204;0
WireConnection;2025;0;2035;0
WireConnection;3646;0;3645;0
WireConnection;1491;0;1382;0
WireConnection;2033;0;2025;0
WireConnection;3735;0;3650;0
WireConnection;3594;0;3593;0
WireConnection;2867;0;1489;0
WireConnection;2867;1;2870;0
WireConnection;2867;2;4394;0
WireConnection;3644;0;3735;0
WireConnection;3644;3;3646;0
WireConnection;3644;4;3594;0
WireConnection;4200;0;2867;0
WireConnection;1994;0;1480;0
WireConnection;1994;1;1297;0
WireConnection;1994;2;2033;0
WireConnection;3595;0;3644;0
WireConnection;2213;0;2217;0
WireConnection;2213;1;2216;0
WireConnection;2213;2;2033;0
WireConnection;3262;1;3059;4
WireConnection;3262;2;3263;0
WireConnection;3497;0;1058;0
WireConnection;3497;3;1994;0
WireConnection;3497;4;3500;0
WireConnection;4139;0;1107;0
WireConnection;3331;0;4200;0
WireConnection;3331;1;1916;0
WireConnection;3325;7;3331;0
WireConnection;3596;0;3595;0
WireConnection;2218;0;2213;0
WireConnection;4135;0;3262;0
WireConnection;1106;0;3497;0
WireConnection;1106;1;4139;0
WireConnection;4377;0;1106;0
WireConnection;4377;1;4384;0
WireConnection;3301;0;1915;0
WireConnection;3301;2;3325;0
WireConnection;4361;0;1106;0
WireConnection;4424;0;1123;0
WireConnection;4424;1;4430;0
WireConnection;3289;0;1123;0
WireConnection;1118;0;4105;0
WireConnection;1118;1;4361;0
WireConnection;1118;2;4170;0
WireConnection;3332;0;3301;0
WireConnection;3332;1;3331;0
WireConnection;4423;0;4424;0
WireConnection;3592;0;3587;0
WireConnection;3592;1;3601;0
WireConnection;4364;0;4373;0
WireConnection;4364;1;4377;0
WireConnection;4364;2;4374;0
WireConnection;1914;0;3331;0
WireConnection;1914;2;3332;0
WireConnection;4103;0;1118;0
WireConnection;4103;1;4104;0
WireConnection;3588;0;3592;0
WireConnection;4422;0;4423;0
WireConnection;4422;2;1123;0
WireConnection;4422;4;3289;0
WireConnection;4366;0;4364;0
WireConnection;4366;1;4363;0
WireConnection;4370;0;4365;0
WireConnection;1424;0;349;1
WireConnection;1424;1;349;2
WireConnection;1424;2;349;3
WireConnection;662;0;4422;0
WireConnection;662;2;641;0
WireConnection;662;3;642;0
WireConnection;1254;0;4103;0
WireConnection;4369;0;4366;0
WireConnection;3270;0;1914;0
WireConnection;3589;0;3586;0
WireConnection;3589;1;3588;0
WireConnection;4392;0;1254;0
WireConnection;4371;0;4370;0
WireConnection;4371;2;4369;0
WireConnection;1010;0;1008;0
WireConnection;3719;0;3839;0
WireConnection;3797;0;3589;0
WireConnection;3797;1;3798;0
WireConnection;3282;0;662;0
WireConnection;645;0;4422;0
WireConnection;645;4;1492;0
WireConnection;645;2;641;0
WireConnection;645;3;642;0
WireConnection;3336;0;1424;0
WireConnection;3273;0;3271;0
WireConnection;811;0;646;0
WireConnection;3281;0;645;0
WireConnection;4691;0;3797;0
WireConnection;4691;1;4692;0
WireConnection;3335;0;3336;0
WireConnection;3720;0;3719;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;3291;0;3282;0
WireConnection;4134;0;1118;0
WireConnection;4383;1;4371;0
WireConnection;4383;2;4392;0
WireConnection;4380;0;1016;0
WireConnection;4380;1;4383;0
WireConnection;4694;0;4691;0
WireConnection;4694;1;3720;0
WireConnection;1425;0;3335;0
WireConnection;680;0;3273;0
WireConnection;679;0;811;0
WireConnection;4125;0;4134;0
WireConnection;3290;0;3281;0
WireConnection;3290;2;3291;0
WireConnection;3698;0;3696;0
WireConnection;3698;1;3703;0
WireConnection;4198;0;4197;0
WireConnection;3552;7;1914;0
WireConnection;3287;0;3290;0
WireConnection;4199;0;4198;0
WireConnection;3737;0;3739;0
WireConnection;3710;0;3839;0
WireConnection;4695;0;4694;0
WireConnection;4695;1;4696;0
WireConnection;3502;0;1035;0
WireConnection;3502;3;680;0
WireConnection;3502;4;679;0
WireConnection;3717;0;3797;0
WireConnection;3717;1;3720;0
WireConnection;351;0;1425;0
WireConnection;4379;0;4385;0
WireConnection;4379;2;4380;0
WireConnection;4379;3;1016;0
WireConnection;3699;0;3698;0
WireConnection;4685;0;3797;0
WireConnection;3326;7;1914;0
WireConnection;3554;0;3552;0
WireConnection;4148;1;4199;0
WireConnection;1470;0;1106;0
WireConnection;979;0;4379;0
WireConnection;669;1;3287;0
WireConnection;669;2;684;0
WireConnection;3283;0;3502;0
WireConnection;3740;0;3736;0
WireConnection;3740;2;3737;0
WireConnection;3740;3;3733;0
WireConnection;627;0;351;0
WireConnection;4133;0;4126;0
WireConnection;3608;0;3717;0
WireConnection;3608;1;3611;0
WireConnection;3711;0;3710;0
WireConnection;4686;1;4695;0
WireConnection;4686;2;4685;0
WireConnection;3702;0;3700;0
WireConnection;3702;1;3699;0
WireConnection;3557;0;3554;0
WireConnection;2093;0;3326;0
WireConnection;3285;0;3283;0
WireConnection;3285;2;669;0
WireConnection;3506;0;1999;0
WireConnection;3506;3;627;0
WireConnection;3506;4;351;0
WireConnection;4149;0;4148;1
WireConnection;4149;1;4148;4
WireConnection;3705;0;3711;0
WireConnection;3705;2;3702;0
WireConnection;3741;0;3685;0
WireConnection;3741;1;3740;0
WireConnection;4687;0;3608;0
WireConnection;4687;1;4686;0
WireConnection;4123;0;4133;0
WireConnection;4123;1;4140;0
WireConnection;344;0;1470;0
WireConnection;344;1;335;0
WireConnection;3564;0;2093;0
WireConnection;3255;0;3253;0
WireConnection;3558;0;3557;0
WireConnection;3558;1;3120;0
WireConnection;4131;0;3586;0
WireConnection;3686;0;3741;0
WireConnection;4688;0;4693;0
WireConnection;4688;2;4687;0
WireConnection;4688;3;3608;0
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;3694;0;3705;0
WireConnection;4129;1;4123;0
WireConnection;4129;2;4132;0
WireConnection;4150;0;4149;0
WireConnection;3333;0;3506;0
WireConnection;3503;0;2976;0
WireConnection;3503;3;3285;0
WireConnection;3503;4;954;0
WireConnection;3566;0;3255;0
WireConnection;3687;0;3686;0
WireConnection;3687;1;4131;0
WireConnection;4076;4;3431;0
WireConnection;4076;1;3343;0
WireConnection;4076;28;4078;0
WireConnection;3553;0;3564;0
WireConnection;3553;1;3558;0
WireConnection;30;0;346;0
WireConnection;4426;0;3503;0
WireConnection;4130;0;4129;0
WireConnection;4152;0;4151;0
WireConnection;4152;2;4150;0
WireConnection;4152;3;4149;0
WireConnection;3743;0;4688;0
WireConnection;3345;0;3343;0
WireConnection;3345;1;3431;0
WireConnection;2984;0;2982;0
WireConnection;2984;1;3430;0
WireConnection;4166;4;3430;0
WireConnection;4166;1;2982;0
WireConnection;4166;28;4167;0
WireConnection;3666;0;3694;0
WireConnection;3551;0;3553;0
WireConnection;3551;1;3566;0
WireConnection;4165;0;4164;0
WireConnection;4165;3;4166;0
WireConnection;4165;4;2984;0
WireConnection;4187;0;4152;0
WireConnection;3475;0;3466;0
WireConnection;3475;3;4076;0
WireConnection;3475;4;3345;0
WireConnection;1500;0;30;0
WireConnection;1500;1;4426;0
WireConnection;4137;0;4138;0
WireConnection;4137;2;4136;0
WireConnection;3721;0;3666;0
WireConnection;3682;0;3687;0
WireConnection;3682;2;3681;0
WireConnection;3348;0;3340;0
WireConnection;3348;1;3338;0
WireConnection;4127;0;4130;0
WireConnection;4127;1;3743;0
WireConnection;3683;0;3682;0
WireConnection;4185;0;4187;0
WireConnection;4689;0;4137;0
WireConnection;3715;0;3721;0
WireConnection;2289;0;1500;0
WireConnection;3504;0;3348;0
WireConnection;3504;2;3475;0
WireConnection;3504;3;3475;0
WireConnection;3504;4;4165;0
WireConnection;3657;0;4127;0
WireConnection;328;1;3433;0
WireConnection;1777;0;1914;0
WireConnection;1777;1;3551;0
WireConnection;4690;0;4689;0
WireConnection;812;0;3504;0
WireConnection;3724;0;3715;0
WireConnection;813;0;18;0
WireConnection;3684;0;3683;0
WireConnection;3684;1;3657;0
WireConnection;808;0;328;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;2289;0
WireConnection;4154;0;4185;0
WireConnection;4154;1;4156;0
WireConnection;19;0;812;0
WireConnection;19;1;813;0
WireConnection;968;0;1922;0
WireConnection;4326;0;808;0
WireConnection;3451;0;4203;0
WireConnection;3451;1;603;0
WireConnection;4155;0;4154;0
WireConnection;3619;0;3610;0
WireConnection;3619;1;3684;0
WireConnection;3619;2;4690;0
WireConnection;3619;3;3724;0
WireConnection;602;1;3494;0
WireConnection;602;2;3451;0
WireConnection;4188;0;4178;0
WireConnection;4181;0;4178;0
WireConnection;4181;3;4155;0
WireConnection;4181;4;4195;0
WireConnection;2909;0;19;0
WireConnection;4330;0;4329;0
WireConnection;4330;1;4326;1
WireConnection;3604;0;3605;0
WireConnection;3604;3;3619;0
WireConnection;3603;0;3604;0
WireConnection;4189;0;4188;0
WireConnection;4189;1;4181;0
WireConnection;1234;0;602;0
WireConnection;4240;0;4239;0
WireConnection;4328;0;4330;0
WireConnection;4328;1;4326;2
WireConnection;4328;2;4326;3
WireConnection;2911;0;2910;0
WireConnection;2911;1;2909;1
WireConnection;4241;0;970;0
WireConnection;3244;0;1330;0
WireConnection;462;0;4328;0
WireConnection;462;1;970;0
WireConnection;3799;0;968;0
WireConnection;4245;0;4328;0
WireConnection;4245;1;4240;0
WireConnection;4245;2;4241;0
WireConnection;3055;0;1234;0
WireConnection;2918;0;325;0
WireConnection;3249;0;585;0
WireConnection;4332;0;4328;0
WireConnection;2908;0;2911;0
WireConnection;2908;1;2909;2
WireConnection;2908;2;2909;3
WireConnection;4179;0;4189;0
WireConnection;965;0;3055;0
WireConnection;2917;0;2908;0
WireConnection;2917;1;2918;0
WireConnection;3241;0;3244;0
WireConnection;3241;1;3249;0
WireConnection;3493;0;2225;0
WireConnection;3493;3;3512;2
WireConnection;3493;4;1909;0
WireConnection;4246;0;462;0
WireConnection;4246;1;4245;0
WireConnection;3617;0;3607;0
WireConnection;3617;1;3799;0
WireConnection;4331;0;4332;0
WireConnection;3643;0;3617;0
WireConnection;3643;1;968;0
WireConnection;4176;0;4192;0
WireConnection;581;0;2917;0
WireConnection;581;1;3241;0
WireConnection;3576;0;4203;0
WireConnection;3648;0;3494;0
WireConnection;3574;0;3569;0
WireConnection;450;0;4331;0
WireConnection;450;1;4246;0
WireConnection;450;2;461;0
WireConnection;2237;0;3493;0
WireConnection;2237;1;2219;0
WireConnection;3568;0;3574;0
WireConnection;3568;3;3574;0
WireConnection;3568;4;3643;0
WireConnection;2236;1;546;0
WireConnection;4174;0;4176;0
WireConnection;3520;21;967;0
WireConnection;3520;27;1928;0
WireConnection;3087;0;3088;0
WireConnection;3087;1;3462;0
WireConnection;3087;2;3576;0
WireConnection;3647;0;3648;0
WireConnection;3521;9;2898;0
WireConnection;3521;45;1928;0
WireConnection;1783;0;2237;0
WireConnection;3074;0;581;0
WireConnection;1536;0;1537;0
WireConnection;1536;1;1530;0
WireConnection;1536;2;1534;0
WireConnection;4317;0;450;0
WireConnection;4317;2;970;0
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;3505;0;1533;0
WireConnection;3505;3;1536;0
WireConnection;3505;4;1537;0
WireConnection;4256;0;4257;0
WireConnection;4256;2;4317;0
WireConnection;4256;3;450;0
WireConnection;3056;0;561;0
WireConnection;4196;0;4174;0
WireConnection;4163;0;555;0
WireConnection;4163;1;4160;0
WireConnection;3491;0;2905;0
WireConnection;3491;3;3521;0
WireConnection;3491;4;3520;0
WireConnection;553;0;2236;0
WireConnection;3077;0;3074;0
WireConnection;3077;1;3568;0
WireConnection;3086;1;3647;0
WireConnection;3086;2;3087;0
WireConnection;2900;0;2899;0
WireConnection;2900;1;3491;0
WireConnection;2900;2;4196;0
WireConnection;4679;0;328;4
WireConnection;4258;0;4256;0
WireConnection;545;0;551;0
WireConnection;545;1;553;0
WireConnection;556;1;4163;0
WireConnection;360;0;3505;0
WireConnection;360;2;369;0
WireConnection;360;3;368;0
WireConnection;3090;0;3086;0
WireConnection;3796;0;3077;0
WireConnection;3057;0;3056;0
WireConnection;1276;0;3796;0
WireConnection;379;0;360;0
WireConnection;379;1;2299;0
WireConnection;379;2;2300;0
WireConnection;554;0;545;0
WireConnection;554;1;556;0
WireConnection;1921;0;1919;0
WireConnection;4259;0;4258;0
WireConnection;3940;0;376;0
WireConnection;817;0;2900;0
WireConnection;4162;0;3057;0
WireConnection;3091;0;3090;0
WireConnection;805;0;327;0
WireConnection;3773;0;4743;0
WireConnection;3773;1;384;0
WireConnection;3089;0;3091;0
WireConnection;4161;0;4162;0
WireConnection;2294;0;554;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;382;0;3940;0
WireConnection;382;1;379;0
WireConnection;4177;0;4181;0
WireConnection;329;0;4259;0
WireConnection;329;1;4680;0
WireConnection;329;2;805;0
WireConnection;329;3;326;0
WireConnection;383;0;379;0
WireConnection;383;1;3773;0
WireConnection;838;0;837;0
WireConnection;331;0;329;0
WireConnection;331;2;330;0
WireConnection;816;1;2294;0
WireConnection;816;2;4161;0
WireConnection;4728;0;1920;0
WireConnection;4728;1;4727;0
WireConnection;370;0;382;0
WireConnection;370;1;1290;0
WireConnection;4191;0;4188;0
WireConnection;4191;1;4177;0
WireConnection;3524;9;2873;0
WireConnection;3524;45;1930;0
WireConnection;2234;0;816;0
WireConnection;2234;1;816;0
WireConnection;2234;2;816;0
WireConnection;1285;0;331;0
WireConnection;4159;0;3179;0
WireConnection;4159;1;4191;0
WireConnection;2208;0;2209;0
WireConnection;3523;21;963;0
WireConnection;3523;27;1930;0
WireConnection;3080;0;3079;0
WireConnection;4350;1;3182;0
WireConnection;390;0;1291;0
WireConnection;390;1;382;0
WireConnection;390;2;383;0
WireConnection;690;0;4728;0
WireConnection;690;1;691;0
WireConnection;690;2;838;0
WireConnection;372;0;1291;0
WireConnection;372;1;382;0
WireConnection;372;2;383;0
WireConnection;388;0;1290;0
WireConnection;388;1;370;0
WireConnection;388;2;3773;0
WireConnection;3174;0;3177;0
WireConnection;3174;1;4159;0
WireConnection;3174;2;4350;0
WireConnection;3081;0;3080;0
WireConnection;3081;1;3075;0
WireConnection;3492;0;2002;0
WireConnection;3492;3;690;0
WireConnection;2207;0;3523;0
WireConnection;2207;2;2208;0
WireConnection;2301;0;2234;0
WireConnection;1284;0;1281;0
WireConnection;1284;2;388;0
WireConnection;1284;3;390;0
WireConnection;1284;4;372;0
WireConnection;4683;0;4682;0
WireConnection;4683;2;4681;0
WireConnection;2210;0;3524;0
WireConnection;2210;2;2208;0
WireConnection;3068;0;3067;0
WireConnection;4320;0;4233;0
WireConnection;3528;0;2166;0
WireConnection;3528;3;2210;0
WireConnection;3528;4;2207;0
WireConnection;4684;0;1284;0
WireConnection;4684;1;4683;0
WireConnection;4337;0;4336;0
WireConnection;4337;1;3174;0
WireConnection;3064;0;3068;0
WireConnection;3064;1;2301;0
WireConnection;3104;0;3492;0
WireConnection;3104;1;3103;0
WireConnection;3085;0;3081;0
WireConnection;3085;1;3075;0
WireConnection;3489;0;3101;0
WireConnection;3489;3;3104;0
WireConnection;3489;4;3492;0
WireConnection;3069;0;3064;0
WireConnection;3069;1;3085;0
WireConnection;2175;0;2181;0
WireConnection;2175;1;3528;0
WireConnection;1517;0;1518;0
WireConnection;4386;0;4387;0
WireConnection;4386;2;4387;0
WireConnection;4386;3;4320;0
WireConnection;3531;0;4337;0
WireConnection;3531;3;3174;0
WireConnection;3507;0;1514;0
WireConnection;3507;3;4684;0
WireConnection;3507;4;1515;0
WireConnection;3483;0;3181;0
WireConnection;3483;3;3531;0
WireConnection;2920;0;2919;0
WireConnection;4340;1;3489;0
WireConnection;4340;2;824;0
WireConnection;3482;0;3072;0
WireConnection;3482;3;3069;0
WireConnection;3482;4;3064;0
WireConnection;810;0;2175;0
WireConnection;4088;0;1517;0
WireConnection;4234;0;3507;0
WireConnection;4234;1;4233;0
WireConnection;4234;2;4386;0
WireConnection;407;0;810;0
WireConnection;407;1;408;0
WireConnection;407;2;2920;0
WireConnection;3438;0;3482;0
WireConnection;701;0;4340;0
WireConnection;701;1;3483;0
WireConnection;1292;0;4234;0
WireConnection;3266;0;3109;1
WireConnection;3266;1;3109;4
WireConnection;4087;0;4088;0
WireConnection;4342;0;701;0
WireConnection;2180;0;2175;0
WireConnection;2993;0;3504;0
WireConnection;3268;1;3266;0
WireConnection;3268;2;3264;0
WireConnection;696;0;4346;0
WireConnection;696;1;695;1
WireConnection;696;2;695;4
WireConnection;1516;0;407;0
WireConnection;1516;1;4087;0
WireConnection;3437;0;3438;0
WireConnection;4701;97;3582;0
WireConnection;4701;156;3943;0
WireConnection;3251;0;3437;0
WireConnection;3251;1;4342;0
WireConnection;1262;0;2993;0
WireConnection;4345;0;696;0
WireConnection;4345;1;4344;0
WireConnection;414;0;1279;0
WireConnection;414;1;1516;0
WireConnection;807;0;2919;4
WireConnection;807;1;2180;0
WireConnection;807;2;406;0
WireConnection;807;3;3268;0
WireConnection;2291;0;2264;0
WireConnection;560;1;3251;0
WireConnection;560;2;4345;0
WireConnection;3473;0;2003;0
WireConnection;3473;3;4701;0
WireConnection;405;0;1278;0
WireConnection;405;1;414;0
WireConnection;405;2;807;0
WireConnection;2287;0;2291;0
WireConnection;3353;0;1998;0
WireConnection;3352;0;3333;0
WireConnection;333;0;334;0
WireConnection;333;1;1265;0
WireConnection;3429;5;3140;0
WireConnection;3429;6;3142;0
WireConnection;4144;0;3353;0
WireConnection;4144;3;3352;0
WireConnection;4144;4;3499;0
WireConnection;4116;0;2287;0
WireConnection;971;0;3473;0
WireConnection;983;0;560;0
WireConnection;1274;0;405;0
WireConnection;4396;60;4207;0
WireConnection;3478;0;3159;0
WireConnection;3478;2;3498;0
WireConnection;3478;3;3429;7
WireConnection;3478;4;3498;0
WireConnection;4117;0;4116;0
WireConnection;3956;0;2287;0
WireConnection;4120;0;333;0
WireConnection;4120;1;1433;0
WireConnection;4110;0;4109;0
WireConnection;4110;3;4396;0
WireConnection;3252;1;2287;0
WireConnection;4141;0;4144;0
WireConnection;4726;19;1469;0
WireConnection;4726;3;333;0
WireConnection;4726;16;4666;0
WireConnection;3477;0;1021;0
WireConnection;3477;3;2163;0
WireConnection;3477;4;1292;0
WireConnection;4084;0;4117;0
WireConnection;4084;1;4110;0
WireConnection;3144;0;4120;0
WireConnection;3144;1;3478;0
WireConnection;3144;2;4141;0
WireConnection;2284;0;3252;0
WireConnection;2284;1;1701;0
WireConnection;3955;0;3956;0
WireConnection;3955;2;1702;0
WireConnection;470;0;3477;0
WireConnection;470;1;2284;0
WireConnection;470;2;3955;0
WireConnection;470;3;4084;0
WireConnection;1430;0;4726;0
WireConnection;1430;1;3144;0
WireConnection;1861;0;430;0
WireConnection;1560;2;1480;0
WireConnection;1560;3;1297;0
WireConnection;1856;0;602;0
WireConnection;1923;0;470;0
WireConnection;1923;3;1430;0
WireConnection;4436;0;1923;0
ASEEND*/
//CHKSM=4E8540FC8B916A541C0C310BA95ECFBD8682E60E
