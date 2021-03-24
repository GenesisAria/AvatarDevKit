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
		[ToggleUI][Space(5)]_DisableLight("Unlit (warning - disables all light)", Float) = 0
		[Header()][ToggleUI][Space(5)][Deader(.  Shadow  .)]_UseShading("Use Shading", Float) = 1
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
		[ToggleUI][Header(.  Soft Shading  .)]_ShadeEnable("Shade Enable", Float) = 1
		[Enum(FixedColour,0,LightColour,1)]_ShadeColorDynamic("ShadeColor Dynamic", Float) = 1
		_ShadeColour("Shade Colour", Color) = (0,0,0,0)
		_ShadeLevel("Shade Level", Range( 0 , 1)) = 0.5
		_SoftPower("Soft Power", Range( 0.5 , 4)) = 0.75
		_SoftScale("Soft Scale", Range( 0.5 , 2)) = 1
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
		[ToggleUI][Space(5)][Header(. Reflection Probe)]_UseReflection("Use Reflection", Float) = 0
		_ProbeSmoothness("Probe Smoothness", Float) = 0.75
		_ReflectionOpacity("Reflection Opacity", Float) = 1
		_Cubemap("Cubemap Fallback (RGB,A)", CUBE) = "black" {}
		[ToggleUI]_UseCubemapOnly("Use Cubemap Only", Float) = 0
		[ToggleUI][Space(5)][Header(.  Sparkles  .)]_UseSparkleShimmer("Use Sparkle/Shimmer", Float) = 0
		[HDR]_SparkleColor2("Color", Color) = (1,1,1,0)
		_SparklePatternRGB1("Sparkle Pattern (RGB)", 2D) = "black" {}
		[ToggleUI]_SparkleSuperSample1("SuperSample (expensive)", Float) = 0
		_SparkleTexColour1("SparkleTex Saturation", Range( 0 , 2)) = 2
		_Threshold1("Threshold", Range( 0 , 1)) = 0
		_Range1("Range", Range( 0.05 , 1)) = 0.3
		_ScreenContribution1("Screen Contribution", Range( 0 , 1)) = 0.3
		[ToggleUI]_StereoCorrect1("Stereo Correct", Float) = 1
		_WorldPosContribution1("WorldPos Contribution", Range( 0 , 1)) = 0.3
		[Enum(Linear,0,Circular,1)][Space(5)]_MotionType1("Motion Type", Float) = 1
		_MotionSpeed1("Motion Speed", Float) = 0
		_RotateLinear1("Rotate Linear", Range( 0 , 1)) = 0
		_MotionIntensity1("Motion Intensity", Float) = 0.01
		[Space(5)]_SparkleMask1("Sparkle Mask (R,A)", 2D) = "white" {}
		_SparkleFresnel2("Fresnel Bias, Scale, Power", Vector) = (0,10,0.1,0)
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _VRCFallbackDoublesided;
			uniform float _ZTestMode;
			uniform half _StencilRef;
			uniform float _AlphaToCoverage;
			uniform int _StencilOp;
			uniform int _StencilComparison;
			uniform float _SrcBlend;
			uniform int _StencilZFail;
			uniform float _DstBlend;
			uniform half _ReadMask;
			uniform half _WriteMask;
			uniform int _Culling;
			uniform float _Cutoff;
			uniform int _StencilFail;
			uniform float _outline_width;
			uniform float _ZWriteMode;
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
			uniform float _DisableLight;
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
			uniform float _UseCubemapOnly;
			uniform samplerCUBE _Cubemap;
			uniform float _ProbeSmoothness;
			uniform float _ReflectionOpacity;
			uniform float _SpecMaskOpacity;
			uniform sampler2D _SpecularMask;
			uniform float4 _SpecularMask_ST;
			uniform float _UseSparkleShimmer;
			uniform sampler2D _SparkleMask1;
			uniform float4 _SparkleColor2;
			uniform float _Threshold1;
			uniform float _Range1;
			uniform float _SparkleSuperSample1;
			uniform sampler2D _SparklePatternRGB1;
			uniform float4 _SparklePatternRGB1_ST;
			uniform float _SparkleTexColour1;
			uniform float _StereoCorrect1;
			uniform float _ScreenContribution1;
			uniform float _MotionIntensity1;
			uniform float _MotionType1;
			uniform float _MotionSpeed1;
			uniform float _RotateLinear1;
			uniform float _WorldPosContribution1;
			uniform float3 _SparkleFresnel2;
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
			
			float3 CenterEye1_g328(  )
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
			
			float4 VertexLightPosX3_g326(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g326(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g326(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g326(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol114_g326(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightCol215_g326(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g326(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g326(  )
			{
				return unity_LightColor[3];
			}
			
			float3 unity_SHArgb3_g330(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			
			float3 CenterEye1_g383(  )
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
			
			float3 CenterEye1_g385(  )
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
			
			float3 CenterEye1_g342(  )
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
			
			float3 CenterEye1_g373(  )
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
			
			float3 CenterEye1_g375(  )
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
			
			float3 CenterEye1_g371(  )
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
			
			float3 CenterEye1_g394(  )
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
			
			float3 CenterEye1_g397(  )
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
			
			float3 CenterEye1_g395(  )
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
			
			int isCamera1_g387(  )
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
				sampler2D texvalue34_g338 = _MainTexFriends;
				float2 uv_MainTexFriends = i.ase_texcoord1.xy * _MainTexFriends_ST.xy + _MainTexFriends_ST.zw;
				float2 temp_output_4_0_g338 = uv_MainTexFriends;
				half2 uvin34_g338 = temp_output_4_0_g338;
				half2 dx34_g338 = ( ddx( temp_output_4_0_g338 ) * float2( 0.25,0.25 ) );
				half2 dy34_g338 = ( ddy( temp_output_4_0_g338 ) * float2( 0.25,0.25 ) );
				half bias34_g338 = 0.0;
				half4 localsupersample2x234_g338 = supersample2x2( texvalue34_g338 , uvin34_g338 , dx34_g338 , dy34_g338 , bias34_g338 );
				float4 ifLocalVar3475 = 0;
				UNITY_BRANCH 
				if( _FriendsSuperSample == 1.0 )
				ifLocalVar3475 = localsupersample2x234_g338;
				else if( _FriendsSuperSample < 1.0 )
				ifLocalVar3475 = tex2D( _MainTexFriends, uv_MainTexFriends );
				sampler2D texvalue34_g339 = _MainTex;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 temp_output_4_0_g339 = uv_MainTex;
				half2 uvin34_g339 = temp_output_4_0_g339;
				half2 dx34_g339 = ( ddx( temp_output_4_0_g339 ) * float2( 0.25,0.25 ) );
				half2 dy34_g339 = ( ddy( temp_output_4_0_g339 ) * float2( 0.25,0.25 ) );
				half bias34_g339 = 0.0;
				half4 localsupersample2x234_g339 = supersample2x2( texvalue34_g339 , uvin34_g339 , dx34_g339 , dy34_g339 , bias34_g339 );
				float4 ifLocalVar3476 = 0;
				UNITY_BRANCH 
				if( _TexSuperSample == 1.0 )
				ifLocalVar3476 = localsupersample2x234_g339;
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
				sampler2D texvalue34_g327 = _Normal;
				float2 uv_Normal = i.ase_texcoord1.xy * _Normal_ST.xy + _Normal_ST.zw;
				float2 temp_output_4_0_g327 = uv_Normal;
				half2 uvin34_g327 = temp_output_4_0_g327;
				half2 dx34_g327 = ( ddx( temp_output_4_0_g327 ) * float2( 0.25,0.25 ) );
				half2 dy34_g327 = ( ddy( temp_output_4_0_g327 ) * float2( 0.25,0.25 ) );
				half bias34_g327 = 0.0;
				half4 localsupersample2x234_g327 = supersample2x2( texvalue34_g327 , uvin34_g327 , dx34_g327 , dy34_g327 , bias34_g327 );
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
				float3 localUnpackNormal47_g327 = UnpackScaleNormal( localsupersample2x234_g327, clampResult3012 );
				float temp_output_3442_0 = ( _NormalPower * NormalDist3459 );
				float clampResult3014 = clamp( temp_output_3442_0 , 1.0 , 3.0 );
				float3 ifLocalVar3494 = 0;
				UNITY_BRANCH 
				if( _NormSuperSample == 1.0 )
				ifLocalVar3494 = localUnpackNormal47_g327;
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
				float3 localCenterEye1_g328 = CenterEye1_g328();
				float3 temp_output_4_0_g328 = ( localCenterEye1_g328 - WorldPosition );
				float3 normalizeResult5_g328 = normalize( temp_output_4_0_g328 );
				float3 lerpResult2635 = lerp( appendResult248 , normalizeResult5_g328 , float3( 0.3333,0.3333,0.3333 ));
				float3 Dir_LightDir2215 = ( ( ase_lightColor.rgb * ase_lightColor.a ) > float3( 0,0,0 ) ? normalizeResult1233 : lerpResult2635 );
				float3 localSHArgbambientDir6_g329 = SHArgbambientDir();
				float dotResult5 = dot( NormalShade962 , ( Dir_LightDir2215 + localSHArgbambientDir6_g329 ) );
				float NdotL1296 = dotResult5;
				float4 localVertexLightPosX3_g326 = VertexLightPosX3_g326();
				float4 break4_g326 = localVertexLightPosX3_g326;
				float4 localVertexLightPosY2_g326 = VertexLightPosY2_g326();
				float4 break5_g326 = localVertexLightPosY2_g326;
				float4 localVertexLightPosZ1_g326 = VertexLightPosZ1_g326();
				float4 break6_g326 = localVertexLightPosZ1_g326;
				float3 appendResult7_g326 = (float3(break4_g326.x , break5_g326.x , break6_g326.x));
				float3 VertLightPos12017 = appendResult7_g326;
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
				float3 pos188_g326 = appendResult7_g326;
				float3 objToWorld139_g326 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_155_0_g326 = pow( distance( pos188_g326 , objToWorld139_g326 ) , 2.0 );
				float4 localVertexLightAttenuation86_g326 = VertexLightAttenuation86_g326();
				float4 break87_g326 = localVertexLightAttenuation86_g326;
				float attenx96_g326 = break87_g326.x;
				float temp_output_60_0_g326 = saturate( ( 1.0 - ( ( temp_output_155_0_g326 * attenx96_g326 ) / 25.0 ) ) );
				float temp_output_3408_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g326 ) * attenx96_g326 ) ) , ( temp_output_60_0_g326 * temp_output_60_0_g326 ) );
				float3 appendResult8_g326 = (float3(break4_g326.y , break5_g326.y , break6_g326.y));
				float3 pos290_g326 = appendResult8_g326;
				float3 objToWorld140_g326 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_75_0_g326 = pow( distance( pos290_g326 , objToWorld140_g326 ) , 2.0 );
				float atteny97_g326 = break87_g326.y;
				float temp_output_107_0_g326 = saturate( ( 1.0 - ( ( temp_output_75_0_g326 * atteny97_g326 ) / 25.0 ) ) );
				float temp_output_3408_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g326 ) * atteny97_g326 ) ) , ( temp_output_107_0_g326 * temp_output_107_0_g326 ) );
				float3 appendResult9_g326 = (float3(break4_g326.z , break5_g326.z , break6_g326.z));
				float3 pos389_g326 = appendResult9_g326;
				float3 objToWorld141_g326 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_79_0_g326 = pow( distance( pos389_g326 , objToWorld141_g326 ) , 2.0 );
				float attenz98_g326 = break87_g326.z;
				float temp_output_125_0_g326 = saturate( ( 1.0 - ( ( temp_output_79_0_g326 * attenz98_g326 ) / 25.0 ) ) );
				float temp_output_3408_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g326 ) * attenz98_g326 ) ) , ( temp_output_125_0_g326 * temp_output_125_0_g326 ) );
				float3 appendResult10_g326 = (float3(break4_g326.w , break5_g326.w , break6_g326.w));
				float3 pos491_g326 = appendResult10_g326;
				float3 objToWorld138_g326 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_83_0_g326 = pow( distance( pos491_g326 , objToWorld138_g326 ) , 2.0 );
				float attenw99_g326 = break87_g326.w;
				float temp_output_116_0_g326 = saturate( ( 1.0 - ( ( temp_output_83_0_g326 * attenw99_g326 ) / 25.0 ) ) );
				float temp_output_3408_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g326 ) * attenw99_g326 ) ) , ( temp_output_116_0_g326 * temp_output_116_0_g326 ) );
				float VertAtten2014 = ( temp_output_3408_23 + temp_output_3408_29 + temp_output_3408_30 + temp_output_3408_31 );
				float4 localVertexLightCol114_g326 = VertexLightCol114_g326();
				float4 temp_output_3408_16 = localVertexLightCol114_g326;
				float4 localVertexLightCol215_g326 = VertexLightCol215_g326();
				float4 temp_output_3408_17 = localVertexLightCol215_g326;
				float4 localVertexLightCol319_g326 = VertexLightCol319_g326();
				float4 temp_output_3408_18 = localVertexLightCol319_g326;
				float4 localVertexLightCol421_g326 = VertexLightCol421_g326();
				float4 temp_output_3408_20 = localVertexLightCol421_g326;
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
				float isUnlit3574 = _DisableLight;
				float3 temp_cast_4 = (isUnlit3574).xxx;
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch1908 = saturate( ( ( temp_output_3408_16 * temp_output_3408_23 ) + ( temp_output_3408_17 * temp_output_3408_29 ) + ( temp_output_3408_18 * temp_output_3408_30 ) + ( temp_output_3408_20 * temp_output_3408_31 ) ) );
				#else
				float4 staticSwitch1908 = float4(0,0,0,0);
				#endif
				float4 VertLight1406 = staticSwitch1908;
				float3 localunity_SHArgb3_g330 = unity_SHArgb3_g330();
				float3 temp_cast_5 = (_MinLight).xxx;
				float3 clampResult3331 = clamp( ( ( ( ase_lightColor.rgb * ase_lightColor.a * ( 1.0 - _WorldSpaceLightPos0.w ) ) + (VertLight1406).xyz + ( localunity_SHArgb3_g330 * float3( 1.3,1.3,1.3 ) ) ) * _LightMultiplier ) , temp_cast_5 , float3( 2,2,2 ) );
				float3 break5_g335 = clampResult3331;
				float3 clampResult1914 = clamp( clampResult3331 , float3( 0,0,0 ) , ( ( _MaxLight * max( max( break5_g335.x , break5_g335.y ) , max( break5_g335.y , break5_g335.z ) ) ) / clampResult3331 ) );
				float3 break5_g341 = clampResult1914;
				float saferPower3564 = max( saturate( max( max( break5_g341.x , break5_g341.y ) , max( break5_g341.y , break5_g341.z ) ) ) , 0.0001 );
				float3 break5_g340 = clampResult1914;
				float clampResult3551 = clamp( ( pow( saferPower3564 , 3.0 ) - ( ( 1.0 - saturate( min( min( break5_g340.x , break5_g340.y ) , min( break5_g340.y , break5_g340.z ) ) ) ) * _LightSatLimiter ) ) , ( ( 1.0 - _LightSatTotal ) + 0.2 ) , 1.0 );
				float3 desaturateInitialColor1777 = clampResult1914;
				float desaturateDot1777 = dot( desaturateInitialColor1777, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1777 = lerp( desaturateInitialColor1777, desaturateDot1777.xxx, clampResult3551 );
				float3 temp_cast_6 = (( ( 1.0 - temp_output_1106_0 ) * _ShadowDarkness )).xxx;
				float3 clampResult30 = clamp( ( RampShade979 - temp_cast_6 ) , float3( 0,0,0 ) , float3( 0.8,0.8,0.8 ) );
				float3 AllLight3270 = clampResult1914;
				float3 ifLocalVar3502 = 0;
				UNITY_BRANCH 
				if( _ShadeColorDynamic == 1.0 )
				ifLocalVar3502 = (float3( 0.5,0.5,0.5 ) + ((AllLight3270).xyz - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.5,0.5,0.5 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				else if( _ShadeColorDynamic < 1.0 )
				ifLocalVar3502 = (float3( 0.5,0.5,0.5 ) + ((_ShadeColour).rgb - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.5,0.5,0.5 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 Vert_LightDir1491 = normalizeResult1382;
				float3 lerpResult2213 = lerp( Dir_LightDir2215 , Vert_LightDir1491 , temp_output_2033_0);
				float3 FinalLightDir2218 = lerpResult2213;
				float3 switchResult3288 = (((ase_vface>0)?(NormalShade962):(-NormalShade962)));
				float fresnelNdotV645 = dot( normalize( switchResult3288 ), FinalLightDir2218 );
				float fresnelNode645 = ( 0.0 + _SoftScale * pow( max( 1.0 - fresnelNdotV645 , 0.0001 ), _SoftPower ) );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
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
				float3 ifLocalVar3568 = 0;
				UNITY_BRANCH 
				if( isUnlit3574 == 1.0 )
				ifLocalVar3568 = temp_cast_4;
				else if( isUnlit3574 < 1.0 )
				ifLocalVar3568 = LightColour968;
				float3 PostDesaturation1276 = (float3( 0.0001,0.0001,0.0001 ) + (( MaintexRGB3074 * ifLocalVar3568 ) - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.0001,0.0001,0.0001 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
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
				float3 localCenterEye1_g383 = CenterEye1_g383();
				float3 ifLocalVar50_g382 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar50_g382 = localCenterEye1_g383;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar50_g382 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g382 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g382 - WorldPosition ), 0 ) ).xyz );
				float3 lerpResult3086 = lerp( float3( 0,0,1 ) , ifLocalVar3494 , ( _NormalPowerMatCap * NormalDist3459 * tex2DNode3059.r ));
				float3 tanNormal3090 = lerpResult3086;
				float3 worldNormal3090 = float3(dot(tanToWorld0,tanNormal3090), dot(tanToWorld1,tanNormal3090), dot(tanToWorld2,tanNormal3090));
				float3 normalizeResult3091 = normalize( worldNormal3090 );
				float3 NormalMatCap3089 = normalizeResult3091;
				float3 worldToViewDir13_g382 = normalize( mul( UNITY_MATRIX_V, float4( NormalMatCap3089, 0 ) ).xyz );
				float mulTime2208 = _Time.y * _MatcapSpin;
				float cos2210 = cos( mulTime2208 );
				float sin2210 = sin( mulTime2208 );
				float2 rotator2210 = mul( (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g382 ) , worldToViewDir13_g382 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) - float2( 0.5,0.5 ) , float2x2( cos2210 , -sin2210 , sin2210 , cos2210 )) + float2( 0.5,0.5 );
				float3 localCenterEye1_g385 = CenterEye1_g385();
				float3 ifLocalVar32_g384 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar32_g384 = localCenterEye1_g385;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar32_g384 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g384 = normalize( ( ifLocalVar32_g384 - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g384 = normalize( cross( normalizeResult19_g384 , _worldUp ) );
				float3 temp_output_21_0_g384 = NormalMatCap3089;
				float dotResult10_g384 = dot( normalizeResult8_g384 , temp_output_21_0_g384 );
				float dotResult2_g384 = dot( _worldUp , normalizeResult19_g384 );
				float3 normalizeResult7_g384 = normalize( ( _worldUp - ( dotResult2_g384 * normalizeResult19_g384 ) ) );
				float dotResult9_g384 = dot( normalizeResult7_g384 , temp_output_21_0_g384 );
				float2 appendResult11_g384 = (float2(dotResult10_g384 , dotResult9_g384));
				float cos2207 = cos( mulTime2208 );
				float sin2207 = sin( mulTime2208 );
				float2 rotator2207 = mul( ( ( appendResult11_g384 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) - float2( 0.5,0.5 ) , float2x2( cos2207 , -sin2207 , sin2207 , cos2207 )) + float2( 0.5,0.5 );
				float4 ifLocalVar3528 = 0;
				UNITY_BRANCH 
				if( _Legacy == 1.0 )
				ifLocalVar3528 = tex2D( _Matcap, rotator2210 );
				else if( _Legacy < 1.0 )
				ifLocalVar3528 = tex2D( _Matcap, rotator2207 );
				float3 desaturateInitialColor1516 = ( (ifLocalVar3528).rgb * _MatcapIntensity * (_MatCapColor).rgb );
				float desaturateDot1516 = dot( desaturateInitialColor1516, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1516 = lerp( desaturateInitialColor1516, desaturateDot1516.xxx, ( 1.0 - _MatcapSaturation ) );
				float2 uv_MatCapMask = i.ase_texcoord1.xy * _MatCapMask_ST.xy + _MatCapMask_ST.zw;
				float4 tex2DNode3109 = tex2D( _MatCapMask, uv_MatCapMask );
				float lerpResult3268 = lerp( 1.0 , ( tex2DNode3109.r * tex2DNode3109.a ) , _MatcapMaskLevel1);
				float4 lerpResult405 = lerp( PostRimLight1292 , ( PostRimLight1292 * float4( desaturateVar1516 , 0.0 ) ) , ( (ifLocalVar3528).a * _MatcapOpacity * lerpResult3268 ));
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
				float3 temp_cast_15 = (3.0).xxx;
				float3 clampResult331 = clamp( ( lerpResult450 * (_EmissionColor).rgb * _EmissionIntensity ) , float3( 0,0,0 ) , temp_cast_15 );
				float3 Emission1285 = clampResult331;
				float3 desaturateInitialColor2291 = LightColour968;
				float desaturateDot2291 = dot( desaturateInitialColor2291, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2291 = lerp( desaturateInitialColor2291, desaturateDot2291.xxx, 1.0 );
				float3 localCenterEye1_g342 = CenterEye1_g342();
				float3 temp_output_4_0_g342 = ( localCenterEye1_g342 - WorldPosition );
				float3 normalizeResult5_g342 = normalize( temp_output_4_0_g342 );
				float3 ifLocalVar3493 = 0;
				UNITY_BRANCH 
				if( _StereoFixSpec == 1.0 )
				ifLocalVar3493 = normalizeResult5_g342;
				else if( _StereoFixSpec < 1.0 )
				ifLocalVar3493 = ase_worldViewDir;
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
				float3 localCenterEye1_g373 = CenterEye1_g373();
				float3 ifLocalVar50_g372 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar50_g372 = localCenterEye1_g373;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar50_g372 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g372 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g372 - WorldPosition ), 0 ) ).xyz );
				float3 worldToViewDir13_g372 = normalize( mul( UNITY_MATRIX_V, float4( NormalSpecular965, 0 ) ).xyz );
				float3 localCenterEye1_g375 = CenterEye1_g375();
				float3 ifLocalVar32_g374 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar32_g374 = localCenterEye1_g375;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar32_g374 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g374 = normalize( ( ifLocalVar32_g374 - WorldPosition ) );
				float3 normalizeResult8_g374 = normalize( cross( normalizeResult19_g374 , _worldUp ) );
				float3 temp_output_21_0_g374 = NormalSpecular965;
				float dotResult10_g374 = dot( normalizeResult8_g374 , temp_output_21_0_g374 );
				float dotResult2_g374 = dot( _worldUp , normalizeResult19_g374 );
				float3 normalizeResult7_g374 = normalize( ( _worldUp - ( dotResult2_g374 * normalizeResult19_g374 ) ) );
				float dotResult9_g374 = dot( normalizeResult7_g374 , temp_output_21_0_g374 );
				float2 appendResult11_g374 = (float2(dotResult10_g374 , dotResult9_g374));
				float4 ifLocalVar3491 = 0;
				UNITY_BRANCH 
				if( _Legacy2 == 1.0 )
				ifLocalVar3491 = tex2D( _SpecularMatcap, (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g372 ) , worldToViewDir13_g372 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) );
				else if( _Legacy2 < 1.0 )
				ifLocalVar3491 = tex2D( _SpecularMatcap, ( ( appendResult11_g374 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) );
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
				float3 localCenterEye1_g371 = CenterEye1_g371();
				float3 temp_output_4_0_g371 = ( localCenterEye1_g371 - WorldPosition );
				float3 normalizeResult5_g371 = normalize( temp_output_4_0_g371 );
				float4 texCUBENode3538 = texCUBE( _Cubemap, reflect( normalizeResult5_g371 , float3( 0,0,0 ) ) );
				float3 temp_output_3534_0 = ( (texCUBENode3538).rgb * texCUBENode3538.a );
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
				float3 ifLocalVar3539 = 0;
				UNITY_BRANCH 
				if( _UseCubemapOnly == 1.0 )
				ifLocalVar3539 = temp_output_3534_0;
				else if( _UseCubemapOnly < 1.0 )
				ifLocalVar3539 = ( indirectSpecular3174 < float3( 0.001,0.001,0.001 ) ? temp_output_3534_0 : indirectSpecular3174 );
				float3 lerpResult3407 = lerp( float3( 0,0,0 ) , ifLocalVar3539 , _ReflectionOpacity);
				float3 ifLocalVar3483 = 0;
				UNITY_BRANCH 
				if( _UseReflection == 1.0 )
				ifLocalVar3483 = lerpResult3407;
				float2 uv_SpecularMask = i.ase_texcoord1.xy * _SpecularMask_ST.xy + _SpecularMask_ST.zw;
				float3 lerpResult560 = lerp( float3( 0,0,0 ) , ( ifLocalVar3489 + ifLocalVar3483 ) , ( _SpecMaskOpacity * tex2D( _SpecularMask, uv_SpecularMask ).r ));
				float3 SpecularOut983 = ( ifLocalVar3482 + lerpResult560 );
				float2 texCoord81_g392 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float4 tex2DNode87_g392 = tex2D( _SparkleMask1, texCoord81_g392 );
				float3 localCenterEye1_g394 = CenterEye1_g394();
				float clampResult2_g392 = clamp( distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g394 : _WorldSpaceCameraPos ) ) , 0.0 , 100.0 );
				float temp_output_4_0_g392 = ( 1.0 - (0.0 + (clampResult2_g392 - 0.0) * (0.01 - 0.0) / (1.0 - 0.0)) );
				float3 temp_cast_21 = (_Threshold1).xxx;
				float3 temp_cast_22 = (saturate( ( _Threshold1 + _Range1 ) )).xxx;
				sampler2D texvalue34_g399 = _SparklePatternRGB1;
				float2 uv_SparklePatternRGB1 = i.ase_texcoord1.xy * _SparklePatternRGB1_ST.xy + _SparklePatternRGB1_ST.zw;
				float2 temp_output_4_0_g399 = uv_SparklePatternRGB1;
				half2 uvin34_g399 = temp_output_4_0_g399;
				half2 dx34_g399 = ( ddx( temp_output_4_0_g399 ) * float2( 0.25,0.25 ) );
				half2 dy34_g399 = ( ddy( temp_output_4_0_g399 ) * float2( 0.25,0.25 ) );
				half bias34_g399 = 0.0;
				half4 localsupersample2x234_g399 = supersample2x2( texvalue34_g399 , uvin34_g399 , dx34_g399 , dy34_g399 , bias34_g399 );
				float4 ifLocalVar74_g392 = 0;
				UNITY_BRANCH 
				if( _SparkleSuperSample1 == 1.0 )
				ifLocalVar74_g392 = localsupersample2x234_g399;
				else if( _SparkleSuperSample1 < 1.0 )
				ifLocalVar74_g392 = tex2D( _SparklePatternRGB1, uv_SparklePatternRGB1 );
				float temp_output_71_0_g392 = ( 1.0 - _SparkleTexColour1 );
				float3 desaturateInitialColor83_g392 = ifLocalVar74_g392.xyz;
				float desaturateDot83_g392 = dot( desaturateInitialColor83_g392, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar83_g392 = lerp( desaturateInitialColor83_g392, desaturateDot83_g392.xxx, temp_output_71_0_g392 );
				sampler2D texvalue34_g398 = _SparklePatternRGB1;
				float2 break22_g392 = uv_SparklePatternRGB1;
				float2 appendResult39_g392 = (float2(-break22_g392.x , break22_g392.y));
				float3 localCenterEye1_g397 = CenterEye1_g397();
				float4 appendResult76_g396 = (float4(( WorldPosition - localCenterEye1_g397 ) , 0.0));
				float4 temp_output_77_0_g396 = mul( UNITY_MATRIX_V, appendResult76_g396 );
				float2 break83_g396 = ( (temp_output_77_0_g396).xy / (temp_output_77_0_g396).z );
				float2 appendResult86_g396 = (float2(( ( _ScreenParams.z / _ScreenParams.w ) * break83_g396.x ) , ( break83_g396.y * 2.0 )));
				float2 appendResult101_g396 = (float2(1.0 , 1.0));
				float2 appendResult102_g396 = (float2(0.0 , 0.0));
				float4 screenPos = i.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ifLocalVar27_g392 = 0;
				UNITY_BRANCH 
				if( _StereoCorrect1 == 1.0 )
				ifLocalVar27_g392 = ( ( ( ( -appendResult86_g396 * float2( 1,0.5 ) ) + float2( 0.5,0.5 ) ) * appendResult101_g396 ) + appendResult102_g396 );
				else if( _StereoCorrect1 < 1.0 )
				ifLocalVar27_g392 = (ase_screenPosNorm).xy;
				float mulTime7_g392 = _Time.y * _MotionSpeed1;
				float2 appendResult24_g392 = (float2(mulTime7_g392 , 0.0));
				float cos25_g392 = cos( (0.0 + (_RotateLinear1 - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float sin25_g392 = sin( (0.0 + (_RotateLinear1 - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float2 rotator25_g392 = mul( appendResult24_g392 - float2( 0.5,0.5 ) , float2x2( cos25_g392 , -sin25_g392 , sin25_g392 , cos25_g392 )) + float2( 0.5,0.5 );
				float2 appendResult28_g392 = (float2(sin( mulTime7_g392 ) , cos( mulTime7_g392 )));
				float2 ifLocalVar40_g392 = 0;
				UNITY_BRANCH 
				if( _MotionType1 == 1.0 )
				ifLocalVar40_g392 = rotator25_g392;
				else if( _MotionType1 < 1.0 )
				ifLocalVar40_g392 = appendResult28_g392;
				float temp_output_26_0_g392 = ( ( WorldPosition.x + WorldPosition.y + WorldPosition.z ) * ( _WorldPosContribution1 / 10.0 ) );
				float2 appendResult46_g392 = (float2(-temp_output_26_0_g392 , temp_output_26_0_g392));
				float2 temp_output_50_0_g392 = ( ( appendResult39_g392 + ( ifLocalVar27_g392 * _ScreenContribution1 ) ) + float2( 0.25,0.25 ) + ( _MotionIntensity1 * ifLocalVar40_g392 ) + appendResult46_g392 );
				float2 temp_output_4_0_g398 = temp_output_50_0_g392;
				half2 uvin34_g398 = temp_output_4_0_g398;
				half2 dx34_g398 = ( ddx( temp_output_4_0_g398 ) * float2( 0.25,0.25 ) );
				half2 dy34_g398 = ( ddy( temp_output_4_0_g398 ) * float2( 0.25,0.25 ) );
				half bias34_g398 = 0.0;
				half4 localsupersample2x234_g398 = supersample2x2( texvalue34_g398 , uvin34_g398 , dx34_g398 , dy34_g398 , bias34_g398 );
				float4 ifLocalVar68_g392 = 0;
				UNITY_BRANCH 
				if( _SparkleSuperSample1 == 1.0 )
				ifLocalVar68_g392 = localsupersample2x234_g398;
				else if( _SparkleSuperSample1 < 1.0 )
				ifLocalVar68_g392 = tex2D( _SparklePatternRGB1, temp_output_50_0_g392 );
				float3 desaturateInitialColor79_g392 = ifLocalVar68_g392.xyz;
				float desaturateDot79_g392 = dot( desaturateInitialColor79_g392, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar79_g392 = lerp( desaturateInitialColor79_g392, desaturateDot79_g392.xxx, temp_output_71_0_g392 );
				float3 localCenterEye1_g395 = CenterEye1_g395();
				float3 smoothstepResult93_g392 = smoothstep( temp_cast_21 , temp_cast_22 , ( desaturateVar83_g392 * desaturateVar79_g392 * ( 1.0 - pow( ( distance( WorldPosition , localCenterEye1_g395 ) / 10000.0 ) , 0.5 ) ) ));
				float3 normalizeResult64_g392 = normalize( ase_worldViewDir );
				float3 temp_output_97_0_g392 = NormalSpecular965;
				float temp_output_30_0_g392 = (-1.0 + (temp_output_4_0_g392 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0));
				float3 appendResult42_g392 = (float3(_SparkleFresnel2.x , ( _SparkleFresnel2.y * temp_output_30_0_g392 ) , pow( _SparkleFresnel2.z , temp_output_30_0_g392 )));
				float3 break66_g392 = (float3( 0,0,0 ) + (appendResult42_g392 - float3( 0,0,0 )) * (float3( 0.1,0.1,0.1 ) - float3( 0,0,0 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float fresnelNdotV73_g392 = dot( temp_output_97_0_g392, normalizeResult64_g392 );
				float fresnelNode73_g392 = ( break66_g392.x + break66_g392.y * pow( max( 1.0 - fresnelNdotV73_g392 , 0.0001 ), break66_g392.z ) );
				float fresnelNdotV67_g392 = dot( -temp_output_97_0_g392, normalizeResult64_g392 );
				float fresnelNode67_g392 = ( break66_g392.x + break66_g392.y * pow( max( 1.0 - fresnelNdotV67_g392 , 0.0001 ), break66_g392.z ) );
				float switchResult91_g392 = (((ase_vface>0)?(( 1.0 - saturate( fresnelNode73_g392 ) )):(( 1.0 - saturate( fresnelNode67_g392 ) ))));
				float4 ifLocalVar3473 = 0;
				UNITY_BRANCH 
				if( _UseSparkleShimmer == 1.0 )
				ifLocalVar3473 = ( ( tex2DNode87_g392.r * tex2DNode87_g392.a ) * ( _SparkleColor2 * ( 2.5 * ( 200.0 * temp_output_4_0_g392 ) ) ) * float4( smoothstepResult93_g392 , 0.0 ) * switchResult91_g392 );
				float4 SparkleOut971 = ifLocalVar3473;
				float Alpha1262 = (ifLocalVar3504).w;
				int localisCamera1_g387 = isCamera1_g387();
				int Cam17_g387 = localisCamera1_g387;
				int temp_output_5_0_g387 = (int)_IsInMirror;
				int temp_output_6_0_g387 = (int)_IsNotMirror;
				float ifLocalVar3478 = 0;
				UNITY_BRANCH 
				if( _MirrorSystem == 1.0 )
				ifLocalVar3478 = (float)( (float)Cam17_g387 == 1.0 ? ( (float)temp_output_5_0_g387 == 1.0 ? ( Cam17_g387 + temp_output_5_0_g387 ) : ( Cam17_g387 * temp_output_5_0_g387 ) ) : ( (float)temp_output_6_0_g387 == 0.0 ? ( Cam17_g387 * temp_output_6_0_g387 ) : ( Cam17_g387 + temp_output_6_0_g387 ) ) );
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
	
	Fallback "Legacy Shaders/Transparent/Cutout/VertexLit"
}
/*ASEBEGIN
Version=18814
-1637;81;1586;813;1487.454;2451.935;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;1378;-7557.483,-1117.17;Inherit;False;2099.93;995.9517;;34;2150;1491;1406;1908;1910;1683;1682;1631;1630;1629;1684;1389;1381;1382;1380;1383;2017;1665;1905;1911;1879;1891;1890;2014;1589;1886;1551;1878;2152;2153;2154;2159;3408;3496;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1237;-5394.859,-1294.527;Inherit;False;2248.478;1151.156;;43;428;603;3013;3061;1856;1861;3089;3091;3090;3086;3087;965;3088;3055;1234;602;3060;3011;962;1235;430;3062;3049;2962;2958;3012;3059;3014;2957;3432;3442;3451;3460;3461;3462;3494;3510;3464;3458;3527;3495;3459;3576;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;3510;-4220.688,-1169.469;Inherit;False;View Distance;-1;;324;2a6ef75a50a2bd147a81c448d8de0d4d;1,8,0;1;9;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3464;-4203.087,-1242.224;Inherit;False;Property;_NorDist;Normal Distance Modifier;38;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3408;-7361.804,-689.7468;Inherit;False;VertexLightData;-1;;326;d6cc1c00f5d200e45903717e6fa3d55c;0;0;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.RangedFloatNode;3527;-4089.552,-1085.954;Inherit;False;Constant;_Dist_Null;Dist_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3458;-3943.846,-1166.868;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-6944.753,-262.7372;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ConditionalIfNode;3495;-3770.946,-1220.105;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-6816.021,-260.8447;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RegisterLocalVarNode;3459;-3599.025,-1208.479;Inherit;False;NormalDist;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-6660.415,-255.3159;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-7075.868,-323.4985;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1891;-6552.734,-169.838;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3461;-5254.188,-263.1792;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;281;-7590.324,61.49274;Inherit;False;1722.566;633.3398;Uses directional light or uses the static light direction;21;1076;1296;5;2215;3414;1165;2635;1876;1233;248;633;1247;249;252;1246;251;2148;1232;2147;3415;3511;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-5309.746,-336.8552;Inherit;False;Property;_NormalPower;Normal Power;39;0;Create;True;0;0;0;False;0;False;0;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2014;-6745.619,-337.2133;Inherit;False;VertAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-5350.2,-993.4962;Inherit;False;Property;_NormalPowerSpecular;Normal Power Specular;40;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1890;-6526.248,-268.2112;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3460;-5294.659,-1061.566;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-6330.016,-298.2636;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3451;-4949.979,-966.8456;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2147;-7580.227,235.7186;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3442;-4900.85,-290.7675;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1911;-6400.671,-387.3763;Inherit;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-7582.783,125.3326;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ComponentMaskNode;2148;-7380.227,276.7186;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;3012;-5286.095,-875.6575;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2957;-5379.295,-761.6382;Inherit;True;Property;_Normal;Normal (N);36;1;[Normal];Create;False;0;0;0;False;2;Space(5);Header(.  Normal  .);False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TextureCoordinatesNode;3432;-5357.556,-573.2922;Inherit;False;0;2957;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;3014;-5271.194,-450.5571;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3059;-5088.355,-1239.419;Inherit;True;Property;_NormalMaskR;Normal Mask (R);42;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;1905;-6150.92,-332.666;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-7565.5,568.3696;Float;False;Property;_StaticLightZ;Static Light Z;31;0;Create;True;0;0;0;False;0;False;0.44;0.44;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2153;-7531.4,-1047.893;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;3013;-4739.089,-297.5795;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-7160.085,246.2777;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-7567.216,496.3287;Float;False;Property;_StaticLightY;Static Light Y;30;0;Create;True;0;0;0;False;0;False;0.55;0.55;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3049;-5076.198,-854.2844;Inherit;False;NormalTextureSuperSample;-1;;327;c5e7d95f0a9b898419b29857c25ecde5;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;49;FLOAT;1;False;4;FLOAT3;0;FLOAT;39;FLOAT;40;FLOAT;41
Node;AmplifyShaderEditor.SamplerNode;2958;-5084.794,-599.3252;Inherit;True;Property;_TextureSample1;Texture Sample 1;100;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;249;-7567.122,422.0447;Float;False;Property;_StaticLightX;Static Light X;29;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;0.68;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2962;-5047.218,-701.3572;Inherit;False;Property;_NormSuperSample;SuperSample (expensive);37;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3062;-4789.537,-516.2893;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-5892.378,-331.062;Inherit;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2150;-7454.582,-863.1216;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;2152;-7289.371,-1077.054;Inherit;False;Property;_LightMode;Lighting Mode;19;1;[Enum];Create;False;0;2;Surface;0;Object2World;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3061;-4537.636,-315.4132;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3494;-4705.496,-733.877;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-6915.19,-582.9702;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;248;-7233.666,483.6258;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2121;-5759.884,339.9149;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-6915.271,-491.4412;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-6914.716,-401.8803;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;2154;-7315.503,-974.3906;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3511;-7247.144,594.0026;Inherit;False;VR_Center_Eye;-1;;328;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.LightColorNode;633;-7254.702,367.0057;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-7014.398,202.5157;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-6911.245,-673.0161;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-7039.707,408.0018;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-6635.867,-565.054;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ConditionalIfNode;3496;-7085.833,-971.8483;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2635;-6923.536,503.2885;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.3333,0.3333,0.3333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-5595.17,260.0959;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-6921.742,327.9207;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2144;-5504.743,334.7301;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;430;-4357.315,-376.2641;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1235;-3996.53,-410.9391;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;2159;-6923.945,-975.037;Inherit;False;Lightmode;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2140;-5310.849,252.4027;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2017;-7108.622,-748.0175;Inherit;False;VertLightPos1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1076;-6750.737,413.1807;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector4Node;1910;-6290.077,-691.4009;Inherit;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;1683;-6432.471,-564.7127;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2034;-5080.248,321.5851;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.33;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3415;-6562.391,493.4288;Inherit;False;GetBakedLight;-1;;329;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-6743.894,-806.4661;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-3677.044,-410.9052;Inherit;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1908;-6087.497,-575.6229;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2215;-6579.402,418.9576;Inherit;False;Dir_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-5802.324,-574.163;Inherit;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3414;-6353.696,439.8016;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;2081;-3062.307,-219.8347;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.PowerNode;2026;-4916.876,319.8529;Inherit;False;False;2;0;FLOAT;2;False;1;FLOAT;25;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-6574.792,342.4068;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-6630.413,-899.0414;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1382;-6612.254,-804.9048;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-6351.533,-859.6547;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2082;-2814.086,-194.0657;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-2841.482,4.51156;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2035;-4753.248,291.5851;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;1484;-2885.532,-115.071;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.DotProductOpNode;5;-6192.996,365.4466;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3416;-2862.944,100.0505;Inherit;False;GetBakedLight;-1;;330;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-2619.898,-113.8191;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-6198.28,-864.8387;Inherit;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2025;-4626.137,291.327;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3314;-2657.188,3.97455;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3169;-2607.602,99.81083;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1.3,1.3,1.3;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;571;2177.812,311.4184;Inherit;False;1410.604;490.6661;;15;3333;1998;627;1999;351;1425;3335;3336;1424;349;3352;3353;3474;3499;3506;VRChat Friends-Only;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-6165.52,216.8106;Inherit;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-2403.018,-45.81974;Inherit;False;3;3;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4534.744,190.634;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;349;2182.999,611.2747;Inherit;True;Property;_FriendsOnlyRT;> FriendsOnly RenderTexture;118;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2870;-2412.168,80.98762;Inherit;False;Property;_LightMultiplier;Light Multiplier;12;0;Create;True;1;;0;0;False;1;Header(. Lighting .);False;1.1;1.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4520.63,98.07337;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2033;-4486.248,291.5851;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3500;-3957.652,296.1707;Inherit;False;Constant;_Shading_Null;Shading_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1058;-3948.189,177.9939;Inherit;False;Property;_UseShading;Use Shading;18;2;[Header];[ToggleUI];Create;True;1;;0;0;False;2;Space(5);Deader(.  Shadow  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1994;-4219.491,204.3985;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1424;2469.958,638.8937;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3434;-4089.306,579.5365;Inherit;False;0;2211;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1916;-2217.484,138.6671;Inherit;False;Property;_MinLight;Min Light;14;0;Create;True;0;0;0;False;0;False;0.05;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2867;-2192.492,45.67316;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;3331;-1975.108,51.6673;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3860.334,389.5299;Inherit;False;Property;_OffsetDot;Offset Dot;23;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3497;-3725.2,177.3633;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2211;-3850.617,556.9277;Inherit;True;Property;_LightMask;Light Mask (R);27;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3263;-3725.823,752.9653;Float;False;Property;_LightMaskLevel;Mask Level;28;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3336;2565.578,625.4047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-6200.064,-784.2961;Inherit;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3325;-1814.25,16.16423;Inherit;False;Float3 Max;-1;;335;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3335;2273.578,574.4047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1915;-1757.034,-55.08247;Inherit;False;Property;_MaxLight;Max Light;13;0;Create;True;0;0;0;False;0;False;0.9;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;793;-1641.929,926.9338;Inherit;False;1930.734;909.7371;;28;1123;3288;1492;669;3281;645;3285;954;2976;3283;3287;1035;680;679;3282;662;641;642;811;3273;684;3271;646;3289;3290;3291;3502;3503;Soft Shading;0,0,0,1;0;0
Node;AmplifyShaderEditor.LerpOp;3262;-3466.056,569.3016;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3485.761,366.6765;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-3554.867,472.5686;Float;False;Property;_ShadowSharpness1;Shadow Sharpness;24;0;Create;False;0;0;0;False;0;False;1;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1425;2300.324,531.0254;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2217;-4535.136,380.7607;Inherit;False;2215;Dir_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3301;-1605.576,-9.113971;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1123;-1636.372,1591.877;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2216;-4540.25,454.3213;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-3283.7,483.0416;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;3332;-1502.108,157.6673;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2213;-4301.639,385.696;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;3289;-1433.102,1651.847;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;573;-2963.567,591.8939;Inherit;False;1236.993;594.242;;11;979;815;1025;1033;32;1032;1010;1008;1016;1125;3501;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.CeilOpNode;351;2444.413,530.424;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1254;-3108.695,762.8108;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2218;-4147.478,380.9126;Inherit;False;FinalLightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;641;-1296.038,1518.301;Inherit;False;Property;_SoftScale;Soft Scale;48;0;Create;True;0;0;0;False;0;False;1;1;0.5;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1999;2553.491,446.0493;Inherit;False;Property;_FriendsOnly1;Invert Friends Only;119;0;Create;False;0;0;0;False;3;Toggle(_);;;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SwitchByFaceNode;3288;-1314.471,1596.851;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;642;-1304.77,1705.931;Inherit;False;Property;_SoftPower;Soft Power;47;0;Create;True;0;0;0;False;0;False;0.75;0.75;0.5;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1125;-2936.543,967.2917;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;627;2677.13,521.6781;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-1320.873,104.9947;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;1008;-2935.869,628.4987;Inherit;False;Property;_ShadowColour;Shadow Colour;21;0;Create;True;0;0;0;False;0;False;0.7098039,0.7098039,0.7098039,1;0.8196079,0.8196079,0.8196079,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;3270;-1178.349,70.11365;Inherit;False;AllLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1492;-1232.602,1439.593;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;32;-2758.202,968.824;Inherit;True;Property;_Ramp;Ramp (RGB);22;0;Create;False;0;0;0;False;0;False;-1;None;c320938fa0c7f9043aabb704290909a3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;1032;-2674.935,793.2476;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;3;COLOR;0.5,0.5,0.5,0;False;4;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;3506;2853.668,478.1191;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;662;-834.0081,1611.142;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;645;-834.9511,1434.781;Inherit;False;Standard;WorldNormal;LightDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;646;-1461.741,1222.885;Inherit;False;Property;_ShadeColour;Shade Colour;45;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;2982;-2453.117,-522.5095;Inherit;True;Property;_MainTex;Texture (RGB,A);4;0;Create;False;1;;0;0;False;1;Header(.  Main  .);False;None;e17a37043280897439428020a5244d5d;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2631.976,646.1672;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1033;-2432.792,962.5176;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3430;-2455.567,-337.9839;Inherit;False;0;2982;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;3343;-2774.158,-994.4948;Inherit;True;Property;_MainTexFriends;FriendsOnly Texture (RGB,A);121;0;Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TextureCoordinatesNode;3431;-2817.627,-805.014;Inherit;False;0;3343;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;3282;-610.3141,1611.195;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3271;-1465.254,1039.115;Inherit;False;3270;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3333;3007.626,473.3551;Inherit;False;FriendsOnlyInvert;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3567;-1133.719,222.6608;Inherit;False;1140.277;405.8864;light saturation bias;13;3551;3566;3553;3564;3255;3558;3120;2093;3557;3253;3326;3554;3552;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1025;-2351.971,779.2252;Inherit;False;Property;_GradientorRamp;Gradient or Ramp;20;1;[Enum];Create;True;0;2;Ramp_Texture;0;Linear_Gradient;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3291;-469.1021,1611.847;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;815;-2276.506,954.7916;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1016;-2296.772,663.8597;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3281;-616.9593,1436.208;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3273;-1288.745,1039.086;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2984;-2164.317,-379.9094;Inherit;True;Property;_TextureSample7;Texture Sample 7;101;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3466;-2329.095,-1077.135;Inherit;False;Property;_FriendsSuperSample;SuperSample (expensive);122;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3467;-2430.023,-796.7749;Inherit;False;TextureSuperSample;-1;;338;23a6a6e8fbe28134cac41513630794b1;0;3;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.ComponentMaskNode;811;-1259.262,1222.301;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3340;-1990.054,-1113.587;Inherit;False;Property;_FriendsOnlyTexture;Friends Only Texture;120;0;Create;True;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3345;-2497.454,-994.577;Inherit;True;Property;_TextureSample4;Texture Sample 4;101;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;3338;-1996.516,-1041.442;Inherit;False;3333;FriendsOnlyInvert;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2988;-2154.685,-614.2943;Inherit;False;Property;_TexSuperSample;SuperSample (expensive);5;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2997;-2161.717,-539.9096;Inherit;False;TextureSuperSample;-1;;339;23a6a6e8fbe28134cac41513630794b1;0;3;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.TFHCRemapNode;679;-833.7531,1231.946;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3552;-1074.829,383.7633;Inherit;False;Float3 Min;-1;;340;61474a8b2b91ea8409c96a71133ac9bc;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3501;-2100.351,747.7996;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3476;-1797.042,-586.8253;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1035;-613.3292,1144.24;Inherit;False;Property;_ShadeColorDynamic;ShadeColor Dynamic;44;1;[Enum];Create;True;0;2;FixedColour;0;LightColour;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3348;-1668.325,-1085.198;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3290;-318.1021,1397.847;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;680;-820.837,1017.662;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3475;-1979.382,-871.2838;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;3287;-184.4241,1398.014;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3504;-1570.348,-716.4194;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-1934.787,741.6784;Inherit;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3502;-384.7433,1145.886;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;18;-1595.969,-431.3401;Float;False;Property;_Color;> Color;6;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;335;-2422.695,452.5153;Inherit;False;Property;_ShadowDarkness;Shadow Darkness;25;0;Create;True;0;0;0;False;0;False;0.22;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;684;-273.9559,1518.556;Float;False;Property;_ShadeLevel;Shade Level;46;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3554;-878.9614,383.1028;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1470;-2370.866,382.0723;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3326;-1032.638,299.8147;Inherit;False;Float3 Max;-1;;341;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3120;-937.0833,454.5085;Inherit;False;Property;_LightSatLimiter;Light Saturation Limiter;15;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3253;-944.6758,534.3596;Inherit;False;Property;_LightSatTotal;Light Saturation Max;16;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3557;-743.9614,383.1028;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2093;-825.1577,298.775;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-1351.431,-430.7863;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-1366.365,-646.7323;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2186.292,395.4066;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3283;-218.424,1247.014;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;669;11.15326,1433.523;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.618;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2336.51,308.7788;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2976;-183.9426,1011.009;Inherit;False;Property;_ShadeEnable;Shade Enable;43;1;[ToggleUI];Create;True;0;2;FixedColour;0;LightColour;1;0;False;1;Header(.  Soft Shading  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3564;-688.6791,297.944;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3285;126.576,1235.014;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3558;-551.6614,378.3028;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3011;-4762.797,-927.8577;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-987.0077,-630.255;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1347;-973.6296,-417.7522;Inherit;False;1534.475;525.8724;hue & saturation;12;585;1330;581;2917;2911;2908;2918;325;2910;3241;3244;3249;;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector3Node;954;-169.967,1089.07;Inherit;False;Constant;_Shade_Null;Shade_Null;65;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;3255;-722.8646,539.6962;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-1880.116,355.17;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3060;-4611.861,-954.2728;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;2909;-716.3676,-628.6263;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ConditionalIfNode;3503;114.7852,969.2263;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2910;-803.9288,-364.1082;Inherit;False;Property;_Hue;Hue;7;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;30;-1140.387,638.8184;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3553;-369.5294,317.9633;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3566;-570.4897,538.5253;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2911;-434.4628,-331.2577;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1500;333.6703,648.8381;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-929.3052,-37.33464;Inherit;False;Property;_ShadowSaturation;Shadow Saturation;26;0;Create;True;0;0;0;False;0;False;0.85;0.9;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1330;-894.7972,-124.3827;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;569;-3992.233,-3276.048;Inherit;False;2937.823;1659.745;;87;3179;3182;3174;3177;3181;2002;3101;983;560;696;824;701;695;3072;3069;3104;3085;3064;3103;2301;3068;3081;3080;3067;3075;690;2234;1920;838;691;816;3079;2294;837;817;1921;3057;3056;554;1919;561;545;2905;556;2900;2902;555;551;553;2899;1051;1783;967;2898;1928;2236;546;2219;1909;2225;3251;3407;3435;3437;3438;3482;3483;3489;3490;3491;3492;3493;3529;3520;3521;3512;3531;3533;3534;3535;3536;3537;3538;3539;3540;3542;3543;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;3551;-186.5141,321.9888;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;325;-951.03,-274.2717;Float;False;Property;_Saturation;Saturation;8;0;Create;True;0;0;0;False;0;False;1;1.05;-2;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;602;-4413.345,-591.4132;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.HSVToRGBNode;2908;-205.8781,-322.6284;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-3922.059,-3166.281;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;1234;-4078.493,-593.411;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;3512;-3940.373,-3021.321;Inherit;False;VR_Center_Eye;-1;;342;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.RangedFloatNode;2225;-3929.059,-3246.281;Inherit;False;Property;_StereoFixSpec;Stereo Converge (flatten);54;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3244;-599.8806,-120.5177;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1777;68.71701,152.1802;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2289;457.3221,643.5714;Inherit;False;LightShaded;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2918;-634.3347,-223.8553;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3249;-604.4844,-31.81404;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3569;742.9477,514.6986;Inherit;False;Property;_DisableLight;Unlit (warning - disables all light);17;1;[ToggleUI];Create;False;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3493;-3663.338,-3242.463;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2219;-3947.059,-2927.281;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3576;-4487.744,-983.7255;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3529;-3493.189,-3275.913;Inherit;False;199;135;blinn-phong;1;2237;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3241;-342.8801,-70.51768;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3088;-4663.18,-1253.304;Inherit;False;Property;_NormalPowerMatCap;Normal Power MatCap;41;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3462;-4651.131,-1179.149;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;3055;-3890.627,-591.6012;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;2917;101.1179,-185.2206;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;393;-368.534,-1398.263;Inherit;False;1701.075;645.4055;;24;1284;372;388;390;1281;1291;383;370;384;1290;382;376;379;360;2300;2299;368;369;1533;1536;1534;1530;1537;3505;Rim/Outline;1,0.141,0.141,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;802.7797,631.2606;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2237;-3460.059,-3234.281;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-3468.396,-3020.72;Inherit;False;Property;_SpecularSize;Specular Size;50;0;Create;True;0;0;0;False;0;False;1;6.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;1005.1,626.8323;Inherit;False;LightColour;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1530;-354.0584,-1355.021;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1537;-335.6894,-1097.284;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DesaturateOpNode;581;384.9778,-6.735202;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3087;-4348.417,-857.308;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-3736,-598.4681;Inherit;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3574;1031.806,515.7266;Inherit;False;isUnlit;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1534;-353.0052,-1269.659;Inherit;False;Property;_Scale1;Rim Normal Power;96;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2236;-3189.574,-3044.708;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-3365.89,-3117.954;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1533;-333.2188,-1190.179;Inherit;False;Property;_RimNormal;Rim Normal;95;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-3298.059,-3237.281;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1536;-29.41597,-1331.016;Inherit;False;3;0;FLOAT3;0.5,0.5,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;967;-3975.441,-2359.151;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3086;-4132.849,-862.5599;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3074;996.205,284.9231;Inherit;False;MaintexRGB;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1928;-3975.441,-2437.333;Inherit;False;Property;_StereoFixSpecCap;Stereo Converge (flatten);57;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3568;1310.623,540.2003;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2898;-3975.441,-2519.15;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2899;-3953.725,-2701.486;Inherit;True;Property;_SpecularMatcap;Specular Matcap (RGB);56;0;Create;False;0;0;0;False;0;False;None;3d2cce892a030694d9a72a92dad5e82f;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode;3520;-3702.975,-2352.55;Inherit;False;VR MatCap;-1;;374;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldNormalVector;3090;-3981.873,-860.3129;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;3521;-3695.441,-2519.15;Inherit;False;Matcap (legacy);-1;;372;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ExpOpNode;553;-3102.541,-3126.846;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3505;-68.00105,-1184.572;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-2981.35,-3069.468;Inherit;False;Property;_SpecularStrength;Specular Strength;51;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;551;-3141.996,-3239.167;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3077;1515.589,515.3439;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;369;-101.6709,-952.4631;Inherit;False;Property;_Scale;Rim Scale;92;0;Create;False;0;0;0;False;0;False;0;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3543;-3315.93,-2084.908;Inherit;False;VR_Center_Eye;-1;;371;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.RangedFloatNode;368;-87.43275,-860.8964;Inherit;False;Property;_Power;Rim Power;91;0;Create;False;0;0;0;False;0;False;0;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2900;-3401.042,-2594.196;Inherit;True;Property;_TextureSample3;Texture Sample 3;90;0;Create;True;0;0;0;False;0;False;349;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;3535;-3379.816,-1898.425;Inherit;True;Property;_Cubemap;Cubemap Fallback (RGB,A);68;0;Create;False;0;0;0;False;0;False;None;None;False;black;LockedToCube;Cube;-1;0;2;SAMPLERCUBE;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ReflectOpNode;3542;-3080.93,-2054.908;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;3091;-3795.722,-858.8632;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;1918;1684.962,517.1806;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.0001,0.0001,0.0001;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-2986.302,-2981.685;Inherit;False;Property;_SpecularOpacity;Specular Opacity;49;0;Create;True;0;0;0;False;2;Space(5);Header(.  Specular  .);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2905;-3260.575,-2675.87;Inherit;False;Property;_Legacy2;Legacy;62;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2300;161.0131,-866.5192;Inherit;False;Property;_Max;Rim Max;94;0;Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2902;-3400.351,-2406.696;Inherit;True;Property;_TextureSample5;Texture Sample 5;90;0;Create;True;0;0;0;False;0;False;349;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;360;116.3953,-1184.854;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;556;-2760.892,-3122.597;Inherit;False;True;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2299;134.0131,-947.5192;Inherit;False;Property;_Min;Rim Min;93;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;545;-2998.938,-3237.717;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3056;-2679.177,-3002.35;Inherit;False;True;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;376;279.0939,-1353.882;Inherit;False;Property;_RimOutlineColour;Rim/Outline Colour;88;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.6544117,0.3560735,0.448663,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ConditionalIfNode;3491;-3042.145,-2503.19;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3089;-3626.067,-862.913;Inherit;False;NormalMatCap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-3046.066,-2341.094;Inherit;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;59;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-2700.062,-3228.451;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;437;616.6837,1064.665;Inherit;False;2518.223;840.2;Comment;34;3264;3266;3109;1274;405;414;807;1278;2180;1279;406;1516;1517;407;408;2920;1518;810;2919;2176;2175;2166;2210;2181;2207;2208;2209;963;1930;2873;3268;3528;3524;3523;Matcap > Alpha Supported;0.8221117,0.184,1,1;0;0
Node;AmplifyShaderEditor.SmoothstepOpNode;379;340.0466,-1184.545;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3538;-2878.996,-1980.863;Inherit;True;Property;_TextureSample8;Texture Sample 8;125;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;1862.854,512.2891;Inherit;False;PostDesaturation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;963;667.873,1593.267;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;2294;-2573.139,-3201.811;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.0001;False;2;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;384;337.945,-1008.527;Inherit;False;Property;_Amount;Rim Opacity;90;0;Create;False;0;0;0;False;0;False;0;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1921;-2782.207,-2395.469;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3179;-2775.722,-2083.383;Inherit;False;Property;_ProbeSmoothness;Probe Smoothness;66;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2209;839.3574,1750.81;Inherit;False;Property;_MatcapSpin;MatcapSpin;103;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;837;-2986.829,-2761.812;Inherit;False;Property;_SpecMatCapColor;SpecMatCap Colour;60;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,0.5746068,0.4764151,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;2873;665.4427,1378.15;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;3533;-2556.519,-1980.31;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;3057;-2545.886,-3076.35;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3177;-2784.215,-2149.459;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;366.8723,-915.0552;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1930;639.9877,1496.31;Inherit;False;Property;_StereoFix;Stereo Converge (flatten);99;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;531.321,-1272.665;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;817;-2881.305,-2507.978;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;2208;1041.131,1714.177;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-2612.224,-2505.682;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3524;937.2804,1380.15;Inherit;False;Matcap (legacy);-1;;382;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;3079;-2220.43,-3003.798;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1291;553.1177,-1351.037;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3523;941.4138,1600.787;Inherit;False;VR MatCap;-1;;384;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;838;-2756.215,-2731.139;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;816;-2414.243,-3209.465;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IndirectSpecularLight;3174;-2551.691,-2139.987;Inherit;False;World;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;370;691.6432,-1008.159;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-2984.107,-2592.215;Inherit;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;58;0;Create;True;0;0;0;False;0;False;1;0.06;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;383;529.5183,-1177.556;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3534;-2359.519,-1974.31;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-2393.099,-2664.835;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;2234;-2277.797,-3208.486;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1295;934.8981,-2058.38;Inherit;False;1534.433;513.8026;;15;450;331;330;329;326;805;462;461;327;808;970;328;1285;3260;3433;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;372;857.0088,-1341.957;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;3067;-1952.402,-3229.734;Inherit;False;Property;_SpecMatCapColor1;Specular Colour;52;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;2207;1231.715,1591.814;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1281;1044.922,-1347.85;Inherit;False;Property;_RimMode;Rim Mode;89;1;[Enum];Create;True;0;3;Blend_Lerp;0;Multiply;1;AddSubtract;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;388;853.2528,-957.2662;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;2181;676.4752,1125.57;Inherit;True;Property;_Matcap;Matcap (RGB,A);98;0;Create;False;0;0;0;False;0;False;None;f5303b4da8057574c84c7322a19702b7;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.Compare;3531;-2198.647,-2152.468;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0.001,0.001,0.001;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2002;-2484.226,-2737.914;Inherit;False;Property;_UseSpecularMatCap;Use Specular MatCap;55;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(. Specular Overlay);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3075;-2024.182,-2931.614;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;390;865.9427,-1149.693;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;3540;-2248.325,-2228.552;Inherit;False;Property;_UseCubemapOnly;Use Cubemap Only;69;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;2210;1190.533,1382.251;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;3080;-2033.752,-3005.016;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;3068;-1728.356,-3218.67;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2166;1521.727,1127.346;Inherit;False;Property;_Legacy;Legacy;105;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3433;949.9081,-1815.215;Inherit;False;0;328;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ConditionalIfNode;1284;1137.348,-1199.526;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;2301;-1946.688,-3070.491;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3182;-1826.453,-2091.534;Inherit;False;Property;_ReflectionOpacity;Reflection Opacity;67;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3103;-2341.64,-2375.624;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3539;-1992.661,-2193.299;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2176;1459.632,1425.147;Inherit;True;Property;_Matcap1;;90;0;Create;False;0;0;0;False;0;False;-1;None;ca5f4329374a4554eb5fcb2a1bbd66c2;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ConditionalIfNode;3492;-2229.355,-2731.948;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3081;-1810.252,-2995.216;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2175;1409.642,1217.535;Inherit;True;Property;_TextureSample0;Texture Sample 0;90;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3064;-1697.848,-3094.692;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3575;1647.996,-829.8877;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;3181;-1996.4,-2301.007;Inherit;False;Property;_UseReflection;Use Reflection;65;1;[ToggleUI];Create;False;0;0;0;False;2;Space(5);Header(. Reflection Probe);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3101;-2051.329,-2525.446;Inherit;False;Property;_SpecMatCapMode;SpecMatCap Mode;61;1;[Enum];Create;True;0;2;Additive;0;Multiplied;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1514;1678.067,-888.0831;Inherit;False;Property;_UseRim;Use Rim;87;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(.  Rim Fresnel  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3528;1735.017,1169.202;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;2919;1887.213,1376.165;Inherit;False;Property;_MatCapColor;MatCap Colour;104;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,0.3333333,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;3407;-1788.431,-2212.881;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3104;-2097.176,-2398.053;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3085;-1634.815,-2979.32;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;1650.314,-747.1198;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;328;950.3781,-2010.933;Inherit;True;Property;_Emission;Emission Map (RGB,A);32;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3069;-1489.356,-3024.67;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;20,20,20;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3435;-2395.137,-1785.426;Inherit;False;0;695;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;810;1936.337,1128.838;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3489;-1792.19,-2523.703;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3072;-1546.922,-3135.866;Inherit;False;Property;_SpecMode;Specular Mode;53;1;[Enum];Create;False;0;2;Additive;0;Multiplied;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1518;2095.787,1472.25;Float;False;Property;_MatcapSaturation;Matcap Saturation;102;0;Create;True;0;0;0;False;0;False;1;0.25;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3483;-1652.41,-2290.538;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3507;1890.983,-862.2957;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;2920;2079.877,1375.542;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;1234.353,-2010.766;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;3109;2186.933,1643.783;Inherit;True;Property;_MatCapMask;MatCap Mask (R,A);106;0;Create;False;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;408;1978.307,1246.997;Inherit;False;Property;_MatcapIntensity;Matcap Intensity;101;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3482;-1325.67,-3139.77;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1292;2059.22,-859.4677;Inherit;False;PostRimLight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;3264;2315.386,1832.009;Float;False;Property;_MatcapMaskLevel1;Mask Level;107;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3260;1428.058,-2005.44;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;824;-2017.182,-1876.499;Inherit;False;Property;_SpecMaskOpacity;SpecMatcap Level;63;0;Create;False;0;0;0;False;1;Space(10);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1998;2624.466,358.3426;Inherit;False;Property;_FriendsOnly;Friends Only ON/OFF;117;0;Create;False;0;0;0;False;3;Toggle(_);Space(20);Header(VRC Friends Only);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;695;-2092.311,-1806.691;Inherit;True;Property;_SpecularMask;Specular MatCap Mask (R,A);64;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;970;1281.338,-1891.897;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1517;2397.188,1474.188;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3137;2261.639,-150.317;Inherit;False;832.0293;300.472;MirrorSystem;6;3159;3142;3140;3429;3478;3498;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3266;2480.27,1673.178;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;2218.166,1227.171;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;-1487.367,-2317.862;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;-1798.994,-1795.835;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1279;2181.806,1118.502;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;2180;1825.78,1562.556;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3499;3181.238,572.9218;Inherit;False;Constant;_FriendsOnly_Null;FriendsOnly_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3490;-1634.094,-1902.093;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;461;1287.084,-1814.177;Inherit;False;Property;_ShadedEmission;Shaded Emission;35;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1516;2375.548,1257.198;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3142;2289.135,22.34352;Inherit;False;Property;_IsNotMirror;Not Mirror;125;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3140;2291.46,-59.49275;Inherit;False;Property;_IsInMirror;In Mirror;124;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3438;-1101.032,-2988.57;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3268;2637.791,1649.218;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3353;3011.123,358.4993;Inherit;False;FriendsOnlyToggle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;1536.839,-1909.799;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;406;2456.53,1572.698;Inherit;False;Property;_MatcapOpacity;Matcap Opacity;100;0;Create;True;0;0;0;False;0;False;5;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3352;3244.758,481.1561;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;1404.724,-1721.955;Float;False;Property;_EmissionColor;Emission Colour;33;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;870;-927.0864,-2296.078;Inherit;False;904.2734;277.1521;;5;3582;2003;3581;971;3473;Sparkle/Shimmer Effect;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;3159;2682.613,-102.2146;Inherit;False;Property;_MirrorSystem;Use Mirror System;123;1;[ToggleUI];Create;False;0;0;0;False;2;Space(10);Header(Mirror);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3437;-1407.915,-1899.26;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3582;-900.0991,-2176.602;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1278;2466.058,1099.732;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;3429;2570.505,-23.35453;Inherit;False;VRCMirrorToggle;-1;;387;906fee1dc8310a745a0658d5f2fa3fb4;0;2;5;INT;1;False;6;INT;1;False;1;INT;7
Node;AmplifyShaderEditor.ConditionalIfNode;3474;3425.813,363.3008;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3498;2703.011,76.12132;Inherit;False;Constant;_Camera_Null;Camera_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2264;1651.116,-603.5377;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;560;-1530.48,-1818.981;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;805;1638.281,-1723.259;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;450;1715.731,-1925.381;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;2570.741,1207.257;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;326;1632.677,-1634.122;Float;False;Property;_EmissionIntensity;Emission Intensity;34;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;807;2792.138,1475.301;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;405;2731.199,1149.914;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;330;1886.509,-1626.47;Float;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3251;-1379.197,-1869.999;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;2291;1834.352,-598.7445;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2003;-690.2162,-2243.056;Inherit;False;Property;_UseSparkleShimmer;Use Sparkle/Shimmer;70;1;[ToggleUI];Create;True;0;0;0;False;3;Space(5);Header(.  Sparkles  .);;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2993;-1365.439,-740.748;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;1899.234,-1766.029;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3147;3589.668,297.439;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3581;-684.1625,-2170.655;Inherit;False;Aria Sparkles Include;71;;392;fe78986b6250d1d46955dfaed2c4e629;0;1;97;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;3478;2916.37,-71.03625;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;INT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1274;2929.248,1145.099;Inherit;False;PostMatcap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;-1167.354,-741.6555;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3144;3182.924,-73.7593;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;331;2080.128,-1725.067;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3473;-434.2063,-2239.654;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;-1261.065,-1875.78;Inherit;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2287;2000.972,-603.599;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2163;2152.229,-932.084;Inherit;False;1274;PostMatcap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3252;2240.06,-623.5621;Inherit;False;2;2;0;FLOAT3;0.05,0.05,0.05;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;971;-252.5286,-2239.319;Inherit;False;SparkleOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;2001.217,-508.7396;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3146;3323.789,-102.5296;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;2304.434,-335.2882;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;2234.397,-1723.081;Inherit;False;Emission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1021;2188.035,-1013.522;Inherit;False;Property;_UseMatcap;Use Matcap;97;1;[ToggleUI];Create;True;0;0;0;False;2;Space(10);Header(.  MatCap  .);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;334;2207.65,-410.3355;Inherit;False;Property;_Alpha;Alpha;10;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3145;3059.669,-310.6737;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1702;2419.217,-495.7396;Inherit;False;971;SparkleOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2284;2377.972,-600.599;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3477;2401.127,-967.5283;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;2525.688,-317.4168;Inherit;False;Property;_AlphaCutoff;Alpha Cutoff;11;0;Create;False;0;0;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1294;2423.846,-690.4126;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;2516.751,-417.5501;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClipNode;1430;3137.46,-463.9726;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2807.245,-579.6193;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1346;2859.333,-1342.923;Inherit;False;670.9946;746.3742;custom properties;13;1345;1335;1344;1342;1431;1340;1339;1337;1432;1343;1338;1341;1469;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-4029.873,-266.3261;Inherit;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1343;3201.625,-1061.015;Inherit;False;Property;_StencilZFail;StencilZFail;134;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;3098;3608.803,-1048.708;Inherit;False;Property;_VRCFallbackDoublesided;VRC Fallback Doublesided;2;0;Create;True;0;0;0;True;2;Toggle(TINTED_OUTLINE);Space(10);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1469;2892.559,-694.9409;Inherit;False;Property;_AlphaToCoverage;AlphaToCoverage (override alpha);9;1;[ToggleUI];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1560;-4223.124,45.83719;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.005;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1342;3202.625,-1136.015;Inherit;False;Property;_StencilFail;StencilFail;133;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;2876.299,-1194.834;Half;False;Property;_ReadMask;ReadMask (non-zero);130;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;2886.308,-1002.382;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);126;1;[ToggleUI];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1335;3215.875,-918.9951;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;2882.479,-1280.823;Half;False;Property;_StencilRef;Stencil ID;128;0;Create;False;0;0;0;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;2875.299,-1112.257;Half;False;Property;_WriteMask;WriteMask (non-zero);129;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-4073.304,-680.0932;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3099;3610.803,-975.708;Inherit;False;Property;_outline_width;_outline_width;1;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3578;858.4009,-128.0061;Inherit;False;Aria Parallax Include;108;;406;972a5d25f3151a4479be2dcc9b9e75fa;0;1;44;SAMPLER2D;_Sampler443578;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3151.765,-825.441;Inherit;False;Property;_DstBlend;Destination Blend (Zero);136;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1344;2882.237,-914.3182;Float;False;Property;_ZTestMode;ZTestMode (LEqual);127;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldReflectionVector;3537;-3100.668,-1955.762;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;3536;-3331.667,-1967.762;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1341;3206.338,-1208.357;Inherit;False;Property;_StencilOp;StencilOp;132;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1340;3181.625,-1281.015;Inherit;False;Property;_StencilComparison;Stencil Comparison;131;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;3269;3610.792,-886.0767;Inherit;False;Property;_Cutoff;Fallback Cutoff;3;1;[Enum];Create;False;0;2;Visible;0;Invisible;2;0;True;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1923;3354.73,-577.434;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1431;2886.58,-820.4198;Inherit;False;Property;_SrcBlend;Source Blend (One);135;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1924;3771.631,-578.6443;Float;False;True;-1;2;ASEMaterialInspector;0;1;.GenesisAria/Arias VertexLit Shader WIP;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;VertexLit;2;False;True;1;1;True;1431;0;True;1432;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;True;1469;False;True;0;True;1335;True;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;True;255;True;1337;255;True;1338;255;True;1339;7;True;1340;1;True;1341;1;True;1342;1;True;1343;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;1345;True;3;True;1344;True;False;0;False;-1;0;False;-1;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;7;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;Legacy Shaders/Transparent/Cutout/VertexLit;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;3458;0;3510;0
WireConnection;3458;2;3464;0
WireConnection;1878;0;3408;16
WireConnection;1878;1;3408;17
WireConnection;1878;2;3408;18
WireConnection;1878;3;3408;20
WireConnection;3495;0;3464;0
WireConnection;3495;2;3458;0
WireConnection;3495;3;3458;0
WireConnection;3495;4;3527;0
WireConnection;1551;0;1878;0
WireConnection;3459;0;3495;0
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;1886;0;3408;23
WireConnection;1886;1;3408;29
WireConnection;1886;2;3408;30
WireConnection;1886;3;3408;31
WireConnection;1891;0;1551;3
WireConnection;2014;0;1886;0
WireConnection;1890;0;1589;0
WireConnection;1879;0;2014;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;3451;0;3460;0
WireConnection;3451;1;603;0
WireConnection;3442;0;428;0
WireConnection;3442;1;3461;0
WireConnection;2148;0;2147;0
WireConnection;3012;0;3451;0
WireConnection;3014;0;3442;0
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;3013;0;3442;0
WireConnection;1246;0;1232;2
WireConnection;1246;1;2148;0
WireConnection;3049;4;3432;0
WireConnection;3049;1;2957;0
WireConnection;3049;49;3012;0
WireConnection;2958;0;2957;0
WireConnection;2958;1;3432;0
WireConnection;2958;5;3014;0
WireConnection;3062;0;3059;1
WireConnection;1665;0;1905;0
WireConnection;3061;0;3062;0
WireConnection;3061;1;3013;0
WireConnection;3494;0;2962;0
WireConnection;3494;3;3049;0
WireConnection;3494;4;2958;0
WireConnection;1630;0;3408;17
WireConnection;1630;1;3408;29
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;1631;0;3408;18
WireConnection;1631;1;3408;30
WireConnection;1684;0;3408;20
WireConnection;1684;1;3408;31
WireConnection;2154;0;2153;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;1629;0;3408;16
WireConnection;1629;1;3408;23
WireConnection;1876;0;633;1
WireConnection;1876;1;633;2
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;3496;0;2152;0
WireConnection;3496;3;2154;0
WireConnection;3496;4;2150;0
WireConnection;2635;0;248;0
WireConnection;2635;1;3511;2
WireConnection;1233;0;1247;0
WireConnection;2144;0;2121;0
WireConnection;430;1;3494;0
WireConnection;430;2;3061;0
WireConnection;1235;0;430;0
WireConnection;2159;0;3496;0
WireConnection;2140;0;2121;0
WireConnection;2140;1;1490;0
WireConnection;2140;2;2144;0
WireConnection;2017;0;3408;0
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;2635;0
WireConnection;1683;0;1682;0
WireConnection;2034;0;2140;0
WireConnection;1383;0;2017;0
WireConnection;1383;1;2159;0
WireConnection;962;0;1235;0
WireConnection;1908;1;1910;0
WireConnection;1908;0;1683;0
WireConnection;2215;0;1076;0
WireConnection;1406;0;1908;0
WireConnection;3414;0;2215;0
WireConnection;3414;1;3415;7
WireConnection;2026;0;2034;0
WireConnection;1382;0;1383;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;2082;0;2081;2
WireConnection;2035;1;2026;0
WireConnection;5;0;1165;0
WireConnection;5;1;3414;0
WireConnection;1486;0;1484;1
WireConnection;1486;1;1484;2
WireConnection;1486;2;2082;0
WireConnection;1389;0;1381;0
WireConnection;2025;0;2035;0
WireConnection;3314;0;1408;0
WireConnection;3169;0;3416;0
WireConnection;1296;0;5;0
WireConnection;1489;0;1486;0
WireConnection;1489;1;3314;0
WireConnection;1489;2;3169;0
WireConnection;2033;0;2025;0
WireConnection;1994;0;1480;0
WireConnection;1994;1;1297;0
WireConnection;1994;2;2033;0
WireConnection;1424;0;349;1
WireConnection;1424;1;349;2
WireConnection;1424;2;349;3
WireConnection;2867;0;1489;0
WireConnection;2867;1;2870;0
WireConnection;3331;0;2867;0
WireConnection;3331;1;1916;0
WireConnection;3497;0;1058;0
WireConnection;3497;3;1994;0
WireConnection;3497;4;3500;0
WireConnection;2211;1;3434;0
WireConnection;3336;0;1424;0
WireConnection;1491;0;1382;0
WireConnection;3325;7;3331;0
WireConnection;3335;0;3336;0
WireConnection;3262;1;2211;1
WireConnection;3262;2;3263;0
WireConnection;1106;0;3497;0
WireConnection;1106;1;1107;0
WireConnection;1425;0;3335;0
WireConnection;3301;0;1915;0
WireConnection;3301;1;3325;0
WireConnection;1118;0;149;0
WireConnection;1118;1;1106;0
WireConnection;1118;2;3262;0
WireConnection;3332;0;3301;0
WireConnection;3332;1;3331;0
WireConnection;2213;0;2217;0
WireConnection;2213;1;2216;0
WireConnection;2213;2;2033;0
WireConnection;3289;0;1123;0
WireConnection;351;0;1425;0
WireConnection;1254;0;1118;0
WireConnection;2218;0;2213;0
WireConnection;3288;0;1123;0
WireConnection;3288;1;3289;0
WireConnection;1125;0;1254;0
WireConnection;1125;1;1254;0
WireConnection;627;0;351;0
WireConnection;1914;0;3331;0
WireConnection;1914;2;3332;0
WireConnection;3270;0;1914;0
WireConnection;32;1;1125;0
WireConnection;1032;0;1008;0
WireConnection;3506;0;1999;0
WireConnection;3506;3;627;0
WireConnection;3506;4;351;0
WireConnection;662;0;3288;0
WireConnection;662;2;641;0
WireConnection;662;3;642;0
WireConnection;645;0;3288;0
WireConnection;645;4;1492;0
WireConnection;645;2;641;0
WireConnection;645;3;642;0
WireConnection;1010;0;1008;0
WireConnection;1033;0;1032;0
WireConnection;1033;1;32;0
WireConnection;3282;0;662;0
WireConnection;3333;0;3506;0
WireConnection;3291;0;3282;0
WireConnection;815;0;1033;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;3281;0;645;0
WireConnection;3273;0;3271;0
WireConnection;2984;0;2982;0
WireConnection;2984;1;3430;0
WireConnection;3467;4;3431;0
WireConnection;3467;1;3343;0
WireConnection;811;0;646;0
WireConnection;3345;0;3343;0
WireConnection;3345;1;3431;0
WireConnection;2997;4;3430;0
WireConnection;2997;1;2982;0
WireConnection;679;0;811;0
WireConnection;3552;7;1914;0
WireConnection;3501;0;1025;0
WireConnection;3501;3;1016;0
WireConnection;3501;4;815;0
WireConnection;3476;0;2988;0
WireConnection;3476;3;2997;0
WireConnection;3476;4;2984;0
WireConnection;3348;0;3340;0
WireConnection;3348;1;3338;0
WireConnection;3290;0;3281;0
WireConnection;3290;2;3291;0
WireConnection;680;0;3273;0
WireConnection;3475;0;3466;0
WireConnection;3475;3;3467;0
WireConnection;3475;4;3345;0
WireConnection;3287;0;3290;0
WireConnection;3504;0;3348;0
WireConnection;3504;3;3475;0
WireConnection;3504;4;3476;0
WireConnection;979;0;3501;0
WireConnection;3502;0;1035;0
WireConnection;3502;3;680;0
WireConnection;3502;4;679;0
WireConnection;3554;0;3552;0
WireConnection;1470;0;1106;0
WireConnection;3326;7;1914;0
WireConnection;3557;0;3554;0
WireConnection;2093;0;3326;0
WireConnection;813;0;18;0
WireConnection;812;0;3504;0
WireConnection;344;0;1470;0
WireConnection;344;1;335;0
WireConnection;3283;0;3502;0
WireConnection;669;1;3287;0
WireConnection;669;2;684;0
WireConnection;3564;0;2093;0
WireConnection;3285;0;3283;0
WireConnection;3285;2;669;0
WireConnection;3558;0;3557;0
WireConnection;3558;1;3120;0
WireConnection;3011;0;3451;0
WireConnection;19;0;812;0
WireConnection;19;1;813;0
WireConnection;3255;0;3253;0
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;3060;0;3059;1
WireConnection;3060;1;3011;0
WireConnection;2909;0;19;0
WireConnection;3503;0;2976;0
WireConnection;3503;3;3285;0
WireConnection;3503;4;954;0
WireConnection;30;0;346;0
WireConnection;3553;0;3564;0
WireConnection;3553;1;3558;0
WireConnection;3566;0;3255;0
WireConnection;2911;0;2910;0
WireConnection;2911;1;2909;1
WireConnection;1500;0;30;0
WireConnection;1500;1;3503;0
WireConnection;3551;0;3553;0
WireConnection;3551;1;3566;0
WireConnection;602;1;3494;0
WireConnection;602;2;3060;0
WireConnection;2908;0;2911;0
WireConnection;2908;1;2909;2
WireConnection;2908;2;2909;3
WireConnection;1234;0;602;0
WireConnection;3244;0;1330;0
WireConnection;1777;0;1914;0
WireConnection;1777;1;3551;0
WireConnection;2289;0;1500;0
WireConnection;2918;0;325;0
WireConnection;3249;0;585;0
WireConnection;3493;0;2225;0
WireConnection;3493;3;3512;2
WireConnection;3493;4;1909;0
WireConnection;3576;0;3059;1
WireConnection;3241;0;3244;0
WireConnection;3241;1;3249;0
WireConnection;3055;0;1234;0
WireConnection;2917;0;2908;0
WireConnection;2917;1;2918;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;2289;0
WireConnection;2237;0;3493;0
WireConnection;2237;1;2219;0
WireConnection;968;0;1922;0
WireConnection;581;0;2917;0
WireConnection;581;1;3241;0
WireConnection;3087;0;3088;0
WireConnection;3087;1;3462;0
WireConnection;3087;2;3576;0
WireConnection;965;0;3055;0
WireConnection;3574;0;3569;0
WireConnection;2236;1;546;0
WireConnection;1783;0;2237;0
WireConnection;1536;0;1537;0
WireConnection;1536;1;1530;0
WireConnection;1536;2;1534;0
WireConnection;3086;1;3494;0
WireConnection;3086;2;3087;0
WireConnection;3074;0;581;0
WireConnection;3568;0;3574;0
WireConnection;3568;3;3574;0
WireConnection;3568;4;968;0
WireConnection;3520;21;967;0
WireConnection;3520;27;1928;0
WireConnection;3090;0;3086;0
WireConnection;3521;9;2898;0
WireConnection;3521;45;1928;0
WireConnection;553;0;2236;0
WireConnection;3505;0;1533;0
WireConnection;3505;3;1536;0
WireConnection;3505;4;1537;0
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;3077;0;3074;0
WireConnection;3077;1;3568;0
WireConnection;2900;0;2899;0
WireConnection;2900;1;3521;0
WireConnection;3542;0;3543;2
WireConnection;3091;0;3090;0
WireConnection;1918;0;3077;0
WireConnection;2902;0;2899;0
WireConnection;2902;1;3520;0
WireConnection;360;0;3505;0
WireConnection;360;2;369;0
WireConnection;360;3;368;0
WireConnection;556;1;555;0
WireConnection;545;0;551;0
WireConnection;545;1;553;0
WireConnection;3056;0;561;0
WireConnection;3491;0;2905;0
WireConnection;3491;3;2900;0
WireConnection;3491;4;2902;0
WireConnection;3089;0;3091;0
WireConnection;554;0;545;0
WireConnection;554;1;556;0
WireConnection;379;0;360;0
WireConnection;379;1;2299;0
WireConnection;379;2;2300;0
WireConnection;3538;0;3535;0
WireConnection;3538;1;3542;0
WireConnection;1276;0;1918;0
WireConnection;2294;0;554;0
WireConnection;1921;0;1919;0
WireConnection;3533;0;3538;0
WireConnection;3057;0;3056;0
WireConnection;382;0;376;0
WireConnection;382;1;379;0
WireConnection;817;0;3491;0
WireConnection;2208;0;2209;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;3524;9;2873;0
WireConnection;3524;45;1930;0
WireConnection;3523;21;963;0
WireConnection;3523;27;1930;0
WireConnection;838;0;837;0
WireConnection;816;1;2294;0
WireConnection;816;2;3057;0
WireConnection;3174;0;3177;0
WireConnection;3174;1;3179;0
WireConnection;370;0;382;0
WireConnection;370;1;1290;0
WireConnection;383;0;379;0
WireConnection;383;1;384;0
WireConnection;3534;0;3533;0
WireConnection;3534;1;3538;4
WireConnection;690;0;1920;0
WireConnection;690;1;691;0
WireConnection;690;2;838;0
WireConnection;2234;0;816;0
WireConnection;2234;1;816;0
WireConnection;2234;2;816;0
WireConnection;372;0;1291;0
WireConnection;372;1;382;0
WireConnection;372;2;383;0
WireConnection;2207;0;3523;0
WireConnection;2207;2;2208;0
WireConnection;388;0;1290;0
WireConnection;388;1;370;0
WireConnection;388;2;384;0
WireConnection;3531;0;3174;0
WireConnection;3531;2;3534;0
WireConnection;3531;3;3174;0
WireConnection;390;0;1291;0
WireConnection;390;1;382;0
WireConnection;390;2;383;0
WireConnection;2210;0;3524;0
WireConnection;2210;2;2208;0
WireConnection;3080;0;3079;0
WireConnection;3068;0;3067;0
WireConnection;1284;0;1281;0
WireConnection;1284;2;388;0
WireConnection;1284;3;390;0
WireConnection;1284;4;372;0
WireConnection;2301;0;2234;0
WireConnection;3539;0;3540;0
WireConnection;3539;3;3534;0
WireConnection;3539;4;3531;0
WireConnection;2176;0;2181;0
WireConnection;2176;1;2207;0
WireConnection;3492;0;2002;0
WireConnection;3492;3;690;0
WireConnection;3081;0;3080;0
WireConnection;3081;1;3075;0
WireConnection;2175;0;2181;0
WireConnection;2175;1;2210;0
WireConnection;3064;0;3068;0
WireConnection;3064;1;2301;0
WireConnection;3575;0;1284;0
WireConnection;3528;0;2166;0
WireConnection;3528;3;2175;0
WireConnection;3528;4;2176;0
WireConnection;3407;1;3539;0
WireConnection;3407;2;3182;0
WireConnection;3104;0;3492;0
WireConnection;3104;1;3103;0
WireConnection;3085;0;3081;0
WireConnection;3085;1;3075;0
WireConnection;328;1;3433;0
WireConnection;3069;0;3064;0
WireConnection;3069;1;3085;0
WireConnection;810;0;3528;0
WireConnection;3489;0;3101;0
WireConnection;3489;3;3104;0
WireConnection;3489;4;3492;0
WireConnection;3483;0;3181;0
WireConnection;3483;3;3407;0
WireConnection;3507;0;1514;0
WireConnection;3507;3;3575;0
WireConnection;3507;4;1515;0
WireConnection;2920;0;2919;0
WireConnection;808;0;328;0
WireConnection;3482;0;3072;0
WireConnection;3482;3;3069;0
WireConnection;3482;4;3064;0
WireConnection;1292;0;3507;0
WireConnection;3260;0;808;0
WireConnection;3260;1;328;4
WireConnection;695;1;3435;0
WireConnection;1517;0;1518;0
WireConnection;3266;0;3109;1
WireConnection;3266;1;3109;4
WireConnection;407;0;810;0
WireConnection;407;1;408;0
WireConnection;407;2;2920;0
WireConnection;701;0;3489;0
WireConnection;701;1;3483;0
WireConnection;696;0;824;0
WireConnection;696;1;695;1
WireConnection;2180;0;3528;0
WireConnection;3490;0;701;0
WireConnection;1516;0;407;0
WireConnection;1516;1;1517;0
WireConnection;3438;0;3482;0
WireConnection;3268;1;3266;0
WireConnection;3268;2;3264;0
WireConnection;3353;0;1998;0
WireConnection;462;0;3260;0
WireConnection;462;1;970;0
WireConnection;3352;0;3333;0
WireConnection;3437;0;3438;0
WireConnection;3429;5;3140;0
WireConnection;3429;6;3142;0
WireConnection;3474;0;3353;0
WireConnection;3474;3;3352;0
WireConnection;3474;4;3499;0
WireConnection;560;1;3490;0
WireConnection;560;2;696;0
WireConnection;805;0;327;0
WireConnection;450;0;3260;0
WireConnection;450;1;462;0
WireConnection;450;2;461;0
WireConnection;414;0;1279;0
WireConnection;414;1;1516;0
WireConnection;807;0;2180;0
WireConnection;807;1;406;0
WireConnection;807;2;3268;0
WireConnection;405;0;1278;0
WireConnection;405;1;414;0
WireConnection;405;2;807;0
WireConnection;3251;0;3437;0
WireConnection;3251;1;560;0
WireConnection;2291;0;2264;0
WireConnection;2993;0;3504;0
WireConnection;329;0;450;0
WireConnection;329;1;805;0
WireConnection;329;2;326;0
WireConnection;3147;0;3474;0
WireConnection;3581;97;3582;0
WireConnection;3478;0;3159;0
WireConnection;3478;2;3498;0
WireConnection;3478;3;3429;7
WireConnection;3478;4;3498;0
WireConnection;1274;0;405;0
WireConnection;1262;0;2993;0
WireConnection;3144;0;3478;0
WireConnection;3144;1;3147;0
WireConnection;331;0;329;0
WireConnection;331;2;330;0
WireConnection;3473;0;2003;0
WireConnection;3473;3;3581;0
WireConnection;983;0;3251;0
WireConnection;2287;0;2291;0
WireConnection;3252;1;2287;0
WireConnection;971;0;3473;0
WireConnection;3146;0;3144;0
WireConnection;1285;0;331;0
WireConnection;3145;0;3146;0
WireConnection;2284;0;3252;0
WireConnection;2284;1;1701;0
WireConnection;3477;0;1021;0
WireConnection;3477;3;2163;0
WireConnection;3477;4;1292;0
WireConnection;333;0;334;0
WireConnection;333;1;1265;0
WireConnection;1430;0;333;0
WireConnection;1430;1;3145;0
WireConnection;1430;2;1433;0
WireConnection;470;0;3477;0
WireConnection;470;1;1294;0
WireConnection;470;2;2284;0
WireConnection;470;3;1702;0
WireConnection;1861;0;430;0
WireConnection;1560;2;1480;0
WireConnection;1560;3;1297;0
WireConnection;1856;0;602;0
WireConnection;3537;0;3536;0
WireConnection;1923;0;470;0
WireConnection;1923;3;1430;0
WireConnection;1924;0;1923;0
ASEEND*/
//CHKSM=01530CDD33F560FA7366DDAFF0572A84CC557240
