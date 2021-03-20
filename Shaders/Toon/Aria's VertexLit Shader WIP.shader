// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Arias VertexLit Shader WIP"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[HideInInspector]_outline_width("_outline_width", Float) = 0
		[Toggle(TINTED_OUTLINE)][Space(10)]_VRCFallbackDoublesided("VRC Fallback Doublesided", Float) = 0
		[Enum(Visible,0,Invisible,2)]_Cutoff("Fallback Cutoff", Float) = 0
		[Header(.  Main  .)]_MainTex("Texture (RGB,A)", 2D) = "white" {}
		[Toggle(_)]_TexSuperSample("SuperSample (expensive)", Float) = 0
		[HDR]_Color("> Color", Color) = (1,1,1,1)
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
		[ToggleUI][Space(5)][Header(.  Shadow  .)]_UseShading("Use Shading", Float) = 1
		[Enum(Surface,0,Object2World,1)]_LightMode("Lighting Mode", Float) = 0
		[Enum(Ramp_Texture,0,Linear_Gradient,1)]_GradientorRamp("Gradient or Ramp", Float) = 1
		_ShadowColour("Shadow Colour", Color) = (0.7098039,0.7098039,0.7098039,1)
		_Ramp("Ramp (RGB)", 2D) = "white" {}
		_OffsetDot("Offset Dot", Range( -1 , 1)) = 0
		_ShadowSharpness1("Shadow Sharpness", Float) = 1
		_ShadowDarkness("Shadow Darkness", Float) = 0.22
		_ShadowSaturation("Shadow Saturation", Range( -2 , 2)) = 0.85
		_LightMask("Light Mask (R)", 2D) = "white" {}
		_LightMaskLevel("Mask Level", Float) = 1
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.68
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.55
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.44
		[Space(5)][Header(.  Emission  .)]_Emission("Emission Map (RGB,A)", 2D) = "white" {}
		[HDR]_EmissionColor("Emission Colour", Color) = (0,0,0,0)
		_EmissionIntensity("Emission Intensity", Float) = 1
		_ShadedEmission("Shaded Emission", Float) = 0
		[Normal][Space(5)][Header(.  Normal  .)]_Normal("Normal (N)", 2D) = "bump" {}
		[Toggle(_)]_NormSuperSample("SuperSample (expensive)", Float) = 0
		_NorDist("Normal Distance Modifier", Float) = 0
		_NormalPower("Normal Power", Range( 0 , 2)) = 0
		_NormalPowerSpecular("Normal Power Specular", Range( 0 , 2)) = 0.5
		_NormalPowerMatCap("Normal Power MatCap", Range( 0 , 2)) = 0.5
		_NormalMaskR("Normal Mask (R)", 2D) = "white" {}
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
		_SpecularMask("Specular MatCap Mask (R,A)", 2D) = "white" {}
		[ToggleUI][Space(5)][Header(. Reflection Probe)]_UseReflection("Use Reflection Probe", Float) = 0
		_ProbeSmoothness("Probe Smoothness", Float) = 0.75
		_ReflectionOpacity("Reflection Opacity", Float) = 1
		[ToggleUI][Space(5)][Header(.  Sparkles  .)]_UseSparkleShimmer("Use Sparkle/Shimmer", Float) = 0
		[HDR]_SparkleColor1("Color", Color) = (1,1,1,0)
		_SparklePatternRGB("Sparkle Pattern (RGB)", 2D) = "black" {}
		[ToggleUI]_SparkleSuperSample("SuperSample (expensive)", Float) = 0
		_SparkleTexColour("SparkleTex Saturation", Range( 0 , 2)) = 0
		_Threshold("Threshold", Range( 0 , 1)) = 0
		_Range("Range", Range( 0.05 , 1)) = 0.3
		_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.3
		[ToggleUI]_StereoCorrect("Stereo Correct", Float) = 1
		_WorldPosContribution("WorldPos Contribution", Range( 0 , 1)) = 0.3
		[Enum(Linear,0,Circular,1)][Space(5)]_MotionType("Motion Type", Float) = 1
		_MotionSpeed("Motion Speed", Float) = 0
		_RotateLinear("Rotate Linear", Range( 0 , 1)) = 0
		_MotionIntensity("Motion Intensity", Float) = 0.01
		[Space(5)]_SparkleMask("Sparkle Mask (R,A)", 2D) = "white" {}
		_SparkleFresnel1("Fresnel Bias, Scale, Power", Vector) = (0,10,0.1,0)
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
		[Space(10)]_MatCapMask("MatCap Mask (R,A)", 2D) = "white" {}
		_MatcapMaskLevel1("Mask Level", Float) = 1
		[Toggle(_)][Space(20)][Header(VRC Friends Only)]_FriendsOnly("Friends Only ON/OFF", Float) = 0
		_FriendsOnlyRT("> FriendsOnly RenderTexture", 2D) = "white" {}
		[Toggle(_)]_FriendsOnly1("Invert Friends Only", Float) = 0
		[Toggle(_)]_FriendsOnlyTexture("Friends Only Texture", Float) = 0
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
			Name "Unlit"
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile __ VERTEXLIGHT_ON
			#include "AutoLight.cginc"


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _WriteMask;
			uniform float _ZTestMode;
			uniform half _StencilRef;
			uniform int _StencilComparison;
			uniform float _SrcBlend;
			uniform float _ZWriteMode;
			uniform float _VRCFallbackDoublesided;
			uniform float _DstBlend;
			uniform int _StencilZFail;
			uniform int _StencilFail;
			uniform int _Culling;
			uniform float _AlphaToCoverage;
			uniform half _ReadMask;
			uniform float _Cutoff;
			uniform float _outline_width;
			uniform int _StencilOp;
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
			uniform float _TexSuperSample;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _Color;
			uniform float _Saturation;
			uniform float _GradientorRamp;
			uniform float4 _ShadowColour;
			uniform float _ShadowSharpness1;
			uniform float _UseShading;
			uniform float _NormSuperSample;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform float _NorDist;
			uniform float _NormalPowerSpecular;
			uniform float _NormalPower;
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
			uniform sampler2D _Ramp;
			uniform float _ShadowSaturation;
			uniform float _LightMultiplier;
			uniform float _MinLight;
			uniform float _MaxLight;
			uniform float _LightSatLimiter;
			uniform float _LightSatTotal;
			uniform float _ShadowDarkness;
			uniform float4 _RimOutlineColour;
			uniform float _Min;
			uniform float _Max;
			uniform float _RimNormal;
			uniform float _Scale1;
			uniform float _Scale;
			uniform float _Power;
			uniform float _Amount;
			uniform float _Legacy;
			uniform sampler2D _Matcap;
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
			uniform float _SpecularSize;
			uniform float _SpecularStrength;
			uniform float _SpecularOpacity;
			uniform float _SpecMatCapMode;
			uniform float _UseSpecularMatCap;
			uniform float _Legacy2;
			uniform sampler2D _SpecularMatcap;
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
			uniform sampler2D _SparkleMask;
			uniform float4 _SparkleMask_ST;
			uniform float4 _SparkleColor1;
			uniform float _Threshold;
			uniform float _Range;
			uniform float _SparkleSuperSample;
			uniform sampler2D _SparklePatternRGB;
			uniform float4 _SparklePatternRGB_ST;
			uniform float _SparkleTexColour;
			uniform float _StereoCorrect;
			uniform float _ScreenContribution;
			uniform float _MotionIntensity;
			uniform float _MotionType;
			uniform float _MotionSpeed;
			uniform float _RotateLinear;
			uniform float _WorldPosContribution;
			uniform float3 _SparkleFresnel1;
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
			half4 supersample2x2( sampler2D texvalue, float2 uvin, float2 dx, float2 dy, float bias )
			{
				half4 col = 0;
				col += tex2Dbias(texvalue, float4(uvin.xy + dx + dy, 0.0, bias));
				col += tex2Dbias(texvalue, float4(uvin.xy - dx + dy, 0.0, bias));
				col += tex2Dbias(texvalue, float4(uvin.xy + dx - dy, 0.0, bias));
				col += tex2Dbias(texvalue, float4(uvin.xy - dx - dy, 0.0, bias));
				col *= 0.25;
				return col;
			}
			
			float3 CenterEye1_g325(  )
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
			
			float3 CenterEye1_g327(  )
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
			
			float4 VertexLightPosX3_g257(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g257(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g257(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g257(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol114_g257(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightCol215_g257(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g257(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g257(  )
			{
				return unity_LightColor[3];
			}
			
			float3 unity_SHArgb3_g329(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			
			float3 CenterEye1_g352(  )
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
			
			float3 CenterEye1_g354(  )
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
			
			float3 CenterEye1_g336(  )
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
			
			float3 CenterEye1_g344(  )
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
			
			float3 CenterEye1_g346(  )
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
			
			float3 CenterEye1_g338(  )
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
			
			float3 CenterEye1_g348(  )
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
			
			float3 CenterEye1_g355(  )
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
			
			int isCamera1_g358(  )
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
				o.ase_texcoord5 = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
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
				sampler2D texvalue34_g334 = _MainTexFriends;
				float2 uv_MainTexFriends = i.ase_texcoord1.xy * _MainTexFriends_ST.xy + _MainTexFriends_ST.zw;
				float2 temp_output_4_0_g334 = uv_MainTexFriends;
				half2 uvin34_g334 = temp_output_4_0_g334;
				half2 dx34_g334 = ( ddx( temp_output_4_0_g334 ) * float2( 0.25,0.25 ) );
				half2 dy34_g334 = ( ddy( temp_output_4_0_g334 ) * float2( 0.25,0.25 ) );
				half bias34_g334 = 0.0;
				half4 localsupersample2x234_g334 = supersample2x2( texvalue34_g334 , uvin34_g334 , dx34_g334 , dy34_g334 , bias34_g334 );
				float4 ifLocalVar3475 = 0;
				UNITY_BRANCH 
				if( _FriendsSuperSample == 1.0 )
				ifLocalVar3475 = localsupersample2x234_g334;
				else if( _FriendsSuperSample < 1.0 )
				ifLocalVar3475 = tex2D( _MainTexFriends, uv_MainTexFriends );
				sampler2D texvalue34_g333 = _MainTex;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 temp_output_4_0_g333 = uv_MainTex;
				half2 uvin34_g333 = temp_output_4_0_g333;
				half2 dx34_g333 = ( ddx( temp_output_4_0_g333 ) * float2( 0.25,0.25 ) );
				half2 dy34_g333 = ( ddy( temp_output_4_0_g333 ) * float2( 0.25,0.25 ) );
				half bias34_g333 = 0.0;
				half4 localsupersample2x234_g333 = supersample2x2( texvalue34_g333 , uvin34_g333 , dx34_g333 , dy34_g333 , bias34_g333 );
				float4 ifLocalVar3476 = 0;
				UNITY_BRANCH 
				if( _TexSuperSample == 1.0 )
				ifLocalVar3476 = localsupersample2x234_g333;
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
				sampler2D texvalue34_g326 = _Normal;
				float2 uv_Normal = i.ase_texcoord1.xy * _Normal_ST.xy + _Normal_ST.zw;
				float2 temp_output_4_0_g326 = uv_Normal;
				half2 uvin34_g326 = temp_output_4_0_g326;
				half2 dx34_g326 = ( ddx( temp_output_4_0_g326 ) * float2( 0.25,0.25 ) );
				half2 dy34_g326 = ( ddy( temp_output_4_0_g326 ) * float2( 0.25,0.25 ) );
				half bias34_g326 = 0.0;
				half4 localsupersample2x234_g326 = supersample2x2( texvalue34_g326 , uvin34_g326 , dx34_g326 , dy34_g326 , bias34_g326 );
				float3 localCenterEye1_g325 = CenterEye1_g325();
				float temp_output_3458_0 = ( distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g325 : _WorldSpaceCameraPos ) ) * 2.0 * _NorDist );
				float ifLocalVar3495 = 0;
				UNITY_BRANCH 
				if( _NorDist >= 1.0 )
				ifLocalVar3495 = temp_output_3458_0;
				else
				ifLocalVar3495 = 1.0;
				float NormalDist3459 = ifLocalVar3495;
				float temp_output_3451_0 = ( NormalDist3459 * _NormalPowerSpecular );
				float clampResult3012 = clamp( temp_output_3451_0 , 1.0 , 3.0 );
				float3 localUnpackNormal47_g326 = UnpackScaleNormal( localsupersample2x234_g326, clampResult3012 );
				float temp_output_3442_0 = ( _NormalPower * NormalDist3459 );
				float clampResult3014 = clamp( temp_output_3442_0 , 1.0 , 3.0 );
				float3 ifLocalVar3494 = 0;
				UNITY_BRANCH 
				if( _NormSuperSample == 1.0 )
				ifLocalVar3494 = localUnpackNormal47_g326;
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
				float3 localCenterEye1_g327 = CenterEye1_g327();
				float3 temp_output_4_0_g327 = ( localCenterEye1_g327 - WorldPosition );
				float3 normalizeResult5_g327 = normalize( temp_output_4_0_g327 );
				float3 lerpResult2635 = lerp( appendResult248 , normalizeResult5_g327 , float3( 0.3333,0.3333,0.3333 ));
				float3 Dir_LightDir2215 = ( ( ase_lightColor.rgb * ase_lightColor.a ) > float3( 0,0,0 ) ? normalizeResult1233 : lerpResult2635 );
				float3 localSHArgbambientDir6_g328 = SHArgbambientDir();
				float dotResult5 = dot( NormalShade962 , ( Dir_LightDir2215 + localSHArgbambientDir6_g328 ) );
				float NdotL1296 = dotResult5;
				float4 localVertexLightPosX3_g257 = VertexLightPosX3_g257();
				float4 break4_g257 = localVertexLightPosX3_g257;
				float4 localVertexLightPosY2_g257 = VertexLightPosY2_g257();
				float4 break5_g257 = localVertexLightPosY2_g257;
				float4 localVertexLightPosZ1_g257 = VertexLightPosZ1_g257();
				float4 break6_g257 = localVertexLightPosZ1_g257;
				float3 appendResult7_g257 = (float3(break4_g257.x , break5_g257.x , break6_g257.x));
				float3 VertLightPos12017 = appendResult7_g257;
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
				float3 pos188_g257 = appendResult7_g257;
				float3 objToWorld139_g257 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_155_0_g257 = pow( distance( pos188_g257 , objToWorld139_g257 ) , 2.0 );
				float4 localVertexLightAttenuation86_g257 = VertexLightAttenuation86_g257();
				float4 break87_g257 = localVertexLightAttenuation86_g257;
				float attenx96_g257 = break87_g257.x;
				float temp_output_60_0_g257 = saturate( ( 1.0 - ( ( temp_output_155_0_g257 * attenx96_g257 ) / 25.0 ) ) );
				float temp_output_3408_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g257 ) * attenx96_g257 ) ) , ( temp_output_60_0_g257 * temp_output_60_0_g257 ) );
				float3 appendResult8_g257 = (float3(break4_g257.y , break5_g257.y , break6_g257.y));
				float3 pos290_g257 = appendResult8_g257;
				float3 objToWorld140_g257 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_75_0_g257 = pow( distance( pos290_g257 , objToWorld140_g257 ) , 2.0 );
				float atteny97_g257 = break87_g257.y;
				float temp_output_107_0_g257 = saturate( ( 1.0 - ( ( temp_output_75_0_g257 * atteny97_g257 ) / 25.0 ) ) );
				float temp_output_3408_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g257 ) * atteny97_g257 ) ) , ( temp_output_107_0_g257 * temp_output_107_0_g257 ) );
				float3 appendResult9_g257 = (float3(break4_g257.z , break5_g257.z , break6_g257.z));
				float3 pos389_g257 = appendResult9_g257;
				float3 objToWorld141_g257 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_79_0_g257 = pow( distance( pos389_g257 , objToWorld141_g257 ) , 2.0 );
				float attenz98_g257 = break87_g257.z;
				float temp_output_125_0_g257 = saturate( ( 1.0 - ( ( temp_output_79_0_g257 * attenz98_g257 ) / 25.0 ) ) );
				float temp_output_3408_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g257 ) * attenz98_g257 ) ) , ( temp_output_125_0_g257 * temp_output_125_0_g257 ) );
				float3 appendResult10_g257 = (float3(break4_g257.w , break5_g257.w , break6_g257.w));
				float3 pos491_g257 = appendResult10_g257;
				float3 objToWorld138_g257 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_83_0_g257 = pow( distance( pos491_g257 , objToWorld138_g257 ) , 2.0 );
				float attenw99_g257 = break87_g257.w;
				float temp_output_116_0_g257 = saturate( ( 1.0 - ( ( temp_output_83_0_g257 * attenw99_g257 ) / 25.0 ) ) );
				float temp_output_3408_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g257 ) * attenw99_g257 ) ) , ( temp_output_116_0_g257 * temp_output_116_0_g257 ) );
				float VertAtten2014 = ( temp_output_3408_23 + temp_output_3408_29 + temp_output_3408_30 + temp_output_3408_31 );
				float4 localVertexLightCol114_g257 = VertexLightCol114_g257();
				float4 temp_output_3408_16 = localVertexLightCol114_g257;
				float4 localVertexLightCol215_g257 = VertexLightCol215_g257();
				float4 temp_output_3408_17 = localVertexLightCol215_g257;
				float4 localVertexLightCol319_g257 = VertexLightCol319_g257();
				float4 temp_output_3408_18 = localVertexLightCol319_g257;
				float4 localVertexLightCol421_g257 = VertexLightCol421_g257();
				float4 temp_output_3408_20 = localVertexLightCol421_g257;
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
				float temp_output_1254_0 = saturate( ( _ShadowSharpness1 * temp_output_1106_0 * lerpResult3262 ) );
				float3 lerpResult1016 = lerp( (_ShadowColour).rgb , float3( 1,1,1 ) , temp_output_1254_0);
				float2 appendResult1125 = (float2(temp_output_1254_0 , temp_output_1254_0));
				float3 ifLocalVar3501 = 0;
				UNITY_BRANCH 
				if( _GradientorRamp == 1.0 )
				ifLocalVar3501 = lerpResult1016;
				else if( _GradientorRamp < 1.0 )
				ifLocalVar3501 = (( (float4( 0.5,0.5,0.5,0 ) + (_ShadowColour - float4( 0,0,0,0 )) * (float4( 1,1,1,0 ) - float4( 0.5,0.5,0.5,0 )) / (float4( 1,1,1,0 ) - float4( 0,0,0,0 ))) * tex2D( _Ramp, appendResult1125 ) )).rgb;
				float3 RampShade979 = ifLocalVar3501;
				float3 desaturateInitialColor581 = desaturateVar2917;
				float desaturateDot581 = dot( desaturateInitialColor581, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar581 = lerp( desaturateInitialColor581, desaturateDot581.xxx, ( ( 1.0 - RampShade979 ) * ( 1.0 - _ShadowSaturation ) ).x );
				float3 MaintexRGB3074 = desaturateVar581;
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch1908 = saturate( ( ( temp_output_3408_16 * temp_output_3408_23 ) + ( temp_output_3408_17 * temp_output_3408_29 ) + ( temp_output_3408_18 * temp_output_3408_30 ) + ( temp_output_3408_20 * temp_output_3408_31 ) ) );
				#else
				float4 staticSwitch1908 = float4(0,0,0,0);
				#endif
				float4 VertLight1406 = staticSwitch1908;
				float3 localunity_SHArgb3_g329 = unity_SHArgb3_g329();
				float3 temp_cast_4 = (_MinLight).xxx;
				float3 clampResult3331 = clamp( ( ( ( ase_lightColor.rgb * ase_lightColor.a * ( 1.0 - _WorldSpaceLightPos0.w ) ) + (VertLight1406).xyz + ( localunity_SHArgb3_g329 * float3( 1.3,1.3,1.3 ) ) ) * _LightMultiplier ) , temp_cast_4 , float3( 1,1,1 ) );
				float3 break5_g332 = clampResult3331;
				float3 clampResult1914 = clamp( clampResult3331 , float3( 0,0,0 ) , ( ( _MaxLight * max( max( break5_g332.x , break5_g332.y ) , max( break5_g332.y , break5_g332.z ) ) ) / clampResult3331 ) );
				float3 break5_g335 = clampResult1914;
				float clampResult3256 = clamp( (0.0 + (saturate( max( max( break5_g335.x , break5_g335.y ) , max( break5_g335.y , break5_g335.z ) ) ) - 0.0) * (( 1.0 - _LightSatLimiter ) - 0.0) / (1.0 - 0.0)) , ( 1.0 - _LightSatTotal ) , 1.0 );
				float3 desaturateInitialColor1777 = clampResult1914;
				float desaturateDot1777 = dot( desaturateInitialColor1777, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1777 = lerp( desaturateInitialColor1777, desaturateDot1777.xxx, clampResult3256 );
				float3 temp_cast_5 = (( ( 1.0 - temp_output_1106_0 ) * _ShadowDarkness )).xxx;
				float3 clampResult30 = clamp( ( RampShade979 - temp_cast_5 ) , float3( 0,0,0 ) , float3( 0.8,0.8,0.8 ) );
				float3 LightColour968 = ( desaturateVar1777 * clampResult30 );
				float3 PostDesaturation1276 = (float3( 0.0001,0.0001,0.0001 ) + (( MaintexRGB3074 * LightColour968 ) - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.0001,0.0001,0.0001 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 lerpResult1536 = lerp( ase_worldNormal , NormalShade962 , _Scale1);
				float3 ifLocalVar3505 = 0;
				UNITY_BRANCH 
				if( _RimNormal == 1.0 )
				ifLocalVar3505 = lerpResult1536;
				else if( _RimNormal < 1.0 )
				ifLocalVar3505 = ase_worldNormal;
				float fresnelNdotV360 = dot( ifLocalVar3505, ase_worldViewDir );
				float fresnelNode360 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV360, _Power ) );
				float smoothstepResult379 = smoothstep( _Min , _Max , fresnelNode360);
				float4 temp_output_382_0 = ( _RimOutlineColour * smoothstepResult379 );
				float4 lerpResult388 = lerp( float4( PostDesaturation1276 , 0.0 ) , ( temp_output_382_0 + float4( PostDesaturation1276 , 0.0 ) ) , _Amount);
				float temp_output_383_0 = ( smoothstepResult379 * _Amount );
				float4 lerpResult390 = lerp( float4( PostDesaturation1276 , 0.0 ) , temp_output_382_0 , temp_output_383_0);
				float4 lerpResult372 = lerp( float4( PostDesaturation1276 , 0.0 ) , temp_output_382_0 , temp_output_383_0);
				float4 ifLocalVar1284 = 0;
				if( _RimMode > 1.0 )
				ifLocalVar1284 = lerpResult388;
				else if( _RimMode == 1.0 )
				ifLocalVar1284 = lerpResult390;
				else if( _RimMode < 1.0 )
				ifLocalVar1284 = lerpResult372;
				float4 ifLocalVar3507 = 0;
				UNITY_BRANCH 
				if( _UseRim == 1.0 )
				ifLocalVar3507 = ifLocalVar1284;
				else if( _UseRim < 1.0 )
				ifLocalVar3507 = float4( PostDesaturation1276 , 0.0 );
				float4 PostRimLight1292 = ifLocalVar3507;
				float3 localCenterEye1_g352 = CenterEye1_g352();
				float3 ifLocalVar50_g351 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar50_g351 = localCenterEye1_g352;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar50_g351 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g351 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g351 - WorldPosition ), 0 ) ).xyz );
				float3 lerpResult3086 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( _NormalPowerMatCap * tex2DNode3059.r * NormalDist3459 ));
				float3 tanNormal3090 = lerpResult3086;
				float3 worldNormal3090 = float3(dot(tanToWorld0,tanNormal3090), dot(tanToWorld1,tanNormal3090), dot(tanToWorld2,tanNormal3090));
				float3 normalizeResult3091 = normalize( worldNormal3090 );
				float3 NormalMatCap3089 = normalizeResult3091;
				float3 worldToViewDir13_g351 = normalize( mul( UNITY_MATRIX_V, float4( NormalMatCap3089, 0 ) ).xyz );
				float mulTime2208 = _Time.y * _MatcapSpin;
				float cos2210 = cos( mulTime2208 );
				float sin2210 = sin( mulTime2208 );
				float2 rotator2210 = mul( (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g351 ) , worldToViewDir13_g351 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) - float2( 0.5,0.5 ) , float2x2( cos2210 , -sin2210 , sin2210 , cos2210 )) + float2( 0.5,0.5 );
				float3 localCenterEye1_g354 = CenterEye1_g354();
				float3 ifLocalVar32_g353 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar32_g353 = localCenterEye1_g354;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar32_g353 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g353 = normalize( ( ifLocalVar32_g353 - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g353 = normalize( cross( normalizeResult19_g353 , _worldUp ) );
				float3 temp_output_21_0_g353 = NormalMatCap3089;
				float dotResult10_g353 = dot( normalizeResult8_g353 , temp_output_21_0_g353 );
				float dotResult2_g353 = dot( _worldUp , normalizeResult19_g353 );
				float3 normalizeResult7_g353 = normalize( ( _worldUp - ( dotResult2_g353 * normalizeResult19_g353 ) ) );
				float dotResult9_g353 = dot( normalizeResult7_g353 , temp_output_21_0_g353 );
				float2 appendResult11_g353 = (float2(dotResult10_g353 , dotResult9_g353));
				float cos2207 = cos( mulTime2208 );
				float sin2207 = sin( mulTime2208 );
				float2 rotator2207 = mul( ( ( appendResult11_g353 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) - float2( 0.5,0.5 ) , float2x2( cos2207 , -sin2207 , sin2207 , cos2207 )) + float2( 0.5,0.5 );
				float4 temp_output_2165_0 = ( _Legacy == 1.0 ? tex2D( _Matcap, rotator2210 ) : tex2D( _Matcap, rotator2207 ) );
				float3 desaturateInitialColor1516 = ( (temp_output_2165_0).rgb * _MatcapIntensity * (_MatCapColor).rgb );
				float desaturateDot1516 = dot( desaturateInitialColor1516, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1516 = lerp( desaturateInitialColor1516, desaturateDot1516.xxx, ( 1.0 - _MatcapSaturation ) );
				float2 uv_MatCapMask = i.ase_texcoord1.xy * _MatCapMask_ST.xy + _MatCapMask_ST.zw;
				float4 tex2DNode3109 = tex2D( _MatCapMask, uv_MatCapMask );
				float lerpResult3268 = lerp( 1.0 , ( tex2DNode3109.r * tex2DNode3109.a ) , _MatcapMaskLevel1);
				float4 lerpResult405 = lerp( PostRimLight1292 , ( PostRimLight1292 * float4( desaturateVar1516 , 0.0 ) ) , ( (temp_output_2165_0).a * _MatcapOpacity * lerpResult3268 ));
				float4 PostMatcap1274 = lerpResult405;
				float4 ifLocalVar3477 = 0;
				UNITY_BRANCH 
				if( _UseMatcap == 1.0 )
				ifLocalVar3477 = PostMatcap1274;
				else if( _UseMatcap < 1.0 )
				ifLocalVar3477 = PostRimLight1292;
				float2 uv_Emission = i.ase_texcoord1.xy * _Emission_ST.xy + _Emission_ST.zw;
				float4 tex2DNode328 = tex2D( _Emission, uv_Emission );
				float3 temp_output_3260_0 = ( (tex2DNode328).rgb * tex2DNode328.a );
				float3 lerpResult450 = lerp( temp_output_3260_0 , ( temp_output_3260_0 * LightColour968 ) , _ShadedEmission);
				float3 temp_cast_14 = (3.0).xxx;
				float3 clampResult331 = clamp( ( lerpResult450 * (_EmissionColor).rgb * _EmissionIntensity ) , float3( 0,0,0 ) , temp_cast_14 );
				float3 Emission1285 = clampResult331;
				float3 desaturateInitialColor2291 = LightColour968;
				float desaturateDot2291 = dot( desaturateInitialColor2291, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2291 = lerp( desaturateInitialColor2291, desaturateDot2291.xxx, 1.0 );
				float3 localCenterEye1_g336 = CenterEye1_g336();
				float3 temp_output_4_0_g336 = ( localCenterEye1_g336 - WorldPosition );
				float3 normalizeResult5_g336 = normalize( temp_output_4_0_g336 );
				float3 ifLocalVar3493 = 0;
				UNITY_BRANCH 
				if( _StereoFixSpec == 1.0 )
				ifLocalVar3493 = normalizeResult5_g336;
				else if( _StereoFixSpec < 1.0 )
				ifLocalVar3493 = ase_worldViewDir;
				float3 Vert_LightDir1491 = normalizeResult1382;
				float3 lerpResult2213 = lerp( Dir_LightDir2215 , Vert_LightDir1491 , temp_output_2033_0);
				float3 FinalLightDir2218 = lerpResult2213;
				float3 normalizeResult1783 = normalize( ( ifLocalVar3493 + FinalLightDir2218 ) );
				float clampResult3011 = clamp( temp_output_3451_0 , 0.0 , 1.0 );
				float3 lerpResult602 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( tex2DNode3059.r * clampResult3011 ));
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
				float3 localCenterEye1_g344 = CenterEye1_g344();
				float3 ifLocalVar50_g343 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar50_g343 = localCenterEye1_g344;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar50_g343 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g343 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g343 - WorldPosition ), 0 ) ).xyz );
				float3 worldToViewDir13_g343 = normalize( mul( UNITY_MATRIX_V, float4( NormalSpecular965, 0 ) ).xyz );
				float3 localCenterEye1_g346 = CenterEye1_g346();
				float3 ifLocalVar32_g345 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar32_g345 = localCenterEye1_g346;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar32_g345 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g345 = normalize( ( ifLocalVar32_g345 - WorldPosition ) );
				float3 normalizeResult8_g345 = normalize( cross( normalizeResult19_g345 , _worldUp ) );
				float3 temp_output_21_0_g345 = NormalSpecular965;
				float dotResult10_g345 = dot( normalizeResult8_g345 , temp_output_21_0_g345 );
				float dotResult2_g345 = dot( _worldUp , normalizeResult19_g345 );
				float3 normalizeResult7_g345 = normalize( ( _worldUp - ( dotResult2_g345 * normalizeResult19_g345 ) ) );
				float dotResult9_g345 = dot( normalizeResult7_g345 , temp_output_21_0_g345 );
				float2 appendResult11_g345 = (float2(dotResult10_g345 , dotResult9_g345));
				float4 ifLocalVar3491 = 0;
				UNITY_BRANCH 
				if( _Legacy2 == 1.0 )
				ifLocalVar3491 = tex2D( _SpecularMatcap, (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g343 ) , worldToViewDir13_g343 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) );
				else if( _Legacy2 < 1.0 )
				ifLocalVar3491 = tex2D( _SpecularMatcap, ( ( appendResult11_g345 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) );
				float3 desaturateInitialColor1920 = (ifLocalVar3491).rgb;
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
				float3 lerpResult3407 = lerp( float3( 0,0,0 ) , indirectSpecular3174 , _ReflectionOpacity);
				float3 ifLocalVar3483 = 0;
				UNITY_BRANCH 
				if( _UseReflection == 1.0 )
				ifLocalVar3483 = lerpResult3407;
				float2 uv_SpecularMask = i.ase_texcoord1.xy * _SpecularMask_ST.xy + _SpecularMask_ST.zw;
				float3 lerpResult560 = lerp( ( ifLocalVar3489 + ifLocalVar3483 ) , float3( 0,0,0 ) , ( _SpecMaskOpacity * tex2D( _SpecularMask, uv_SpecularMask ).r ));
				float3 SpecularOut983 = ( ifLocalVar3482 + lerpResult560 );
				float2 uv_SparkleMask = i.ase_texcoord1.xy * _SparkleMask_ST.xy + _SparkleMask_ST.zw;
				float4 tex2DNode1743 = tex2D( _SparkleMask, uv_SparkleMask );
				float3 localCenterEye1_g338 = CenterEye1_g338();
				float clampResult2503 = clamp( distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g338 : _WorldSpaceCameraPos ) ) , 0.0 , 100.0 );
				float temp_output_2804_0 = ( 1.0 - (0.0 + (clampResult2503 - 0.0) * (0.01 - 0.0) / (1.0 - 0.0)) );
				float3 temp_cast_20 = (_Threshold).xxx;
				float3 temp_cast_21 = (saturate( ( _Threshold + _Range ) )).xxx;
				sampler2D texvalue34_g357 = _SparklePatternRGB;
				float2 uv_SparklePatternRGB = i.ase_texcoord1.xy * _SparklePatternRGB_ST.xy + _SparklePatternRGB_ST.zw;
				float2 temp_output_4_0_g357 = uv_SparklePatternRGB;
				half2 uvin34_g357 = temp_output_4_0_g357;
				half2 dx34_g357 = ( ddx( temp_output_4_0_g357 ) * float2( 0.25,0.25 ) );
				half2 dy34_g357 = ( ddy( temp_output_4_0_g357 ) * float2( 0.25,0.25 ) );
				half bias34_g357 = 0.0;
				half4 localsupersample2x234_g357 = supersample2x2( texvalue34_g357 , uvin34_g357 , dx34_g357 , dy34_g357 , bias34_g357 );
				float4 ifLocalVar3485 = 0;
				UNITY_BRANCH 
				if( _SparkleSuperSample == 1.0 )
				ifLocalVar3485 = localsupersample2x234_g357;
				else if( _SparkleSuperSample < 1.0 )
				ifLocalVar3485 = tex2D( _SparklePatternRGB, uv_SparklePatternRGB );
				float temp_output_1710_0 = ( 1.0 - _SparkleTexColour );
				float3 desaturateInitialColor1704 = ifLocalVar3485.xyz;
				float desaturateDot1704 = dot( desaturateInitialColor1704, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1704 = lerp( desaturateInitialColor1704, desaturateDot1704.xxx, temp_output_1710_0 );
				sampler2D texvalue34_g356 = _SparklePatternRGB;
				float2 break2472 = uv_SparklePatternRGB;
				float2 appendResult2473 = (float2(-break2472.x , break2472.y));
				float3 localCenterEye1_g348 = CenterEye1_g348();
				float4 appendResult76_g347 = (float4(( WorldPosition - localCenterEye1_g348 ) , 0.0));
				float4 temp_output_77_0_g347 = mul( UNITY_MATRIX_V, appendResult76_g347 );
				float2 break83_g347 = ( (temp_output_77_0_g347).xy / (temp_output_77_0_g347).z );
				float2 appendResult86_g347 = (float2(( ( _ScreenParams.z / _ScreenParams.w ) * break83_g347.x ) , ( break83_g347.y * 2.0 )));
				float2 appendResult101_g347 = (float2(1.0 , 1.0));
				float2 appendResult102_g347 = (float2(0.0 , 0.0));
				float4 screenPos = i.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ifLocalVar3487 = 0;
				UNITY_BRANCH 
				if( _StereoCorrect == 1.0 )
				ifLocalVar3487 = ( ( ( ( -appendResult86_g347 * float2( 1,0.5 ) ) + float2( 0.5,0.5 ) ) * appendResult101_g347 ) + appendResult102_g347 );
				else if( _StereoCorrect < 1.0 )
				ifLocalVar3487 = (ase_screenPosNorm).xy;
				float mulTime2348 = _Time.y * _MotionSpeed;
				float2 appendResult2405 = (float2(mulTime2348 , 0.0));
				float cos2403 = cos( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float sin2403 = sin( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float2 rotator2403 = mul( appendResult2405 - float2( 0.5,0.5 ) , float2x2( cos2403 , -sin2403 , sin2403 , cos2403 )) + float2( 0.5,0.5 );
				float2 appendResult2356 = (float2(sin( mulTime2348 ) , cos( mulTime2348 )));
				float2 ifLocalVar3488 = 0;
				UNITY_BRANCH 
				if( _MotionType == 1.0 )
				ifLocalVar3488 = rotator2403;
				else if( _MotionType < 1.0 )
				ifLocalVar3488 = appendResult2356;
				float temp_output_2779_0 = ( ( WorldPosition.x + WorldPosition.y + WorldPosition.z ) * ( _WorldPosContribution / 10.0 ) );
				float2 appendResult2864 = (float2(-temp_output_2779_0 , temp_output_2779_0));
				float2 temp_output_2355_0 = ( ( appendResult2473 + ( ifLocalVar3487 * _ScreenContribution ) ) + float2( 0.25,0.25 ) + ( _MotionIntensity * ifLocalVar3488 ) + appendResult2864 );
				float2 temp_output_4_0_g356 = temp_output_2355_0;
				half2 uvin34_g356 = temp_output_4_0_g356;
				half2 dx34_g356 = ( ddx( temp_output_4_0_g356 ) * float2( 0.25,0.25 ) );
				half2 dy34_g356 = ( ddy( temp_output_4_0_g356 ) * float2( 0.25,0.25 ) );
				half bias34_g356 = 0.0;
				half4 localsupersample2x234_g356 = supersample2x2( texvalue34_g356 , uvin34_g356 , dx34_g356 , dy34_g356 , bias34_g356 );
				float4 ifLocalVar3486 = 0;
				UNITY_BRANCH 
				if( _SparkleSuperSample == 1.0 )
				ifLocalVar3486 = localsupersample2x234_g356;
				else if( _SparkleSuperSample < 1.0 )
				ifLocalVar3486 = tex2D( _SparklePatternRGB, temp_output_2355_0 );
				float3 desaturateInitialColor1705 = ifLocalVar3486.xyz;
				float desaturateDot1705 = dot( desaturateInitialColor1705, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1705 = lerp( desaturateInitialColor1705, desaturateDot1705.xxx, temp_output_1710_0 );
				float3 localCenterEye1_g355 = CenterEye1_g355();
				float3 smoothstepResult901 = smoothstep( temp_cast_20 , temp_cast_21 , ( desaturateVar1704 * desaturateVar1705 * ( 1.0 - pow( ( distance( WorldPosition , localCenterEye1_g355 ) / 10000.0 ) , 0.5 ) ) ));
				float3 normalizeResult2480 = normalize( ase_worldViewDir );
				float temp_output_2833_0 = (-1.0 + (temp_output_2804_0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0));
				float3 appendResult2806 = (float3(_SparkleFresnel1.x , ( _SparkleFresnel1.y * temp_output_2833_0 ) , pow( _SparkleFresnel1.z , temp_output_2833_0 )));
				float3 break2506 = (float3( 0,0,0 ) + (appendResult2806 - float3( 0,0,0 )) * (float3( 0.1,0.1,0.1 ) - float3( 0,0,0 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float fresnelNdotV2371 = dot( NormalSpecular965, normalizeResult2480 );
				float fresnelNode2371 = ( break2506.x + break2506.y * pow( max( 1.0 - fresnelNdotV2371 , 0.0001 ), break2506.z ) );
				float fresnelNdotV2440 = dot( -NormalSpecular965, normalizeResult2480 );
				float fresnelNode2440 = ( break2506.x + break2506.y * pow( max( 1.0 - fresnelNdotV2440 , 0.0001 ), break2506.z ) );
				float switchResult2437 = (((ase_vface>0)?(( 1.0 - saturate( fresnelNode2371 ) )):(( 1.0 - saturate( fresnelNode2440 ) ))));
				float4 ifLocalVar3473 = 0;
				UNITY_BRANCH 
				if( _UseSparkleShimmer == 1.0 )
				ifLocalVar3473 = ( ( tex2DNode1743.r * tex2DNode1743.a ) * ( _SparkleColor1 * ( 2.5 * ( 200.0 * temp_output_2804_0 ) ) ) * float4( smoothstepResult901 , 0.0 ) * switchResult2437 );
				float4 SparkleOut971 = ifLocalVar3473;
				float Alpha1262 = (ifLocalVar3504).w;
				int localisCamera1_g358 = isCamera1_g358();
				int Cam17_g358 = localisCamera1_g358;
				int temp_output_5_0_g358 = (int)_IsInMirror;
				int temp_output_6_0_g358 = (int)_IsNotMirror;
				float ifLocalVar3478 = 0;
				UNITY_BRANCH 
				if( _MirrorSystem == 1.0 )
				ifLocalVar3478 = (float)( (float)Cam17_g358 == 1.0 ? ( (float)temp_output_5_0_g358 == 1.0 ? ( Cam17_g358 + temp_output_5_0_g358 ) : ( Cam17_g358 * temp_output_5_0_g358 ) ) : ( (float)temp_output_6_0_g358 == 0.0 ? ( Cam17_g358 * temp_output_6_0_g358 ) : ( Cam17_g358 + temp_output_6_0_g358 ) ) );
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
				float4 appendResult1923 = (float4(( ifLocalVar3477 + float4( Emission1285 , 0.0 ) + float4( ( ( float3( 0.05,0.05,0.05 ) + (desaturateVar2291).xyz ) * SpecularOut983 ) , 0.0 ) + SparkleOut971 ).rgb , ( _Alpha * Alpha1262 )));
				
				
				finalColor = appendResult1923;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback "Standard"
}
/*ASEBEGIN
Version=18814
-1635;27;1486;818;430.3813;1950.257;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;1378;-5038.125,-1071.467;Inherit;False;2099.93;995.9517;;34;2150;1491;1406;1908;1910;1683;1682;1631;1630;1629;1684;1389;1381;1382;1380;1383;2017;1665;1905;1911;1879;1891;1890;2014;1589;1886;1551;1878;2152;2153;2154;2159;3408;3496;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;3408;-4842.446,-644.0442;Inherit;False;VertexLightData;-1;;257;d6cc1c00f5d200e45903717e6fa3d55c;0;0;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.RangedFloatNode;3464;-5078.783,-2525.445;Inherit;False;Property;_NorDist;Normal Distance Modifier;37;0;Create;False;0;0;0;False;0;False;0;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3510;-5096.384,-2452.69;Inherit;False;View Distance;-1;;324;2a6ef75a50a2bd147a81c448d8de0d4d;1,8,0;1;9;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3458;-4819.542,-2450.09;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3527;-4965.248,-2369.176;Inherit;False;Constant;_Dist_Null;Dist_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-4425.395,-217.0346;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-4296.662,-215.1421;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ConditionalIfNode;3495;-4646.642,-2503.326;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3459;-4474.721,-2491.7;Inherit;False;NormalDist;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1237;-6000.223,-2294.419;Inherit;False;2248.478;1151.156;;36;428;603;3013;3061;1856;1861;3089;3091;3090;3086;3087;965;3088;3055;1234;602;3060;3011;962;1235;430;3062;3049;2962;2958;3012;3059;3014;2957;3432;3442;3451;3460;3461;3462;3494;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-4556.51,-277.7959;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-4141.057,-209.6132;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-5955.564,-1993.389;Inherit;False;Property;_NormalPowerSpecular;Normal Power Specular;39;0;Create;True;0;0;0;False;0;False;0.5;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3460;-5900.023,-2061.458;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1891;-4033.376,-124.1354;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2014;-4226.261,-291.5107;Inherit;False;VertAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3461;-5859.552,-1263.072;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1890;-4006.89,-222.5086;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-5915.11,-1336.748;Inherit;False;Property;_NormalPower;Normal Power;38;0;Create;True;0;0;0;False;0;False;0;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;281;-3675.826,-1809.984;Inherit;False;1722.566;633.3398;Uses directional light or uses the static light direction;20;1076;1296;5;2215;3414;1165;2635;1876;1233;248;633;1247;249;252;1246;251;2148;1232;2147;3415;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1911;-3881.313,-341.6737;Inherit;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-3810.657,-252.561;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3442;-5495.817,-1381.638;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2147;-3665.729,-1635.758;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3451;-5555.343,-1966.738;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-3668.285,-1746.144;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;3432;-5962.919,-1573.185;Inherit;False;0;2957;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;2148;-3465.729,-1594.758;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;3059;-5693.719,-2239.311;Inherit;True;Property;_NormalMaskR;Normal Mask (R);41;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;1905;-3631.562,-286.9634;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3012;-5880.458,-1875.55;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2957;-6000.658,-1762.531;Inherit;True;Property;_Normal;Normal (N);35;1;[Normal];Create;False;0;0;0;False;2;Space(5);Header(.  Normal  .);False;None;6de7e95ea7231d74e880c76a5472134d;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ClampOpNode;3014;-5876.558,-1450.45;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2958;-5690.157,-1599.218;Inherit;True;Property;_TextureSample1;Texture Sample 1;100;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-3373.02,-285.3594;Inherit;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3013;-5334.056,-1388.45;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2153;-5012.042,-1002.19;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2962;-5652.581,-1701.25;Inherit;False;Property;_NormSuperSample;SuperSample (expensive);36;0;Create;False;0;0;0;False;1;Toggle(_);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-3651.002,-1303.107;Float;False;Property;_StaticLightZ;Static Light Z;30;0;Create;True;0;0;0;False;0;False;0.44;0.44;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3049;-5681.562,-1854.177;Inherit;False;NormalTextureSuperSample;-1;;326;c5e7d95f0a9b898419b29857c25ecde5;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;49;FLOAT;1;False;4;FLOAT3;0;FLOAT;39;FLOAT;40;FLOAT;41
Node;AmplifyShaderEditor.RangedFloatNode;251;-3652.718,-1375.148;Float;False;Property;_StaticLightY;Static Light Y;29;0;Create;True;0;0;0;False;0;False;0.55;0.55;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3062;-5394.901,-1516.182;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-3652.624,-1449.432;Float;False;Property;_StaticLightX;Static Light X;28;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;0.68;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-3245.587,-1625.199;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2154;-4796.145,-928.688;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3511;-3332.646,-1277.474;Inherit;False;VR_Center_Eye;-1;;327;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.WorldPosInputsNode;2150;-4935.224,-817.419;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LightColorNode;633;-3340.204,-1504.471;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;2121;-5759.884,339.9149;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3494;-5310.86,-1733.77;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2152;-4770.013,-1031.351;Inherit;False;Property;_LightMode;Lighting Mode;18;1;[Enum];Create;False;0;2;Surface;0;Object2World;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3061;-5140.401,-1416.681;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;248;-3319.168,-1387.851;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-3099.9,-1668.961;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3496;-4566.475,-926.1456;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-3125.209,-1463.475;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-5595.17,260.0959;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2144;-5504.743,334.7301;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-3007.244,-1543.556;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;430;-4960.079,-1477.532;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2635;-3009.038,-1368.188;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.3333,0.3333,0.3333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2017;-4589.264,-702.3149;Inherit;False;VertLightPos1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1076;-2836.239,-1458.296;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1235;-4599.294,-1512.207;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;2140;-5310.849,252.4027;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2159;-4404.587,-929.3344;Inherit;False;Lightmode;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;571;2177.812,309.4184;Inherit;False;1410.604;490.6661;;15;3333;1998;627;1999;351;1425;3335;3336;1424;349;3352;3353;3474;3499;3506;VRChat Friends-Only;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-4395.913,-445.7386;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-4391.887,-627.3135;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-4395.358,-356.1777;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2215;-2664.903,-1452.519;Inherit;False;Dir_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-4279.809,-1512.173;Inherit;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-4395.832,-537.2676;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-4224.535,-760.7634;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2034;-5080.248,321.5851;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.33;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3415;-2647.893,-1378.048;Inherit;False;GetBakedLight;-1;;328;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.NormalizeNode;1382;-4092.896,-759.2022;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-4116.509,-519.3514;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3414;-2439.197,-1431.675;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2026;-4916.876,319.8529;Inherit;False;False;2;0;FLOAT;2;False;1;FLOAT;25;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-4111.055,-853.3388;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;349;2182.999,609.2747;Inherit;True;Property;_FriendsOnlyRT;> FriendsOnly RenderTexture;106;0;Create;False;0;0;0;False;0;False;-1;None;82b3c1c318ad4cf47a66ffc8a2859a78;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-2660.294,-1529.07;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1424;2469.958,636.8937;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;5;-2278.497,-1506.03;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1683;-3913.112,-519.0101;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-3832.175,-813.9521;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2035;-4753.248,291.5851;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;1910;-3770.719,-645.6983;Inherit;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;3336;2565.578,623.4047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1908;-3568.139,-529.9202;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-2141.104,-1578.773;Inherit;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2025;-4626.137,291.327;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-3678.922,-819.1361;Inherit;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;2081;-2729.621,-199.2258;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4534.744,190.634;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-3282.966,-528.4603;Inherit;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;3335;2273.578,572.4047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2033;-4486.248,291.5851;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4520.63,98.07337;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3416;-2530.258,120.6594;Inherit;False;GetBakedLight;-1;;329;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.LightColorNode;1484;-2552.846,-94.46214;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;1994;-4219.491,204.3985;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-2508.796,25.12043;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;3500;-3957.652,296.1707;Inherit;False;Constant;_Shading_Null;Shading_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2082;-2481.4,-173.4568;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1425;2300.324,529.0254;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1058;-3948.189,177.9939;Inherit;False;Property;_UseShading;Use Shading;17;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(.  Shadow  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3434;-4089.306,579.5365;Inherit;False;0;2211;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-2287.212,-93.21018;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3497;-3725.2,177.3633;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2211;-3850.617,556.9277;Inherit;True;Property;_LightMask;Light Mask (R);26;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3860.334,389.5299;Inherit;False;Property;_OffsetDot;Offset Dot;22;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3263;-3725.823,752.9653;Float;False;Property;_LightMaskLevel;Mask Level;27;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3314;-2324.502,24.58342;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3169;-2274.916,120.4197;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1.3,1.3,1.3;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CeilOpNode;351;2444.413,528.424;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2870;-2079.482,101.5965;Inherit;False;Property;_LightMultiplier;Light Multiplier;12;0;Create;True;0;0;0;False;1;Header(. Lighting .);False;1.1;1.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;627;2677.13,519.6781;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-3554.867,472.5686;Float;False;Property;_ShadowSharpness1;Shadow Sharpness;23;0;Create;False;0;0;0;False;0;False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-2070.332,-25.21087;Inherit;False;3;3;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3485.761,366.6765;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3262;-3466.056,569.3016;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1999;2553.491,444.0493;Inherit;False;Property;_FriendsOnly1;Invert Friends Only;107;0;Create;False;0;0;0;False;3;Toggle(_);;;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-3283.7,483.0416;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2867;-1859.806,66.28204;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1916;-1884.798,159.276;Inherit;False;Property;_MinLight;Min Light;14;0;Create;True;0;0;0;False;0;False;0.05;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3506;2853.668,476.1191;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3333;3007.626,471.3551;Inherit;False;FriendsOnlyInvert;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2982;-2120.431,-501.9006;Inherit;True;Property;_MainTex;Texture (RGB,A);4;0;Create;False;0;0;0;False;1;Header(.  Main  .);False;None;5bfa835c2acdbf34db98593ea20f81b2;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SaturateNode;1254;-3093.266,641.0908;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;573;-2953.281,478.7458;Inherit;False;1236.993;594.242;;11;979;815;1025;1033;32;1032;1010;1008;1016;1125;3501;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3430;-2122.881,-317.3751;Inherit;False;0;2982;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;3343;-2441.472,-973.886;Inherit;True;Property;_MainTexFriends;FriendsOnly Texture (RGB,A);109;0;Create;False;0;0;0;False;0;False;None;30f44e6c764737143a2cade4aa3aad40;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ClampOpNode;3331;-1642.422,72.27618;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3431;-2484.941,-784.4052;Inherit;False;0;3343;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;3325;-1481.564,36.7731;Inherit;False;Float3 Max;-1;;332;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3467;-2097.337,-776.1661;Inherit;False;TextureSuperSample;-1;;334;23a6a6e8fbe28134cac41513630794b1;0;3;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.RangedFloatNode;1915;-1424.348,-34.4736;Inherit;False;Property;_MaxLight;Max Light;13;0;Create;True;0;0;0;False;0;False;0.9;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3340;-1657.368,-1092.978;Inherit;False;Property;_FriendsOnlyTexture;Friends Only Texture;108;0;Create;True;0;0;0;False;1;Toggle(_);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2997;-1829.031,-519.3008;Inherit;False;TextureSuperSample;-1;;333;23a6a6e8fbe28134cac41513630794b1;0;3;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.RangedFloatNode;2988;-1821.999,-593.6854;Inherit;False;Property;_TexSuperSample;SuperSample (expensive);5;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3345;-2164.768,-973.9682;Inherit;True;Property;_TextureSample4;Texture Sample 4;101;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1008;-2925.583,515.3505;Inherit;False;Property;_ShadowColour;Shadow Colour;20;0;Create;True;0;0;0;False;0;False;0.7098039,0.7098039,0.7098039,1;0.8196079,0.8196079,0.8196079,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3466;-1996.409,-1056.526;Inherit;False;Property;_FriendsSuperSample;SuperSample (expensive);110;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2984;-1831.631,-359.3005;Inherit;True;Property;_TextureSample7;Texture Sample 7;101;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;3338;-1663.83,-1020.833;Inherit;False;3333;FriendsOnlyInvert;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1125;-2926.257,854.1436;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;3475;-1646.696,-850.675;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ConditionalIfNode;3476;-1464.356,-566.2165;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3348;-1335.639,-1064.589;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1032;-2664.649,680.0994;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;3;COLOR;0.5,0.5,0.5,0;False;4;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;32;-2747.916,855.6759;Inherit;True;Property;_Ramp;Ramp (RGB);21;0;Create;False;0;0;0;False;0;False;-1;None;c320938fa0c7f9043aabb704290909a3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3301;-1272.89,11.4949;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;3332;-1169.422,178.2762;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;18;-1263.283,-410.7312;Float;False;Property;_Color;> Color;6;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1033;-2422.506,849.3695;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2621.69,533.0191;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3504;-1237.662,-695.8106;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1025;-2341.685,666.077;Inherit;False;Property;_GradientorRamp;Gradient or Ramp;19;1;[Enum];Create;True;0;2;Ramp_Texture;0;Linear_Gradient;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;815;-2266.22,841.6435;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-988.1868,125.6036;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1016;-2286.486,550.7116;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;3011;-5368.16,-1927.75;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-3680.706,-738.5935;Inherit;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-1018.745,-410.1774;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-1033.679,-626.1235;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-654.3216,-609.6462;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2216;-4540.25,454.3213;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1347;-614.4459,-361.8139;Inherit;False;1534.475;525.8724;hue & saturation;12;585;1330;581;2917;2911;2908;2918;325;2910;3241;3244;3249;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;2217;-4535.136,380.7607;Inherit;False;2215;Dir_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3501;-2090.065,634.6515;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3120;-745.1984,411.3862;Inherit;False;Property;_LightSatLimiter;Light Saturation Limiter;15;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3326;-717.7537,324.6924;Inherit;False;Float3 Max;-1;;335;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3060;-5217.225,-1954.165;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-1924.501,628.5303;Inherit;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;569;-1858.718,-2794;Inherit;False;2937.823;1659.745;;90;3179;3182;3174;3177;3181;2002;3101;983;560;696;824;701;695;3072;3069;3104;3085;3064;3103;2301;3068;3081;3080;3067;3075;690;2234;1920;838;691;816;3079;2294;837;817;1921;3057;3056;554;1919;561;545;2905;556;2900;2902;555;551;553;2899;1051;1783;967;2898;1928;2236;2237;546;2219;1909;2225;3183;3186;3190;3192;3193;3211;3215;3216;3217;3218;3219;3220;3226;3227;3251;3354;3355;3407;3435;3437;3438;3482;3483;3489;3490;3491;3492;3493;3508;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;1470;-2314.928,337.9105;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2093;-465.273,325.6527;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;602;-5016.11,-1692.681;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3253;-521.091,487.0372;Inherit;False;Property;_LightSatTotal;Light Saturation Max;16;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;2213;-4301.639,385.696;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RGBToHSVNode;2909;-357.1839,-572.6876;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;335;-2366.757,408.3535;Inherit;False;Property;_ShadowDarkness;Shadow Darkness;24;0;Create;True;0;0;0;False;0;False;0.22;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3121;-501.5092,415.606;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2910;-444.7452,-308.1699;Inherit;False;Property;_Hue;Hue;7;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2130.354,351.2448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3255;-286.2798,492.3739;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3512;-1783.858,-2540.273;Inherit;False;VR_Center_Eye;-1;;336;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.RangedFloatNode;2225;-1795.544,-2764.233;Inherit;False;Property;_StereoFixSpec;Stereo Converge (flatten);53;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-570.1216,18.60373;Inherit;False;Property;_ShadowSaturation;Shadow Saturation;25;0;Create;True;0;0;0;False;0;False;0.85;0.9;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2911;-75.27967,-275.3194;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;325;-591.8463,-218.3334;Float;False;Property;_Saturation;Saturation;8;0;Create;True;0;0;0;False;0;False;1;1.15;-2;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1330;-535.6135,-68.44437;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2280.572,264.617;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-1795.544,-2684.233;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;1234;-4681.257,-1694.679;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;2218;-4147.478,380.9126;Inherit;False;FinalLightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;2098;-319.7894,325.1325;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-1824.178,311.0082;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;870;-3935.378,-5113.513;Inherit;False;4668.005;2027.595;;96;2478;971;2003;877;2437;1745;2811;901;2308;875;2313;2564;2801;900;1743;898;2394;1704;2813;2805;2810;2812;1705;2556;897;894;2396;2440;2371;1710;2473;2355;2558;1709;2506;2395;2458;2480;2476;1746;2379;2505;2864;2544;2359;2372;2865;2360;1713;2806;2686;2472;2377;2356;2400;2841;2840;960;2403;2779;885;1732;2349;2405;2778;2406;902;2357;2863;2833;2866;2348;2404;2834;2862;2361;2804;2839;2503;2949;2950;2954;2955;2956;3093;3094;3096;2999;2998;3097;3436;3473;3485;3486;3487;3488;Sparkle/Shimmer Effect;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;3514;-2143.525,-3346.59;Inherit;False;View Distance;-1;;337;2a6ef75a50a2bd147a81c448d8de0d4d;1,8,0;1;9;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3249;-245.3008,24.12432;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2918;-275.151,-167.917;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3462;-5256.494,-2179.041;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;3055;-4493.392,-1692.869;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3088;-5268.543,-2253.197;Inherit;False;Property;_NormalPowerMatCap;Normal Power MatCap;40;0;Create;True;0;0;0;False;0;False;0.5;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3493;-1529.824,-2760.415;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;3244;-240.697,-64.57932;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.HSVToRGBNode;2908;153.305,-266.6901;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;3256;-15.89054,325.1595;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2219;-1795.544,-2444.233;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;30;-791.1228,614.0745;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;2503;-1853.843,-3345.896;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;393;-63.82562,-1050.789;Inherit;False;1701.075;645.4055;;24;1284;372;388;390;1281;1291;383;370;384;1290;382;376;379;360;2300;2299;368;369;1533;1536;1534;1530;1537;3505;Rim/Outline;1,0.141,0.141,1;0;0
Node;AmplifyShaderEditor.DesaturateOpNode;2917;460.3011,-129.2823;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3241;16.30298,-14.57932;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-1449.881,-2593.672;Inherit;False;Property;_SpecularSize;Specular Size;49;0;Create;True;0;0;0;False;0;False;1;6.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-4338.765,-1699.736;Inherit;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2237;-1357.544,-2753.233;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1777;226.9369,252.5126;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3087;-5036.958,-2052.152;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;743.4008,383.4407;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2236;-1163.059,-2609.66;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;967;-1844.883,-1956.931;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-1180.544,-2756.233;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1928;-1844.883,-2035.113;Inherit;False;Property;_StereoFixSpecCap;Stereo Converge (flatten);56;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1537;-30.98103,-749.8091;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1534;-48.29684,-922.1852;Inherit;False;Property;_Scale1;Rim Normal Power;93;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2898;-1844.883,-2116.931;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1530;-49.35001,-1007.547;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3086;-4821.39,-2057.404;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;581;744.1608,49.20317;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;2839;-1700.059,-3344.948;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-1236.375,-2685.906;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2361;-3753.106,-3439.271;Inherit;False;Property;_MotionSpeed;Motion Speed;79;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3074;988.0295,68.27046;Inherit;False;MaintexRGB;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-1207.835,-2506.42;Inherit;False;Property;_SpecularStrength;Specular Strength;50;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2804;-1521.098,-3343.817;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ExpOpNode;553;-996.0268,-2633.798;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2899;-1823.167,-2299.266;Inherit;True;Property;_SpecularMatcap;Specular Matcap (RGB);55;0;Create;False;0;0;0;False;0;False;None;cf4d3dd252fe9d24ca515e882a3534bf;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;977.7213,396.0124;Inherit;False;LightColour;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;3090;-4670.416,-2055.157;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;551;-1008.481,-2757.119;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1536;275.2924,-983.5421;Inherit;False;3;0;FLOAT3;0.5,0.5,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1533;-28.51046,-842.7043;Inherit;False;Property;_RimNormal;Rim Normal;92;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;1732;-3903.547,-4883.444;Inherit;True;Property;_SparklePatternRGB;Sparkle Pattern (RGB);70;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode;3520;-1572.417,-1950.33;Inherit;False;VR MatCap;-1;;345;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;3521;-1564.883,-2116.931;Inherit;False;Matcap (legacy);-1;;343;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;369;203.0375,-604.9886;Inherit;False;Property;_Scale;Rim Scale;89;0;Create;False;0;0;0;False;0;False;0;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2866;-3519.922,-3950.225;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;561;-927.7875,-2504.637;Inherit;False;Property;_SpecularOpacity;Specular Opacity;48;0;Create;True;0;0;0;False;2;Space(5);Header(.  Specular  .);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2905;-1130.017,-2273.651;Inherit;False;Property;_Legacy2;Legacy;61;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1713;-3660.088,-4665.986;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3077;1459.413,344.6912;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3505;236.7073,-837.098;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;3093;-3834.962,-4127.624;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2404;-3828.275,-3611.519;Inherit;False;Property;_RotateLinear;Rotate Linear;80;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2862;-3633.193,-3780.882;Float;False;Property;_WorldPosContribution;WorldPos Contribution;77;0;Create;True;0;0;0;False;0;False;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;545;-865.4236,-2755.669;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2900;-1270.484,-2191.976;Inherit;True;Property;_TextureSample3;Texture Sample 3;90;0;Create;True;0;0;0;False;0;False;349;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2902;-1269.793,-2004.476;Inherit;True;Property;_TextureSample5;Texture Sample 5;90;0;Create;True;0;0;0;False;0;False;349;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NormalizeNode;3091;-4484.266,-2053.707;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;2834;-1427.717,-3439.009;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;556;-824.3777,-2655.549;Inherit;False;True;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2348;-3576.545,-3434.713;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;368;217.2756,-513.4219;Inherit;False;Property;_Power;Rim Power;88;0;Create;False;0;0;0;False;0;False;0;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2863;-3283.696,-3802.151;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;2349;-3180.589,-3477.478;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3089;-4314.611,-2057.757;Inherit;False;NormalMatCap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-915.5077,-1938.875;Inherit;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;58;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3491;-911.5875,-2100.971;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;3097;-2344.652,-3451.803;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;2472;-3392.588,-4660.741;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.CosOpNode;2357;-3177.304,-3409.784;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2299;438.7214,-600.0447;Inherit;False;Property;_Min;Rim Min;90;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;2406;-3559.192,-3601.475;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;6.27;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2300;465.7214,-519.0447;Inherit;False;Property;_Max;Rim Max;91;0;Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3056;-620.6622,-2525.302;Inherit;False;True;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2778;-3318.212,-3928.102;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3096;-3601.305,-4340.908;Inherit;False;Property;_StereoCorrect;Stereo Correct;76;1;[ToggleUI];Create;True;0;1;Linear;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-649.548,-2732.403;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;360;421.1036,-837.3793;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;437;373.4562,891.688;Inherit;False;2518.223;840.2;Comment;32;3264;3266;3109;1274;405;414;807;1278;2180;1279;406;1516;1517;407;408;2920;1518;810;2919;2165;2176;2175;2166;2210;2181;2207;2208;2209;963;1930;2873;3268;Matcap > Alpha Supported;0.8221117,0.184,1,1;0;0
Node;AmplifyShaderEditor.ComponentMaskNode;3094;-3623.663,-4126.324;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TFHCRemapNode;1918;1650.786,357.5279;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.0001,0.0001,0.0001;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3516;-3645.763,-4266.91;Inherit;False;VR_ScreenSpaceUV;-1;;347;83887303006e6e7459722034b3b9f189;0;4;97;FLOAT;1;False;98;FLOAT;1;False;99;FLOAT;0;False;100;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2405;-3293.771,-3603.028;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;3487;-3357.816,-4262.777;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector3Node;902;-2380.579,-3733.505;Float;False;Property;_SparkleFresnel1;Fresnel Bias, Scale, Power;83;0;Create;False;0;0;0;False;0;False;0,10,0.1;0,10,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1930;396.7602,1323.333;Inherit;False;Property;_StereoFix;Stereo Converge (flatten);96;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;817;-750.7472,-2105.758;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;837;-856.2704,-2359.592;Inherit;False;Property;_SpecMatCapColor;SpecMatCap Colour;59;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,0.5746068,0.4764151,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;379;644.755,-837.0701;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;2833;-2295.517,-3590.409;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1921;-651.6487,-1993.25;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2209;596.1299,1577.833;Inherit;False;Property;_MatcapSpin;MatcapSpin;100;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;885;-3466.895,-4024.817;Float;False;Property;_ScreenContribution;Screen Contribution;75;0;Create;True;0;0;0;False;0;False;0.3;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;1844.679,352.6364;Inherit;False;PostDesaturation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;2356;-3029.777,-3451.243;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;376;583.8023,-1006.408;Inherit;False;Property;_RimOutlineColour;Rim/Outline Colour;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.6544117,0.3560733,0.448663,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2400;-3076.654,-3686.837;Inherit;False;Property;_MotionType;Motion Type;78;1;[Enum];Create;True;0;2;Linear;0;Circular;1;0;False;1;Space(5);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;2294;-474.6246,-2724.763;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.0001;False;2;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;963;424.6455,1420.29;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;2403;-3110.379,-3599.333;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;3057;-451.3709,-2600.302;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1746;-3280.765,-4662.587;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2779;-3146.794,-3928.2;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.0075;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2873;422.2152,1205.173;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3079;-286.9155,-2520.75;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2360;-3039.769,-3776.426;Inherit;False;Property;_MotionIntensity;Motion Intensity;81;0;Create;True;0;0;0;False;0;False;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;838;-625.657,-2328.92;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2686;-3139.362,-4103.162;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;2208;797.9037,1541.2;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;384;642.6534,-661.0529;Inherit;False;Property;_Amount;Rim Opacity;87;0;Create;False;0;0;0;False;0;False;0;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;671.5806,-567.5807;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-481.666,-2103.463;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;2865;-2993.922,-3950.225;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;836.0294,-925.1907;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;2840;-1970.759,-3554.437;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-853.549,-2189.995;Inherit;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;57;0;Create;True;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3524;675.3692,1207.173;Inherit;False;Matcap (legacy);-1;;351;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;3488;-2876.929,-3652.966;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2841;-1966.023,-3645.833;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;816;-304.7284,-2727.417;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2473;-3135.793,-4664.151;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;3523;679.5027,1427.81;Inherit;False;VR MatCap;-1;;353;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;3177;-249.7355,-1814.242;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3075;-60.96707,-2449.566;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;383;834.2267,-830.0812;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;370;996.3516,-660.6846;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;2181;433.2477,952.5939;Inherit;True;Property;_Matcap;Matcap (RGB,A);95;0;Create;False;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.DynamicAppendNode;2234;-168.2825,-2726.438;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2359;-2727.905,-3819.424;Inherit;False;2;2;0;FLOAT;0.1;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2864;-2848.922,-3939.225;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2544;-2872.73,-4118.502;Inherit;False;2;2;0;FLOAT2;0.5,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1291;857.8261,-1003.563;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;3080;-70.5372,-2522.968;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1295;1178.112,-1581.713;Inherit;False;1534.433;513.8026;;15;450;331;330;329;326;805;462;461;327;808;970;328;1285;3260;3433;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.RotatorNode;2210;947.3047,1209.274;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2377;-1948.06,-5055.522;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-262.5412,-2262.616;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;2207;988.4868,1418.837;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;960;-3519.427,-4947.928;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3067;10.81282,-2747.686;Inherit;False;Property;_SpecMatCapColor1;Specular Colour;51;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;3513;-1771.232,-4986.866;Inherit;False;VR_Center_Eye;-1;;355;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.RangedFloatNode;3179;-241.2421,-1748.165;Inherit;False;Property;_ProbeSmoothness;Probe Smoothness;66;0;Create;True;0;0;0;False;0;False;0.75;0.95;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2806;-1759.143,-3714.182;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2002;-353.6673,-2335.694;Inherit;False;Property;_UseSpecularMatCap;Use Specular MatCap;54;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(. Specular Overlay);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3182;45.02692,-1644.317;Inherit;False;Property;_ReflectionOpacity;Reflection Opacity;67;0;Create;True;0;0;0;False;0;False;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2176;1216.404,1252.17;Inherit;True;Property;_Matcap1;;90;0;Create;False;0;0;0;False;0;False;-1;None;ca5f4329374a4554eb5fcb2a1bbd66c2;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;2950;-2717.697,-4798.807;Inherit;False;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.ConditionalIfNode;3492;-98.79723,-2329.728;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;3068;234.8588,-2736.622;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;2949;-3019.572,-4731.55;Inherit;False;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.WireNode;2955;-2608.933,-4827.055;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DistanceOpNode;2379;-1493.1,-5042.535;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3081;152.9628,-2513.168;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3103;-211.0815,-1973.404;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1281;1349.63,-1000.376;Inherit;False;Property;_RimMode;Rim Mode;86;1;[Enum];Create;True;0;3;Blend_Lerp;0;Multiply;1;AddSubtract;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2301;16.52673,-2588.443;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;372;1161.717,-994.4828;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2372;-1777.94,-3961.066;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3433;1193.122,-1338.549;Inherit;False;0;328;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;2558;-3112.507,-4767.948;Inherit;False;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.IndirectSpecularLight;3174;-17.21165,-1804.769;Inherit;False;World;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;2476;-2039.747,-3840.646;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;388;1157.961,-609.7917;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2175;1166.414,1044.558;Inherit;True;Property;_TextureSample0;Texture Sample 0;90;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;2505;-1589.558,-3714.75;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2166;1278.499,954.3699;Inherit;False;Property;_Legacy;Legacy;102;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;390;1170.651,-802.2184;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2355;-2501.09,-4092.559;Inherit;False;4;4;0;FLOAT2;0,0;False;1;FLOAT2;0.25,0.25;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;3181;180.158,-1899.787;Inherit;False;Property;_UseReflection;Use Reflection Probe;64;1;[ToggleUI];Create;False;0;0;0;False;2;Space(5);Header(. Reflection Probe);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2395;-1320.011,-5028.739;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10000;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3101;79.22963,-2123.226;Inherit;False;Property;_SpecMatCapMode;SpecMatCap Mode;60;1;[Enum];Create;True;0;2;Additive;0;Multiplied;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3064;265.3668,-2612.644;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3104;33.38334,-1995.834;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;2919;1643.985,1203.188;Inherit;False;Property;_MatCapColor;MatCap Colour;101;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,0.3333333,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;2165;1512.686,989.6039;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2556;-2194.502,-4412.349;Inherit;True;Property;_TextureSample2;Texture Sample 2;100;0;Create;True;0;0;0;False;0;False;695;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;3085;328.3998,-2497.272;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2954;-1924.163,-4504.608;Inherit;False;Property;_SparkleSuperSample;SuperSample (expensive);71;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;1650.314,-747.1198;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1514;1678.067,-888.0831;Inherit;False;Property;_UseRim;Use Rim;84;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(.  Rim Fresnel  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2999;-2173.673,-4671.193;Inherit;True;TextureSuperSample;-1;;357;23a6a6e8fbe28134cac41513630794b1;0;3;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.RangedFloatNode;1709;-1615.061,-4495.261;Inherit;False;Property;_SparkleTexColour;SparkleTex Saturation;72;0;Create;False;0;0;0;False;0;False;0;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;2458;-1554.132,-3898.97;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;328;1193.592,-1534.267;Inherit;True;Property;_Emission;Emission Map (RGB,A);31;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NormalizeNode;2480;-1590.047,-3814.846;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2956;-2211.213,-4884.405;Inherit;True;Property;_TextureSample6;Texture Sample 6;100;0;Create;True;0;0;0;False;0;False;695;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;2506;-1412.8,-3716.33;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ConditionalIfNode;1284;1442.056,-852.0511;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2998;-2151.237,-4216.599;Inherit;True;TextureSuperSample;-1;;356;23a6a6e8fbe28134cac41513630794b1;0;3;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.LerpOp;3407;260.0489,-1828.663;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3507;1890.983,-862.2957;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;1477.567,-1534.099;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FresnelNode;2371;-1163.438,-3964.105;Inherit;False;Standard;WorldNormal;ViewDir;False;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;897;-1185.224,-4365.983;Float;False;Property;_Threshold;Threshold;73;0;Create;True;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;894;-1184.447,-4287.943;Float;False;Property;_Range;Range;74;0;Create;True;0;0;0;False;0;False;0.3;0;0.05;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3435;-261.6221,-1303.378;Inherit;False;0;695;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ConditionalIfNode;3483;422.1483,-1881.318;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2396;-1168.331,-5026.638;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;408;1735.079,1074.02;Inherit;False;Property;_MatcapIntensity;Matcap Intensity;98;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3069;473.8586,-2542.622;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;20,20,20;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;810;1693.109,955.861;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1710;-1355.441,-4491.478;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3485;-1564.088,-4693.654;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;3109;1943.706,1470.806;Inherit;True;Property;_MatCapMask;MatCap Mask (R,A);103;0;Create;False;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1518;1852.559,1299.273;Float;False;Property;_MatcapSaturation;Matcap Saturation;99;0;Create;True;0;0;0;False;0;False;1;0.25;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2920;1836.649,1202.565;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3489;338.3679,-2121.484;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3486;-1571.269,-4391.149;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FresnelNode;2440;-1163.259,-3804.006;Inherit;False;Standard;WorldNormal;ViewDir;False;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3072;416.2928,-2653.818;Inherit;False;Property;_SpecMode;Specular Mode;52;1;[Enum];Create;False;0;2;Additive;0;Multiplied;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;824;116.3333,-1394.451;Inherit;False;Property;_SpecMaskOpacity;SpecMatcap Level;62;0;Create;False;0;0;0;False;1;Space(10);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;695;41.20361,-1324.644;Inherit;True;Property;_SpecularMask;Specular MatCap Mask (R,A);63;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;3137;2250.739,-222.2424;Inherit;False;832.0293;300.472;MirrorSystem;6;3159;3142;3140;3429;3478;3498;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;597.1917,-1915.642;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;898;-905.4461,-4339.74;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2810;-610.8661,-4143.396;Inherit;False;Constant;_Float0;Float 0;94;0;Create;True;0;0;0;False;0;False;2.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3266;2237.043,1500.201;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2813;-892.7233,-3817.364;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1998;2624.466,356.3426;Inherit;False;Property;_FriendsOnly;Friends Only ON/OFF;105;0;Create;False;0;0;0;False;3;Toggle(_);Space(20);Header(VRC Friends Only);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1704;-1180.733,-4560.023;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3436;-796.8342,-4698.592;Inherit;False;0;1743;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;970;1524.552,-1415.231;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1517;2153.961,1301.211;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3264;2072.159,1659.032;Float;False;Property;_MatcapMaskLevel1;Mask Level;104;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;1974.939,1054.194;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;2812;-901.1658,-3963.154;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3482;637.5446,-2657.722;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1705;-1183.049,-4461.302;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2805;-478.3685,-3678.164;Inherit;False;2;2;0;FLOAT;200;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2394;-1004.45,-5020.253;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3260;1671.272,-1528.773;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1292;2059.22,-859.4677;Inherit;False;PostRimLight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;2180;1582.552,1389.579;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1743;-550.9827,-4720.039;Inherit;True;Property;_SparkleMask;Sparkle Mask (R,A);82;0;Create;False;0;0;0;False;1;Space(5);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;3490;499.4215,-1420.045;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3499;3181.238,570.9218;Inherit;False;Constant;_FriendsOnly_Null;FriendsOnly_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3353;3011.123,356.4993;Inherit;False;FriendsOnlyToggle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3352;3244.758,479.1561;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3142;2278.235,-49.58194;Inherit;False;Property;_IsNotMirror;Not Mirror;113;1;[IntRange];Create;False;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3438;1032.484,-2506.522;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;900;-844.8233,-4544.192;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;461;1530.298,-1337.511;Inherit;False;Property;_ShadedEmission;Shaded Emission;34;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1516;2132.321,1084.221;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3268;2394.564,1476.241;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;1780.053,-1433.133;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2564;-729.0884,-3846.875;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;334.521,-1313.788;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2313;-779.8272,-4364.619;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;875;-645.7482,-4311.635;Float;False;Property;_SparkleColor1;Color;69;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;406;2213.303,1399.721;Inherit;False;Property;_MatcapOpacity;Matcap Opacity;97;0;Create;True;0;0;0;False;0;False;5;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1279;1938.579,945.5255;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;2308;-724.7711,-3963.999;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;1647.938,-1245.289;Float;False;Property;_EmissionColor;Emission Colour;32;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3140;2280.56,-131.4182;Inherit;False;Property;_IsInMirror;In Mirror;112;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2801;-462.61,-4139.03;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;560;603.0345,-1336.934;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;805;1881.495,-1246.593;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2264;1651.116,-603.5377;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;326;1875.891,-1157.456;Float;False;Property;_EmissionIntensity;Emission Intensity;33;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1278;2222.831,926.7556;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;3498;2692.111,4.195862;Inherit;False;Constant;_Camera_Null;Camera_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3437;622.1183,-1423.125;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;2327.514,1034.28;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;901;-601.4185,-4443.397;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.8,0,0;False;2;FLOAT3;0.85,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwitchByFaceNode;2437;-519.0889,-3958.741;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3474;3425.813,361.3008;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3159;2671.712,-174.14;Inherit;False;Property;_MirrorSystem;Use Mirror System;111;1;[ToggleUI];Create;False;0;0;0;False;2;Space(10);Header(Mirror);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2811;-348.955,-4256.187;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;807;2548.911,1302.324;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3429;2559.604,-95.27997;Inherit;False;VRCMirrorToggle;-1;;358;906fee1dc8310a745a0658d5f2fa3fb4;0;2;5;INT;1;False;6;INT;1;False;1;INT;7
Node;AmplifyShaderEditor.LerpOp;450;1958.945,-1448.715;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1745;-244.1026,-4639.069;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;330;2129.723,-1149.804;Float;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3478;2905.469,-142.9617;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;INT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2003;-103.557,-4321.001;Inherit;False;Property;_UseSparkleShimmer;Use Sparkle/Shimmer;68;1;[ToggleUI];Create;True;0;0;0;False;3;Space(5);Header(.  Sparkles  .);;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;877;-141.4834,-4211.803;Inherit;False;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;2142.448,-1289.363;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3147;3589.668,295.439;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3251;754.3188,-1387.951;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;2291;1834.352,-598.7445;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2993;-1032.753,-720.1392;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;405;2487.972,976.9373;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;2287;2000.972,-603.599;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;331;2323.342,-1248.401;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;872.4492,-1393.732;Inherit;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3473;161.2344,-4248.163;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1274;2686.021,972.123;Inherit;False;PostMatcap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;-834.6683,-721.0467;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3144;3168.178,-151.1746;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;334;2207.65,-410.3355;Inherit;False;Property;_Alpha;Alpha;10;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3252;2240.06,-623.5621;Inherit;False;2;2;0;FLOAT3;0.05,0.05,0.05;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2163;2152.229,-932.084;Inherit;False;1274;PostMatcap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;971;342.9131,-4247.828;Inherit;False;SparkleOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;2001.217,-508.7396;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;2477.611,-1246.415;Inherit;False;Emission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3146;3283.238,-174.4152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1021;2188.035,-1013.522;Inherit;False;Property;_UseMatcap;Use Matcap;94;1;[ToggleUI];Create;True;0;0;0;False;2;Space(10);Header(.  MatCap  .);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;2304.434,-335.2882;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2284;2377.972,-600.599;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;2516.751,-417.5501;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1702;2419.217,-495.7396;Inherit;False;971;SparkleOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;2525.688,-317.4168;Inherit;False;Property;_AlphaCutoff;Alpha Cutoff;11;0;Create;False;0;0;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1294;2423.846,-690.4126;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3145;3059.669,-310.6737;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3477;2401.127,-967.5283;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1346;2859.333,-1342.923;Inherit;False;670.9946;746.3742;custom properties;13;1345;1335;1344;1342;1431;1340;1339;1337;1432;1343;1338;1341;1469;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2807.245,-579.6193;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;793;-1641.929,783.3547;Inherit;False;1930.734;909.7371;;28;1123;3288;1492;669;3281;645;3285;954;2976;3283;3287;1035;680;679;3282;662;641;642;811;3273;684;3271;646;3289;3290;3291;3502;3503;Soft Shading;0,0,0,1;0;0
Node;AmplifyShaderEditor.ClipNode;1430;3137.46,-463.9726;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;954;-169.967,945.4908;Inherit;False;Constant;_Shade_Null;Shade_Null;65;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCRemapNode;679;-833.7531,1088.367;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;3217;-996.8801,-1511.394;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;3190;-1803.372,-1507.512;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1469;2892.559,-694.9409;Inherit;False;Property;_AlphaToCoverage;AlphaToCoverage (override alpha);9;1;[ToggleUI];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1035;-613.3292,1000.661;Inherit;False;Property;_ShadeColorDynamic;ShadeColor Dynamic;43;1;[Enum];Create;True;0;2;FixedColour;0;LightColour;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-4632.638,-1367.594;Inherit;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1335;3215.875,-918.9951;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.ComponentMaskNode;811;-1259.262,1078.722;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;3273;-1288.745,895.5067;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1342;3202.625,-1136.015;Inherit;False;Property;_StencilFail;StencilFail;121;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1343;3201.625,-1061.015;Inherit;False;Property;_StencilZFail;StencilZFail;122;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-4676.069,-1781.361;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwitchByFaceNode;3288;-1314.471,1453.272;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;2876.299,-1194.834;Half;False;Property;_ReadMask;ReadMask (non-zero);118;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;2875.299,-1112.257;Half;False;Property;_WriteMask;WriteMask (non-zero);117;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3354;-786.3796,-1364.509;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;680;-820.837,874.0831;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3508;-589.6356,-1485.131;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3503;114.7852,825.6471;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3290;-318.1021,1254.268;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3287;-184.4241,1254.435;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3218;-994.5661,-1246.064;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1923;3354.73,-577.434;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;684;-273.9559,1374.977;Float;False;Property;_ShadeLevel;Shade Level;45;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3219;-1179.632,-1525.015;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3269;3610.792,-886.0767;Inherit;False;Property;_Cutoff;Fallback Cutoff;3;1;[Enum];Create;False;0;2;Visible;0;Invisible;2;0;True;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3192;-481.3662,-1291.605;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3291;-469.1021,1468.268;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3271;-1465.254,895.5356;Inherit;False;3270;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;669;11.15326,1289.944;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.618;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3099;3610.803,-975.708;Inherit;False;Property;_outline_width;_outline_width;1;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1560;-4223.124,45.83719;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.005;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2478;-2065.047,-3916.846;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1341;3206.338,-1208.357;Inherit;False;Property;_StencilOp;StencilOp;120;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2289;457.3221,643.5714;Inherit;False;LightShaded;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1431;2886.58,-820.4198;Inherit;False;Property;_SrcBlend;Source Blend (One);123;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1344;2882.237,-914.3182;Float;False;Property;_ZTestMode;ZTestMode (LEqual);115;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1340;3181.625,-1281.015;Inherit;False;Property;_StencilComparison;Stencil Comparison;119;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.GrabScreenPosition;3215;-1380.789,-1317.791;Inherit;False;1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;3216;-1127.592,-1316.896;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3270;-845.6627,90.72253;Inherit;False;AllLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;2882.479,-1280.823;Half;False;Property;_StencilRef;Stencil ID;116;0;Create;False;0;0;0;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1492;-1232.602,1296.014;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2976;-183.9426,867.4297;Inherit;False;Property;_ShadeEnable;Shade Enable;42;1;[ToggleUI];Create;True;0;2;FixedColour;0;LightColour;1;0;False;1;Header(.  Soft Shading  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3220;-1343.373,-1428.379;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3193;-698.0973,-1251.833;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3183;-820.21,-1471.654;Inherit;False;Property;_ReflectionMode;Reflection Mode;65;1;[Enum];Create;True;0;2;Probe Reflection;0;Screenspace;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3283;-218.424,1103.435;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FresnelNode;645;-834.9511,1291.202;Inherit;False;Standard;WorldNormal;LightDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3502;-384.7433,1002.307;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1500;333.6703,648.8381;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RefractOpVec;3226;-1428.16,-1578.693;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;642;-1304.77,1562.352;Inherit;False;Property;_SoftPower;Soft Power;46;0;Create;True;0;0;0;False;0;False;0.75;0.75;0.5;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1123;-1636.372,1448.298;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3151.765,-825.441;Inherit;False;Property;_DstBlend;Destination Blend (Zero);124;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;662;-834.0081,1467.563;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3098;3608.803,-1048.708;Inherit;False;Property;_VRCFallbackDoublesided;VRC Fallback Doublesided;2;0;Create;True;0;0;0;True;2;Toggle(TINTED_OUTLINE);Space(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;641;-1296.038,1374.722;Inherit;False;Property;_SoftScale;Soft Scale;47;0;Create;True;0;0;0;False;0;False;1;1;0.5;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;3289;-1433.102,1508.268;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;2886.308,-1002.382;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);114;1;[ToggleUI];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;3211;-1648.536,-1431.217;Inherit;True;Standard;WorldNormal;ViewDir;True;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;3355;-1012.473,-1366.698;Inherit;False;unity_SpecCube0_HDR.x = 1@$return unity_SpecCube0_HDR.x@;1;False;0;Reflection Probe HDR;True;False;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;3227;-1755.76,-1702.193;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SaturateNode;3281;-616.9593,1292.629;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3282;-610.3141,1467.616;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3522;-1767.401,-1224.196;Inherit;False;Matcap (legacy);-1;;359;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenColorNode;3186;-860.3974,-1251.711;Inherit;False;Global;_AriaGrab;AriaGrab;117;0;Create;True;0;0;0;False;0;False;Object;-1;True;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;3285;126.576,1091.435;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3526;-264.6091,-3048.01;Inherit;False;Blinn-Phong Half Vector VR;-1;;361;a14416ee163e75d4f83c3889a3f25b2f;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;646;-1461.741,1079.306;Inherit;False;Property;_ShadeColour;Shade Colour;44;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1924;3771.631,-578.6443;Float;False;True;-1;2;ASEMaterialInspector;0;1;.GenesisAria/Arias VertexLit Shader WIP;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;1;1;True;1431;0;True;1432;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;True;1469;False;True;0;True;1335;True;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;True;255;True;1337;255;True;1338;255;True;1339;7;True;1340;1;True;1341;1;True;1342;1;True;1343;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;1345;True;3;True;1344;True;False;0;False;-1;0;False;-1;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;7;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;2;Include;;False;;Native;Include;AutoLight.cginc;False;;Custom;Standard;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;3458;0;3510;0
WireConnection;3458;2;3464;0
WireConnection;1878;0;3408;16
WireConnection;1878;1;3408;17
WireConnection;1878;2;3408;18
WireConnection;1878;3;3408;20
WireConnection;1551;0;1878;0
WireConnection;3495;0;3464;0
WireConnection;3495;2;3458;0
WireConnection;3495;3;3458;0
WireConnection;3495;4;3527;0
WireConnection;3459;0;3495;0
WireConnection;1886;0;3408;23
WireConnection;1886;1;3408;29
WireConnection;1886;2;3408;30
WireConnection;1886;3;3408;31
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;1891;0;1551;3
WireConnection;2014;0;1886;0
WireConnection;1890;0;1589;0
WireConnection;1879;0;2014;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;3442;0;428;0
WireConnection;3442;1;3461;0
WireConnection;3451;0;3460;0
WireConnection;3451;1;603;0
WireConnection;2148;0;2147;0
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;3012;0;3451;0
WireConnection;3014;0;3442;0
WireConnection;2958;0;2957;0
WireConnection;2958;1;3432;0
WireConnection;2958;5;3014;0
WireConnection;1665;0;1905;0
WireConnection;3013;0;3442;0
WireConnection;3049;4;3432;0
WireConnection;3049;1;2957;0
WireConnection;3049;49;3012;0
WireConnection;3062;0;3059;1
WireConnection;1246;0;1232;2
WireConnection;1246;1;2148;0
WireConnection;2154;0;2153;0
WireConnection;3494;0;2962;0
WireConnection;3494;3;3049;0
WireConnection;3494;4;2958;0
WireConnection;3061;0;3062;0
WireConnection;3061;1;3013;0
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;3496;0;2152;0
WireConnection;3496;3;2154;0
WireConnection;3496;4;2150;0
WireConnection;1876;0;633;1
WireConnection;1876;1;633;2
WireConnection;2144;0;2121;0
WireConnection;1233;0;1247;0
WireConnection;430;1;3494;0
WireConnection;430;2;3061;0
WireConnection;2635;0;248;0
WireConnection;2635;1;3511;2
WireConnection;2017;0;3408;0
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;2635;0
WireConnection;1235;0;430;0
WireConnection;2140;0;2121;0
WireConnection;2140;1;1490;0
WireConnection;2140;2;2144;0
WireConnection;2159;0;3496;0
WireConnection;1631;0;3408;18
WireConnection;1631;1;3408;30
WireConnection;1629;0;3408;16
WireConnection;1629;1;3408;23
WireConnection;1684;0;3408;20
WireConnection;1684;1;3408;31
WireConnection;2215;0;1076;0
WireConnection;962;0;1235;0
WireConnection;1630;0;3408;17
WireConnection;1630;1;3408;29
WireConnection;1383;0;2017;0
WireConnection;1383;1;2159;0
WireConnection;2034;0;2140;0
WireConnection;1382;0;1383;0
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;3414;0;2215;0
WireConnection;3414;1;3415;7
WireConnection;2026;0;2034;0
WireConnection;1424;0;349;1
WireConnection;1424;1;349;2
WireConnection;1424;2;349;3
WireConnection;5;0;1165;0
WireConnection;5;1;3414;0
WireConnection;1683;0;1682;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;2035;1;2026;0
WireConnection;3336;0;1424;0
WireConnection;1908;1;1910;0
WireConnection;1908;0;1683;0
WireConnection;1296;0;5;0
WireConnection;2025;0;2035;0
WireConnection;1389;0;1381;0
WireConnection;1406;0;1908;0
WireConnection;3335;0;3336;0
WireConnection;2033;0;2025;0
WireConnection;1994;0;1480;0
WireConnection;1994;1;1297;0
WireConnection;1994;2;2033;0
WireConnection;2082;0;2081;2
WireConnection;1425;0;3335;0
WireConnection;1486;0;1484;1
WireConnection;1486;1;1484;2
WireConnection;1486;2;2082;0
WireConnection;3497;0;1058;0
WireConnection;3497;3;1994;0
WireConnection;3497;4;3500;0
WireConnection;2211;1;3434;0
WireConnection;3314;0;1408;0
WireConnection;3169;0;3416;0
WireConnection;351;0;1425;0
WireConnection;627;0;351;0
WireConnection;1489;0;1486;0
WireConnection;1489;1;3314;0
WireConnection;1489;2;3169;0
WireConnection;1106;0;3497;0
WireConnection;1106;1;1107;0
WireConnection;3262;1;2211;1
WireConnection;3262;2;3263;0
WireConnection;1118;0;149;0
WireConnection;1118;1;1106;0
WireConnection;1118;2;3262;0
WireConnection;2867;0;1489;0
WireConnection;2867;1;2870;0
WireConnection;3506;0;1999;0
WireConnection;3506;3;627;0
WireConnection;3506;4;351;0
WireConnection;3333;0;3506;0
WireConnection;1254;0;1118;0
WireConnection;3331;0;2867;0
WireConnection;3331;1;1916;0
WireConnection;3325;7;3331;0
WireConnection;3467;4;3431;0
WireConnection;3467;1;3343;0
WireConnection;2997;4;3430;0
WireConnection;2997;1;2982;0
WireConnection;3345;0;3343;0
WireConnection;3345;1;3431;0
WireConnection;2984;0;2982;0
WireConnection;2984;1;3430;0
WireConnection;1125;0;1254;0
WireConnection;1125;1;1254;0
WireConnection;3475;0;3466;0
WireConnection;3475;3;3467;0
WireConnection;3475;4;3345;0
WireConnection;3476;0;2988;0
WireConnection;3476;3;2997;0
WireConnection;3476;4;2984;0
WireConnection;3348;0;3340;0
WireConnection;3348;1;3338;0
WireConnection;1032;0;1008;0
WireConnection;32;1;1125;0
WireConnection;3301;0;1915;0
WireConnection;3301;1;3325;0
WireConnection;3332;0;3301;0
WireConnection;3332;1;3331;0
WireConnection;1033;0;1032;0
WireConnection;1033;1;32;0
WireConnection;1010;0;1008;0
WireConnection;3504;0;3348;0
WireConnection;3504;3;3475;0
WireConnection;3504;4;3476;0
WireConnection;815;0;1033;0
WireConnection;1914;0;3331;0
WireConnection;1914;2;3332;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;3011;0;3451;0
WireConnection;1491;0;1382;0
WireConnection;813;0;18;0
WireConnection;812;0;3504;0
WireConnection;19;0;812;0
WireConnection;19;1;813;0
WireConnection;3501;0;1025;0
WireConnection;3501;3;1016;0
WireConnection;3501;4;815;0
WireConnection;3326;7;1914;0
WireConnection;3060;0;3059;1
WireConnection;3060;1;3011;0
WireConnection;979;0;3501;0
WireConnection;1470;0;1106;0
WireConnection;2093;0;3326;0
WireConnection;602;1;3494;0
WireConnection;602;2;3060;0
WireConnection;2213;0;2217;0
WireConnection;2213;1;2216;0
WireConnection;2213;2;2033;0
WireConnection;2909;0;19;0
WireConnection;3121;0;3120;0
WireConnection;344;0;1470;0
WireConnection;344;1;335;0
WireConnection;3255;0;3253;0
WireConnection;2911;0;2910;0
WireConnection;2911;1;2909;1
WireConnection;1234;0;602;0
WireConnection;2218;0;2213;0
WireConnection;2098;0;2093;0
WireConnection;2098;4;3121;0
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;3249;0;585;0
WireConnection;2918;0;325;0
WireConnection;3055;0;1234;0
WireConnection;3493;0;2225;0
WireConnection;3493;3;3512;2
WireConnection;3493;4;1909;0
WireConnection;3244;0;1330;0
WireConnection;2908;0;2911;0
WireConnection;2908;1;2909;2
WireConnection;2908;2;2909;3
WireConnection;3256;0;2098;0
WireConnection;3256;1;3255;0
WireConnection;30;0;346;0
WireConnection;2503;0;3514;0
WireConnection;2917;0;2908;0
WireConnection;2917;1;2918;0
WireConnection;3241;0;3244;0
WireConnection;3241;1;3249;0
WireConnection;965;0;3055;0
WireConnection;2237;0;3493;0
WireConnection;2237;1;2219;0
WireConnection;1777;0;1914;0
WireConnection;1777;1;3256;0
WireConnection;3087;0;3088;0
WireConnection;3087;1;3059;1
WireConnection;3087;2;3462;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;30;0
WireConnection;2236;1;546;0
WireConnection;1783;0;2237;0
WireConnection;3086;1;3494;0
WireConnection;3086;2;3087;0
WireConnection;581;0;2917;0
WireConnection;581;1;3241;0
WireConnection;2839;0;2503;0
WireConnection;3074;0;581;0
WireConnection;2804;0;2839;0
WireConnection;553;0;2236;0
WireConnection;968;0;1922;0
WireConnection;3090;0;3086;0
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;1536;0;1537;0
WireConnection;1536;1;1530;0
WireConnection;1536;2;1534;0
WireConnection;3520;21;967;0
WireConnection;3520;27;1928;0
WireConnection;3521;9;2898;0
WireConnection;3521;45;1928;0
WireConnection;1713;2;1732;0
WireConnection;3077;0;3074;0
WireConnection;3077;1;968;0
WireConnection;3505;0;1533;0
WireConnection;3505;3;1536;0
WireConnection;3505;4;1537;0
WireConnection;545;0;551;0
WireConnection;545;1;553;0
WireConnection;2900;0;2899;0
WireConnection;2900;1;3521;0
WireConnection;2902;0;2899;0
WireConnection;2902;1;3520;0
WireConnection;3091;0;3090;0
WireConnection;2834;0;2804;0
WireConnection;556;1;555;0
WireConnection;2348;0;2361;0
WireConnection;2863;0;2862;0
WireConnection;2349;0;2348;0
WireConnection;3089;0;3091;0
WireConnection;3491;0;2905;0
WireConnection;3491;3;2900;0
WireConnection;3491;4;2902;0
WireConnection;3097;0;2834;0
WireConnection;2472;0;1713;0
WireConnection;2357;0;2348;0
WireConnection;2406;0;2404;0
WireConnection;3056;0;561;0
WireConnection;2778;0;2866;1
WireConnection;2778;1;2866;2
WireConnection;2778;2;2866;3
WireConnection;554;0;545;0
WireConnection;554;1;556;0
WireConnection;360;0;3505;0
WireConnection;360;2;369;0
WireConnection;360;3;368;0
WireConnection;3094;0;3093;0
WireConnection;1918;0;3077;0
WireConnection;2405;0;2348;0
WireConnection;3487;0;3096;0
WireConnection;3487;3;3516;0
WireConnection;3487;4;3094;0
WireConnection;817;0;3491;0
WireConnection;379;0;360;0
WireConnection;379;1;2299;0
WireConnection;379;2;2300;0
WireConnection;2833;0;3097;0
WireConnection;1921;0;1919;0
WireConnection;1276;0;1918;0
WireConnection;2356;0;2349;0
WireConnection;2356;1;2357;0
WireConnection;2294;0;554;0
WireConnection;2403;0;2405;0
WireConnection;2403;2;2406;0
WireConnection;3057;0;3056;0
WireConnection;1746;0;2472;0
WireConnection;2779;0;2778;0
WireConnection;2779;1;2863;0
WireConnection;838;0;837;0
WireConnection;2686;0;3487;0
WireConnection;2686;1;885;0
WireConnection;2208;0;2209;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;2865;0;2779;0
WireConnection;382;0;376;0
WireConnection;382;1;379;0
WireConnection;2840;0;902;3
WireConnection;2840;1;2833;0
WireConnection;3524;9;2873;0
WireConnection;3524;45;1930;0
WireConnection;3488;0;2400;0
WireConnection;3488;3;2403;0
WireConnection;3488;4;2356;0
WireConnection;2841;0;902;2
WireConnection;2841;1;2833;0
WireConnection;816;1;2294;0
WireConnection;816;2;3057;0
WireConnection;2473;0;1746;0
WireConnection;2473;1;2472;1
WireConnection;3523;21;963;0
WireConnection;3523;27;1930;0
WireConnection;383;0;379;0
WireConnection;383;1;384;0
WireConnection;370;0;382;0
WireConnection;370;1;1290;0
WireConnection;2234;0;816;0
WireConnection;2234;1;816;0
WireConnection;2234;2;816;0
WireConnection;2359;0;2360;0
WireConnection;2359;1;3488;0
WireConnection;2864;0;2865;0
WireConnection;2864;1;2779;0
WireConnection;2544;0;2473;0
WireConnection;2544;1;2686;0
WireConnection;3080;0;3079;0
WireConnection;2210;0;3524;0
WireConnection;2210;2;2208;0
WireConnection;690;0;1920;0
WireConnection;690;1;691;0
WireConnection;690;2;838;0
WireConnection;2207;0;3523;0
WireConnection;2207;2;2208;0
WireConnection;960;2;1732;0
WireConnection;2806;0;902;1
WireConnection;2806;1;2841;0
WireConnection;2806;2;2840;0
WireConnection;2176;0;2181;0
WireConnection;2176;1;2207;0
WireConnection;2950;0;1732;0
WireConnection;3492;0;2002;0
WireConnection;3492;3;690;0
WireConnection;3068;0;3067;0
WireConnection;2949;0;1732;0
WireConnection;2955;0;960;0
WireConnection;2379;0;2377;0
WireConnection;2379;1;3513;0
WireConnection;3081;0;3080;0
WireConnection;3081;1;3075;0
WireConnection;2301;0;2234;0
WireConnection;372;0;1291;0
WireConnection;372;1;382;0
WireConnection;372;2;383;0
WireConnection;2558;0;1732;0
WireConnection;3174;0;3177;0
WireConnection;3174;1;3179;0
WireConnection;388;0;1290;0
WireConnection;388;1;370;0
WireConnection;388;2;384;0
WireConnection;2175;0;2181;0
WireConnection;2175;1;2210;0
WireConnection;2505;0;2806;0
WireConnection;390;0;1291;0
WireConnection;390;1;382;0
WireConnection;390;2;383;0
WireConnection;2355;0;2544;0
WireConnection;2355;2;2359;0
WireConnection;2355;3;2864;0
WireConnection;2395;0;2379;0
WireConnection;3064;0;3068;0
WireConnection;3064;1;2301;0
WireConnection;3104;0;3492;0
WireConnection;3104;1;3103;0
WireConnection;2165;0;2166;0
WireConnection;2165;2;2175;0
WireConnection;2165;3;2176;0
WireConnection;2556;0;2558;0
WireConnection;2556;1;2355;0
WireConnection;3085;0;3081;0
WireConnection;3085;1;3075;0
WireConnection;2999;4;2955;0
WireConnection;2999;1;2950;0
WireConnection;2458;0;2372;0
WireConnection;328;1;3433;0
WireConnection;2480;0;2476;0
WireConnection;2956;0;1732;0
WireConnection;2956;1;960;0
WireConnection;2506;0;2505;0
WireConnection;1284;0;1281;0
WireConnection;1284;2;388;0
WireConnection;1284;3;390;0
WireConnection;1284;4;372;0
WireConnection;2998;4;2355;0
WireConnection;2998;1;2949;0
WireConnection;3407;1;3174;0
WireConnection;3407;2;3182;0
WireConnection;3507;0;1514;0
WireConnection;3507;3;1284;0
WireConnection;3507;4;1515;0
WireConnection;808;0;328;0
WireConnection;2371;0;2372;0
WireConnection;2371;4;2480;0
WireConnection;2371;1;2506;0
WireConnection;2371;2;2506;1
WireConnection;2371;3;2506;2
WireConnection;3483;0;3181;0
WireConnection;3483;3;3407;0
WireConnection;2396;0;2395;0
WireConnection;3069;0;3064;0
WireConnection;3069;1;3085;0
WireConnection;810;0;2165;0
WireConnection;1710;0;1709;0
WireConnection;3485;0;2954;0
WireConnection;3485;3;2999;0
WireConnection;3485;4;2956;0
WireConnection;2920;0;2919;0
WireConnection;3489;0;3101;0
WireConnection;3489;3;3104;0
WireConnection;3489;4;3492;0
WireConnection;3486;0;2954;0
WireConnection;3486;3;2998;0
WireConnection;3486;4;2556;0
WireConnection;2440;0;2458;0
WireConnection;2440;4;2480;0
WireConnection;2440;1;2506;0
WireConnection;2440;2;2506;1
WireConnection;2440;3;2506;2
WireConnection;695;1;3435;0
WireConnection;701;0;3489;0
WireConnection;701;1;3483;0
WireConnection;898;0;897;0
WireConnection;898;1;894;0
WireConnection;3266;0;3109;1
WireConnection;3266;1;3109;4
WireConnection;2813;0;2440;0
WireConnection;1704;0;3485;0
WireConnection;1704;1;1710;0
WireConnection;1517;0;1518;0
WireConnection;407;0;810;0
WireConnection;407;1;408;0
WireConnection;407;2;2920;0
WireConnection;2812;0;2371;0
WireConnection;3482;0;3072;0
WireConnection;3482;3;3069;0
WireConnection;3482;4;3064;0
WireConnection;1705;0;3486;0
WireConnection;1705;1;1710;0
WireConnection;2805;1;2804;0
WireConnection;2394;0;2396;0
WireConnection;3260;0;808;0
WireConnection;3260;1;328;4
WireConnection;1292;0;3507;0
WireConnection;2180;0;2165;0
WireConnection;1743;1;3436;0
WireConnection;3490;0;701;0
WireConnection;3353;0;1998;0
WireConnection;3352;0;3333;0
WireConnection;3438;0;3482;0
WireConnection;900;0;1704;0
WireConnection;900;1;1705;0
WireConnection;900;2;2394;0
WireConnection;1516;0;407;0
WireConnection;1516;1;1517;0
WireConnection;3268;1;3266;0
WireConnection;3268;2;3264;0
WireConnection;462;0;3260;0
WireConnection;462;1;970;0
WireConnection;2564;0;2813;0
WireConnection;696;0;824;0
WireConnection;696;1;695;1
WireConnection;2313;0;898;0
WireConnection;2308;0;2812;0
WireConnection;2801;0;2810;0
WireConnection;2801;1;2805;0
WireConnection;560;0;3490;0
WireConnection;560;2;696;0
WireConnection;805;0;327;0
WireConnection;3437;0;3438;0
WireConnection;414;0;1279;0
WireConnection;414;1;1516;0
WireConnection;901;0;900;0
WireConnection;901;1;897;0
WireConnection;901;2;2313;0
WireConnection;2437;0;2308;0
WireConnection;2437;1;2564;0
WireConnection;3474;0;3353;0
WireConnection;3474;3;3352;0
WireConnection;3474;4;3499;0
WireConnection;2811;0;875;0
WireConnection;2811;1;2801;0
WireConnection;807;0;2180;0
WireConnection;807;1;406;0
WireConnection;807;2;3268;0
WireConnection;3429;5;3140;0
WireConnection;3429;6;3142;0
WireConnection;450;0;3260;0
WireConnection;450;1;462;0
WireConnection;450;2;461;0
WireConnection;1745;0;1743;1
WireConnection;1745;1;1743;4
WireConnection;3478;0;3159;0
WireConnection;3478;2;3498;0
WireConnection;3478;3;3429;7
WireConnection;3478;4;3498;0
WireConnection;877;0;1745;0
WireConnection;877;1;2811;0
WireConnection;877;2;901;0
WireConnection;877;3;2437;0
WireConnection;329;0;450;0
WireConnection;329;1;805;0
WireConnection;329;2;326;0
WireConnection;3147;0;3474;0
WireConnection;3251;0;3437;0
WireConnection;3251;1;560;0
WireConnection;2291;0;2264;0
WireConnection;2993;0;3504;0
WireConnection;405;0;1278;0
WireConnection;405;1;414;0
WireConnection;405;2;807;0
WireConnection;2287;0;2291;0
WireConnection;331;0;329;0
WireConnection;331;2;330;0
WireConnection;983;0;3251;0
WireConnection;3473;0;2003;0
WireConnection;3473;3;877;0
WireConnection;1274;0;405;0
WireConnection;1262;0;2993;0
WireConnection;3144;0;3478;0
WireConnection;3144;1;3147;0
WireConnection;3252;1;2287;0
WireConnection;971;0;3473;0
WireConnection;1285;0;331;0
WireConnection;3146;0;3144;0
WireConnection;2284;0;3252;0
WireConnection;2284;1;1701;0
WireConnection;333;0;334;0
WireConnection;333;1;1265;0
WireConnection;3145;0;3146;0
WireConnection;3477;0;1021;0
WireConnection;3477;3;2163;0
WireConnection;3477;4;1292;0
WireConnection;470;0;3477;0
WireConnection;470;1;1294;0
WireConnection;470;2;2284;0
WireConnection;470;3;1702;0
WireConnection;1430;0;333;0
WireConnection;1430;1;3145;0
WireConnection;1430;2;1433;0
WireConnection;679;0;811;0
WireConnection;3217;0;3226;0
WireConnection;1861;0;430;0
WireConnection;811;0;646;0
WireConnection;3273;0;3271;0
WireConnection;1856;0;602;0
WireConnection;3288;0;1123;0
WireConnection;3288;1;3289;0
WireConnection;3354;0;3355;0
WireConnection;680;0;3273;0
WireConnection;3508;0;3183;0
WireConnection;3508;3;3354;0
WireConnection;3508;4;3192;0
WireConnection;3503;0;2976;0
WireConnection;3503;3;3285;0
WireConnection;3503;4;954;0
WireConnection;3290;0;3281;0
WireConnection;3290;2;3291;0
WireConnection;3287;0;3290;0
WireConnection;3218;0;3216;0
WireConnection;3218;1;3220;0
WireConnection;1923;0;470;0
WireConnection;1923;3;1430;0
WireConnection;3219;0;3190;0
WireConnection;3219;1;3220;0
WireConnection;3192;1;3193;0
WireConnection;3291;0;3282;0
WireConnection;669;1;3287;0
WireConnection;669;2;684;0
WireConnection;1560;2;1480;0
WireConnection;1560;3;1297;0
WireConnection;2289;0;1500;0
WireConnection;3216;0;3215;0
WireConnection;3270;0;1914;0
WireConnection;3220;0;3211;0
WireConnection;3193;0;3186;0
WireConnection;3283;0;3502;0
WireConnection;645;0;3288;0
WireConnection;645;4;1492;0
WireConnection;645;2;641;0
WireConnection;645;3;642;0
WireConnection;3502;0;1035;0
WireConnection;3502;3;680;0
WireConnection;3502;4;679;0
WireConnection;1500;0;30;0
WireConnection;1500;1;3503;0
WireConnection;3226;0;3227;0
WireConnection;3226;1;3190;0
WireConnection;662;0;3288;0
WireConnection;662;2;641;0
WireConnection;662;3;642;0
WireConnection;3289;0;1123;0
WireConnection;3281;0;645;0
WireConnection;3282;0;662;0
WireConnection;3522;9;3190;0
WireConnection;3186;0;3218;0
WireConnection;3285;0;3283;0
WireConnection;3285;2;669;0
WireConnection;1924;0;1923;0
ASEEND*/
//CHKSM=6ACFA4F6563A19BF0157F4AF014C2FFAF94097C0