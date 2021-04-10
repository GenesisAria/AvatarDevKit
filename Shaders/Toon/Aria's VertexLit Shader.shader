// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Arias VertexLit Shader"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[HideInInspector]_outline_width("_outline_width", Float) = 0
		[Toggle(TINTED_OUTLINE)][Space(10)]_VRCFallbackDoublesided("VRC Fallback Doublesided", Float) = 0
		[Enum(Visible,0,Invisible,2)]_Cutoff("Fallback Cutoff", Float) = 0
		[Header(.  Main  .)]_MainTex("Texture (RGB,A)", 2D) = "white" {}
		[ToggleUI]_TexSuperSample("SuperSample (expensive)", Float) = 0
		_TexSSBias("SuperSample Bias", Float) = 0
		[HDR][Space(5)]_Color("> Color", Color) = (1,1,1,1)
		_Hue("Hue", Range( 0 , 1)) = 0
		_Saturation("Saturation", Range( -2 , 5)) = 1
		[ToggleUI][Space (5)]_AlphaToCoverage("AlphaToCoverage (override alpha)", Float) = 0
		_Alpha("Alpha", Range( 0 , 1)) = 1
		_AlphaCutoff("Alpha Cutoff", Float) = 0.5
		[Header(. Lighting .)]_LightMultiplier("Light Multiplier", Float) = 1.1
		_MaxLight("Max Light", Float) = 0.9
		_MinLight("Min Light", Float) = 0.05
		_LightSatLimiter("Light Saturation Limiter", Float) = 0.5
		_LightSatTotal("Light Saturation Max", Float) = 1
		[ToggleUI][Space(5)]_DisableLight("Unlit (warning - disables all light)", Float) = 0
		[ToggleUI][Space(5)][Deader(.  Shadow  .)]_UseShading("Use Shading", Float) = 1
		[Enum(Surface,0,Object2World,1)]_LightMode("Lighting Mode", Float) = 0
		_ShadowColour("Shadow Colour", Color) = (0.7098039,0.7098039,0.7098039,1)
		_OffsetDot("Offset Dot", Range( -1 , 1)) = 0
		_ShadowSharpness("Shadow Sharpness", Float) = 20
		_ShadowPower("Shadow Power", Range( 0 , 10)) = 1
		_ShadowDarkness("Shadow Darkness", Float) = 0.22
		_ShadowSaturation("Shadow Saturation", Range( -2 , 2)) = 0.85
		[SingleLineTexture][Space(5)]_LightMask("Light Mask (R)", 2D) = "white" {}
		_LightMaskLevel("Mask Level", Float) = 1
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.68
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.55
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.44
		[Space(5)][Header(.  Emission  .)]_Emission("Emission Map (RGB,A)", 2D) = "white" {}
		[HDR]_EmissionColor("Emission Colour", Color) = (0,0,0,0)
		_EmissionIntensity("Emission Intensity", Float) = 1
		_ShadedEmission("Shaded Emission", Float) = 0
		[Normal][Space(5)][Header(.  Normal  .)]_Normal("Normal (N)", 2D) = "bump" {}
		[ToggleUI]_NormSuperSample("SuperSample (expensive)", Float) = 0
		_NormSSBias("SuperSample Bias", Float) = 0
		[Space(5)]_NorDist("Normal Distance Modifier", Float) = 0
		_NormalPower("Normal Power", Range( 0 , 2)) = 0
		_NormalPowerSpecular("Normal Specular", Range( 0 , 10)) = 0.5
		_NormalPowerMatCap("Normal MatCap", Range( 0 , 5)) = 0.5
		_NormalPowerSubSurface("Normal SubSurface", Range( 0 , 2)) = 0.5
		[SingleLineTexture][Space(5)]_NormalMaskR("Normal Mask (R)", 2D) = "white" {}
		[ToggleUI][Space(5)][Header(.  Soft Shading  .)]_ShadeEnable("Shade Enable", Float) = 1
		[Enum(FixedColour,0,LightColour,1)]_ShadeColorDynamic("ShadeColor Dynamic", Float) = 1
		_ShadeColour("Shade Colour", Color) = (0,0,0,0)
		_ShadeLevel("Shade Level", Range( 0 , 1)) = 0.5
		_SoftPower("Soft Power", Range( 0.5 , 4)) = 0.75
		_SoftScale("Soft Scale", Range( 0.5 , 2)) = 1
		[ToggleUI][Space(5)][Header(. SubSurface Light .)]_UseSubSurface("Use SubSurface", Float) = 0
		_OffsetSS("Offset", Range( -1 , 1)) = 0
		_SSIntensity("SubSurface Intensity", Float) = 5
		_SSBrightness("SubSurface Brightness", Float) = 2
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
		_SpecMatcapSaturation("SpecMatcap Saturation", Float) = 1
		[HDR]_SpecMatCapColor("SpecMatCap Colour", Color) = (1,1,1,1)
		[Enum(Additive,0,Multiplied,1)]_SpecMatCapMode("SpecMatCap Mode", Float) = 0
		[ToggleUI]_Legacy2("Legacy", Float) = 0
		[Space(10)]_SpecMaskOpacity("SpecMatcap Level", Float) = 1
		[SingleLineTexture]_SpecularMask("Specular MatCap Mask (R,A)", 2D) = "white" {}
		[ToggleUI][Space(5)][Header(. Reflection Probe)]_UseReflection("Use Reflection", Float) = 0
		_ProbeSmoothness("Probe Smoothness", Float) = 0.75
		_ReflectionOpacity("Reflection Opacity", Float) = 1
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
		[HDR]_ParallaxColour("Parallax Colour", Color) = (1,1,1,1)
		_ParallaxTexture("Parallax Texture (RGB,A)", 2D) = "black" {}
		_ParallaxHeight("Parallax Height", Float) = 0.5
		_ParallaxScale("Parallax Scale", Float) = 1
		_ParallaxMask("Parallax Mask (R)", 2D) = "white" {}
		_ParallaxMaskPower("Parallax Mask Power", Float) = 1
		[ToggleUI][Space(20)][Header(VRC Friends Only)]_FriendsOnly("Friends Only ON/OFF", Float) = 0
		[SingleLineTexture]_FriendsOnlyRT("> FriendsOnly RenderTexture", 2D) = "white" {}
		[Toggle(_)]_FriendsOnly1("Invert Friends Only", Float) = 0
		[Toggle(_)][Space(10)]_FriendsOnlyTexture("Friends Only Texture", Float) = 0
		_MainTexFriends("FriendsOnly Texture (RGB,A)", 2D) = "white" {}
		[Toggle(_)]_FriendsSuperSample("SuperSample (expensive)", Float) = 0
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
		
		
		Tags { "RenderType"="Opaque" "Queue"="Geometry" }
	LOD 0

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		AlphaToMask [_AlphaToCoverage]
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
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
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
			#pragma multi_compile __ VERTEXLIGHT_ON


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

			uniform float _ZTestMode;
			uniform float _SrcBlend;
			uniform int _Culling;
			uniform int _StencilFail;
			uniform float _DstBlend;
			uniform float _outline_width;
			uniform int _StencilOp;
			uniform half _ReadMask;
			uniform float _ZWriteMode;
			uniform half _WriteMask;
			uniform float _AlphaToCoverage;
			uniform int _StencilZFail;
			uniform float _Cutoff;
			uniform float _VRCFallbackDoublesided;
			uniform int _StencilComparison;
			uniform half _StencilRef;
			uniform float _UseMatcap;
			uniform float _UseRim;
			uniform float _RimMode;
			uniform float _Hue;
			uniform float _FriendsOnlyTexture;
			uniform float _FriendsOnly1;
			uniform sampler2D _FriendsOnlyRT;
			uniform float4 _FriendsOnlyRT_ST;
			uniform float _FriendsSuperSample;
			uniform sampler2D _MainTexFriends;
			uniform float4 _MainTexFriends_ST;
			uniform float _TexSSBias;
			uniform float _TexSuperSample;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _Color;
			uniform float _Saturation;
			uniform float4 _ShadowColour;
			uniform float _ShadowSharpness;
			uniform float _UseShading;
			uniform float _NormSuperSample;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform float _NormSSBias;
			uniform float _NormalPower;
			uniform float _NorDist;
			uniform sampler2D _NormalMaskR;
			uniform float4 _NormalMaskR_ST;
			uniform float _StaticLightX;
			uniform float _StaticLightY;
			uniform float _StaticLightZ;
			uniform float _LightMode;
			uniform float _OffsetDot;
			uniform sampler2D _LightMask;
			uniform float4 _LightMask_ST;
			uniform float _LightMaskLevel;
			uniform float _ShadowPower;
			uniform float _ShadowSaturation;
			uniform float _DisableLight;
			uniform float _UseSubSurface;
			uniform float _SSBrightness;
			uniform float _Spherize;
			uniform float _SSTransmission;
			uniform float _NormalPowerSubSurface;
			uniform float _OffsetSS;
			uniform float _SSIntensity;
			uniform float _LightMultiplier;
			uniform float _MinLight;
			uniform float _MaxLight;
			uniform float _LightSatLimiter;
			uniform float _LightSatTotal;
			uniform float _ShadowDarkness;
			uniform float _ShadeEnable;
			uniform float _ShadeColorDynamic;
			uniform float4 _ShadeColour;
			uniform float _SoftScale;
			uniform float _SoftPower;
			uniform float _ShadeLevel;
			uniform float4 _RimOutlineColour;
			uniform float _Min;
			uniform float _Max;
			uniform float _RimNormal;
			uniform float _Scale1;
			uniform float _Scale;
			uniform float _Power;
			uniform float _Amount;
			uniform sampler2D _Matcap;
			uniform float _Legacy;
			uniform float _StereoFix;
			uniform float _NormalPowerMatCap;
			uniform float _MatcapSpin;
			uniform float _MatcapIntensity;
			uniform float4 _MatCapColor;
			uniform float _MatcapSaturation;
			uniform float _MatcapOpacity;
			uniform sampler2D _MatCapMask;
			uniform float4 _MatCapMask_ST;
			uniform float _MatcapMaskLevel1;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;
			uniform float _ShadedEmission;
			uniform float4 _EmissionColor;
			uniform float _EmissionIntensity;
			uniform float _SpecMode;
			uniform float4 _SpecMatCapColor1;
			uniform float _StereoFixSpec;
			uniform float _NormalPowerSpecular;
			uniform float _SpecularSize;
			uniform float _SpecularStrength;
			uniform float _SpecularOpacity;
			uniform float _SpecMatCapMode;
			uniform float _UseSpecularMatCap;
			uniform sampler2D _SpecularMatcap;
			uniform float _Legacy2;
			uniform float _StereoFixSpecCap;
			uniform float _SpecMatcapSaturation;
			uniform float _SpecMatcapMultiply;
			uniform float4 _SpecMatCapColor;
			uniform float _UseReflection;
			uniform float _ProbeSmoothness;
			uniform float _ReflectionOpacity;
			uniform float _SpecMaskOpacity;
			uniform sampler2D _SpecularMask;
			uniform float4 _SpecularMask_ST;
			uniform float _UseSparkleShimmer;
			uniform float _SparkleMode;
			uniform sampler2D _SparkleMask;
			uniform float4 _SparkleMask_ST;
			uniform float _SparkleMaskPower;
			uniform float _Threshold;
			uniform float _Range;
			uniform float _SparkleSuperSample;
			uniform sampler2D _SparklePattern;
			uniform float4 _SparklePattern_ST;
			uniform float _SparkleSSBias;
			uniform float _SparkleTexColour;
			uniform float _StereoCorrect;
			uniform float _ScreenContribution;
			uniform float _MotionIntensity;
			uniform float _MotionType;
			uniform float _MotionSpeed;
			uniform float _RotateLinear;
			uniform float _WorldPosContribution;
			uniform float4 _SparkleColor;
			uniform float3 _SparkleFresnel;
			uniform float _UseParallax;
			uniform sampler2D _ParallaxMask;
			uniform float4 _ParallaxMask_ST;
			uniform float _ParallaxMaskPower;
			uniform sampler2D _ParallaxTexture;
			uniform float4 _ParallaxTexture_ST;
			uniform float _ParallaxHeight;
			uniform float _ParallaxScale;
			uniform float4 _ParallaxColour;
			uniform float _Alpha;
			uniform float _MirrorSystem;
			uniform float _IsInMirror;
			uniform float _IsNotMirror;
			uniform float _FriendsOnly;
			uniform float _AlphaCutoff;
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
			
			float4 VertexLightPosX3_g584(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g584(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g584(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g584(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol114_g584(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightCol215_g584(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g584(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g584(  )
			{
				return unity_LightColor[3];
			}
			
			float3 CenterEye1_g1580(  )
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
			
			float3 unity_SHArgb3_g1576(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			
			float3 CenterEye1_g1594(  )
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
			
			float3 CenterEye1_g1602(  )
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
			
			float3 CenterEye1_g1600(  )
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
			
			float3 CenterEye1_g1587(  )
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
			
			float3 CenterEye1_g1591(  )
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
			
			float3 CenterEye1_g1589(  )
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
			
			float3 CenterEye1_g1617(  )
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
			
			float3 CenterEye1_g1619(  )
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
			
			float3 CenterEye1_g1620(  )
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
			
			int isCamera1_g1614(  )
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
			
			fixed4 frag (v2f i , half ase_vface : VFACE) : SV_Target
			{
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
				UNITY_BRANCH 
				if( _FriendsOnly1 == 1.0 )
				ifLocalVar3506 = ( 1.0 - temp_output_351_0 );
				else if( _FriendsOnly1 < 1.0 )
				ifLocalVar3506 = temp_output_351_0;
				float FriendsOnlyInvert3333 = ifLocalVar3506;
				sampler2D texvalue34_g1585 = _MainTexFriends;
				float2 uv_MainTexFriends = i.ase_texcoord1.xy * _MainTexFriends_ST.xy + _MainTexFriends_ST.zw;
				float2 temp_output_4_0_g1585 = uv_MainTexFriends;
				float2 uvin34_g1585 = temp_output_4_0_g1585;
				float2 dx34_g1585 = ( ddx( temp_output_4_0_g1585 ) * float2( 0.25,0.25 ) );
				float2 dy34_g1585 = ( ddy( temp_output_4_0_g1585 ) * float2( 0.25,0.25 ) );
				float bias34_g1585 = _TexSSBias;
				float4 localsupersample2x234_g1585 = supersample2x2( texvalue34_g1585 , uvin34_g1585 , dx34_g1585 , dy34_g1585 , bias34_g1585 );
				float4 ifLocalVar3475 = 0;
				UNITY_BRANCH 
				if( _FriendsSuperSample == 1.0 )
				ifLocalVar3475 = localsupersample2x234_g1585;
				else if( _FriendsSuperSample < 1.0 )
				ifLocalVar3475 = tex2D( _MainTexFriends, uv_MainTexFriends );
				sampler2D texvalue34_g1586 = _MainTex;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 temp_output_4_0_g1586 = uv_MainTex;
				float2 uvin34_g1586 = temp_output_4_0_g1586;
				float2 dx34_g1586 = ( ddx( temp_output_4_0_g1586 ) * float2( 0.25,0.25 ) );
				float2 dy34_g1586 = ( ddy( temp_output_4_0_g1586 ) * float2( 0.25,0.25 ) );
				float bias34_g1586 = _TexSSBias;
				float4 localsupersample2x234_g1586 = supersample2x2( texvalue34_g1586 , uvin34_g1586 , dx34_g1586 , dy34_g1586 , bias34_g1586 );
				float4 ifLocalVar3476 = 0;
				UNITY_BRANCH 
				if( _TexSuperSample == 1.0 )
				ifLocalVar3476 = localsupersample2x234_g1586;
				else if( _TexSuperSample < 1.0 )
				ifLocalVar3476 = tex2D( _MainTex, uv_MainTex );
				float4 ifLocalVar3504 = 0;
				UNITY_BRANCH 
				if( ( _FriendsOnlyTexture * FriendsOnlyInvert3333 ) == 1.0 )
				ifLocalVar3504 = ifLocalVar3475;
				else if( ( _FriendsOnlyTexture * FriendsOnlyInvert3333 ) < 1.0 )
				ifLocalVar3504 = ifLocalVar3476;
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
				float bias34_g1574 = _NormSSBias;
				float4 localsupersample2x234_g1574 = supersample2x2( texvalue34_g1574 , uvin34_g1574 , dx34_g1574 , dy34_g1574 , bias34_g1574 );
				float3 localCenterEye1_g586 = CenterEye1_g586();
				float temp_output_4_0_g585 = distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g586 : _WorldSpaceCameraPos ) );
				float temp_output_3458_0 = ( temp_output_4_0_g585 * 2.0 * _NorDist );
				float ifLocalVar3495 = 0;
				if( _NorDist >= 0.001 )
				ifLocalVar3495 = temp_output_3458_0;
				else
				ifLocalVar3495 = 1.0;
				float NormalDist3459 = ifLocalVar3495;
				float temp_output_3442_0 = ( _NormalPower * NormalDist3459 );
				float clampResult3014 = clamp( temp_output_3442_0 , 1.0 , 3.0 );
				float3 localUnpackNormal47_g1574 = UnpackScaleNormal( localsupersample2x234_g1574, clampResult3014 );
				float3 ifLocalVar3494 = 0;
				UNITY_BRANCH 
				if( _NormSuperSample == 1.0 )
				ifLocalVar3494 = localUnpackNormal47_g1574;
				else if( _NormSuperSample < 1.0 )
				ifLocalVar3494 = UnpackScaleNormal( tex2D( _Normal, uv_Normal ), clampResult3014 );
				float2 uv_NormalMaskR = i.ase_texcoord1.xy * _NormalMaskR_ST.xy + _NormalMaskR_ST.zw;
				float4 tex2DNode3059 = tex2D( _NormalMaskR, uv_NormalMaskR );
				float clampResult3013 = clamp( temp_output_3442_0 , 0.0 , 1.0 );
				float3 lerpResult430 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( tex2DNode3059.r * clampResult3013 ));
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
				float3 Dir_LightDir2215 = ( ( ase_lightColor.rgb * ase_lightColor.a ) > float3( 0,0,0 ) ? normalizeResult1233 : lerpResult2635 );
				float3 localSHArgbambientDir6_g1577 = SHArgbambientDir();
				float dotResult5 = dot( NormalShade962 , ( Dir_LightDir2215 + localSHArgbambientDir6_g1577 ) );
				float NdotL1296 = dotResult5;
				float4 localVertexLightPosX3_g584 = VertexLightPosX3_g584();
				float4 break4_g584 = localVertexLightPosX3_g584;
				float4 localVertexLightPosY2_g584 = VertexLightPosY2_g584();
				float4 break5_g584 = localVertexLightPosY2_g584;
				float4 localVertexLightPosZ1_g584 = VertexLightPosZ1_g584();
				float4 break6_g584 = localVertexLightPosZ1_g584;
				float3 appendResult7_g584 = (float3(break4_g584.x , break5_g584.x , break6_g584.x));
				float3 VertLightPos12017 = appendResult7_g584;
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
				float3 pos188_g584 = appendResult7_g584;
				float3 objToWorld139_g584 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_155_0_g584 = pow( distance( pos188_g584 , objToWorld139_g584 ) , 2.0 );
				float4 localVertexLightAttenuation86_g584 = VertexLightAttenuation86_g584();
				float4 break87_g584 = localVertexLightAttenuation86_g584;
				float attenx96_g584 = break87_g584.x;
				float temp_output_60_0_g584 = saturate( ( 1.0 - ( ( temp_output_155_0_g584 * attenx96_g584 ) / 25.0 ) ) );
				float temp_output_3408_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g584 ) * attenx96_g584 ) ) , ( temp_output_60_0_g584 * temp_output_60_0_g584 ) );
				float3 appendResult8_g584 = (float3(break4_g584.y , break5_g584.y , break6_g584.y));
				float3 pos290_g584 = appendResult8_g584;
				float3 objToWorld140_g584 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_75_0_g584 = pow( distance( pos290_g584 , objToWorld140_g584 ) , 2.0 );
				float atteny97_g584 = break87_g584.y;
				float temp_output_107_0_g584 = saturate( ( 1.0 - ( ( temp_output_75_0_g584 * atteny97_g584 ) / 25.0 ) ) );
				float temp_output_3408_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g584 ) * atteny97_g584 ) ) , ( temp_output_107_0_g584 * temp_output_107_0_g584 ) );
				float3 appendResult9_g584 = (float3(break4_g584.z , break5_g584.z , break6_g584.z));
				float3 pos389_g584 = appendResult9_g584;
				float3 objToWorld141_g584 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_79_0_g584 = pow( distance( pos389_g584 , objToWorld141_g584 ) , 2.0 );
				float attenz98_g584 = break87_g584.z;
				float temp_output_125_0_g584 = saturate( ( 1.0 - ( ( temp_output_79_0_g584 * attenz98_g584 ) / 25.0 ) ) );
				float temp_output_3408_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g584 ) * attenz98_g584 ) ) , ( temp_output_125_0_g584 * temp_output_125_0_g584 ) );
				float3 appendResult10_g584 = (float3(break4_g584.w , break5_g584.w , break6_g584.w));
				float3 pos491_g584 = appendResult10_g584;
				float3 objToWorld138_g584 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_83_0_g584 = pow( distance( pos491_g584 , objToWorld138_g584 ) , 2.0 );
				float attenw99_g584 = break87_g584.w;
				float temp_output_116_0_g584 = saturate( ( 1.0 - ( ( temp_output_83_0_g584 * attenw99_g584 ) / 25.0 ) ) );
				float temp_output_3408_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g584 ) * attenw99_g584 ) ) , ( temp_output_116_0_g584 * temp_output_116_0_g584 ) );
				float VertAtten2014 = ( temp_output_3408_23 + temp_output_3408_29 + temp_output_3408_30 + temp_output_3408_31 );
				float4 localVertexLightCol114_g584 = VertexLightCol114_g584();
				float4 temp_output_3408_16 = localVertexLightCol114_g584;
				float4 localVertexLightCol215_g584 = VertexLightCol215_g584();
				float4 temp_output_3408_17 = localVertexLightCol215_g584;
				float4 localVertexLightCol319_g584 = VertexLightCol319_g584();
				float4 temp_output_3408_18 = localVertexLightCol319_g584;
				float4 localVertexLightCol421_g584 = VertexLightCol421_g584();
				float4 temp_output_3408_20 = localVertexLightCol421_g584;
				float4 break1551 = ( temp_output_3408_16 + temp_output_3408_17 + temp_output_3408_18 + temp_output_3408_20 );
				#ifdef VERTEXLIGHT_ON
				float staticSwitch1905 = ( VertAtten2014 * saturate( ( break1551.x + break1551.y + break1551.z ) ) * break1551.w );
				#else
				float staticSwitch1905 = 0.0;
				#endif
				float VertTotal1665 = staticSwitch1905;
				float lerpResult2140 = lerp( VertTotal1665 , VertAtten2014 , ( VertTotal1665 * 0.75 ));
				float temp_output_2033_0 = ( 1.0 - saturate( ( 1.0 / pow( ( lerpResult2140 * 0.33 ) , 25.0 ) ) ) );
				float lerpResult1994 = lerp( NdotL1296 , Vert_NdotL1389 , temp_output_2033_0);
				float ifLocalVar3497 = 0;
				UNITY_BRANCH 
				if( _UseShading == 1.0 )
				ifLocalVar3497 = lerpResult1994;
				else if( _UseShading < 1.0 )
				ifLocalVar3497 = 1.0;
				float temp_output_1106_0 = ( ifLocalVar3497 - _OffsetDot );
				float2 uv_LightMask = i.ase_texcoord1.xy * _LightMask_ST.xy + _LightMask_ST.zw;
				float lerpResult3262 = lerp( 1.0 , tex2D( _LightMask, uv_LightMask ).r , _LightMaskLevel);
				float saferPower4103 = max( ( _ShadowSharpness * temp_output_1106_0 * lerpResult3262 ) , 0.0001 );
				float3 lerpResult1016 = lerp( (_ShadowColour).rgb , float3( 1,1,1 ) , saturate( pow( saferPower4103 , _ShadowPower ) ));
				float3 RampShade979 = lerpResult1016;
				float3 desaturateInitialColor581 = desaturateVar2917;
				float desaturateDot581 = dot( desaturateInitialColor581, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar581 = lerp( desaturateInitialColor581, desaturateDot581.xxx, ( ( 1.0 - RampShade979 ) * ( 1.0 - _ShadowSaturation ) ).x );
				float3 MaintexRGB3074 = desaturateVar581;
				float isUnlit3574 = _DisableLight;
				float3 temp_cast_4 = (isUnlit3574).xxx;
				float3 Vert_LightDir1491 = normalizeResult1382;
				float3 lerpResult2213 = lerp( Dir_LightDir2215 , Vert_LightDir1491 , temp_output_2033_0);
				float3 FinalLightDir2218 = lerpResult2213;
				float SphereizeVar3735 = _Spherize;
				float3 objToWorldDir3737 = mul( unity_ObjectToWorld, float4( i.ase_texcoord5.xyz, 0 ) ).xyz;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult3687 = dot( -( FinalLightDir2218 + ( SphereizeVar3735 == 1.0 ? objToWorldDir3737 : ase_worldNormal ) ) , ase_worldViewDir );
				float3 objToWorldDir3646 = mul( unity_ObjectToWorld, float4( i.ase_texcoord5.xyz, 0 ) ).xyz;
				float3 lerpResult3593 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( tex2DNode3059.r * saturate( NormalDist3459 ) * _NormalPowerSubSurface ));
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
				float4 transform5_g1579 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 localCenterEye1_g1580 = CenterEye1_g1580();
				float temp_output_4_0_g1579 = distance( transform5_g1579 , float4( ( (float)0 == 0.0 ? localCenterEye1_g1580 : _WorldSpaceCameraPos ) , 0.0 ) );
				float temp_output_3839_0 = temp_output_4_0_g1579;
				float dotResult3702 = dot( ase_worldViewDir , -( FinalLightDir2218 + ase_worldNormal ) );
				float saferPower3694 = max( ( ( 1.0 - ( temp_output_3839_0 * -0.25 ) ) * 0.3 * dotResult3702 ) , 0.0001 );
				float smoothstepResult3721 = smoothstep( 0.0 , 0.075 , saturate( pow( saferPower3694 , 3.0 ) ));
				float ifLocalVar3604 = 0;
				UNITY_BRANCH 
				if( _UseSubSurface == 1.0 )
				ifLocalVar3604 = ( _SSBrightness * ( saturate( ( dotResult3687 * 0.5 * _SSTransmission ) ) + saturate( max( pow( ( ( dotResult3589 - _OffsetSS ) * pow( (0.0 + (temp_output_3839_0 - 0.0) * (1.0 - 0.0) / (0.5 - 0.0)) , 0.25 ) ) , _SSIntensity ) , 1E-05 ) ) ) * ( ( 1.0 - smoothstepResult3721 ) * 0.75 ) );
				float SubSurface3603 = ifLocalVar3604;
				float temp_output_2082_0 = ( 1.0 - _WorldSpaceLightPos0.w );
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch1908 = saturate( ( ( temp_output_3408_16 * temp_output_3408_23 ) + ( temp_output_3408_17 * temp_output_3408_29 ) + ( temp_output_3408_18 * temp_output_3408_30 ) + ( temp_output_3408_20 * temp_output_3408_31 ) ) );
				#else
				float4 staticSwitch1908 = float4(0,0,0,0);
				#endif
				float4 VertLight1406 = staticSwitch1908;
				float3 localunity_SHArgb3_g1576 = unity_SHArgb3_g1576();
				float3 temp_cast_7 = (_MinLight).xxx;
				float3 clampResult3331 = clamp( ( ( ( ase_lightColor.rgb * ase_lightColor.a * temp_output_2082_0 ) + ( (VertLight1406).xyz * temp_output_2082_0 ) + ( localunity_SHArgb3_g1576 * float3( 1.3,1.3,1.3 ) ) ) * _LightMultiplier ) , temp_cast_7 , float3( 2,2,2 ) );
				float3 break5_g1578 = clampResult3331;
				float3 clampResult1914 = clamp( clampResult3331 , float3( 0,0,0 ) , ( ( _MaxLight * max( max( break5_g1578.x , break5_g1578.y ) , max( break5_g1578.y , break5_g1578.z ) ) ) / clampResult3331 ) );
				float3 break5_g1582 = clampResult1914;
				float saferPower3564 = max( saturate( max( max( break5_g1582.x , break5_g1582.y ) , max( break5_g1582.y , break5_g1582.z ) ) ) , 0.0001 );
				float3 break5_g1581 = clampResult1914;
				float clampResult3551 = clamp( ( pow( saferPower3564 , 3.0 ) - ( ( 1.0 - saturate( min( min( break5_g1581.x , break5_g1581.y ) , min( break5_g1581.y , break5_g1581.z ) ) ) ) * _LightSatLimiter ) ) , ( ( 1.0 - _LightSatTotal ) + 0.2 ) , 1.0 );
				float3 desaturateInitialColor1777 = clampResult1914;
				float desaturateDot1777 = dot( desaturateInitialColor1777, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1777 = lerp( desaturateInitialColor1777, desaturateDot1777.xxx, clampResult3551 );
				float3 temp_cast_8 = (( ( 1.0 - temp_output_1106_0 ) * _ShadowDarkness )).xxx;
				float3 clampResult30 = clamp( ( RampShade979 - temp_cast_8 ) , float3( 0,0,0 ) , float3( 0.8,0.8,0.8 ) );
				float3 AllLight3270 = clampResult1914;
				float3 ifLocalVar3502 = 0;
				if( _ShadeColorDynamic == 1.0 )
				ifLocalVar3502 = (float3( 0.5,0.5,0.5 ) + ((AllLight3270).xyz - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.5,0.5,0.5 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				else if( _ShadeColorDynamic < 1.0 )
				ifLocalVar3502 = (float3( 0.5,0.5,0.5 ) + ((_ShadeColour).rgb - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.5,0.5,0.5 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 switchResult3288 = (((ase_vface>0)?(NormalShade962):(-NormalShade962)));
				float fresnelNdotV645 = dot( normalize( switchResult3288 ), FinalLightDir2218 );
				float fresnelNode645 = ( 0.0 + _SoftScale * pow( max( 1.0 - fresnelNdotV645 , 0.0001 ), _SoftPower ) );
				float fresnelNdotV662 = dot( normalize( switchResult3288 ), ase_worldViewDir );
				float fresnelNode662 = ( 0.0 + _SoftScale * pow( max( 1.0 - fresnelNdotV662 , 0.0001 ), _SoftPower ) );
				float lerpResult669 = lerp( 1.0 , ( 1.0 - ( saturate( fresnelNode645 ) * 0.5 * ( saturate( fresnelNode662 ) * 0.5 ) ) ) , _ShadeLevel);
				float3 lerpResult3285 = lerp( ( ifLocalVar3502 * float3( 0.1,0.1,0.1 ) ) , float3( 1,1,1 ) , lerpResult669);
				float3 ifLocalVar3503 = 0;
				UNITY_BRANCH 
				if( _ShadeEnable == 1.0 )
				ifLocalVar3503 = lerpResult3285;
				else if( _ShadeEnable < 1.0 )
				ifLocalVar3503 = float3(1,1,1);
				float3 LightShaded2289 = ( clampResult30 * ifLocalVar3503 );
				float3 LightColour968 = ( desaturateVar1777 * LightShaded2289 );
				float3 saferPower3799 = max( LightColour968 , 0.0001 );
				float3 ifLocalVar3568 = 0;
				UNITY_BRANCH 
				if( isUnlit3574 == 1.0 )
				ifLocalVar3568 = temp_cast_4;
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
				float4 transform5_g1593 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 localCenterEye1_g1594 = CenterEye1_g1594();
				float temp_output_4_0_g1593 = distance( transform5_g1593 , float4( ( (float)0 == 0.0 ? localCenterEye1_g1594 : _WorldSpaceCameraPos ) , 0.0 ) );
				float dotResult17_g1592 = dot( ase_worldViewDir , ase_worldNormal );
				float saferPower24_g1592 = max( ( ( 1.0 - ( temp_output_4_0_g1593 * 0.25 ) ) * 10.0 * dotResult17_g1592 ) , 0.0001 );
				float smoothstepResult25_g1592 = smoothstep( 0.0 , 0.25 , saturate( pow( saferPower24_g1592 , 3.0 ) ));
				float temp_output_3773_0 = ( ( smoothstepResult25_g1592 + 0.25 ) * _Amount );
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
				float3 ifLocalVar3507 = 0;
				UNITY_BRANCH 
				if( _UseRim == 1.0 )
				ifLocalVar3507 = ifLocalVar1284;
				else if( _UseRim < 1.0 )
				ifLocalVar3507 = PostDesaturation1276;
				float3 PostRimLight1292 = ifLocalVar3507;
				float3 localCenterEye1_g1602 = CenterEye1_g1602();
				float3 ifLocalVar50_g1601 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar50_g1601 = localCenterEye1_g1602;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar50_g1601 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g1601 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g1601 - WorldPosition ), 0 ) ).xyz );
				float3 lerpResult3086 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( _NormalPowerMatCap * NormalDist3459 * tex2DNode3059.r ));
				float3 tanNormal3090 = lerpResult3086;
				float3 worldNormal3090 = float3(dot(tanToWorld0,tanNormal3090), dot(tanToWorld1,tanNormal3090), dot(tanToWorld2,tanNormal3090));
				float3 normalizeResult3091 = normalize( worldNormal3090 );
				float3 NormalMatCap3089 = normalizeResult3091;
				float3 worldToViewDir13_g1601 = normalize( mul( UNITY_MATRIX_V, float4( NormalMatCap3089, 0 ) ).xyz );
				float mulTime2208 = _Time.y * _MatcapSpin;
				float cos2210 = cos( mulTime2208 );
				float sin2210 = sin( mulTime2208 );
				float2 rotator2210 = mul( (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g1601 ) , worldToViewDir13_g1601 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) - float2( 0.5,0.5 ) , float2x2( cos2210 , -sin2210 , sin2210 , cos2210 )) + float2( 0.5,0.5 );
				float3 localCenterEye1_g1600 = CenterEye1_g1600();
				float3 ifLocalVar32_g1599 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar32_g1599 = localCenterEye1_g1600;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar32_g1599 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g1599 = normalize( ( ifLocalVar32_g1599 - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g1599 = normalize( cross( normalizeResult19_g1599 , _worldUp ) );
				float3 temp_output_21_0_g1599 = NormalMatCap3089;
				float dotResult10_g1599 = dot( normalizeResult8_g1599 , temp_output_21_0_g1599 );
				float dotResult2_g1599 = dot( _worldUp , normalizeResult19_g1599 );
				float3 normalizeResult7_g1599 = normalize( ( _worldUp - ( dotResult2_g1599 * normalizeResult19_g1599 ) ) );
				float dotResult9_g1599 = dot( normalizeResult7_g1599 , temp_output_21_0_g1599 );
				float2 appendResult11_g1599 = (float2(dotResult10_g1599 , dotResult9_g1599));
				float cos2207 = cos( mulTime2208 );
				float sin2207 = sin( mulTime2208 );
				float2 rotator2207 = mul( ( ( appendResult11_g1599 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) - float2( 0.5,0.5 ) , float2x2( cos2207 , -sin2207 , sin2207 , cos2207 )) + float2( 0.5,0.5 );
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
				float2 uv_Emission = i.ase_texcoord1.xy * _Emission_ST.xy + _Emission_ST.zw;
				float4 tex2DNode328 = tex2D( _Emission, uv_Emission );
				float3 temp_output_3260_0 = ( (tex2DNode328).rgb * tex2DNode328.a );
				float3 lerpResult450 = lerp( temp_output_3260_0 , ( temp_output_3260_0 * LightColour968 ) , _ShadedEmission);
				float3 temp_cast_13 = (3.0).xxx;
				float3 clampResult331 = clamp( ( lerpResult450 * (_EmissionColor).rgb * _EmissionIntensity ) , float3( 0,0,0 ) , temp_cast_13 );
				float3 Emission1285 = clampResult331;
				float3 desaturateInitialColor2291 = LightColour968;
				float desaturateDot2291 = dot( desaturateInitialColor2291, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2291 = lerp( desaturateInitialColor2291, desaturateDot2291.xxx, 1.0 );
				float3 temp_output_2287_0 = (desaturateVar2291).xyz;
				float3 localCenterEye1_g1587 = CenterEye1_g1587();
				float3 temp_output_4_0_g1587 = ( localCenterEye1_g1587 - WorldPosition );
				float3 normalizeResult5_g1587 = normalize( temp_output_4_0_g1587 );
				float3 ifLocalVar3493 = 0;
				if( _StereoFixSpec == 1.0 )
				ifLocalVar3493 = normalizeResult5_g1587;
				else if( _StereoFixSpec < 1.0 )
				ifLocalVar3493 = ase_worldViewDir;
				float3 normalizeResult1783 = normalize( ( ifLocalVar3493 + FinalLightDir2218 ) );
				float3 lerpResult602 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( tex2DNode3059.r * saturate( NormalDist3459 ) * _NormalPowerSpecular ));
				float3 tanNormal1234 = lerpResult602;
				float3 worldNormal1234 = float3(dot(tanToWorld0,tanNormal1234), dot(tanToWorld1,tanNormal1234), dot(tanToWorld2,tanNormal1234));
				float3 normalizeResult3055 = normalize( worldNormal1234 );
				float3 NormalSpecular965 = normalizeResult3055;
				float dotResult551 = dot( normalizeResult1783 , NormalSpecular965 );
				float saferPower545 = max( dotResult551 , 0.0001 );
				float saferPower556 = max( 10.0 , 0.0001 );
				float clampResult2294 = clamp( ( pow( saferPower545 , exp( ( 10.0 - _SpecularSize ) ) ) * pow( saferPower556 , _SpecularStrength ) ) , 0.0001 , 5.0 );
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
				float3 localCenterEye1_g1591 = CenterEye1_g1591();
				float3 ifLocalVar50_g1590 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar50_g1590 = localCenterEye1_g1591;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar50_g1590 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g1590 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g1590 - WorldPosition ), 0 ) ).xyz );
				float3 worldToViewDir13_g1590 = normalize( mul( UNITY_MATRIX_V, float4( NormalSpecular965, 0 ) ).xyz );
				float3 localCenterEye1_g1589 = CenterEye1_g1589();
				float3 ifLocalVar32_g1588 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar32_g1588 = localCenterEye1_g1589;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar32_g1588 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g1588 = normalize( ( ifLocalVar32_g1588 - WorldPosition ) );
				float3 normalizeResult8_g1588 = normalize( cross( normalizeResult19_g1588 , _worldUp ) );
				float3 temp_output_21_0_g1588 = NormalSpecular965;
				float dotResult10_g1588 = dot( normalizeResult8_g1588 , temp_output_21_0_g1588 );
				float dotResult2_g1588 = dot( _worldUp , normalizeResult19_g1588 );
				float3 normalizeResult7_g1588 = normalize( ( _worldUp - ( dotResult2_g1588 * normalizeResult19_g1588 ) ) );
				float dotResult9_g1588 = dot( normalizeResult7_g1588 , temp_output_21_0_g1588 );
				float2 appendResult11_g1588 = (float2(dotResult10_g1588 , dotResult9_g1588));
				float2 ifLocalVar3491 = 0;
				UNITY_BRANCH 
				if( _Legacy2 == 1.0 )
				ifLocalVar3491 = (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g1590 ) , worldToViewDir13_g1590 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 )));
				else if( _Legacy2 < 1.0 )
				ifLocalVar3491 = ( ( appendResult11_g1588 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) );
				float3 desaturateInitialColor1920 = (tex2D( _SpecularMatcap, ifLocalVar3491 )).rgb;
				float desaturateDot1920 = dot( desaturateInitialColor1920, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1920 = lerp( desaturateInitialColor1920, desaturateDot1920.xxx, ( 1.0 - _SpecMatcapSaturation ) );
				float3 ifLocalVar3492 = 0;
				UNITY_BRANCH 
				if( _UseSpecularMatCap == 1.0 )
				ifLocalVar3492 = ( desaturateVar1920 * _SpecMatcapMultiply * (_SpecMatCapColor).rgb );
				float3 ifLocalVar3489 = 0;
				UNITY_BRANCH 
				if( _SpecMatCapMode == 1.0 )
				ifLocalVar3489 = ( ifLocalVar3492 * MaintexRGB3074 );
				else if( _SpecMatCapMode < 1.0 )
				ifLocalVar3489 = ifLocalVar3492;
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
				Unity_GlossyEnvironmentData g3174 = UnityGlossyEnvironmentSetup( _ProbeSmoothness, ase_worldViewDir, NormalSpecular965, float3(0,0,0));
				float3 indirectSpecular3174 = UnityGI_IndirectSpecular( data, 1.0, NormalSpecular965, g3174 );
				float3 lerpResult3407 = lerp( float3( 0,0,0 ) , ( float3( 0,0,0 ) >= float3( 1,1,1 ) ? float3( 0,0,0 ) : ( indirectSpecular3174 < float3( 0.001,0.001,0.001 ) ? float3( 0,0,0 ) : indirectSpecular3174 ) ) , _ReflectionOpacity);
				float3 ifLocalVar3483 = 0;
				UNITY_BRANCH 
				if( _UseReflection == 1.0 )
				ifLocalVar3483 = lerpResult3407;
				float2 uv_SpecularMask = i.ase_texcoord1.xy * _SpecularMask_ST.xy + _SpecularMask_ST.zw;
				float3 lerpResult560 = lerp( float3( 0,0,0 ) , ( ifLocalVar3489 + ifLocalVar3483 ) , ( _SpecMaskOpacity * tex2D( _SpecularMask, uv_SpecularMask ).r ));
				float3 SpecularOut983 = ( ifLocalVar3482 + lerpResult560 );
				float2 uv_SparkleMask = i.ase_texcoord1.xy * _SparkleMask_ST.xy + _SparkleMask_ST.zw;
				float4 tex2DNode87_g1615 = tex2D( _SparkleMask, uv_SparkleMask );
				float3 temp_cast_16 = (_Threshold).xxx;
				float3 localCenterEye1_g1617 = CenterEye1_g1617();
				float temp_output_4_0_g1616 = distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g1617 : _WorldSpaceCameraPos ) );
				float temp_output_102_0_g1615 = temp_output_4_0_g1616;
				float3 temp_cast_18 = (saturate( ( _Threshold + pow( _Range , ( 1.0 - (0.0 + (temp_output_102_0_g1615 - 0.0) * (0.1 - 0.0) / (1.0 - 0.0)) ) ) ) )).xxx;
				sampler2D texvalue34_g1622 = _SparklePattern;
				float2 uv_SparklePattern = i.ase_texcoord1.xy * _SparklePattern_ST.xy + _SparklePattern_ST.zw;
				float2 temp_output_4_0_g1622 = uv_SparklePattern;
				float2 uvin34_g1622 = temp_output_4_0_g1622;
				float2 dx34_g1622 = ( ddx( temp_output_4_0_g1622 ) * float2( 0.25,0.25 ) );
				float2 dy34_g1622 = ( ddy( temp_output_4_0_g1622 ) * float2( 0.25,0.25 ) );
				float bias34_g1622 = _SparkleSSBias;
				float4 localsupersample2x234_g1622 = supersample2x2( texvalue34_g1622 , uvin34_g1622 , dx34_g1622 , dy34_g1622 , bias34_g1622 );
				float4 ifLocalVar74_g1615 = 0;
				UNITY_BRANCH 
				if( _SparkleSuperSample == 1.0 )
				ifLocalVar74_g1615 = localsupersample2x234_g1622;
				else if( _SparkleSuperSample < 1.0 )
				ifLocalVar74_g1615 = tex2D( _SparklePattern, uv_SparklePattern );
				float grayscale107_g1615 = dot(ifLocalVar74_g1615.xyz, float3(0.299,0.587,0.114));
				float3 appendResult113_g1615 = (float3(grayscale107_g1615 , grayscale107_g1615 , grayscale107_g1615));
				float3 lerpResult109_g1615 = lerp( appendResult113_g1615 , (ifLocalVar74_g1615).xyz , _SparkleTexColour);
				sampler2D texvalue34_g1621 = _SparklePattern;
				float2 break22_g1615 = uv_SparklePattern;
				float2 appendResult39_g1615 = (float2(-break22_g1615.x , break22_g1615.y));
				float3 localCenterEye1_g1619 = CenterEye1_g1619();
				float4 appendResult76_g1618 = (float4(( WorldPosition - localCenterEye1_g1619 ) , 0.0));
				float4 temp_output_77_0_g1618 = mul( UNITY_MATRIX_V, appendResult76_g1618 );
				float2 break83_g1618 = ( (temp_output_77_0_g1618).xy / (temp_output_77_0_g1618).z );
				float2 appendResult86_g1618 = (float2(( ( _ScreenParams.z / _ScreenParams.w ) * break83_g1618.x ) , ( break83_g1618.y * 2.0 )));
				float2 appendResult101_g1618 = (float2(1.0 , 1.0));
				float2 appendResult102_g1618 = (float2(0.0 , 0.0));
				float4 screenPos = i.ase_texcoord6;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ifLocalVar27_g1615 = 0;
				UNITY_BRANCH 
				if( _StereoCorrect == 1.0 )
				ifLocalVar27_g1615 = ( ( ( ( -appendResult86_g1618 * float2( 1,0.5 ) ) + float2( 0.5,0.5 ) ) * appendResult101_g1618 ) + appendResult102_g1618 );
				else if( _StereoCorrect < 1.0 )
				ifLocalVar27_g1615 = (ase_screenPosNorm).xy;
				float mulTime7_g1615 = _Time.y * _MotionSpeed;
				float2 appendResult24_g1615 = (float2(mulTime7_g1615 , 0.0));
				float cos25_g1615 = cos( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float sin25_g1615 = sin( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float2 rotator25_g1615 = mul( appendResult24_g1615 - float2( 0.5,0.5 ) , float2x2( cos25_g1615 , -sin25_g1615 , sin25_g1615 , cos25_g1615 )) + float2( 0.5,0.5 );
				float2 appendResult28_g1615 = (float2(sin( mulTime7_g1615 ) , cos( mulTime7_g1615 )));
				float2 ifLocalVar40_g1615 = 0;
				UNITY_BRANCH 
				if( _MotionType == 0.0 )
				ifLocalVar40_g1615 = rotator25_g1615;
				else if( _MotionType < 0.0 )
				ifLocalVar40_g1615 = appendResult28_g1615;
				float temp_output_26_0_g1615 = ( ( WorldPosition.x + WorldPosition.y + WorldPosition.z ) * ( _WorldPosContribution / 10.0 ) );
				float2 appendResult46_g1615 = (float2(-temp_output_26_0_g1615 , temp_output_26_0_g1615));
				float2 temp_output_50_0_g1615 = ( ( appendResult39_g1615 + ( ifLocalVar27_g1615 * _ScreenContribution ) ) + float2( 0.25,0.25 ) + ( _MotionIntensity * ifLocalVar40_g1615 ) + appendResult46_g1615 );
				float2 temp_output_4_0_g1621 = temp_output_50_0_g1615;
				float2 uvin34_g1621 = temp_output_4_0_g1621;
				float2 dx34_g1621 = ( ddx( temp_output_4_0_g1621 ) * float2( 0.25,0.25 ) );
				float2 dy34_g1621 = ( ddy( temp_output_4_0_g1621 ) * float2( 0.25,0.25 ) );
				float bias34_g1621 = _SparkleSSBias;
				float4 localsupersample2x234_g1621 = supersample2x2( texvalue34_g1621 , uvin34_g1621 , dx34_g1621 , dy34_g1621 , bias34_g1621 );
				float4 ifLocalVar68_g1615 = 0;
				UNITY_BRANCH 
				if( _SparkleSuperSample == 1.0 )
				ifLocalVar68_g1615 = localsupersample2x234_g1621;
				else if( _SparkleSuperSample < 1.0 )
				ifLocalVar68_g1615 = tex2D( _SparklePattern, temp_output_50_0_g1615 );
				float grayscale108_g1615 = dot(ifLocalVar68_g1615.xyz, float3(0.299,0.587,0.114));
				float3 appendResult114_g1615 = (float3(grayscale108_g1615 , grayscale108_g1615 , grayscale108_g1615));
				float3 lerpResult110_g1615 = lerp( appendResult114_g1615 , (ifLocalVar68_g1615).xyz , _SparkleTexColour);
				float3 localCenterEye1_g1620 = CenterEye1_g1620();
				float3 smoothstepResult93_g1615 = smoothstep( temp_cast_16 , temp_cast_18 , ( lerpResult109_g1615 * lerpResult110_g1615 * ( 1.0 - pow( ( distance( WorldPosition , localCenterEye1_g1620 ) / 10000.0 ) , 0.5 ) ) ));
				float3 clampResult151_g1615 = clamp( smoothstepResult93_g1615 , float3( 0,0,0 ) , float3( 3,3,3 ) );
				float clampResult139_g1615 = clamp( (1.0 + (temp_output_102_0_g1615 - 0.0) * (100.0 - 1.0) / (2.0 - 0.0)) , 0.0 , 100.0 );
				float saferPower143_g1615 = max( clampResult139_g1615 , 0.0001 );
				float3 normalizeResult64_g1615 = normalize( ase_worldViewDir );
				float3 temp_output_97_0_g1615 = NormalSpecular965;
				float3 break66_g1615 = (float3( 0,0,0 ) + (_SparkleFresnel - float3( 0,0,0 )) * (float3( 0.1,0.1,0.1 ) - float3( 0,0,0 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float fresnelNdotV73_g1615 = dot( temp_output_97_0_g1615, normalizeResult64_g1615 );
				float fresnelNode73_g1615 = ( break66_g1615.x + break66_g1615.y * pow( max( 1.0 - fresnelNdotV73_g1615 , 0.0001 ), break66_g1615.z ) );
				float fresnelNdotV67_g1615 = dot( -temp_output_97_0_g1615, normalizeResult64_g1615 );
				float fresnelNode67_g1615 = ( break66_g1615.x + break66_g1615.y * pow( max( 1.0 - fresnelNdotV67_g1615 , 0.0001 ), break66_g1615.z ) );
				float switchResult91_g1615 = (((ase_vface>0)?(( 1.0 - saturate( fresnelNode73_g1615 ) )):(( 1.0 - saturate( fresnelNode67_g1615 ) ))));
				float3 temp_output_95_0_g1615 = ( pow( ( tex2DNode87_g1615.r * tex2DNode87_g1615.a ) , _SparkleMaskPower ) * clampResult151_g1615 * ( (_SparkleColor).rgb * ( (0.0 + (saturate( ( 1.0 / temp_output_102_0_g1615 ) ) - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) * pow( saferPower143_g1615 , 1.5 ) ) ) * switchResult91_g1615 );
				float3 ifLocalVar3473 = 0;
				UNITY_BRANCH 
				if( _UseSparkleShimmer == 1.0 )
				ifLocalVar3473 = ( _SparkleMode == 1.0 ? ( MaintexRGB3074 * temp_output_95_0_g1615 ) : temp_output_95_0_g1615 );
				float3 SparkleOut971 = ifLocalVar3473;
				float2 uv_ParallaxMask = i.ase_texcoord1.xy * _ParallaxMask_ST.xy + _ParallaxMask_ST.zw;
				float2 uv_ParallaxTexture = i.ase_texcoord1.xy * _ParallaxTexture_ST.xy + _ParallaxTexture_ST.zw;
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = Unity_SafeNormalize( ase_tanViewDir );
				float2 Offset29_g1623 = ( ( _ParallaxHeight - 1 ) * ase_tanViewDir.xy * _ParallaxScale ) + uv_ParallaxTexture;
				float4 tex2DNode41_g1623 = tex2D( _ParallaxTexture, Offset29_g1623 );
				float3 ifLocalVar4110 = 0;
				UNITY_BRANCH 
				if( _UseParallax == 1.0 )
				ifLocalVar4110 = ( pow( tex2D( _ParallaxMask, uv_ParallaxMask ).r , _ParallaxMaskPower ) * (( tex2DNode41_g1623 * _ParallaxColour * tex2DNode41_g1623.a * _ParallaxColour.a )).rgb );
				float Alpha1262 = (ifLocalVar3504).w;
				int localisCamera1_g1614 = isCamera1_g1614();
				int Cam17_g1614 = localisCamera1_g1614;
				int temp_output_5_0_g1614 = (int)_IsInMirror;
				int temp_output_6_0_g1614 = (int)_IsNotMirror;
				float ifLocalVar3478 = 0;
				UNITY_BRANCH 
				if( _MirrorSystem == 1.0 )
				ifLocalVar3478 = (float)( (float)Cam17_g1614 == 1.0 ? ( (float)temp_output_5_0_g1614 == 1.0 ? ( Cam17_g1614 + temp_output_5_0_g1614 ) : ( Cam17_g1614 * temp_output_5_0_g1614 ) ) : ( (float)temp_output_6_0_g1614 == 0.0 ? ( Cam17_g1614 * temp_output_6_0_g1614 ) : ( Cam17_g1614 + temp_output_6_0_g1614 ) ) );
				else
				ifLocalVar3478 = 1.0;
				float FriendsOnlyToggle3353 = _FriendsOnly;
				float ifLocalVar3474 = 0;
				UNITY_BRANCH 
				if( FriendsOnlyToggle3353 == 1.0 )
				ifLocalVar3474 = ( FriendsOnlyInvert3333 * 2.0 );
				else if( FriendsOnlyToggle3353 < 1.0 )
				ifLocalVar3474 = 1.0;
				clip( ( ifLocalVar3478 * ifLocalVar3474 ) - _AlphaCutoff);
				float4 appendResult1923 = (float4(( ifLocalVar3477 + Emission1285 + ( ( float3( 0.05,0.05,0.05 ) + temp_output_2287_0 ) * SpecularOut983 ) + ( ( temp_output_2287_0 + float3( 0.1,0.1,0.1 ) ) * float3( 2,2,2 ) * SparkleOut971 ) + ( ( temp_output_2287_0 + float3( 0.03,0.03,0.03 ) ) * ifLocalVar4110 ) ) , ( _Alpha * Alpha1262 )));
				
				
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
Version=18814
-1585;53;1544;856;1675.978;15.77966;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;1378;-5291.419,-1444.382;Inherit;False;2099.93;995.9517;;34;2150;1491;1406;1908;1910;1683;1682;1631;1630;1629;1684;1389;1381;1382;1380;1383;2017;1665;1905;1911;1879;1891;1890;2014;1589;1886;1551;1878;2152;2153;2154;2159;3408;3496;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;3408;-5095.741,-1016.958;Inherit;False;VertexLightData;-1;;584;d6cc1c00f5d200e45903717e6fa3d55c;0;0;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.CommentaryNode;1237;-7728.33,-609.5203;Inherit;False;2167.791;1518.161;;58;1856;1861;3089;3091;3090;3086;3087;965;3576;3088;3055;3462;1234;602;3451;603;3460;3596;3595;3594;3593;3598;3597;3599;962;1235;430;3494;3061;3013;2962;3062;2958;3014;3600;3432;2957;3059;3442;3461;428;3459;3495;3527;3458;3464;3644;3645;3646;3647;3648;3650;3678;3679;3735;3838;4079;4074;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-4678.689,-589.9489;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;3464;-6710.069,-565.8151;Inherit;False;Property;_NorDist;Normal Distance Modifier;39;0;Create;False;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3838;-6728.67,-494.0599;Inherit;False;View Distance;-1;;585;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,0,17,0;1;9;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3527;-6374.534,-386.5449;Inherit;False;Constant;_Dist_Null;Dist_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3458;-6376.828,-507.459;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-4549.958,-588.0564;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-4809.805,-650.7102;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3495;-6191.929,-556.696;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0.001;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-4394.352,-582.5276;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1890;-4260.185,-595.4229;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1891;-4286.67,-497.0497;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2014;-4479.556,-664.4249;Inherit;False;VertAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3459;-6007.008,-560.0701;Inherit;False;NormalDist;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-4645.182,-1000.228;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-4648.652,-729.092;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-4063.952,-625.4753;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-4649.208,-818.6528;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-7685.389,757.7861;Inherit;False;Property;_NormalPower;Normal Power;40;0;Create;True;0;0;0;False;0;False;0;0.333;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3461;-7629.829,831.462;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;281;-7411.466,-1454.344;Inherit;False;1841.337;637.1891;Uses directional light or uses the static light direction;21;3415;1296;5;1165;2215;1076;1233;1876;2635;633;3511;1247;248;249;252;251;1246;2148;1232;2147;3817;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-4649.126,-910.1819;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1911;-4134.607,-714.588;Inherit;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3059;-7688.899,-509.0777;Inherit;True;Property;_NormalMaskR;Normal Mask (R);44;1;[SingleLineTexture];Create;True;0;0;0;False;1;Space(5);False;-1;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2147;-7401.369,-1280.118;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-4369.804,-892.2656;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch;1905;-3884.856,-659.8777;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3442;-7256.624,790.1205;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2148;-7201.369,-1239.118;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3432;-7718.758,486.315;Inherit;False;0;2957;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;1683;-4166.408,-891.9243;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TexturePropertyNode;2957;-7723.159,295.0251;Inherit;True;Property;_Normal;Normal (N);36;1;[Normal];Create;False;0;0;0;False;2;Space(5);Header(.  Normal  .);False;None;3855b3126264f1b4bad2dc341abcbb3f;True;bump;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;4079;-7712.833,215.1496;Inherit;False;Property;_NormSSBias;SuperSample Bias;38;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-3626.314,-658.2737;Inherit;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;1910;-4024.013,-1018.613;Inherit;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;3820;-5471.558,15.06701;Inherit;False;1832.555;536.1137;LightDir Threshold;17;1560;2218;2213;2217;2216;1994;1480;2033;1297;2025;2035;2026;2034;2140;1490;2144;2121;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-7403.925,-1390.504;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.WireNode;3600;-7136.843,83.77792;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3014;-7619.328,602.824;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-7386.642,-947.4669;Float;False;Property;_StaticLightZ;Static Light Z;31;0;Create;True;0;0;0;False;0;False;0.44;0.44;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2962;-7371.675,371.9998;Inherit;False;Property;_NormSuperSample;SuperSample (expensive);37;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-6981.227,-1269.559;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2153;-5265.336,-1375.104;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;1908;-3821.434,-902.8346;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-7388.264,-1093.792;Float;False;Property;_StaticLightX;Static Light X;29;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;0.68;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3013;-7094.864,792.4774;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-7388.357,-1019.508;Float;False;Property;_StaticLightY;Static Light Y;30;0;Create;True;0;0;0;False;0;False;0.55;0.55;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4074;-7409.283,232.0128;Inherit;False;NormalTextureSuperSample;-1;;1574;c5e7d95f0a9b898419b29857c25ecde5;0;5;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;50;SAMPLERSTATE;0;False;28;FLOAT;0;False;49;FLOAT;1;False;4;FLOAT3;0;FLOAT;39;FLOAT;40;FLOAT;41
Node;AmplifyShaderEditor.WireNode;3062;-7115.82,457.8054;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2958;-7418.22,554.7494;Inherit;True;Property;_TextureSample1;Texture Sample 1;100;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;2121;-5415.258,429.4309;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;248;-7054.808,-1032.211;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-6835.54,-1313.321;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3494;-7047.402,384.6891;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2150;-5188.519,-1190.333;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-3536.261,-901.3746;Inherit;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3061;-6918.222,790.5927;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;633;-7075.844,-1148.831;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ComponentMaskNode;2154;-5049.439,-1301.602;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3511;-7068.286,-921.8339;Inherit;False;VR_Center_Eye;-1;;1575;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2144;-5158.812,422.2583;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2152;-5023.308,-1404.266;Inherit;False;Property;_LightMode;Lighting Mode;20;1;[Enum];Create;False;0;2;Surface;0;Object2World;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-5250.543,348.4393;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3819;-3218.194,-266.5444;Inherit;False;2029.574;515.1823;;19;1914;3332;3301;3325;1915;3331;2867;1916;1489;2870;1486;3169;3803;1484;3314;3416;2082;1408;2081;Light Colour;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;2635;-6744.678,-1012.548;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.3333,0.3333,0.3333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-6860.849,-1107.835;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2140;-4966.812,342.2583;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;2081;-3145.722,-217.2328;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-3185.898,5.113546;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ConditionalIfNode;3496;-4819.77,-1299.06;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;430;-6699.094,757.1844;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-6742.884,-1187.916;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2034;-4783.742,339.7534;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.33;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3599;-7699.925,-84.34311;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3416;-2940.36,91.25252;Inherit;False;GetBakedLight;-1;;1576;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.RegisterLocalVarNode;2017;-4842.559,-1075.229;Inherit;False;VertLightPos1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2082;-2883.502,-194.4638;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1076;-6571.878,-1102.656;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;1484;-2952.948,-112.4691;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ComponentMaskNode;3314;-3001.604,4.576536;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1235;-6333.925,588.3059;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;2159;-4657.881,-1302.249;Inherit;False;Lightmode;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-6014.439,588.3399;Inherit;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3415;-6408.596,-1000.766;Inherit;False;GetBakedLight;-1;;1577;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3169;-2685.018,91.01285;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1.3,1.3,1.3;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3679;-7512.629,-77.56461;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2215;-6400.543,-1096.879;Inherit;False;Dir_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3803;-2683.162,0.3914285;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-2687.314,-111.2172;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-4477.831,-1133.678;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3597;-7706.958,-12.19924;Inherit;False;Property;_NormalPowerSubSurface;Normal SubSurface;43;0;Create;False;0;0;0;False;0;False;0.5;0.333;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;2026;-4620.37,338.0211;Inherit;False;False;2;0;FLOAT;2;False;1;FLOAT;25;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2870;-2410.19,82.96565;Inherit;False;Property;_LightMultiplier;Light Multiplier;13;0;Create;True;1;;0;0;False;1;Header(. Lighting .);False;1.1;1.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3598;-7349.94,-58.5719;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-2470.434,-43.21778;Inherit;False;3;3;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-4364.35,-1226.253;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2035;-4456.742,309.7534;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1382;-4346.19,-1132.116;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3817;-6164.132,-1091.983;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-6395.934,-1173.43;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;5;-6006.522,-1172.504;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3650;-6660.679,-69.72693;Inherit;False;Property;_Spherize;Spherize SS Normal;56;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-4085.469,-1186.866;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2025;-4329.63,309.4951;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3593;-6595.414,151.4984;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-3934,-1111.508;Inherit;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;3645;-6635.356,9.856089;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1916;-2215.506,140.6451;Inherit;False;Property;_MinLight;Min Light;15;0;Create;True;0;0;0;False;0;False;0.05;0.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2867;-2190.514,47.6512;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TransformDirectionNode;3646;-6440.356,4.856089;Inherit;False;Object;World;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;3331;-1973.13,53.64534;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2033;-4189.742,309.7534;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3594;-6401.439,148.7454;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;2216;-4230.755,476.6841;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-5805.046,-1179.14;Inherit;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2217;-4228.138,413.6643;Inherit;False;2215;Dir_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;571;2177.812,311.4184;Inherit;False;1410.604;490.6661;;15;3333;1998;627;1999;351;1425;3335;3336;1424;349;3352;3353;3474;3499;3506;VRChat Friends-Only;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-3932.216,-1192.05;Inherit;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3735;-6420.638,-70.82031;Inherit;False;SphereizeVar;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4212.73,130.2954;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;349;2182.999,611.2747;Inherit;True;Property;_FriendsOnlyRT;> FriendsOnly RenderTexture;126;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;3325;-1812.272,18.14227;Inherit;False;Float3 Max;-1;;1578;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3585;-4419.437,-2866.456;Inherit;False;2639.568;1216.435;;37;3603;3604;3619;3605;3684;3610;3683;3657;3682;3743;3687;3608;3681;3742;3717;3686;3611;3797;3741;3720;3589;3740;3719;3798;3685;3733;3737;3736;3586;3588;3592;3739;3601;3587;3801;3802;3839;SubSurface;1,1,0,1;0;0
Node;AmplifyShaderEditor.LerpOp;2213;-3993.74,417.9181;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3644;-6125.324,19.69476;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4226.845,222.8561;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1915;-1755.056,-53.10443;Inherit;False;Property;_MaxLight;Max Light;14;0;Create;True;0;0;0;False;0;False;0.9;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;793;-1641.929,926.9338;Inherit;False;1930.734;909.7371;;28;1123;3288;1492;669;3281;645;3285;954;2976;3283;3287;1035;680;679;3282;662;641;642;811;3273;684;3271;646;3289;3290;3291;3502;3503;Soft Shading;0,0,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;3500;-3632.421,323.1929;Inherit;False;Constant;_Shading_Null;Shading_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3301;-1603.598,-7.135933;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;3595;-5959.139,20.30882;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1123;-1636.372,1591.877;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2218;-3839.579,413.1346;Inherit;False;FinalLightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1994;-3911.592,236.6205;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1058;-3622.957,205.0163;Inherit;False;Property;_UseShading;Use Shading;19;1;[ToggleUI];Create;True;1;;0;0;False;2;Space(5);Deader(.  Shadow  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3801;-4413.965,-1990.235;Inherit;False;2118.357;333.0564;Edge Correction;14;3702;3699;3700;3698;3703;3696;3710;3705;3694;3666;3721;3715;3724;3711;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1424;2469.958,638.8937;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3596;-5789.484,16.25903;Inherit;False;NormalSubSurface;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3696;-4403.149,-1893.913;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3552.435,421.752;Inherit;False;Property;_OffsetDot;Offset Dot;22;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2211;-3723.994,670.7645;Inherit;True;Property;_LightMask;Light Mask (R);27;1;[SingleLineTexture];Create;False;0;0;0;False;1;Space(5);False;-1;None;66766187ed71a06409060a3ebe98c30a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NegateNode;3289;-1433.102,1651.847;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3497;-3399.968,204.3857;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3263;-3616.327,868.3288;Float;False;Property;_LightMaskLevel;Mask Level;28;0;Create;False;0;0;0;False;0;False;1;1.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;573;-3218.757,579.1837;Inherit;False;1045.672;436.533;;9;979;1016;1010;1254;1008;4103;1118;4104;4105;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.WorldNormalVector;3703;-4396.229,-1821.065;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleDivideOpNode;3332;-1500.13,159.6453;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3336;2565.578,625.4047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;642;-1304.77,1705.931;Inherit;False;Property;_SoftPower;Soft Power;49;0;Create;True;0;0;0;False;0;False;0.75;0.5;0.5;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4105;-3190.46,623.5242;Float;False;Property;_ShadowSharpness;Shadow Sharpness;23;0;Create;True;0;0;0;False;0;False;20;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3058.179,382.5783;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwitchByFaceNode;3288;-1314.471,1596.851;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3698;-4187.824,-1844.532;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3839;-4401.611,-2070.522;Inherit;False;View Distance;-1;;1579;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,1,17,0;1;9;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;641;-1296.038,1518.301;Inherit;False;Property;_SoftScale;Soft Scale;50;0;Create;True;0;0;0;False;0;False;1;1;0.5;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3262;-3389.2,679.225;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3587;-4398.95,-2265.431;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3335;2273.578,574.4047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3601;-4403.153,-2175.77;Inherit;False;3596;NormalSubSurface;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-1318.895,106.9727;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3592;-4165.07,-2266.496;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1492;-1232.602,1439.593;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3710;-3757.628,-1951.693;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1425;2300.324,531.0254;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;3699;-3973.37,-1772.732;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-2936.011,629.959;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3270;-1178.349,70.11365;Inherit;False;AllLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;3739;-4406.354,-2740.896;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4104;-3198.46,752.2241;Float;False;Property;_ShadowPower;Shadow Power;24;0;Create;True;0;0;0;False;0;False;1;0.8;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;3700;-4021.668,-1925.66;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FresnelNode;662;-834.0081,1611.142;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;351;2444.413,530.424;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;3702;-3623.497,-1871.635;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3271;-1465.254,1039.115;Inherit;False;3270;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4103;-2794.361,727.1241;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;645;-834.9511,1434.781;Inherit;False;Standard;WorldNormal;LightDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3733;-4410.202,-2597.916;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;3586;-4397.655,-2410.542;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;1008;-3150.637,839.551;Inherit;False;Property;_ShadowColour;Shadow Colour;21;0;Create;True;0;0;0;False;0;False;0.7098039,0.7098039,0.7098039,1;0.8,0.8,0.8,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;646;-1461.741,1222.885;Inherit;False;Property;_ShadeColour;Shade Colour;47;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TransformDirectionNode;3737;-4173.602,-2747.198;Inherit;False;Object;World;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;3711;-3613.628,-1951.693;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3282;-610.3141,1611.195;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3736;-4154.609,-2557.625;Inherit;False;3735;SphereizeVar;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;3588;-4057.372,-2329.529;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3798;-3616.474,-2445.101;Inherit;False;Property;_OffsetSS;Offset;52;0;Create;False;0;0;0;False;0;False;0;-0.1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;3589;-3871.028,-2386.991;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3685;-4406.126,-2823.562;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1254;-2650.739,730.9539;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2832.745,846.2195;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3705;-3407.551,-1950.063;Inherit;False;3;3;0;FLOAT;1;False;1;FLOAT;0.3;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3273;-1288.745,1039.086;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;627;2677.13,521.6781;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3567;-1133.719,222.6608;Inherit;False;1140.277;405.8864;Light Saturation Bias;13;3551;3566;3553;3564;3255;3558;3120;2093;3557;3253;3326;3554;3552;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1999;2553.491,446.0493;Inherit;False;Property;_FriendsOnly1;Invert Friends Only;127;0;Create;False;0;0;0;False;3;Toggle(_);;;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;811;-1259.262,1222.301;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;3719;-4050.716,-2165.476;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3291;-469.1021,1611.847;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;3740;-3916.904,-2738.603;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3281;-616.9593,1436.208;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1035;-613.3292,1144.24;Inherit;False;Property;_ShadeColorDynamic;ShadeColor Dynamic;46;1;[Enum];Create;True;0;2;FixedColour;0;LightColour;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;679;-833.7531,1231.946;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3552;-1074.829,383.7633;Inherit;False;Float3 Min;-1;;1581;61474a8b2b91ea8409c96a71133ac9bc;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;680;-820.837,1017.662;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3741;-3754.183,-2800.033;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3290;-318.1021,1397.847;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1016;-2511.515,856.5878;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3506;2853.668,478.1191;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3797;-3600.132,-2364.219;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3694;-3253.336,-1952.249;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3818;-2969.361,-1469.866;Inherit;False;2077.226;1028.437;;21;1262;2993;19;812;813;3504;18;3475;3348;3476;2988;3345;3338;2984;3466;3340;3431;3343;2982;3430;4078;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.PowerNode;3720;-3831.539,-2168.483;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1470;-2370.866,382.0723;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4078;-2775.505,-882.7297;Inherit;False;Property;_TexSSBias;SuperSample Bias;6;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3431;-2950.245,-1050.092;Inherit;False;0;3343;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ConditionalIfNode;3502;-384.7433,1145.886;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;3686;-3636.627,-2797.162;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3742;-3560.069,-2541.843;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-2373.802,851.8518;Inherit;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2982;-2893.645,-789.0926;Inherit;True;Property;_MainTex;Texture (RGB,A);4;0;Create;False;1;;0;0;False;1;Header(.  Main  .);False;None;e3a2159bb5238584c8ee9ace5502e4a7;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;3343;-2944.342,-1242.078;Inherit;True;Property;_MainTexFriends;FriendsOnly Texture (RGB,A);129;0;Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SaturateNode;3666;-3102.478,-1952.808;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3326;-1032.638,299.8147;Inherit;False;Float3 Max;-1;;1582;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3717;-3417.939,-2322.644;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3333;3007.626,473.3551;Inherit;False;FriendsOnlyInvert;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3287;-184.4241,1398.014;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3554;-878.9614,383.1028;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-2422.695,452.5153;Inherit;False;Property;_ShadowDarkness;Shadow Darkness;25;0;Create;True;0;0;0;False;0;False;0.22;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;684;-273.9559,1518.556;Float;False;Property;_ShadeLevel;Shade Level;48;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3611;-3514.83,-2229.702;Float;False;Property;_SSIntensity;SubSurface Intensity;53;0;Create;False;0;0;0;False;0;False;5;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3430;-2538.095,-585.567;Inherit;False;0;2982;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;2093;-825.1577,298.775;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;669;11.15326,1433.523;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.618;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3120;-937.0833,454.5085;Inherit;False;Property;_LightSatLimiter;Light Saturation Limiter;16;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;3721;-2895.676,-1952.764;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.075;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2336.51,308.7788;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;3345;-2579.982,-1242.16;Inherit;True;Property;_TextureSample4;Texture Sample 4;101;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3283;-218.424,1247.014;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2186.292,395.4066;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3557;-743.9614,383.1028;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4075;-2244.245,-787.4926;Inherit;False;TextureSuperSample;-1;;1586;23a6a6e8fbe28134cac41513630794b1;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;48;SAMPLERSTATE;0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.RangedFloatNode;3681;-3297.63,-2689.209;Inherit;False;Property;_SSTransmission;Transmission;55;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2984;-2246.845,-627.4925;Inherit;True;Property;_TextureSample7;Texture Sample 7;101;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2988;-2237.213,-861.8774;Inherit;False;Property;_TexSuperSample;SuperSample (expensive);5;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3253;-944.6758,534.3596;Inherit;False;Property;_LightSatTotal;Light Saturation Max;17;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4076;-2512.551,-1044.358;Inherit;False;TextureSuperSample;-1;;1585;23a6a6e8fbe28134cac41513630794b1;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;48;SAMPLERSTATE;0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.DotProductOpNode;3687;-3504.539,-2800.726;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3608;-3212.929,-2297.616;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3340;-2072.582,-1361.17;Inherit;False;Property;_FriendsOnlyTexture;Friends Only Texture;128;0;Create;True;0;0;0;False;2;Toggle(_);Space(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3466;-2411.623,-1324.718;Inherit;False;Property;_FriendsSuperSample;SuperSample (expensive);130;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3338;-2079.044,-1289.025;Inherit;False;3333;FriendsOnlyInvert;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3715;-2665.435,-1950.767;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3564;-688.6791,297.944;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;3743;-3016.827,-2309.647;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1E-05;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3285;126.576,1235.014;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3558;-551.6614,378.3028;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3475;-2061.91,-1118.867;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;3255;-722.8646,539.6962;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;954;-169.967,1089.07;Inherit;False;Constant;_Shade_Null;Shade_Null;65;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3348;-1750.853,-1332.781;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3476;-1879.57,-834.4084;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3682;-3009.875,-2766.819;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2976;-183.9426,1011.009;Inherit;False;Property;_ShadeEnable;Shade Enable;45;1;[ToggleUI];Create;True;0;2;FixedColour;0;LightColour;1;0;False;2;Space(5);Header(.  Soft Shading  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-1880.116,355.17;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3460;-7655.209,74.34177;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3657;-2857.107,-2518.744;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3724;-2429.098,-1958.131;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3553;-369.5294,317.9633;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;18;-1678.497,-678.9232;Float;False;Property;_Color;> Color;7;1;[HDR];Create;True;0;0;0;False;1;Space(5);False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ConditionalIfNode;3504;-1652.876,-964.0024;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ConditionalIfNode;3503;114.7852,969.2263;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3566;-570.4897,538.5253;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;30;-1140.387,638.8184;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3683;-2844.423,-2590.256;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3802;-2301.676,-2015.799;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1500;333.6703,648.8381;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3684;-2692.423,-2587.256;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3610;-2771.49,-2684.485;Inherit;False;Property;_SSBrightness;SubSurface Brightness;54;0;Create;False;0;0;0;False;0;False;2;8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-1433.959,-678.3693;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-7621.75,141.4118;Inherit;False;Property;_NormalPowerSpecular;Normal Specular;41;0;Create;False;0;0;0;False;0;False;0.5;0.75;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3678;-7461.589,76.07526;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-1448.893,-894.3154;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;3551;-186.5141,321.9888;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1347;-973.6296,-417.7522;Inherit;False;1534.475;525.8724;hue & saturation;12;585;1330;581;2917;2911;2908;2918;325;2910;3241;3244;3249;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3451;-7251.927,100.289;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3619;-2486.882,-2623.353;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1069.535,-877.8381;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1777;68.71701,152.1802;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3605;-2357.198,-2740.345;Inherit;False;Property;_UseSubSurface;Use SubSurface;51;1;[ToggleUI];Create;True;0;2;Surface;0;Object2World;1;0;False;2;Space(5);Header(. SubSurface Light .);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2289;457.3221,643.5714;Inherit;False;LightShaded;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RGBToHSVNode;2909;-716.3676,-628.6263;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ConditionalIfNode;3604;-2142.84,-2730.113;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;703.9747,626.15;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;602;-6576.991,423.3041;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;569;-7423.754,-3321.559;Inherit;False;2937.823;1659.745;;76;3179;3182;3174;3177;3181;2002;3101;983;560;696;824;701;695;3072;3069;3104;3085;3064;3103;2301;3068;3081;3080;3067;3075;690;2234;1920;838;691;816;3079;2294;837;817;1921;3057;3056;554;1919;561;545;2905;556;2900;555;551;553;2899;1051;1783;967;2898;1928;2236;546;2219;1909;2225;3251;3407;3437;3438;3482;3483;3489;3490;3491;3492;3493;3529;3520;3521;3512;3531;4118;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2910;-803.9288,-364.1082;Inherit;False;Property;_Hue;Hue;8;0;Create;True;0;0;0;False;0;False;0;0.995;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;848.3743,620.0181;Inherit;False;LightColour;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1234;-6362.724,444.8207;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;3603;-1980.609,-2737.702;Inherit;False;SubSurface;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3512;-7371.894,-3066.832;Inherit;False;VR_Center_Eye;-1;;1587;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.GetLocalVarNode;1330;-894.7972,-124.3827;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2911;-434.4628,-331.2577;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-7353.58,-3211.792;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;325;-951.03,-274.2717;Float;False;Property;_Saturation;Saturation;9;0;Create;True;0;0;0;False;0;False;1;1;-2;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2225;-7360.58,-3291.792;Inherit;False;Property;_StereoFixSpec;Stereo Converge (flatten);62;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-929.3052,-37.33464;Inherit;False;Property;_ShadowSaturation;Shadow Saturation;26;0;Create;True;0;0;0;False;0;False;0.85;1;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3244;-599.8806,-120.5177;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;3055;-6174.857,446.6305;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.HSVToRGBNode;2908;-205.8781,-322.6284;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;2918;-634.3347,-223.8553;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3799;1054.92,404.4882;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;3249;-604.4844,-31.81404;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3529;-6924.71,-3321.424;Inherit;False;199;135;blinn-phong;1;2237;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;3088;-6980.507,-304.1641;Inherit;False;Property;_NormalPowerMatCap;Normal MatCap;42;0;Create;False;0;0;0;False;0;False;0.5;0.75;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2219;-7378.58,-2972.792;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3462;-6968.459,-230.0092;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3493;-7094.858,-3287.974;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3648;-6845.757,-100.3173;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3576;-7011.975,-178.3918;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3607;1001.601,332.3544;Inherit;False;3603;SubSurface;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;2917;101.1179,-185.2206;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3569;904.3232,217.3129;Inherit;False;Property;_DisableLight;Unlit (warning - disables all light);18;1;[ToggleUI];Create;False;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3647;-6553.757,-132.3173;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-6899.917,-3066.231;Inherit;False;Property;_SpecularSize;Specular Size;58;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-6020.232,439.7637;Inherit;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;393;-249.2973,-1286.792;Inherit;False;1847.51;780.355;;26;1537;1284;1281;388;390;372;383;370;1291;382;384;1290;379;376;360;2299;2300;3505;368;369;1536;1533;1530;1534;3773;3940;Rim/Outline;1,0.141,0.141,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2237;-6891.58,-3279.792;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3617;1211.368,346.4321;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3241;-342.8801,-70.51768;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3087;-6669.947,-239.3187;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3086;-6454.38,-244.5707;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2898;-7406.962,-2564.661;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-6797.411,-3163.465;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1534;-233.7685,-1158.188;Inherit;False;Property;_Scale1;Rim Normal Power;105;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-6729.58,-3282.792;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3643;1351.192,347.2688;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1928;-7406.962,-2482.844;Inherit;False;Property;_StereoFixSpecCap;Stereo Converge (flatten);65;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1530;-234.8218,-1243.55;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1537;-216.4528,-985.8127;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2236;-6621.095,-3090.219;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3574;1194.182,218.3409;Inherit;False;isUnlit;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;581;384.9778,-6.735202;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;967;-7406.962,-2404.662;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2905;-7016.096,-2593.381;Inherit;False;Property;_Legacy2;Legacy;70;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;551;-6573.517,-3284.678;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3090;-6303.404,-243.3238;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;3074;1086.244,126.0905;Inherit;False;MaintexRGB;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3521;-7114.961,-2520.661;Inherit;False;Matcap (legacy);-1;;1590;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;3568;1490.085,247.9405;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1533;-213.9822,-1078.708;Inherit;False;Property;_RimNormal;Rim Normal;104;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-6412.871,-3114.979;Inherit;False;Property;_SpecularStrength;Specular Strength;59;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ExpOpNode;553;-6534.062,-3172.357;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3520;-7111.496,-2425.061;Inherit;False;VR MatCap;-1;;1588;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;1536;89.8206,-1219.545;Inherit;False;3;0;FLOAT3;0.5,0.5,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3505;51.23543,-1073.101;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3077;1654.051,179.084;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-6417.823,-3027.196;Inherit;False;Property;_SpecularOpacity;Specular Opacity;57;0;Create;True;0;0;0;False;2;Space(5);Header(.  Specular  .);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;3091;-6117.254,-240.874;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2899;-7394.246,-2761.997;Inherit;True;Property;_SpecularMatcap;Specular Matcap (RGB);64;0;Create;False;0;0;0;False;0;False;None;252c4088d408e2b4aa3f0fd60f94e38b;False;black;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.PowerNode;556;-6192.413,-3168.108;Inherit;False;True;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;545;-6430.459,-3283.228;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;368;42.77901,-816.6483;Inherit;False;Property;_Power;Rim Power;100;0;Create;False;0;0;0;False;0;False;0;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3491;-6766.666,-2539.701;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;369;28.54083,-908.2149;Inherit;False;Property;_Scale;Rim Scale;101;0;Create;False;0;0;0;False;0;False;0;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;360;235.6319,-1073.383;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;437;616.6837,1064.665;Inherit;False;2518.223;840.2;Comment;35;3264;3266;3109;1274;405;414;807;1278;2180;1279;406;1516;1517;407;408;2920;1518;810;2919;2175;2166;2210;2181;2207;2208;2209;963;1930;2873;3268;3528;3524;3523;4087;4088;Matcap > Alpha Supported;0.8221117,0.184,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3796;1890.35,178.912;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.0001,0.0001,0.0001;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;3056;-6110.698,-3047.861;Inherit;False;True;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2300;291.2249,-822.2711;Inherit;False;Property;_Max;Rim Max;103;0;Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-6131.583,-3273.962;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2900;-6605.563,-2566.707;Inherit;True;Property;_TextureSample3;Texture Sample 3;90;0;Create;True;0;0;0;False;0;False;349;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1919;-6475.587,-2377.605;Inherit;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;67;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3089;-5947.601,-244.9239;Inherit;False;NormalMatCap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;376;258.5829,-1246.025;Inherit;False;Property;_RimOutlineColour;Rim/Outline Colour;97;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.6544117,0.3560734,0.448663,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2299;264.225,-903.2711;Inherit;False;Property;_Min;Rim Min;102;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3179;-6263.754,-2122.963;Inherit;False;Property;_ProbeSmoothness;Probe Smoothness;74;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2873;665.4427,1378.15;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;837;-6418.35,-2807.323;Inherit;False;Property;_SpecMatCapColor;SpecMatCap Colour;68;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;0.5,0.5,0.5,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;3177;-6272.247,-2189.039;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;384;341.9415,-662.4603;Inherit;False;Property;_Amount;Rim Opacity;99;0;Create;False;0;0;0;False;0;False;0;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;2294;-6004.66,-3247.322;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.0001;False;2;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1930;639.9877,1496.31;Inherit;False;Property;_StereoFix;Stereo Converge (flatten);108;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1921;-6213.728,-2440.98;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;2021.824,174.6748;Inherit;False;PostDesaturation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;379;459.2831,-1073.074;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2209;839.3574,1750.81;Inherit;False;Property;_MatcapSpin;MatcapSpin;112;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;817;-6297.826,-2561.489;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3057;-5977.407,-3121.861;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3840;275.8679,-738.7574;Inherit;False;Fresnel Edge Pixel Fix;-1;;1592;e37ec5be3c94a1b4e99e2c04f776c418;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;963;667.873,1593.267;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;3940;501.0678,-1246.686;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3079;-5651.951,-3049.309;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IndirectSpecularLight;3174;-6039.723,-2179.567;Inherit;False;World;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3524;908.5381,1381.841;Inherit;False;Matcap (legacy);-1;;1601;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3773;588.0085,-804.9855;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;684.6137,-683.9471;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-6043.745,-2551.193;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3523;916.053,1597.406;Inherit;False;VR MatCap;-1;;1599;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-6415.628,-2637.726;Inherit;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;66;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;838;-6187.736,-2802.65;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;2208;1041.131,1714.177;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;739.7065,-1145.533;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;816;-5845.764,-3254.976;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2002;-5915.747,-2783.425;Inherit;False;Property;_UseSpecularMatCap;Use Specular MatCap;63;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(. Specular Overlay);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;370;900.0287,-800.0839;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1291;761.5031,-1223.905;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-5824.62,-2710.346;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;2207;1226.643,1596.886;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Compare;3531;-5686.679,-2192.048;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0.001,0.001,0.001;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3075;-5455.703,-2977.125;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;2234;-5709.318,-3253.997;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;2210;1161.791,1383.942;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;383;737.9038,-1050.424;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2166;1216.985,1303.037;Inherit;False;Property;_Legacy;Legacy;114;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3080;-5465.273,-3050.527;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;3067;-5383.923,-3275.245;Inherit;False;Property;_SpecMatCapColor1;Specular Colour;60;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1295;1909.84,-2190.196;Inherit;False;1534.433;513.8026;;15;450;331;330;329;326;805;462;461;327;808;970;328;1285;3260;3433;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.Compare;4118;-5483.397,-2260.353;Inherit;False;3;4;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;390;1129.204,-949.8493;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;388;1131.605,-824.6456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3182;-5463.974,-2091.045;Inherit;False;Property;_ReflectionOpacity;Reflection Opacity;75;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3433;1924.85,-1947.031;Inherit;False;0;328;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;2301;-5378.209,-3116.002;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3492;-5660.876,-2777.459;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2181;676.4752,1125.57;Inherit;True;Property;_Matcap;Matcap (RGB,A);107;0;Create;False;0;0;0;False;0;False;None;8f02e7ba8527b3749bd170e9445019a2;False;black;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.LerpOp;372;1127.13,-1124.279;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3103;-5773.161,-2421.135;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1518;2330.894,1400.255;Float;False;Property;_MatcapSaturation;Matcap Saturation;111;0;Create;True;0;0;0;False;0;False;1;0.25;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3068;-5175.13,-3275.076;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3528;1384.281,1345.644;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1281;1412.327,-944.0667;Inherit;False;Property;_RimMode;Rim Mode;98;1;[Enum];Create;True;0;3;Blend_Lerp;0;Multiply;1;AddSubtract;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3081;-5241.773,-3040.727;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3101;-5482.85,-2570.957;Inherit;False;Property;_SpecMatCapMode;SpecMatCap Mode;69;1;[Enum];Create;True;0;2;Additive;0;Multiplied;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3064;-5129.369,-3140.203;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;1284;1400.899,-872.0556;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3181;-5427.921,-2346.518;Inherit;False;Property;_UseReflection;Use Reflection;73;1;[ToggleUI];Create;False;0;0;0;False;2;Space(5);Header(. Reflection Probe);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3104;-5528.697,-2443.564;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3407;-5219.953,-2258.392;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;328;1925.321,-2142.749;Inherit;True;Property;_Emission;Emission Map (RGB,A);32;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;3085;-5066.336,-3024.831;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;2919;1869.213,1376.165;Inherit;False;Property;_MatCapColor;MatCap Colour;113;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;1517;2596.298,1406.693;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;1652.201,-773.5391;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2175;1559.9,1240.226;Inherit;True;Property;_TextureSample0;Texture Sample 0;90;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1514;1679.954,-914.5024;Inherit;False;Property;_UseRim;Use Rim;96;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(.  Rim Fresnel  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3483;-5083.931,-2336.049;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4088;2721.615,1382.797;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2920;2094.501,1376.667;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3072;-4978.443,-3181.377;Inherit;False;Property;_SpecMode;Specular Mode;61;1;[Enum];Create;False;0;2;Additive;0;Multiplied;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3069;-4920.877,-3070.181;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;20,20,20;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3507;1892.87,-888.715;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;408;1978.307,1246.997;Inherit;False;Property;_MatcapIntensity;Matcap Intensity;110;0;Create;True;0;0;0;False;0;False;0;3.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3489;-5223.711,-2569.214;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;2209.295,-2142.582;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;810;1936.337,1128.838;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;3109;2186.933,1643.783;Inherit;True;Property;_MatCapMask;MatCap Mask (R,A);115;1;[SingleLineTexture];Create;False;0;0;0;False;1;Space(5);False;-1;None;0f3e5cdcbe145e0408e97d9eae75bacf;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3264;2315.386,1832.009;Float;False;Property;_MatcapMaskLevel1;Mask Level;116;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3266;2480.27,1673.178;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3260;2403,-2137.256;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3137;2261.639,-150.317;Inherit;False;832.0293;300.472;MirrorSystem;6;3159;3142;3140;3429;3478;3498;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ConditionalIfNode;3482;-4757.191,-3185.281;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;695;-5523.832,-1852.202;Inherit;True;Property;_SpecularMask;Specular MatCap Mask (R,A);72;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;701;-4918.888,-2363.373;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;970;2256.281,-2023.713;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;870;-4410.912,-3313.317;Inherit;False;904.2734;277.1521;;5;3582;2003;971;3473;3943;Sparkle/Shimmer Effect;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;824;-5448.703,-1922.01;Inherit;False;Property;_SpecMaskOpacity;SpecMatcap Level;71;0;Create;False;0;0;0;False;1;Space(10);False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1998;2624.466,358.3426;Inherit;False;Property;_FriendsOnly;Friends Only ON/OFF;125;1;[ToggleUI];Create;False;0;0;0;False;2;Space(20);Header(VRC Friends Only);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1292;2061.107,-885.887;Inherit;False;PostRimLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;2218.166,1227.171;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4087;2349.268,1331.051;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3352;3244.758,481.1561;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3142;2289.135,22.34352;Inherit;False;Property;_IsNotMirror;Not Mirror;133;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;-5230.516,-1841.346;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3438;-4532.553,-3034.081;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1516;2375.548,1257.198;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3943;-4392.067,-3127.301;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2180;1865.78,1542.556;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3268;2637.791,1649.218;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1279;2181.806,1118.502;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;2511.781,-2041.615;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3582;-4392.924,-3198.841;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;461;2262.026,-1945.993;Inherit;False;Property;_ShadedEmission;Shaded Emission;35;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;406;2456.53,1572.698;Inherit;False;Property;_MatcapOpacity;Matcap Opacity;109;0;Create;True;0;0;0;False;0;False;5;0.55;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2264;1605.616,-686.7376;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3499;3181.238,572.9218;Inherit;False;Constant;_FriendsOnly_Null;FriendsOnly_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;2379.667,-1853.771;Float;False;Property;_EmissionColor;Emission Colour;33;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3140;2291.46,-59.49275;Inherit;False;Property;_IsInMirror;In Mirror;132;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3490;-5065.615,-1947.604;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3353;3011.123,358.4993;Inherit;False;FriendsOnlyToggle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2003;-4174.041,-3260.295;Inherit;False;Property;_UseSparkleShimmer;Use Sparkle/Shimmer;76;1;[ToggleUI];Create;True;0;0;0;False;3;Space(5);Header(.  Sparkles  .);;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4081;-4163.988,-3187.792;Inherit;False;Aria Sparkles Include;77;;1615;fe78986b6250d1d46955dfaed2c4e629;0;2;97;FLOAT3;0,0,0;False;156;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1278;2466.058,1099.732;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;2570.741,1207.257;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;805;2613.223,-1855.075;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;2291;1788.852,-681.9444;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3498;2703.011,76.12132;Inherit;False;Constant;_Camera_Null;Camera_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;450;2690.673,-2057.197;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;807;2792.138,1475.301;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3437;-4839.437,-1944.771;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3474;3425.813,363.3008;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;326;2607.619,-1765.938;Float;False;Property;_EmissionIntensity;Emission Intensity;34;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3429;2570.505,-23.35453;Inherit;False;VRCMirrorToggle;-1;;1614;906fee1dc8310a745a0658d5f2fa3fb4;0;2;5;INT;1;False;6;INT;1;False;1;INT;7
Node;AmplifyShaderEditor.LerpOp;560;-4962.001,-1864.492;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3159;2682.613,-102.2146;Inherit;False;Property;_MirrorSystem;Use Mirror System;131;1;[ToggleUI];Create;False;0;0;0;False;2;Space(10);Header(Mirror);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;2874.176,-1897.845;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3251;-4810.718,-1915.51;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2287;1967.472,-687.7989;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3473;-3918.031,-3256.893;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;330;2861.451,-1758.286;Float;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3478;2916.37,-71.03625;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;INT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2993;-1447.967,-988.331;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3147;3589.668,297.439;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;405;2731.199,1149.914;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4109;1791.498,-365.4897;Inherit;False;Property;_UseParallax;Use Parallax;117;0;Create;True;0;0;0;False;3;Toggle(_);Space(10);Header(.  Parallax  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4116;2149.498,-420.4897;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;971;-3736.353,-3256.558;Inherit;False;SparkleOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;4115;1734.248,-291.7196;Inherit;False;Aria Parallax Include;118;;1623;972a5d25f3151a4479be2dcc9b9e75fa;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1274;2929.248,1145.099;Inherit;False;PostMatcap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;-1249.882,-989.2386;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;331;3055.07,-1856.883;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;-4692.586,-1921.291;Inherit;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3144;3182.924,-73.7593;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;1955.717,-597.9395;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;3209.339,-1854.897;Inherit;False;Emission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3252;2194.56,-706.762;Inherit;False;2;2;0;FLOAT3;0.05,0.05,0.05;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3146;3323.789,-102.5296;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;334;2518.35,-332.3355;Inherit;False;Property;_Alpha;Alpha;11;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3956;2265.263,-587.0474;Inherit;False;2;2;0;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;2615.134,-257.2882;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1702;2186.417,-491.9396;Inherit;False;971;SparkleOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4117;2214.498,-410.4897;Inherit;False;2;2;0;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0.03,0.03,0.03;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;4110;1978.498,-360.4897;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2163;2154.116,-958.5033;Inherit;False;1274;PostMatcap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1021;2189.922,-1039.942;Inherit;False;Property;_UseMatcap;Use Matcap;106;1;[ToggleUI];Create;True;0;0;0;False;2;Space(10);Header(.  MatCap  .);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3477;2403.014,-993.9476;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;2836.388,-239.4168;Inherit;False;Property;_AlphaCutoff;Alpha Cutoff;12;0;Create;False;0;0;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;2827.451,-339.5501;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3955;2415.263,-542.0474;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2284;2332.472,-683.7989;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1294;2378.346,-773.6125;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3145;3126.082,-308.9708;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4084;2354.149,-387.397;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2807.245,-579.6193;Inherit;False;5;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClipNode;1430;3137.46,-463.9726;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1346;2859.333,-1342.923;Inherit;False;670.9946;746.3742;custom properties;13;1345;1335;1344;1342;1431;1340;1339;1337;1432;1343;1338;1341;1469;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1344;2882.237,-914.3182;Float;False;Property;_ZTestMode;ZTestMode (LEqual);135;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;2882.479,-1280.823;Half;False;Property;_StencilRef;Stencil ID;136;0;Create;False;0;0;0;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1340;3181.625,-1281.015;Inherit;False;Property;_StencilComparison;Stencil Comparison;139;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;3098;3608.803,-1048.708;Inherit;False;Property;_VRCFallbackDoublesided;VRC Fallback Doublesided;2;0;Create;True;0;0;0;True;2;Toggle(TINTED_OUTLINE);Space(10);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1560;-3915.225,78.05922;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.005;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3269;3610.792,-886.0767;Inherit;False;Property;_Cutoff;Fallback Cutoff;3;1;[Enum];Create;False;0;2;Visible;0;Invisible;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1343;3201.625,-1061.015;Inherit;False;Property;_StencilZFail;StencilZFail;142;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-6357.534,358.1386;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1469;2892.559,-694.9409;Inherit;False;Property;_AlphaToCoverage;AlphaToCoverage (override alpha);10;1;[ToggleUI];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;2875.299,-1112.257;Half;False;Property;_WriteMask;WriteMask (non-zero);137;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;2876.299,-1194.834;Half;False;Property;_ReadMask;ReadMask (non-zero);138;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1341;3206.338,-1208.357;Inherit;False;Property;_StencilOp;StencilOp;140;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;3099;3610.803,-975.708;Inherit;False;Property;_outline_width;_outline_width;1;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3151.765,-825.441;Inherit;False;Property;_DstBlend;Destination Blend (Zero);144;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1342;3202.625,-1136.015;Inherit;False;Property;_StencilFail;StencilFail;141;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1335;3215.875,-918.9951;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-6367.268,732.9191;Inherit;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1431;2886.58,-820.4198;Inherit;False;Property;_SrcBlend;Source Blend (One);143;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;2886.308,-1002.382;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);134;1;[ToggleUI];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1923;3354.73,-577.434;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1924;3771.631,-578.6443;Float;False;True;-1;2;ASEMaterialInspector;0;1;.GenesisAria/Arias VertexLit Shader;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;VertexLit;2;False;True;1;1;True;1431;0;True;1432;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;True;1469;False;True;0;True;1335;True;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;True;255;True;1337;255;True;1338;255;True;1339;7;True;1340;1;True;1341;1;True;1342;1;True;1343;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;1345;True;3;True;1344;True;False;0;False;-1;0;False;-1;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;7;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;Legacy Shaders/Transparent/Cutout/VertexLit;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;1878;0;3408;16
WireConnection;1878;1;3408;17
WireConnection;1878;2;3408;18
WireConnection;1878;3;3408;20
WireConnection;3458;0;3838;0
WireConnection;3458;2;3464;0
WireConnection;1551;0;1878;0
WireConnection;1886;0;3408;23
WireConnection;1886;1;3408;29
WireConnection;1886;2;3408;30
WireConnection;1886;3;3408;31
WireConnection;3495;0;3464;0
WireConnection;3495;2;3458;0
WireConnection;3495;3;3458;0
WireConnection;3495;4;3527;0
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;1890;0;1589;0
WireConnection;1891;0;1551;3
WireConnection;2014;0;1886;0
WireConnection;3459;0;3495;0
WireConnection;1629;0;3408;16
WireConnection;1629;1;3408;23
WireConnection;1684;0;3408;20
WireConnection;1684;1;3408;31
WireConnection;1879;0;2014;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;1631;0;3408;18
WireConnection;1631;1;3408;30
WireConnection;1630;0;3408;17
WireConnection;1630;1;3408;29
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;3442;0;428;0
WireConnection;3442;1;3461;0
WireConnection;2148;0;2147;0
WireConnection;1683;0;1682;0
WireConnection;1665;0;1905;0
WireConnection;3600;0;3059;1
WireConnection;3014;0;3442;0
WireConnection;1246;0;1232;2
WireConnection;1246;1;2148;0
WireConnection;1908;1;1910;0
WireConnection;1908;0;1683;0
WireConnection;3013;0;3442;0
WireConnection;4074;4;3432;0
WireConnection;4074;1;2957;0
WireConnection;4074;28;4079;0
WireConnection;4074;49;3014;0
WireConnection;3062;0;3600;0
WireConnection;2958;0;2957;0
WireConnection;2958;1;3432;0
WireConnection;2958;5;3014;0
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;3494;0;2962;0
WireConnection;3494;3;4074;0
WireConnection;3494;4;2958;0
WireConnection;1406;0;1908;0
WireConnection;3061;0;3062;0
WireConnection;3061;1;3013;0
WireConnection;2154;0;2153;0
WireConnection;2144;0;2121;0
WireConnection;2635;0;248;0
WireConnection;2635;1;3511;2
WireConnection;1876;0;633;1
WireConnection;1876;1;633;2
WireConnection;2140;0;2121;0
WireConnection;2140;1;1490;0
WireConnection;2140;2;2144;0
WireConnection;3496;0;2152;0
WireConnection;3496;3;2154;0
WireConnection;3496;4;2150;0
WireConnection;430;1;3494;0
WireConnection;430;2;3061;0
WireConnection;1233;0;1247;0
WireConnection;2034;0;2140;0
WireConnection;2017;0;3408;0
WireConnection;2082;0;2081;2
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;2635;0
WireConnection;3314;0;1408;0
WireConnection;1235;0;430;0
WireConnection;2159;0;3496;0
WireConnection;962;0;1235;0
WireConnection;3169;0;3416;0
WireConnection;3679;0;3599;0
WireConnection;2215;0;1076;0
WireConnection;3803;0;3314;0
WireConnection;3803;1;2082;0
WireConnection;1486;0;1484;1
WireConnection;1486;1;1484;2
WireConnection;1486;2;2082;0
WireConnection;1383;0;2017;0
WireConnection;1383;1;2159;0
WireConnection;2026;0;2034;0
WireConnection;3598;0;3059;1
WireConnection;3598;1;3679;0
WireConnection;3598;2;3597;0
WireConnection;1489;0;1486;0
WireConnection;1489;1;3803;0
WireConnection;1489;2;3169;0
WireConnection;2035;1;2026;0
WireConnection;1382;0;1383;0
WireConnection;3817;0;2215;0
WireConnection;3817;1;3415;7
WireConnection;5;0;1165;0
WireConnection;5;1;3817;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;2025;0;2035;0
WireConnection;3593;1;3494;0
WireConnection;3593;2;3598;0
WireConnection;1491;0;1382;0
WireConnection;2867;0;1489;0
WireConnection;2867;1;2870;0
WireConnection;3646;0;3645;0
WireConnection;3331;0;2867;0
WireConnection;3331;1;1916;0
WireConnection;2033;0;2025;0
WireConnection;3594;0;3593;0
WireConnection;1296;0;5;0
WireConnection;1389;0;1381;0
WireConnection;3735;0;3650;0
WireConnection;3325;7;3331;0
WireConnection;2213;0;2217;0
WireConnection;2213;1;2216;0
WireConnection;2213;2;2033;0
WireConnection;3644;0;3735;0
WireConnection;3644;3;3646;0
WireConnection;3644;4;3594;0
WireConnection;3301;0;1915;0
WireConnection;3301;1;3325;0
WireConnection;3595;0;3644;0
WireConnection;2218;0;2213;0
WireConnection;1994;0;1480;0
WireConnection;1994;1;1297;0
WireConnection;1994;2;2033;0
WireConnection;1424;0;349;1
WireConnection;1424;1;349;2
WireConnection;1424;2;349;3
WireConnection;3596;0;3595;0
WireConnection;3289;0;1123;0
WireConnection;3497;0;1058;0
WireConnection;3497;3;1994;0
WireConnection;3497;4;3500;0
WireConnection;3332;0;3301;0
WireConnection;3332;1;3331;0
WireConnection;3336;0;1424;0
WireConnection;1106;0;3497;0
WireConnection;1106;1;1107;0
WireConnection;3288;0;1123;0
WireConnection;3288;1;3289;0
WireConnection;3698;0;3696;0
WireConnection;3698;1;3703;0
WireConnection;3262;1;2211;1
WireConnection;3262;2;3263;0
WireConnection;3335;0;3336;0
WireConnection;1914;0;3331;0
WireConnection;1914;2;3332;0
WireConnection;3592;0;3587;0
WireConnection;3592;1;3601;0
WireConnection;3710;0;3839;0
WireConnection;1425;0;3335;0
WireConnection;3699;0;3698;0
WireConnection;1118;0;4105;0
WireConnection;1118;1;1106;0
WireConnection;1118;2;3262;0
WireConnection;3270;0;1914;0
WireConnection;662;0;3288;0
WireConnection;662;2;641;0
WireConnection;662;3;642;0
WireConnection;351;0;1425;0
WireConnection;3702;0;3700;0
WireConnection;3702;1;3699;0
WireConnection;4103;0;1118;0
WireConnection;4103;1;4104;0
WireConnection;645;0;3288;0
WireConnection;645;4;1492;0
WireConnection;645;2;641;0
WireConnection;645;3;642;0
WireConnection;3737;0;3739;0
WireConnection;3711;0;3710;0
WireConnection;3282;0;662;0
WireConnection;3588;0;3592;0
WireConnection;3589;0;3586;0
WireConnection;3589;1;3588;0
WireConnection;1254;0;4103;0
WireConnection;1010;0;1008;0
WireConnection;3705;0;3711;0
WireConnection;3705;2;3702;0
WireConnection;3273;0;3271;0
WireConnection;627;0;351;0
WireConnection;811;0;646;0
WireConnection;3719;0;3839;0
WireConnection;3291;0;3282;0
WireConnection;3740;0;3736;0
WireConnection;3740;2;3737;0
WireConnection;3740;3;3733;0
WireConnection;3281;0;645;0
WireConnection;679;0;811;0
WireConnection;3552;7;1914;0
WireConnection;680;0;3273;0
WireConnection;3741;0;3685;0
WireConnection;3741;1;3740;0
WireConnection;3290;0;3281;0
WireConnection;3290;2;3291;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;3506;0;1999;0
WireConnection;3506;3;627;0
WireConnection;3506;4;351;0
WireConnection;3797;0;3589;0
WireConnection;3797;1;3798;0
WireConnection;3694;0;3705;0
WireConnection;3720;0;3719;0
WireConnection;1470;0;1106;0
WireConnection;3502;0;1035;0
WireConnection;3502;3;680;0
WireConnection;3502;4;679;0
WireConnection;3686;0;3741;0
WireConnection;3742;0;3586;0
WireConnection;979;0;1016;0
WireConnection;3666;0;3694;0
WireConnection;3326;7;1914;0
WireConnection;3717;0;3797;0
WireConnection;3717;1;3720;0
WireConnection;3333;0;3506;0
WireConnection;3287;0;3290;0
WireConnection;3554;0;3552;0
WireConnection;2093;0;3326;0
WireConnection;669;1;3287;0
WireConnection;669;2;684;0
WireConnection;3721;0;3666;0
WireConnection;3345;0;3343;0
WireConnection;3345;1;3431;0
WireConnection;3283;0;3502;0
WireConnection;344;0;1470;0
WireConnection;344;1;335;0
WireConnection;3557;0;3554;0
WireConnection;4075;4;3430;0
WireConnection;4075;1;2982;0
WireConnection;4075;28;4078;0
WireConnection;2984;0;2982;0
WireConnection;2984;1;3430;0
WireConnection;4076;4;3431;0
WireConnection;4076;1;3343;0
WireConnection;4076;28;4078;0
WireConnection;3687;0;3686;0
WireConnection;3687;1;3742;0
WireConnection;3608;0;3717;0
WireConnection;3608;1;3611;0
WireConnection;3715;0;3721;0
WireConnection;3564;0;2093;0
WireConnection;3743;0;3608;0
WireConnection;3285;0;3283;0
WireConnection;3285;2;669;0
WireConnection;3558;0;3557;0
WireConnection;3558;1;3120;0
WireConnection;3475;0;3466;0
WireConnection;3475;3;4076;0
WireConnection;3475;4;3345;0
WireConnection;3255;0;3253;0
WireConnection;3348;0;3340;0
WireConnection;3348;1;3338;0
WireConnection;3476;0;2988;0
WireConnection;3476;3;4075;0
WireConnection;3476;4;2984;0
WireConnection;3682;0;3687;0
WireConnection;3682;2;3681;0
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;3657;0;3743;0
WireConnection;3724;0;3715;0
WireConnection;3553;0;3564;0
WireConnection;3553;1;3558;0
WireConnection;3504;0;3348;0
WireConnection;3504;3;3475;0
WireConnection;3504;4;3476;0
WireConnection;3503;0;2976;0
WireConnection;3503;3;3285;0
WireConnection;3503;4;954;0
WireConnection;3566;0;3255;0
WireConnection;30;0;346;0
WireConnection;3683;0;3682;0
WireConnection;3802;0;3724;0
WireConnection;1500;0;30;0
WireConnection;1500;1;3503;0
WireConnection;3684;0;3683;0
WireConnection;3684;1;3657;0
WireConnection;813;0;18;0
WireConnection;3678;0;3460;0
WireConnection;812;0;3504;0
WireConnection;3551;0;3553;0
WireConnection;3551;1;3566;0
WireConnection;3451;0;3059;1
WireConnection;3451;1;3678;0
WireConnection;3451;2;603;0
WireConnection;3619;0;3610;0
WireConnection;3619;1;3684;0
WireConnection;3619;2;3802;0
WireConnection;19;0;812;0
WireConnection;19;1;813;0
WireConnection;1777;0;1914;0
WireConnection;1777;1;3551;0
WireConnection;2289;0;1500;0
WireConnection;2909;0;19;0
WireConnection;3604;0;3605;0
WireConnection;3604;3;3619;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;2289;0
WireConnection;602;1;3494;0
WireConnection;602;2;3451;0
WireConnection;968;0;1922;0
WireConnection;1234;0;602;0
WireConnection;3603;0;3604;0
WireConnection;2911;0;2910;0
WireConnection;2911;1;2909;1
WireConnection;3244;0;1330;0
WireConnection;3055;0;1234;0
WireConnection;2908;0;2911;0
WireConnection;2908;1;2909;2
WireConnection;2908;2;2909;3
WireConnection;2918;0;325;0
WireConnection;3799;0;968;0
WireConnection;3249;0;585;0
WireConnection;3493;0;2225;0
WireConnection;3493;3;3512;2
WireConnection;3493;4;1909;0
WireConnection;3648;0;3494;0
WireConnection;3576;0;3059;1
WireConnection;2917;0;2908;0
WireConnection;2917;1;2918;0
WireConnection;3647;0;3648;0
WireConnection;965;0;3055;0
WireConnection;2237;0;3493;0
WireConnection;2237;1;2219;0
WireConnection;3617;0;3607;0
WireConnection;3617;1;3799;0
WireConnection;3241;0;3244;0
WireConnection;3241;1;3249;0
WireConnection;3087;0;3088;0
WireConnection;3087;1;3462;0
WireConnection;3087;2;3576;0
WireConnection;3086;1;3647;0
WireConnection;3086;2;3087;0
WireConnection;1783;0;2237;0
WireConnection;3643;0;3617;0
WireConnection;3643;1;968;0
WireConnection;2236;1;546;0
WireConnection;3574;0;3569;0
WireConnection;581;0;2917;0
WireConnection;581;1;3241;0
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;3090;0;3086;0
WireConnection;3074;0;581;0
WireConnection;3521;9;2898;0
WireConnection;3521;45;1928;0
WireConnection;3568;0;3574;0
WireConnection;3568;3;3574;0
WireConnection;3568;4;3643;0
WireConnection;553;0;2236;0
WireConnection;3520;21;967;0
WireConnection;3520;27;1928;0
WireConnection;1536;0;1537;0
WireConnection;1536;1;1530;0
WireConnection;1536;2;1534;0
WireConnection;3505;0;1533;0
WireConnection;3505;3;1536;0
WireConnection;3505;4;1537;0
WireConnection;3077;0;3074;0
WireConnection;3077;1;3568;0
WireConnection;3091;0;3090;0
WireConnection;556;1;555;0
WireConnection;545;0;551;0
WireConnection;545;1;553;0
WireConnection;3491;0;2905;0
WireConnection;3491;3;3521;0
WireConnection;3491;4;3520;0
WireConnection;360;0;3505;0
WireConnection;360;2;369;0
WireConnection;360;3;368;0
WireConnection;3796;0;3077;0
WireConnection;3056;0;561;0
WireConnection;554;0;545;0
WireConnection;554;1;556;0
WireConnection;2900;0;2899;0
WireConnection;2900;1;3491;0
WireConnection;3089;0;3091;0
WireConnection;2294;0;554;0
WireConnection;1921;0;1919;0
WireConnection;1276;0;3796;0
WireConnection;379;0;360;0
WireConnection;379;1;2299;0
WireConnection;379;2;2300;0
WireConnection;817;0;2900;0
WireConnection;3057;0;3056;0
WireConnection;3940;0;376;0
WireConnection;3174;0;3177;0
WireConnection;3174;1;3179;0
WireConnection;3524;9;2873;0
WireConnection;3524;45;1930;0
WireConnection;3773;0;3840;0
WireConnection;3773;1;384;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;3523;21;963;0
WireConnection;3523;27;1930;0
WireConnection;838;0;837;0
WireConnection;2208;0;2209;0
WireConnection;382;0;3940;0
WireConnection;382;1;379;0
WireConnection;816;1;2294;0
WireConnection;816;2;3057;0
WireConnection;370;0;382;0
WireConnection;370;1;1290;0
WireConnection;690;0;1920;0
WireConnection;690;1;691;0
WireConnection;690;2;838;0
WireConnection;2207;0;3523;0
WireConnection;2207;2;2208;0
WireConnection;3531;0;3174;0
WireConnection;3531;3;3174;0
WireConnection;2234;0;816;0
WireConnection;2234;1;816;0
WireConnection;2234;2;816;0
WireConnection;2210;0;3524;0
WireConnection;2210;2;2208;0
WireConnection;383;0;379;0
WireConnection;383;1;3773;0
WireConnection;3080;0;3079;0
WireConnection;4118;3;3531;0
WireConnection;390;0;1291;0
WireConnection;390;1;382;0
WireConnection;390;2;383;0
WireConnection;388;0;1290;0
WireConnection;388;1;370;0
WireConnection;388;2;3773;0
WireConnection;2301;0;2234;0
WireConnection;3492;0;2002;0
WireConnection;3492;3;690;0
WireConnection;372;0;1291;0
WireConnection;372;1;382;0
WireConnection;372;2;383;0
WireConnection;3068;0;3067;0
WireConnection;3528;0;2166;0
WireConnection;3528;3;2210;0
WireConnection;3528;4;2207;0
WireConnection;3081;0;3080;0
WireConnection;3081;1;3075;0
WireConnection;3064;0;3068;0
WireConnection;3064;1;2301;0
WireConnection;1284;0;1281;0
WireConnection;1284;2;388;0
WireConnection;1284;3;390;0
WireConnection;1284;4;372;0
WireConnection;3104;0;3492;0
WireConnection;3104;1;3103;0
WireConnection;3407;1;4118;0
WireConnection;3407;2;3182;0
WireConnection;328;1;3433;0
WireConnection;3085;0;3081;0
WireConnection;3085;1;3075;0
WireConnection;1517;0;1518;0
WireConnection;2175;0;2181;0
WireConnection;2175;1;3528;0
WireConnection;3483;0;3181;0
WireConnection;3483;3;3407;0
WireConnection;4088;0;1517;0
WireConnection;2920;0;2919;0
WireConnection;3069;0;3064;0
WireConnection;3069;1;3085;0
WireConnection;3507;0;1514;0
WireConnection;3507;3;1284;0
WireConnection;3507;4;1515;0
WireConnection;3489;0;3101;0
WireConnection;3489;3;3104;0
WireConnection;3489;4;3492;0
WireConnection;808;0;328;0
WireConnection;810;0;2175;0
WireConnection;3266;0;3109;1
WireConnection;3266;1;3109;4
WireConnection;3260;0;808;0
WireConnection;3260;1;328;4
WireConnection;3482;0;3072;0
WireConnection;3482;3;3069;0
WireConnection;3482;4;3064;0
WireConnection;701;0;3489;0
WireConnection;701;1;3483;0
WireConnection;1292;0;3507;0
WireConnection;407;0;810;0
WireConnection;407;1;408;0
WireConnection;407;2;2920;0
WireConnection;4087;0;4088;0
WireConnection;3352;0;3333;0
WireConnection;696;0;824;0
WireConnection;696;1;695;1
WireConnection;3438;0;3482;0
WireConnection;1516;0;407;0
WireConnection;1516;1;4087;0
WireConnection;2180;0;2175;0
WireConnection;3268;1;3266;0
WireConnection;3268;2;3264;0
WireConnection;462;0;3260;0
WireConnection;462;1;970;0
WireConnection;3490;0;701;0
WireConnection;3353;0;1998;0
WireConnection;4081;97;3582;0
WireConnection;4081;156;3943;0
WireConnection;414;0;1279;0
WireConnection;414;1;1516;0
WireConnection;805;0;327;0
WireConnection;2291;0;2264;0
WireConnection;450;0;3260;0
WireConnection;450;1;462;0
WireConnection;450;2;461;0
WireConnection;807;0;2919;4
WireConnection;807;1;2180;0
WireConnection;807;2;406;0
WireConnection;807;3;3268;0
WireConnection;3437;0;3438;0
WireConnection;3474;0;3353;0
WireConnection;3474;3;3352;0
WireConnection;3474;4;3499;0
WireConnection;3429;5;3140;0
WireConnection;3429;6;3142;0
WireConnection;560;1;3490;0
WireConnection;560;2;696;0
WireConnection;329;0;450;0
WireConnection;329;1;805;0
WireConnection;329;2;326;0
WireConnection;3251;0;3437;0
WireConnection;3251;1;560;0
WireConnection;2287;0;2291;0
WireConnection;3473;0;2003;0
WireConnection;3473;3;4081;0
WireConnection;3478;0;3159;0
WireConnection;3478;2;3498;0
WireConnection;3478;3;3429;7
WireConnection;3478;4;3498;0
WireConnection;2993;0;3504;0
WireConnection;3147;0;3474;0
WireConnection;405;0;1278;0
WireConnection;405;1;414;0
WireConnection;405;2;807;0
WireConnection;4116;0;2287;0
WireConnection;971;0;3473;0
WireConnection;1274;0;405;0
WireConnection;1262;0;2993;0
WireConnection;331;0;329;0
WireConnection;331;2;330;0
WireConnection;983;0;3251;0
WireConnection;3144;0;3478;0
WireConnection;3144;1;3147;0
WireConnection;1285;0;331;0
WireConnection;3252;1;2287;0
WireConnection;3146;0;3144;0
WireConnection;3956;0;2287;0
WireConnection;4117;0;4116;0
WireConnection;4110;0;4109;0
WireConnection;4110;3;4115;0
WireConnection;3477;0;1021;0
WireConnection;3477;3;2163;0
WireConnection;3477;4;1292;0
WireConnection;333;0;334;0
WireConnection;333;1;1265;0
WireConnection;3955;0;3956;0
WireConnection;3955;2;1702;0
WireConnection;2284;0;3252;0
WireConnection;2284;1;1701;0
WireConnection;3145;0;3146;0
WireConnection;4084;0;4117;0
WireConnection;4084;1;4110;0
WireConnection;470;0;3477;0
WireConnection;470;1;1294;0
WireConnection;470;2;2284;0
WireConnection;470;3;3955;0
WireConnection;470;4;4084;0
WireConnection;1430;0;333;0
WireConnection;1430;1;3145;0
WireConnection;1430;2;1433;0
WireConnection;1560;2;1480;0
WireConnection;1560;3;1297;0
WireConnection;1856;0;602;0
WireConnection;1861;0;430;0
WireConnection;1923;0;470;0
WireConnection;1923;3;1430;0
WireConnection;1924;0;1923;0
ASEEND*/
//CHKSM=406C39F1C2A1CA0BEE24D49C0C17611B2E83E577
