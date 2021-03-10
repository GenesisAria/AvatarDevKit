// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Arias Toon Shader WIP"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[HideInInspector]_outline_width("_outline_width", Float) = 0
		[Toggle(TINTED_OUTLINE)]_VRCFallbackDoublesided("VRC Fallback Doublesided", Float) = 0
		[Header(.  Main  .)]_MainTex("Texture", 2D) = "white" {}
		[Toggle(_)]_TexSuperSample("SuperSample (expensive)", Float) = 0
		[HDR]_Color("> Color", Color) = (1,1,1,1)
		_Hue("Hue", Range( 0 , 1)) = 0
		_Saturation("Saturation", Range( -2 , 5)) = 1
		[ToggleUI][Space (5)]_AlphaToCoverage("AlphaToCoverage (override alpha)", Float) = 0
		_Alpha("Alpha", Range( 0 , 1)) = 1
		_Cutoff("Alpha Cutoff", Float) = 0
		_LightMultiplier("Light Multiplier", Float) = 1.1
		_MaxLight("Max Light", Float) = 0.9
		_MinLight("Min Light", Float) = 0.9
		_LightSatLimiter("Light Saturation Limiter", Float) = 0.5
		[Space(5)][Header(.  Shadow  .)][Toggle(_)]_UseShading("Use Shading", Float) = 1
		[Enum(Surface,0,Object2World,1)]_LightMode("Lighting Mode", Float) = 0
		[Enum(Ramp_Texture,0,Linear_Gradient,1)]_GradientorRamp("Gradient or Ramp", Float) = 1
		_ShadowColour("Shadow Colour", Color) = (0.7098039,0.7098039,0.7098039,1)
		_Ramp("Ramp", 2D) = "white" {}
		_OffsetDot("Offset Dot", Range( -1 , 1)) = 0
		_ShadowSharpness1("Shadow Sharpness", Float) = 1
		_ShadowDarkness("Shadow Darkness", Float) = 0.22
		_ShadowSaturation("Shadow Saturation", Range( -2 , 2)) = 0.85
		_LightMask("Light Mask", 2D) = "white" {}
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.68
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.55
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.44
		[Space(5)][Header(.  Emission  .)]_Emission("Emission Map", 2D) = "black" {}
		[HDR]_EmissionColor("Emission Colour", Color) = (0,0,0,0)
		_EmissionIntensity("Emission Intensity", Float) = 1
		_ShadedEmission("Shaded Emission", Float) = 0
		[Normal][Space(5)][Header(.  Normal  .)]_Normal("Normal", 2D) = "bump" {}
		[Toggle(_)]_NormSuperSample("SuperSample (expensive)", Float) = 0
		_NormalPower("Normal Power", Range( 0 , 2)) = 0
		_NormalPowerSpecular("Normal Power Specular", Range( 0 , 2)) = 0.5
		_NormalPowerMatCap("Normal Power MatCap", Range( 0 , 2)) = 0.5
		_NormalMask("Normal Mask", 2D) = "white" {}
		[Toggle(_)][Header(.  Soft Shading  .)]_ShadeEnable("Shade Enable", Float) = 1
		[Enum(FixedColour,0,LightColour,1)]_ShadeColorDynamic("ShadeColor Dynamic", Float) = 1
		_ShadeColour("Shade Colour", Color) = (0,0,0,0)
		_ShadePower("Shade Power", Range( 0 , 2)) = 0.5
		_ShadeScale("Shade Scale", Range( 2 , 200)) = 100
		_MultiplyDynamic("MultiplyDynamic", Range( 0 , 1)) = 0.75
		[Space(5)][Header(.  Specular  .)]_SpecularOpacity("Specular Opacity", Range( 0 , 1)) = 1
		_SpecularSize("Specular Size", Range( 0 , 10)) = 1
		_SpecularStrength("Specular Strength", Float) = 0
		[HDR]_SpecMatCapColor1("Specular Colour", Color) = (1,1,1,1)
		[Enum(Additive,0,Multiplied,1)]_SpecularMode("Specular Mode", Float) = 1
		[Toggle(_)]_StereoFixSpec("Stereo Converge (flatten)", Float) = 0
		[Toggle(_)][Space(5)][Header(. Specular Overlay)]_UseSpecularMatCap("Use Specular MatCap", Float) = 0
		_SpecularMatcap("Specular Matcap", 2D) = "black" {}
		[Toggle(_)]_StereoFixSpecCap("Stereo Converge (flatten)", Float) = 0
		_SpecMatcapMultiply("SpecMatcap Multiply", Float) = 1
		_SpecMatcapSaturation("SpecMatcap Saturation", Float) = 1
		[HDR]_SpecMatCapColor("SpecMatCap Colour", Color) = (1,1,1,1)
		[Enum(Additive,0,Multiplied,1)]_SpecMatCapMode("SpecMatCap Mode", Float) = 0
		[Toggle(_)]_Legacy2("Legacy", Float) = 0
		[Space(10)]_SpecularMask("Specular Mask", 2D) = "white" {}
		_SpecMaskOpacity("SpecMatCap Opacity", Float) = 1
		[Toggle(_)][Space(5)][Header(.  Sparkles  .)]_UseSparkleShimmer("Use Sparkle/Shimmer", Float) = 0
		[HDR]_SparkleColor1("Color", Color) = (1,1,1,0)
		_SparklePattern("Sparkle Pattern", 2D) = "black" {}
		[Toggle(_)]_SparkleSuperSample("SuperSample (expensive)", Float) = 0
		_SparkleTexColour("SparkleTex Saturation", Range( 0 , 2)) = 0
		_Threshold("Threshold", Range( 0 , 1)) = 0
		_Range("Range", Range( 0.05 , 1)) = 0.3
		_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.3
		[Toggle(_)]_StereoCorrect("Stereo Correct", Float) = 1
		_WorldPosContribution("WorldPos Contribution", Range( 0 , 1)) = 0.3
		[Enum(Linear,0,Circular,1)][Space(5)]_MotionType("Motion Type", Float) = 1
		_MotionSpeed("Motion Speed", Float) = 0
		_RotateLinear("Rotate Linear", Range( 0 , 1)) = 0
		_MotionIntensity("Motion Intensity", Float) = 0.01
		[Space(5)]_SparkleMask1("Sparkle Mask", 2D) = "white" {}
		_SparkleFresnel1("Fresnel Bias, Scale, Power", Vector) = (0,10,0.1,0)
		[Toggle(_)][Header(.  Rim Fresnel  .)]_UseRim("Use Rim", Float) = 0
		_RimOutlineColour("Rim/Outline Colour", Color) = (0,0,0,0)
		[Enum(Blend_Lerp,0,Multiply,1,AddSubtract,2)]_RimMode("Rim Mode", Float) = 0
		_Amount("Rim Opacity", Float) = 0
		_Power("Rim Power", Float) = 0
		_Scale("Rim Scale", Float) = 0
		_Min("Rim Min", Float) = 0
		_Max("Rim Max", Float) = 0
		[Toggle][Toggle(_)]_RimNormal("Rim Normal", Float) = 0
		_Scale1("Rim Normal Power", Range( 0 , 1)) = 0
		[Toggle(_)][Space(10)][Header(.  MatCap  .)]_UseMatcap("Use Matcap", Float) = 0
		_Matcap("Matcap (Alpha Supported)", 2D) = "black" {}
		[Toggle(_)]_StereoFix("Stereo Converge (flatten)", Float) = 0
		_MatcapOpacity("Matcap Opacity", Range( 0 , 1)) = 5
		_MatcapIntensity("Matcap Intensity", Float) = 0
		_MatcapSaturation("Matcap Saturation", Range( -1 , 5)) = 1
		_MatcapSpin("MatcapSpin", Float) = 0
		[HDR]_MatCapColor("MatCap Colour", Color) = (1,1,1,1)
		[Toggle(_)]_Legacy("Legacy", Float) = 0
		[Space(10)]_MatCapMask("MatCap Mask", 2D) = "white" {}
		[Toggle(_)][Space(20)][Header(VRC Friends Only)]_FriendsOnly("Friends Only ON/OFF", Float) = 0
		_FriendsOnlyRT("> FriendsOnly RenderTexture", 2D) = "white" {}
		[Toggle(_)]_FriendsOnly1("Invert Friends Only", Float) = 0
		[Toggle(_)][Space(10)][Header(Mirror)]_MirrorSystem("Use Mirror System", Float) = 0
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
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		AlphaToMask [_AlphaToCoverage]
		Cull [_Culling]
		ColorMask RGB
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
			#include "UnityStandardUtils.cginc"
			#include "Lighting.cginc"
			#include "UnityShaderVariables.cginc"
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

			uniform float _ZWriteMode;
			uniform float _AlphaToCoverage;
			uniform int _StencilOp;
			uniform half _WriteMask;
			uniform float _outline_width;
			uniform int _StencilZFail;
			uniform int _StencilComparison;
			uniform float _ZTestMode;
			uniform half _ReadMask;
			uniform float _DstBlend;
			uniform int _Culling;
			uniform half _StencilRef;
			uniform float _SrcBlend;
			uniform int _StencilFail;
			uniform float _VRCFallbackDoublesided;
			uniform float _UseMatcap;
			uniform float _UseRim;
			uniform float _RimMode;
			uniform float _Hue;
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
			uniform float _NormalPowerSpecular;
			uniform float4 _Normal_ST;
			uniform float _NormalPower;
			uniform sampler2D _NormalMask;
			uniform float4 _NormalMask_ST;
			uniform float _StaticLightX;
			uniform float _StaticLightY;
			uniform float _StaticLightZ;
			uniform float _LightMode;
			uniform float _OffsetDot;
			uniform sampler2D _LightMask;
			uniform float4 _LightMask_ST;
			uniform sampler2D _Ramp;
			uniform float _ShadowSaturation;
			uniform float _MinLight;
			uniform float _MaxLight;
			uniform float _LightMultiplier;
			uniform float _LightSatLimiter;
			uniform float _ShadowDarkness;
			uniform float _ShadeEnable;
			uniform float _ShadeColorDynamic;
			uniform float _MultiplyDynamic;
			uniform float4 _ShadeColour;
			uniform float _ShadeScale;
			uniform float _ShadePower;
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
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;
			uniform float _ShadedEmission;
			uniform float4 _EmissionColor;
			uniform float _EmissionIntensity;
			uniform float _SpecularMode;
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
			uniform sampler2D _SpecularMask;
			uniform float4 _SpecularMask_ST;
			uniform float _SpecMaskOpacity;
			uniform float _UseSparkleShimmer;
			uniform sampler2D _SparkleMask1;
			uniform float4 _SparkleMask1_ST;
			uniform float4 _SparkleColor1;
			uniform float _Threshold;
			uniform float _Range;
			uniform float _SparkleSuperSample;
			uniform sampler2D _SparklePattern;
			uniform float4 _SparklePattern_ST;
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
			uniform float _FriendsOnly1;
			uniform sampler2D _FriendsOnlyRT;
			uniform float4 _FriendsOnlyRT_ST;
			uniform float _Cutoff;
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
			
			float3 CenterEye1_g146(  )
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
			
			float4 VertexLightPosX3_g69(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g69(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g69(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g69(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol114_g69(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightCol215_g69(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g69(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g69(  )
			{
				return unity_LightColor[3];
			}
			
			float3 unity_SHArgb3_g147(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			
			float3 CenterEye46_g165(  )
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
			
			float3 CenterEye16_g166(  )
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
			
			float3 CenterEye1_g149(  )
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
			
			float3 CenterEye46_g163(  )
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
			
			float3 CenterEye16_g162(  )
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
			
			float3 CenterEye72_g164(  )
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
			
			float3 CenterEye1_g167(  )
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
			
			int isCamera1_g191(  )
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
				sampler2D texvalue34_g148 = _MainTex;
				float2 temp_output_4_0_g148 = i.ase_texcoord1.xy;
				half2 uvin34_g148 = temp_output_4_0_g148;
				half2 dx34_g148 = ( ddx( temp_output_4_0_g148 ) * float2( 0.25,0.25 ) );
				half2 dy34_g148 = ( ddy( temp_output_4_0_g148 ) * float2( 0.25,0.25 ) );
				half bias34_g148 = 0.0;
				half4 localsupersample2x234_g148 = supersample2x2( texvalue34_g148 , uvin34_g148 , dx34_g148 , dy34_g148 , bias34_g148 );
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 temp_output_2987_0 = ( _TexSuperSample == 1.0 ? localsupersample2x234_g148 : tex2D( _MainTex, uv_MainTex ) );
				float3 hsvTorgb2909 = RGBToHSV( ( (temp_output_2987_0).xyz * (_Color).rgb ) );
				float3 hsvTorgb2908 = HSVToRGB( float3(( _Hue + hsvTorgb2909.x ),hsvTorgb2909.y,hsvTorgb2909.z) );
				float3 desaturateInitialColor2917 = hsvTorgb2908;
				float desaturateDot2917 = dot( desaturateInitialColor2917, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2917 = lerp( desaturateInitialColor2917, desaturateDot2917.xxx, ( 1.0 - _Saturation ) );
				sampler2D texvalue34_g145 = _Normal;
				float2 temp_output_4_0_g145 = i.ase_texcoord1.xy;
				half2 uvin34_g145 = temp_output_4_0_g145;
				half2 dx34_g145 = ( ddx( temp_output_4_0_g145 ) * float2( 0.25,0.25 ) );
				half2 dy34_g145 = ( ddy( temp_output_4_0_g145 ) * float2( 0.25,0.25 ) );
				half bias34_g145 = 0.0;
				half4 localsupersample2x234_g145 = supersample2x2( texvalue34_g145 , uvin34_g145 , dx34_g145 , dy34_g145 , bias34_g145 );
				float clampResult3012 = clamp( _NormalPowerSpecular , 1.0 , 2.0 );
				float3 localUnpackNormal47_g145 = UnpackScaleNormal( localsupersample2x234_g145, clampResult3012 );
				float2 uv_Normal = i.ase_texcoord1.xy * _Normal_ST.xy + _Normal_ST.zw;
				float clampResult3014 = clamp( _NormalPower , 1.0 , 2.0 );
				float3 temp_output_2961_0 = ( _NormSuperSample == 1.0 ? localUnpackNormal47_g145 : UnpackScaleNormal( tex2D( _Normal, uv_Normal ), clampResult3014 ) );
				float2 uv_NormalMask = i.ase_texcoord1.xy * _NormalMask_ST.xy + _NormalMask_ST.zw;
				float4 tex2DNode3059 = tex2D( _NormalMask, uv_NormalMask );
				float clampResult3013 = clamp( _NormalPower , 0.0 , 1.0 );
				float3 lerpResult430 = lerp( float3( 0,0,1 ) , temp_output_2961_0 , ( tex2DNode3059.r * clampResult3013 ));
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
				float3 localCenterEye1_g146 = CenterEye1_g146();
				float3 temp_output_4_0_g146 = ( localCenterEye1_g146 - WorldPosition );
				float3 normalizeResult5_g146 = normalize( temp_output_4_0_g146 );
				float3 lerpResult2635 = lerp( appendResult248 , normalizeResult5_g146 , float3( 0.3333,0.3333,0.3333 ));
				float3 Dir_LightDir2215 = ( ( ase_lightColor.rgb * ase_lightColor.a ) > float3( 0,0,0 ) ? normalizeResult1233 : lerpResult2635 );
				float dotResult5 = dot( NormalShade962 , Dir_LightDir2215 );
				float NdotL1296 = dotResult5;
				float4 localVertexLightPosX3_g69 = VertexLightPosX3_g69();
				float4 break4_g69 = localVertexLightPosX3_g69;
				float4 localVertexLightPosY2_g69 = VertexLightPosY2_g69();
				float4 break5_g69 = localVertexLightPosY2_g69;
				float4 localVertexLightPosZ1_g69 = VertexLightPosZ1_g69();
				float4 break6_g69 = localVertexLightPosZ1_g69;
				float3 appendResult7_g69 = (float3(break4_g69.x , break5_g69.x , break6_g69.x));
				float3 VertLightPos12017 = appendResult7_g69;
				float4 transform2153 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 Lightmode2159 = ( _LightMode == 1.0 ? (transform2153).xyz : WorldPosition );
				float3 normalizeResult1382 = normalize( ( VertLightPos12017 - Lightmode2159 ) );
				float dotResult1381 = dot( NormalShade962 , normalizeResult1382 );
				float Vert_NdotL1389 = dotResult1381;
				float3 pos188_g69 = appendResult7_g69;
				float3 objToWorld139_g69 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_155_0_g69 = pow( distance( pos188_g69 , objToWorld139_g69 ) , 2.0 );
				float4 localVertexLightAttenuation86_g69 = VertexLightAttenuation86_g69();
				float4 break87_g69 = localVertexLightAttenuation86_g69;
				float attenx96_g69 = break87_g69.x;
				float temp_output_60_0_g69 = saturate( ( 1.0 - ( ( temp_output_155_0_g69 * attenx96_g69 ) / 25.0 ) ) );
				float temp_output_2937_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g69 ) * attenx96_g69 ) ) , ( temp_output_60_0_g69 * temp_output_60_0_g69 ) );
				float3 appendResult8_g69 = (float3(break4_g69.y , break5_g69.y , break6_g69.y));
				float3 pos290_g69 = appendResult8_g69;
				float3 objToWorld140_g69 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_75_0_g69 = pow( distance( pos290_g69 , objToWorld140_g69 ) , 2.0 );
				float atteny97_g69 = break87_g69.y;
				float temp_output_107_0_g69 = saturate( ( 1.0 - ( ( temp_output_75_0_g69 * atteny97_g69 ) / 25.0 ) ) );
				float temp_output_2937_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g69 ) * atteny97_g69 ) ) , ( temp_output_107_0_g69 * temp_output_107_0_g69 ) );
				float3 appendResult9_g69 = (float3(break4_g69.z , break5_g69.z , break6_g69.z));
				float3 pos389_g69 = appendResult9_g69;
				float3 objToWorld141_g69 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_79_0_g69 = pow( distance( pos389_g69 , objToWorld141_g69 ) , 2.0 );
				float attenz98_g69 = break87_g69.z;
				float temp_output_125_0_g69 = saturate( ( 1.0 - ( ( temp_output_79_0_g69 * attenz98_g69 ) / 25.0 ) ) );
				float temp_output_2937_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g69 ) * attenz98_g69 ) ) , ( temp_output_125_0_g69 * temp_output_125_0_g69 ) );
				float3 appendResult10_g69 = (float3(break4_g69.w , break5_g69.w , break6_g69.w));
				float3 pos491_g69 = appendResult10_g69;
				float3 objToWorld138_g69 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_83_0_g69 = pow( distance( pos491_g69 , objToWorld138_g69 ) , 2.0 );
				float attenw99_g69 = break87_g69.w;
				float temp_output_116_0_g69 = saturate( ( 1.0 - ( ( temp_output_83_0_g69 * attenw99_g69 ) / 25.0 ) ) );
				float temp_output_2937_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g69 ) * attenw99_g69 ) ) , ( temp_output_116_0_g69 * temp_output_116_0_g69 ) );
				float VertAtten2014 = ( temp_output_2937_23 + temp_output_2937_29 + temp_output_2937_30 + temp_output_2937_31 );
				float4 localVertexLightCol114_g69 = VertexLightCol114_g69();
				float4 temp_output_2937_16 = localVertexLightCol114_g69;
				float4 localVertexLightCol215_g69 = VertexLightCol215_g69();
				float4 temp_output_2937_17 = localVertexLightCol215_g69;
				float4 localVertexLightCol319_g69 = VertexLightCol319_g69();
				float4 temp_output_2937_18 = localVertexLightCol319_g69;
				float4 localVertexLightCol421_g69 = VertexLightCol421_g69();
				float4 temp_output_2937_20 = localVertexLightCol421_g69;
				float4 break1551 = ( temp_output_2937_16 + temp_output_2937_17 + temp_output_2937_18 + temp_output_2937_20 );
				#ifdef VERTEXLIGHT_ON
				float staticSwitch1905 = ( VertAtten2014 * saturate( ( break1551.x + break1551.y + break1551.z ) ) * break1551.w );
				#else
				float staticSwitch1905 = 0.0;
				#endif
				float VertTotal1665 = staticSwitch1905;
				float lerpResult2140 = lerp( VertTotal1665 , VertAtten2014 , ( VertTotal1665 * 0.75 ));
				float temp_output_2033_0 = ( 1.0 - saturate( ( 1.0 / pow( ( lerpResult2140 * 0.33 ) , 25.0 ) ) ) );
				float lerpResult1994 = lerp( NdotL1296 , Vert_NdotL1389 , temp_output_2033_0);
				float temp_output_1106_0 = ( ( _UseShading == 1.0 ? lerpResult1994 : 0.0 ) - _OffsetDot );
				float2 uv_LightMask = i.ase_texcoord1.xy * _LightMask_ST.xy + _LightMask_ST.zw;
				float temp_output_1254_0 = saturate( ( _ShadowSharpness1 * temp_output_1106_0 * tex2D( _LightMask, uv_LightMask ).r ) );
				float3 lerpResult1016 = lerp( (_ShadowColour).rgb , float3( 1,1,1 ) , temp_output_1254_0);
				float2 appendResult1125 = (float2(temp_output_1254_0 , temp_output_1254_0));
				float3 RampShade979 = ( _GradientorRamp == 1.0 ? lerpResult1016 : (( (float4( 0.5,0.5,0.5,0 ) + (_ShadowColour - float4( 0,0,0,0 )) * (float4( 1,1,1,0 ) - float4( 0.5,0.5,0.5,0 )) / (float4( 1,1,1,0 ) - float4( 0,0,0,0 ))) * tex2D( _Ramp, appendResult1125 ) )).rgb );
				float3 desaturateInitialColor581 = desaturateVar2917;
				float desaturateDot581 = dot( desaturateInitialColor581, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar581 = lerp( desaturateInitialColor581, desaturateDot581.xxx, ( ( 1.0 - RampShade979 ) * ( 1.0 - _ShadowSaturation ) ).x );
				float3 MaintexRGB3074 = desaturateVar581;
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch1908 = saturate( ( ( temp_output_2937_16 * temp_output_2937_23 ) + ( temp_output_2937_17 * temp_output_2937_29 ) + ( temp_output_2937_18 * temp_output_2937_30 ) + ( temp_output_2937_20 * temp_output_2937_31 ) ) );
				#else
				float4 staticSwitch1908 = float4(0,0,0,0);
				#endif
				float4 VertLight1406 = staticSwitch1908;
				float3 localunity_SHArgb3_g147 = unity_SHArgb3_g147();
				float4 temp_cast_5 = (_MinLight).xxxx;
				float4 temp_cast_6 = (_MaxLight).xxxx;
				float4 clampResult1914 = clamp( ( float4( ( ase_lightColor.rgb * ase_lightColor.a * ( 1.0 - _WorldSpaceLightPos0.w ) ) , 0.0 ) + VertLight1406 + float4( localunity_SHArgb3_g147 , 0.0 ) ) , temp_cast_5 , temp_cast_6 );
				float4 temp_output_2867_0 = ( clampResult1914 * _LightMultiplier );
				float4 break2085 = temp_output_2867_0;
				float3 desaturateInitialColor1777 = temp_output_2867_0.xyz;
				float desaturateDot1777 = dot( desaturateInitialColor1777, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1777 = lerp( desaturateInitialColor1777, desaturateDot1777.xxx, (0.0 + (saturate( ( max( max( break2085.x , break2085.y ) , max( break2085.y , break2085.z ) ) * break2085.w ) ) - 0.0) * (( 1.0 - _LightSatLimiter ) - 0.0) / (1.0 - 0.0)) );
				float3 temp_cast_9 = (( ( 1.0 - temp_output_1106_0 ) * _ShadowDarkness )).xxx;
				float3 clampResult30 = clamp( ( RampShade979 - temp_cast_9 ) , float3( 0,0,0 ) , float3( 0.8,0.8,0.8 ) );
				float3 Vert_LightDir1491 = normalizeResult1382;
				float3 lerpResult2213 = lerp( Dir_LightDir2215 , Vert_LightDir1491 , temp_output_2033_0);
				float3 FinalLightDir2218 = lerpResult2213;
				float fresnelNdotV645 = dot( normalize( NormalShade962 ), FinalLightDir2218 );
				float fresnelNode645 = ( 0.5 + _ShadeScale * pow( max( 1.0 - fresnelNdotV645 , 0.0001 ), _ShadePower ) );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float fresnelNdotV662 = dot( normalize( NormalShade962 ), ase_worldViewDir );
				float fresnelNode662 = ( 0.5 + ( 1.0 - _ShadeScale ) * pow( max( 1.0 - fresnelNdotV662 , 0.0001 ), _ShadePower ) );
				float lerpResult665 = lerp( ( 1.0 - fresnelNode645 ) , ( 1.0 - ( fresnelNode662 * 0.015 ) ) , 1.0);
				float lerpResult669 = lerp( lerpResult665 , 1.0 , ( fresnelNode645 * 0.015 ));
				float4 lerpResult660 = lerp( ( _ShadeColorDynamic == 1.0 ? (float4( 0.88,0.88,0.88,0.88 ) + (( _MultiplyDynamic * saturate( ( VertAtten2014 < 0.005 ? float4( ( ase_lightColor.rgb * ase_lightColor.a ) , 0.0 ) : VertLight1406 ) ) ) - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0.88,0.88,0.88,0.88 )) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) : float4( (float3( 0.88,0.88,0.88 ) + ((_ShadeColour).rgb - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.88,0.88,0.88 )) / (float3( 1,1,1 ) - float3( 0,0,0 ))) , 0.0 ) ) , float4( 1,1,1,0 ) , lerpResult669);
				float4 LightShaded2289 = ( float4( clampResult30 , 0.0 ) * ( _ShadeEnable == 1.0 ? lerpResult660 : float4( float3(1,1,1) , 0.0 ) ) );
				float4 LightColour968 = ( float4( desaturateVar1777 , 0.0 ) * LightShaded2289 );
				float4 PostDesaturation1276 = (float4( 0.0001,0.0001,0.0001,0 ) + (( float4( MaintexRGB3074 , 0.0 ) * LightColour968 ) - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0.0001,0.0001,0.0001,0 )) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float3 lerpResult1536 = lerp( ase_worldNormal , NormalShade962 , _Scale1);
				float fresnelNdotV360 = dot( ( _RimNormal == 1.0 ? lerpResult1536 : ase_worldNormal ), ase_worldViewDir );
				float fresnelNode360 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV360, _Power ) );
				float smoothstepResult379 = smoothstep( _Min , _Max , fresnelNode360);
				float4 temp_output_382_0 = ( _RimOutlineColour * smoothstepResult379 );
				float4 lerpResult388 = lerp( PostDesaturation1276 , ( temp_output_382_0 + PostDesaturation1276 ) , _Amount);
				float temp_output_383_0 = ( smoothstepResult379 * _Amount );
				float4 lerpResult390 = lerp( PostDesaturation1276 , temp_output_382_0 , temp_output_383_0);
				float4 lerpResult372 = lerp( PostDesaturation1276 , temp_output_382_0 , temp_output_383_0);
				float4 ifLocalVar1284 = 0;
				if( _RimMode > 1.0 )
				ifLocalVar1284 = lerpResult388;
				else if( _RimMode == 1.0 )
				ifLocalVar1284 = lerpResult390;
				else if( _RimMode < 1.0 )
				ifLocalVar1284 = lerpResult372;
				float4 PostRimLight1292 = ( _UseRim == 1.0 ? ifLocalVar1284 : PostDesaturation1276 );
				float3 localCenterEye46_g165 = CenterEye46_g165();
				float3 worldToViewDir27_g165 = normalize( mul( UNITY_MATRIX_V, float4( ( ( _StereoFix == 1.0 ? localCenterEye46_g165 : _WorldSpaceCameraPos ) - WorldPosition ), 0 ) ).xyz );
				float3 lerpResult3086 = lerp( float3( 0,0,1 ) , temp_output_2961_0 , ( _NormalPowerMatCap * tex2DNode3059.r ));
				float3 tanNormal3090 = lerpResult3086;
				float3 worldNormal3090 = float3(dot(tanToWorld0,tanNormal3090), dot(tanToWorld1,tanNormal3090), dot(tanToWorld2,tanNormal3090));
				float3 normalizeResult3091 = normalize( worldNormal3090 );
				float3 NormalMatCap3089 = normalizeResult3091;
				float3 worldToViewDir13_g165 = normalize( mul( UNITY_MATRIX_V, float4( NormalMatCap3089, 0 ) ).xyz );
				float mulTime2208 = _Time.y * _MatcapSpin;
				float cos2210 = cos( mulTime2208 );
				float sin2210 = sin( mulTime2208 );
				float2 rotator2210 = mul( (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g165 ) , worldToViewDir13_g165 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) - float2( 0.5,0.5 ) , float2x2( cos2210 , -sin2210 , sin2210 , cos2210 )) + float2( 0.5,0.5 );
				float3 localCenterEye16_g166 = CenterEye16_g166();
				float3 normalizeResult19_g166 = normalize( ( ( _StereoFix == 1.0 ? localCenterEye16_g166 : _WorldSpaceCameraPos ) - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g166 = normalize( cross( normalizeResult19_g166 , _worldUp ) );
				float3 temp_output_21_0_g166 = NormalMatCap3089;
				float dotResult10_g166 = dot( normalizeResult8_g166 , temp_output_21_0_g166 );
				float dotResult2_g166 = dot( _worldUp , normalizeResult19_g166 );
				float3 normalizeResult7_g166 = normalize( ( _worldUp - ( dotResult2_g166 * normalizeResult19_g166 ) ) );
				float dotResult9_g166 = dot( normalizeResult7_g166 , temp_output_21_0_g166 );
				float2 appendResult11_g166 = (float2(dotResult10_g166 , dotResult9_g166));
				float cos2207 = cos( mulTime2208 );
				float sin2207 = sin( mulTime2208 );
				float2 rotator2207 = mul( ( ( appendResult11_g166 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) - float2( 0.5,0.5 ) , float2x2( cos2207 , -sin2207 , sin2207 , cos2207 )) + float2( 0.5,0.5 );
				float4 temp_output_2165_0 = ( _Legacy == 1.0 ? tex2D( _Matcap, rotator2210 ) : tex2D( _Matcap, rotator2207 ) );
				float3 desaturateInitialColor1516 = ( (temp_output_2165_0).rgb * _MatcapIntensity * (_MatCapColor).rgb );
				float desaturateDot1516 = dot( desaturateInitialColor1516, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1516 = lerp( desaturateInitialColor1516, desaturateDot1516.xxx, ( 1.0 - _MatcapSaturation ) );
				float2 uv_MatCapMask = i.ase_texcoord1.xy * _MatCapMask_ST.xy + _MatCapMask_ST.zw;
				float3 desaturateInitialColor3112 = tex2D( _MatCapMask, uv_MatCapMask ).rgb;
				float desaturateDot3112 = dot( desaturateInitialColor3112, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar3112 = lerp( desaturateInitialColor3112, desaturateDot3112.xxx, 1.0 );
				float4 lerpResult405 = lerp( PostRimLight1292 , ( PostRimLight1292 * float4( desaturateVar1516 , 0.0 ) ) , ( (temp_output_2165_0).a * _MatcapOpacity * (desaturateVar3112).x ));
				float4 PostMatcap1274 = lerpResult405;
				float2 uv_Emission = i.ase_texcoord1.xy * _Emission_ST.xy + _Emission_ST.zw;
				float3 temp_output_808_0 = (tex2D( _Emission, uv_Emission )).rgb;
				float4 lerpResult450 = lerp( float4( temp_output_808_0 , 0.0 ) , ( float4( temp_output_808_0 , 0.0 ) * LightColour968 ) , _ShadedEmission);
				float4 temp_cast_24 = (3.0).xxxx;
				float4 clampResult331 = clamp( ( lerpResult450 * float4( (_EmissionColor).rgb , 0.0 ) * _EmissionIntensity ) , float4( 0,0,0,0 ) , temp_cast_24 );
				float4 Emission1285 = clampResult331;
				float3 desaturateInitialColor2291 = LightColour968.xyz;
				float desaturateDot2291 = dot( desaturateInitialColor2291, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2291 = lerp( desaturateInitialColor2291, desaturateDot2291.xxx, 1.0 );
				float3 localCenterEye1_g149 = CenterEye1_g149();
				float3 temp_output_4_0_g149 = ( localCenterEye1_g149 - WorldPosition );
				float3 normalizeResult5_g149 = normalize( temp_output_4_0_g149 );
				float3 normalizeResult1783 = normalize( ( ( _StereoFixSpec == 1.0 ? normalizeResult5_g149 : ase_worldViewDir ) + FinalLightDir2218 ) );
				float clampResult3011 = clamp( _NormalPowerSpecular , 0.0 , 1.0 );
				float3 lerpResult602 = lerp( float3( 0,0,1 ) , temp_output_2961_0 , ( tex2DNode3059.r * clampResult3011 ));
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
				float3 localCenterEye46_g163 = CenterEye46_g163();
				float3 worldToViewDir27_g163 = normalize( mul( UNITY_MATRIX_V, float4( ( ( _StereoFixSpecCap == 1.0 ? localCenterEye46_g163 : _WorldSpaceCameraPos ) - WorldPosition ), 0 ) ).xyz );
				float3 worldToViewDir13_g163 = normalize( mul( UNITY_MATRIX_V, float4( NormalSpecular965, 0 ) ).xyz );
				float3 localCenterEye16_g162 = CenterEye16_g162();
				float3 normalizeResult19_g162 = normalize( ( ( _StereoFixSpecCap == 1.0 ? localCenterEye16_g162 : _WorldSpaceCameraPos ) - WorldPosition ) );
				float3 normalizeResult8_g162 = normalize( cross( normalizeResult19_g162 , _worldUp ) );
				float3 temp_output_21_0_g162 = NormalSpecular965;
				float dotResult10_g162 = dot( normalizeResult8_g162 , temp_output_21_0_g162 );
				float dotResult2_g162 = dot( _worldUp , normalizeResult19_g162 );
				float3 normalizeResult7_g162 = normalize( ( _worldUp - ( dotResult2_g162 * normalizeResult19_g162 ) ) );
				float dotResult9_g162 = dot( normalizeResult7_g162 , temp_output_21_0_g162 );
				float2 appendResult11_g162 = (float2(dotResult10_g162 , dotResult9_g162));
				float3 desaturateInitialColor1920 = (( _Legacy2 == 1.0 ? tex2D( _SpecularMatcap, (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g163 ) , worldToViewDir13_g163 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) ) : tex2D( _SpecularMatcap, ( ( appendResult11_g162 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) ) )).rgb;
				float desaturateDot1920 = dot( desaturateInitialColor1920, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1920 = lerp( desaturateInitialColor1920, desaturateDot1920.xxx, ( 1.0 - _SpecMatcapSaturation ) );
				float3 temp_output_2001_0 = ( _UseSpecularMatCap == 1.0 ? ( desaturateVar1920 * _SpecMatcapMultiply * (_SpecMatCapColor).rgb ) : float3(0,0,0) );
				float2 uv_SpecularMask = i.ase_texcoord1.xy * _SpecularMask_ST.xy + _SpecularMask_ST.zw;
				float3 desaturateInitialColor3115 = tex2D( _SpecularMask, uv_SpecularMask ).rgb;
				float desaturateDot3115 = dot( desaturateInitialColor3115, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar3115 = lerp( desaturateInitialColor3115, desaturateDot3115.xxx, 1.0 );
				float3 lerpResult560 = lerp( float3( 0,0,0 ) , ( ( _SpecularMode == 0.0 ? temp_output_3064_0 : ( temp_output_3064_0 * ( ( (LightColour968).xyz * MaintexRGB3074 ) + MaintexRGB3074 ) ) ) + ( _SpecMatCapMode == 0.0 ? temp_output_2001_0 : ( temp_output_2001_0 * MaintexRGB3074 ) ) ) , ( (desaturateVar3115).x * _SpecMaskOpacity ));
				float3 SpecularOut983 = lerpResult560;
				float3 lerpResult2280 = lerp( ( (desaturateVar2291).xyz * SpecularOut983 ) , SpecularOut983 , ( SpecularOut983 * float3( 10,10,10 ) ));
				float2 uv_SparkleMask1 = i.ase_texcoord1.xy * _SparkleMask1_ST.xy + _SparkleMask1_ST.zw;
				float4 tex2DNode1743 = tex2D( _SparkleMask1, uv_SparkleMask1 );
				float3 desaturateInitialColor1744 = tex2DNode1743.rgb;
				float desaturateDot1744 = dot( desaturateInitialColor1744, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1744 = lerp( desaturateInitialColor1744, desaturateDot1744.xxx, 1.0 );
				float clampResult2503 = clamp( distance( WorldPosition , _WorldSpaceCameraPos ) , 0.0 , 100.0 );
				float temp_output_2804_0 = ( 1.0 - (0.0 + (clampResult2503 - 0.0) * (0.01 - 0.0) / (1.0 - 0.0)) );
				float3 temp_cast_31 = (_Threshold).xxx;
				float3 temp_cast_32 = (saturate( ( _Threshold + _Range ) )).xxx;
				sampler2D texvalue34_g169 = _SparklePattern;
				float2 uv_SparklePattern = i.ase_texcoord1.xy * _SparklePattern_ST.xy + _SparklePattern_ST.zw;
				float2 temp_output_4_0_g169 = uv_SparklePattern;
				half2 uvin34_g169 = temp_output_4_0_g169;
				half2 dx34_g169 = ( ddx( temp_output_4_0_g169 ) * float2( 0.25,0.25 ) );
				half2 dy34_g169 = ( ddy( temp_output_4_0_g169 ) * float2( 0.25,0.25 ) );
				half bias34_g169 = 0.0;
				half4 localsupersample2x234_g169 = supersample2x2( texvalue34_g169 , uvin34_g169 , dx34_g169 , dy34_g169 , bias34_g169 );
				float temp_output_1710_0 = ( 1.0 - _SparkleTexColour );
				float3 desaturateInitialColor1704 = ( _SparkleSuperSample == 1.0 ? localsupersample2x234_g169 : tex2D( _SparklePattern, uv_SparklePattern ) ).xyz;
				float desaturateDot1704 = dot( desaturateInitialColor1704, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1704 = lerp( desaturateInitialColor1704, desaturateDot1704.xxx, temp_output_1710_0 );
				sampler2D texvalue34_g170 = _SparklePattern;
				float2 break2472 = uv_SparklePattern;
				float2 appendResult2473 = (float2(-break2472.x , break2472.y));
				float3 localCenterEye72_g164 = CenterEye72_g164();
				float4 appendResult76_g164 = (float4(( WorldPosition - localCenterEye72_g164 ) , 0.0));
				float4 temp_output_77_0_g164 = mul( UNITY_MATRIX_V, appendResult76_g164 );
				float2 break83_g164 = ( (temp_output_77_0_g164).xy / (temp_output_77_0_g164).z );
				float2 appendResult86_g164 = (float2(( ( _ScreenParams.z / _ScreenParams.w ) * break83_g164.x ) , ( break83_g164.y * 2.0 )));
				float2 appendResult101_g164 = (float2(1.0 , 1.0));
				float2 appendResult102_g164 = (float2(0.0 , 0.0));
				float4 screenPos = i.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float mulTime2348 = _Time.y * _MotionSpeed;
				float2 appendResult2356 = (float2(sin( mulTime2348 ) , cos( mulTime2348 )));
				float2 appendResult2405 = (float2(mulTime2348 , 0.0));
				float cos2403 = cos( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float sin2403 = sin( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float2 rotator2403 = mul( appendResult2405 - float2( 0.5,0.5 ) , float2x2( cos2403 , -sin2403 , sin2403 , cos2403 )) + float2( 0.5,0.5 );
				float temp_output_2779_0 = ( ( WorldPosition.x + WorldPosition.y + WorldPosition.z ) * ( _WorldPosContribution / 10.0 ) );
				float2 appendResult2864 = (float2(-temp_output_2779_0 , temp_output_2779_0));
				float2 temp_output_2355_0 = ( ( appendResult2473 + ( ( _StereoCorrect == 0.0 ? ( ( ( ( -appendResult86_g164 * float2( 1,0.5 ) ) + float2( 0.5,0.5 ) ) * appendResult101_g164 ) + appendResult102_g164 ) : (ase_screenPosNorm).xy ) * _ScreenContribution ) ) + float2( 0.25,0.25 ) + ( _MotionIntensity * ( _MotionType == 1.0 ? appendResult2356 : rotator2403 ) ) + appendResult2864 );
				float2 temp_output_4_0_g170 = temp_output_2355_0;
				half2 uvin34_g170 = temp_output_4_0_g170;
				half2 dx34_g170 = ( ddx( temp_output_4_0_g170 ) * float2( 0.25,0.25 ) );
				half2 dy34_g170 = ( ddy( temp_output_4_0_g170 ) * float2( 0.25,0.25 ) );
				half bias34_g170 = 0.0;
				half4 localsupersample2x234_g170 = supersample2x2( texvalue34_g170 , uvin34_g170 , dx34_g170 , dy34_g170 , bias34_g170 );
				float3 desaturateInitialColor1705 = ( _SparkleSuperSample == 1.0 ? localsupersample2x234_g170 : tex2D( _SparklePattern, temp_output_2355_0 ) ).xyz;
				float desaturateDot1705 = dot( desaturateInitialColor1705, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1705 = lerp( desaturateInitialColor1705, desaturateDot1705.xxx, temp_output_1710_0 );
				float3 localCenterEye1_g167 = CenterEye1_g167();
				float3 smoothstepResult901 = smoothstep( temp_cast_31 , temp_cast_32 , ( desaturateVar1704 * desaturateVar1705 * ( 1.0 - pow( ( distance( WorldPosition , localCenterEye1_g167 ) / 10000.0 ) , 0.5 ) ) ));
				float3 normalizeResult2480 = normalize( ase_worldViewDir );
				float temp_output_2833_0 = (-1.0 + (temp_output_2804_0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0));
				float3 appendResult2806 = (float3(_SparkleFresnel1.x , ( _SparkleFresnel1.y * temp_output_2833_0 ) , pow( _SparkleFresnel1.z , temp_output_2833_0 )));
				float3 break2506 = (float3( 0,0,0 ) + (appendResult2806 - float3( 0,0,0 )) * (float3( 0.1,0.1,0.1 ) - float3( 0,0,0 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float fresnelNdotV2371 = dot( NormalSpecular965, normalizeResult2480 );
				float fresnelNode2371 = ( break2506.x + break2506.y * pow( max( 1.0 - fresnelNdotV2371 , 0.0001 ), break2506.z ) );
				float fresnelNdotV2440 = dot( -NormalSpecular965, normalizeResult2480 );
				float fresnelNode2440 = ( break2506.x + break2506.y * pow( max( 1.0 - fresnelNdotV2440 , 0.0001 ), break2506.z ) );
				float switchResult2437 = (((ase_vface>0)?(( 1.0 - saturate( fresnelNode2371 ) )):(( 1.0 - saturate( fresnelNode2440 ) ))));
				float4 temp_cast_38 = (0.0).xxxx;
				float4 SparkleOut971 = ( _UseSparkleShimmer == 1.0 ? ( float4( ( desaturateVar1744 * tex2DNode1743.a ) , 0.0 ) * ( _SparkleColor1 * ( 2.5 * ( 200.0 * temp_output_2804_0 ) ) ) * float4( smoothstepResult901 , 0.0 ) * switchResult2437 ) : temp_cast_38 );
				float Alpha1262 = (temp_output_2987_0).w;
				int localisCamera1_g191 = isCamera1_g191();
				int Cam17_g191 = localisCamera1_g191;
				int temp_output_5_0_g191 = (int)_IsInMirror;
				int temp_output_6_0_g191 = (int)_IsNotMirror;
				float2 uv_FriendsOnlyRT = i.ase_texcoord1.xy * _FriendsOnlyRT_ST.xy + _FriendsOnlyRT_ST.zw;
				float4 tex2DNode349 = tex2D( _FriendsOnlyRT, uv_FriendsOnlyRT );
				float temp_output_353_0 = ( ceil( saturate( ( tex2DNode349.r + tex2DNode349.g + tex2DNode349.b ) ) ) * 2.0 );
				clip( ( ( _MirrorSystem == 1.0 ? (float)( (float)Cam17_g191 == 1.0 ? ( (float)temp_output_5_0_g191 == 1.0 ? ( Cam17_g191 + temp_output_5_0_g191 ) : ( Cam17_g191 * temp_output_5_0_g191 ) ) : ( (float)temp_output_6_0_g191 == 0.0 ? ( Cam17_g191 * temp_output_6_0_g191 ) : ( Cam17_g191 + temp_output_6_0_g191 ) ) ) : 1.0 ) * ( _FriendsOnly == 1.0 ? ( _FriendsOnly1 == 1.0 ? ( 1.0 - temp_output_353_0 ) : temp_output_353_0 ) : 1.0 ) ) - _Cutoff);
				float4 appendResult1923 = (float4(( ( _UseMatcap == 1.0 ? PostMatcap1274 : PostRimLight1292 ) + Emission1285 + float4( ( lerpResult2280 * float3( 10,10,10 ) ) , 0.0 ) + SparkleOut971 ).rgb , ( _Alpha * Alpha1262 )));
				
				
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
-1625;70;1488;818;-2632.659;868.4341;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;1378;-5038.125,-1067.467;Inherit;False;2099.93;995.9517;;34;2150;1491;1406;1908;1910;1683;1682;1631;1630;1629;1684;1389;1381;1382;1380;1383;2017;1665;1905;1911;1879;1891;1890;2014;1589;1886;1551;1878;2151;2152;2153;2154;2159;2937;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;2937;-4842.446,-640.0442;Inherit;False;VertexLightData;-1;;69;d6cc1c00f5d200e45903717e6fa3d55c;0;0;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-4425.395,-213.0346;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-4296.662,-211.1421;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-4556.51,-273.7959;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-4141.057,-205.6132;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1237;-5229.921,-2055.463;Inherit;False;1915.085;892.6392;;30;2961;2958;428;430;603;602;2957;1861;1856;965;1234;962;1235;2962;3011;3012;3013;3014;3055;3059;3049;3060;3061;3062;3086;3087;3088;3089;3090;3091;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.WireNode;1891;-4033.376,-120.1354;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2014;-4226.261,-287.5107;Inherit;False;VertAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1890;-4006.89,-218.5086;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;281;-3257.708,-1772.316;Inherit;False;1450.566;634.3398;Uses directional light or uses the static light direction;19;1296;5;1165;2215;1076;1876;633;1233;248;251;249;252;1247;1246;2148;1232;2147;2635;2852;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-3810.657,-248.561;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1911;-3881.313,-337.6737;Inherit;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-4911.921,-1289.749;Inherit;False;Property;_NormalPower;Normal Power;34;0;Create;True;0;0;0;False;0;False;0;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-4900.572,-1822.415;Inherit;False;Property;_NormalPowerSpecular;Normal Power Specular;35;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2957;-5231.666,-1652.557;Inherit;True;Property;_Normal;Normal;32;1;[Normal];Create;True;0;0;0;False;2;Space(5);Header(.  Normal  .);False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2147;-3247.611,-1598.09;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;3012;-5101.466,-1781.576;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3014;-5087.566,-1307.476;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1905;-3631.562,-282.9634;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3059;-4919.727,-2009.336;Inherit;True;Property;_NormalMask;Normal Mask;37;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;3062;-4625.909,-1406.208;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3013;-4625.064,-1282.476;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2958;-4921.165,-1489.244;Inherit;True;Property;_TextureSample1;Texture Sample 1;100;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-3373.02,-281.3594;Inherit;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2153;-5012.042,-998.1904;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2962;-4883.589,-1591.276;Inherit;False;Property;_NormSuperSample;SuperSample (expensive);33;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3049;-4912.57,-1744.203;Inherit;False;NormalTextureSuperSample;-1;;145;c5e7d95f0a9b898419b29857c25ecde5;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;49;FLOAT;1;False;4;FLOAT3;0;FLOAT;39;FLOAT;40;FLOAT;41
Node;AmplifyShaderEditor.ComponentMaskNode;2148;-3047.611,-1557.09;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-3250.167,-1708.476;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.WorldPosInputsNode;2150;-4935.224,-813.419;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;2121;-5759.884,339.9149;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2961;-4546.16,-1624.216;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-3232.884,-1265.439;Float;False;Property;_StaticLightZ;Static Light Z;27;0;Create;True;0;0;0;False;0;False;0.44;0.44;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-3234.6,-1337.48;Float;False;Property;_StaticLightY;Static Light Y;26;0;Create;True;0;0;0;False;0;False;0.55;0.55;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2154;-4796.145,-924.688;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3061;-4434.409,-1292.707;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2152;-4770.013,-1027.351;Inherit;False;Property;_LightMode;Lighting Mode;16;1;[Enum];Create;False;0;2;Surface;0;Object2World;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-3234.506,-1411.764;Float;False;Property;_StaticLightX;Static Light X;25;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;0.68;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-2827.469,-1587.531;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;430;-4191.087,-1367.558;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-5595.17,260.0959;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;248;-2901.05,-1350.183;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;2852;-2914.528,-1239.806;Inherit;False;VR_Center_Eye;-1;;146;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2144;-5504.743,334.7301;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-2681.782,-1631.293;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;2151;-4563.795,-951.736;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;633;-2922.086,-1466.803;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;2140;-5310.849,252.4027;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1235;-3830.302,-1402.233;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;2635;-2590.92,-1330.52;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.3333,0.3333,0.3333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-2707.091,-1425.807;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2017;-4589.264,-698.3149;Inherit;False;VertLightPos1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-2589.126,-1505.888;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2159;-4404.587,-925.3344;Inherit;False;Lightmode;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1076;-2395.121,-1419.628;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-4224.535,-756.7634;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2034;-5080.248,321.5851;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.33;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-3510.817,-1402.199;Inherit;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-2268.066,-1505.157;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-4145.727,-847.7141;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1382;-4033.896,-756.2022;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2215;-2246.785,-1414.851;Inherit;False;Dir_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2026;-4916.876,319.8529;Inherit;False;False;2;0;FLOAT;2;False;1;FLOAT;25;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2035;-4753.248,291.5851;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-3832.175,-809.9521;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;5;-2008.379,-1443.362;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-2014.986,-1524.105;Inherit;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-3678.922,-815.1361;Inherit;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2025;-4626.137,291.327;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4529.63,96.07337;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4534.744,190.634;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2033;-4486.248,291.5851;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1994;-4219.491,204.3985;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1058;-3948.189,176.1206;Inherit;False;Property;_UseShading;Use Shading;15;0;Create;True;0;0;0;False;3;Space(5);Header(.  Shadow  .);Toggle(_);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-4395.358,-352.1777;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-4395.913,-441.7386;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-4395.832,-533.2676;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-4391.887,-623.3135;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Compare;1059;-3732.968,218.3465;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-4116.509,-515.3514;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3860.334,389.5299;Inherit;False;Property;_OffsetDot;Offset Dot;20;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2211;-3633.483,565.0453;Inherit;True;Property;_LightMask;Light Mask;24;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;1683;-3913.112,-515.0101;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-3554.867,472.5686;Float;False;Property;_ShadowSharpness1;Shadow Sharpness;21;0;Create;False;0;0;0;False;0;False;1;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;1910;-3770.719,-641.6983;Inherit;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3485.761,366.6765;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-3680.706,-734.5935;Inherit;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-3283.7,483.0416;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1908;-3568.139,-525.9202;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;2081;-2259.994,-160.7657;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;2216;-4540.25,454.3213;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-3282.966,-524.4603;Inherit;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;573;-2953.281,478.7458;Inherit;False;1236.993;594.242;;11;979;1026;815;1025;1033;32;1032;1010;1008;1016;1125;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.SaturateNode;1254;-3093.266,641.0908;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;1484;-2066.066,-58.45258;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.OneMinusNode;2082;-1994.619,-137.4473;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2217;-4535.136,380.7607;Inherit;False;2215;Dir_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;793;-1661.482,781.5772;Inherit;False;1728.081;844.5872;;31;1499;642;954;660;1036;669;680;670;665;679;1035;811;654;1064;664;646;684;682;1304;662;1492;1123;641;1504;1505;1506;1507;1605;645;2975;2976;Soft Shading;0,0,0,1;0;0
Node;AmplifyShaderEditor.LerpOp;2213;-4301.639,385.696;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;641;-1616.012,1379.944;Inherit;False;Property;_ShadeScale;Shade Scale;42;0;Create;True;0;0;0;False;0;False;100;100;2;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1125;-2926.257,854.1436;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-1811.196,-55.04758;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3135;-1872.64,132.385;Inherit;False;GetBakedLight;-1;;147;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;1506;-1637.785,988.9029;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-1857.393,58.05338;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;1008;-2925.583,515.3505;Inherit;False;Property;_ShadowColour;Shadow Colour;18;0;Create;True;0;0;0;False;0;False;0.7098039,0.7098039,0.7098039,1;0.8207547,0.8207547,0.8207547,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;1499;-1229.308,1511.806;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1915;-1606.363,198.7918;Inherit;False;Property;_MaxLight;Max Light;12;0;Create;True;0;0;0;False;0;False;0.9;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2218;-4148.478,380.9126;Inherit;False;FinalLightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;32;-2747.916,855.6759;Inherit;True;Property;_Ramp;Ramp;19;0;Create;False;0;0;0;False;0;False;-1;None;c320938fa0c7f9043aabb704290909a3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1916;-1613.164,123.5596;Inherit;False;Property;_MinLight;Min Light;13;0;Create;True;0;0;0;False;0;False;0.9;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-1592.163,3.262935;Inherit;False;3;3;0;FLOAT3;1,1,1;False;1;FLOAT4;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCRemapNode;1032;-2663.649,673.0994;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;3;COLOR;0.5,0.5,0.5,0;False;4;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1123;-1551.346,1451.52;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1507;-1488.138,1012.252;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1505;-1642.785,912.83;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;642;-1621.744,1540.574;Inherit;False;Property;_ShadePower;Shade Power;41;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1605;-1634.136,818.6085;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1033;-2422.506,849.3695;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FresnelNode;662;-1025.982,1465.785;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1492;-1556.576,1301.236;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2982;-1911.759,-607.1998;Inherit;True;Property;_MainTex;Texture;3;0;Create;False;0;0;0;False;1;Header(.  Main  .);False;None;e3a2159bb5238584c8ee9ace5502e4a7;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ClampOpNode;3011;-4599.168,-1817.776;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1504;-1269.274,931.6057;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.005;False;2;FLOAT3;0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-1351.812,88.06779;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0.8,0.8,0.8,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;2870;-1386.801,202.3459;Inherit;False;Property;_LightMultiplier;Light Multiplier;11;0;Create;True;0;0;0;False;0;False;1.1;1.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2621.69,533.0191;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;815;-2266.22,841.6435;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2867;-1173.768,138.2905;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;1016;-2327.486,556.7116;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2988;-1561.327,-723.9846;Inherit;False;Property;_TexSuperSample;SuperSample (expensive);4;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2997;-1583.159,-645.2;Inherit;False;TextureSuperSample;-1;;148;23a6a6e8fbe28134cac41513630794b1;0;3;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3060;-4448.233,-1844.19;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;684;-1269.829,832.3073;Float;False;Property;_MultiplyDynamic;MultiplyDynamic;43;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;646;-1552.039,1131.359;Inherit;False;Property;_ShadeColour;Shade Colour;40;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2984;-1577.759,-458.1998;Inherit;True;Property;_TextureSample7;Texture Sample 7;101;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;1304;-1116.712,936.2518;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FresnelNode;645;-1026.925,1289.424;Inherit;False;Standard;WorldNormal;LightDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;682;-731.0551,1479.335;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.015;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1025;-2345.685,748.077;Inherit;False;Property;_GradientorRamp;Gradient or Ramp;17;1;[Enum];Create;True;0;2;Ramp_Texture;0;Linear_Gradient;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1064;-955.7271,885.9337;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;811;-1306.56,1133.775;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;18;-1263.283,-410.7312;Float;False;Property;_Color;> Color;5;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;1026;-2086.702,628.3771;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;2085;-1012.291,238.5432;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.Compare;2987;-1215.28,-657.6986;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;654;-772.6262,1274.581;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;569;-1621.408,-2462.519;Inherit;False;2674.146;1264.229;;71;2853;983;560;701;696;2301;695;824;2001;2002;952;690;2234;691;816;1920;838;2294;817;561;1921;837;1919;554;545;556;1928;551;967;555;553;1783;1051;2236;2237;546;2224;2219;2225;1909;2898;2899;2900;2901;2902;2904;2905;3034;3056;3057;3064;3065;3067;3068;3069;3070;3071;3072;3075;3079;3080;3081;3085;3101;3102;3103;3104;3107;3108;3114;3115;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.LerpOp;602;-4247.118,-1582.707;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;664;-746.9799,1373.607;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-1018.745,-410.1774;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;2853;-1546.548,-2208.793;Inherit;False;VR_Center_Eye;-1;;149;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.LerpOp;665;-579.5309,1285.086;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1234;-3912.265,-1584.705;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-1558.234,-2352.753;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMaxOpNode;3117;-866.4255,231.9988;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-1924.501,628.5303;Inherit;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;670;-512.5029,1460.731;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.015;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;3118;-867.3201,317.2791;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;680;-798.3499,888.3104;Inherit;False;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;3;FLOAT4;0.88,0.88,0.88,0.88;False;4;FLOAT4;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;2225;-1558.234,-2432.753;Inherit;False;Property;_StereoFixSpec;Stereo Converge (flatten);49;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;679;-1003.727,1112.589;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.88,0.88,0.88;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-1033.679,-626.1235;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1035;-745.4713,1071.783;Inherit;False;Property;_ShadeColorDynamic;ShadeColor Dynamic;39;1;[Enum];Create;True;0;2;FixedColour;0;LightColour;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-2366.757,408.3535;Inherit;False;Property;_ShadowDarkness;Shadow Darkness;22;0;Create;True;0;0;0;False;0;False;0.22;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1470;-2314.928,337.9105;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2130.354,351.2448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1036;-458.8735,1093.075;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-654.3216,-609.6462;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1347;-614.4459,-361.8139;Inherit;False;1534.475;525.8724;hue & saturation;12;584;586;582;585;1330;581;2917;2911;2908;2918;325;2910;;1,1,1,1;0;0
Node;AmplifyShaderEditor.Compare;2224;-1286.234,-2416.753;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2280.572,264.617;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;669;-382.6471,1306.059;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;3119;-741.0883,257.8079;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;3055;-3724.4,-1582.895;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2219;-1558.234,-2112.753;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;660;-195.4025,1279.834;Inherit;False;3;0;FLOAT4;1,0,0,0;False;1;FLOAT4;1,1,1,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RGBToHSVNode;2909;-357.1839,-572.6876;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;2237;-1120.234,-2421.753;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2109;-600.0175,325.0371;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3120;-745.1984,411.3862;Inherit;False;Property;_LightSatLimiter;Light Saturation Limiter;14;0;Create;False;0;0;0;False;0;False;0.5;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-3569.772,-1589.762;Inherit;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-1824.178,311.0082;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;870;-3721.226,-4676.133;Inherit;False;4668.005;2027.595;;102;2478;971;2004;2003;877;957;2437;1745;2811;901;2308;875;2313;2564;2801;1744;900;1743;898;2394;1704;2813;2805;2810;2812;1705;2556;897;894;2396;2440;2371;1710;2473;2355;2558;1709;2506;2395;2458;2480;2476;1746;2379;2505;2864;2544;2359;2372;2865;2360;1713;2806;2686;2472;2398;2377;2857;2356;2400;2841;2840;2942;960;2403;2779;885;1732;2349;2405;2778;2406;902;2357;2863;2833;2866;2348;2404;2834;2862;2361;2804;2839;2503;2426;2424;2425;2949;2950;2952;2953;2954;2955;2956;3093;3094;3095;3096;2999;2998;3097;Sparkle/Shimmer Effect;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2976;-477.4071,848.7371;Inherit;False;Property;_ShadeEnable;Shade Enable;38;0;Create;True;0;2;FixedColour;0;LightColour;1;0;False;2;Toggle(_);Header(.  Soft Shading  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-1212.571,-2262.192;Inherit;False;Property;_SpecularSize;Specular Size;45;0;Create;True;0;0;0;False;0;False;1;6.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2910;-444.7452,-308.1699;Inherit;False;Property;_Hue;Hue;6;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;954;-463.4315,926.7982;Inherit;False;Constant;_Shade_Null;Shade_Null;65;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;2424;-1971.697,-2980.127;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-999.0647,-2354.426;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;2975;-144.4071,886.7371;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClampOpNode;30;-508.2817,519.7941;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2236;-925.7487,-2278.18;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;2425;-2221.459,-2874.894;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;2911;-75.27967,-275.3194;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-943.2343,-2424.753;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-570.1216,18.60373;Inherit;False;Property;_ShadowSaturation;Shadow Saturation;23;0;Create;True;0;0;0;False;0;False;0.85;1;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2093;-465.273,325.6527;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1330;-555.6135,-65.44437;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;3121;-501.5092,415.606;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;325;-591.8463,-218.3334;Float;False;Property;_Saturation;Saturation;7;0;Create;True;0;0;0;False;0;False;1;1;-2;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1500;96.43668,434.5768;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ExpOpNode;553;-758.7168,-2302.318;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;2426;-1783.482,-2912.731;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;2098;-319.7894,325.1325;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;582;-287.4298,-56.90408;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2918;-275.151,-167.917;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;586;-284.505,25.71292;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3088;-4542.551,-1980.222;Inherit;False;Property;_NormalPowerMatCap;Normal Power MatCap;36;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;2908;153.305,-266.6901;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;551;-771.1711,-2425.639;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-970.525,-2174.94;Inherit;False;Property;_SpecularStrength;Specular Strength;46;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;967;-1598.962,-1685.728;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1928;-1598.962,-1763.91;Inherit;False;Property;_StereoFixSpecCap;Stereo Converge (flatten);52;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;556;-587.0679,-2324.069;Inherit;False;True;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2289;272.1179,420.858;Inherit;False;LightShaded;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClampOpNode;2503;-1639.691,-2908.516;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1777;-92.00611,281.6011;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3087;-4267.966,-1942.177;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;393;-34.49131,-1010.172;Inherit;False;1664.971;591.2498;;24;1284;372;1281;390;388;370;1291;383;1290;384;382;379;376;360;368;369;1530;1531;1533;1534;1536;1537;2299;2300;Rim/Outline;1,0.141,0.141,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;2898;-1598.962,-1845.728;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;2917;460.3011,-129.2823;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-690.4775,-2173.157;Inherit;False;Property;_SpecularOpacity;Specular Opacity;44;0;Create;True;0;0;0;False;2;Space(5);Header(.  Specular  .);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;584;-76.86915,-58.77988;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;545;-628.1136,-2424.189;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;560.3146,383.4407;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PowerNode;3056;-383.3525,-2193.822;Inherit;False;True;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1530;-20.01568,-966.9301;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-412.2383,-2400.923;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;2839;-1485.907,-2907.568;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2899;-1577.246,-2028.063;Inherit;True;Property;_SpecularMatcap;Specular Matcap;51;0;Create;False;0;0;0;False;0;False;None;5ffad72f50c3f2c43b291ed9ecaee2e8;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.WorldNormalVector;1537;-1.646707,-709.1924;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DesaturateOpNode;581;744.1608,49.20317;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1534;-18.96252,-881.5684;Inherit;False;Property;_Scale1;Rim Normal Power;85;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3086;-4052.398,-1947.429;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3044;-1318.962,-1701.728;Inherit;False;VR MatCap;-1;;162;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;3034;-1318.962,-1845.728;Inherit;False;Matcap (legacy);-1;;163;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2905;-884.0963,-2002.447;Inherit;False;Property;_Legacy2;Legacy;57;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2804;-1306.946,-2906.437;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2900;-1024.563,-1920.773;Inherit;True;Property;_TextureSample3;Texture Sample 3;90;0;Create;True;0;0;0;False;0;False;349;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1533;0.8238602,-802.0875;Inherit;False;Property;_RimNormal;Rim Normal;84;1;[Toggle];Create;True;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2361;-3538.954,-3001.891;Inherit;False;Property;_MotionSpeed;Motion Speed;71;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;2294;-237.3148,-2393.283;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.0001;False;2;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3074;988.0295,68.27046;Inherit;False;MaintexRGB;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;1732;-3629.475,-4429.211;Inherit;True;Property;_SparklePattern;Sparkle Pattern;62;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;794.6351,396.0124;Inherit;False;LightColour;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SaturateNode;3057;-214.0612,-2268.822;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1536;304.6267,-942.9253;Inherit;False;3;0;FLOAT3;0.5,0.5,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2902;-1023.872,-1733.273;Inherit;True;Property;_TextureSample5;Texture Sample 5;90;0;Create;True;0;0;0;False;0;False;349;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;3090;-3901.424,-1945.182;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;2866;-3305.77,-3512.845;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Compare;2904;-663.7876,-1836.726;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;368;234.6099,-535.8052;Inherit;False;Property;_Power;Rim Power;80;0;Create;False;0;0;0;False;0;False;0;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;3093;-3620.81,-3690.243;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3077;1459.413,344.6912;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;3079;-101.6056,-2177.57;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;2834;-1213.565,-3001.629;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;3091;-3715.273,-1943.732;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2862;-3419.041,-3343.502;Float;False;Property;_WorldPosContribution;WorldPos Contribution;69;0;Create;True;0;0;0;False;0;False;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1713;-3414.103,-4228.606;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;2348;-3362.393,-2997.333;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;369;220.3718,-627.3718;Inherit;False;Property;_Scale;Rim Scale;81;0;Create;False;0;0;0;False;0;False;0;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1531;273.6504,-801.9625;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-669.5865,-1667.672;Inherit;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;54;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;816;-67.41862,-2395.936;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2404;-3614.123,-3174.139;Inherit;False;Property;_RotateLinear;Rotate Linear;72;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1918;1650.786,357.5279;Inherit;False;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;3;FLOAT4;0.0001,0.0001,0.0001,0;False;4;FLOAT4;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;3094;-3409.511,-3688.943;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;3080;134.2725,-2183.688;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CosOpNode;2357;-2963.152,-2972.404;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;2349;-2966.437,-3040.098;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2299;456.0557,-622.4279;Inherit;False;Property;_Min;Rim Min;82;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;837;-610.3494,-2088.389;Inherit;False;Property;_SpecMatCapColor;SpecMatCap Colour;55;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;3097;-2130.5,-3014.423;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2405;-3079.619,-3165.648;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;817;-504.8264,-1834.555;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3089;-3545.619,-1947.782;Inherit;False;NormalMatCap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;2942;-3431.611,-3829.53;Inherit;False;VR_ScreenSpaceUV;-1;;164;83887303006e6e7459722034b3b9f189;0;4;97;FLOAT;1;False;98;FLOAT;1;False;99;FLOAT;0;False;100;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;437;373.4562,891.688;Inherit;False;2516.223;776.2;Comment;33;963;1274;405;1278;414;807;406;1516;2180;1279;1517;407;1518;810;408;2165;2166;2176;2175;2181;1930;2207;2208;2209;2210;2873;2919;2920;3042;3035;3109;3112;3113;Matcap > Alpha Supported;0.8221117,0.184,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;3067;248.1226,-2416.205;Inherit;False;Property;_SpecMatCapColor1;Specular Colour;47;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;360;443.4379,-796.7625;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;2472;-3178.436,-4223.361;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;2300;483.0557,-541.4279;Inherit;False;Property;_Max;Rim Max;83;0;Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2863;-3069.544,-3364.771;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2234;69.02734,-2394.958;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2778;-3104.06,-3490.722;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1921;-405.7281,-1722.047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3096;-3387.153,-3903.528;Inherit;False;Property;_StereoCorrect;Stereo Correct;68;0;Create;True;0;1;Linear;0;0;False;1;Toggle(_);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;2406;-3345.04,-3164.095;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;6.27;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3075;176.3427,-2118.086;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2400;-2862.502,-3249.457;Inherit;False;Property;_MotionType;Motion Type;70;1;[Enum];Create;True;0;2;Linear;0;Circular;1;0;False;1;Space(5);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-607.6281,-1918.792;Inherit;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;53;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;963;424.6455,1420.29;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;3095;-3131.911,-3734.842;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NegateNode;1746;-3066.613,-4225.207;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2873;422.2152,1205.173;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2779;-2932.642,-3490.82;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.0075;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2301;253.8365,-2256.963;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;2356;-2815.625,-3013.863;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;1844.679,352.6364;Inherit;False;PostDesaturation;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;3068;472.1685,-2405.141;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2209;596.1299,1577.833;Inherit;False;Property;_MatcapSpin;MatcapSpin;92;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;885;-3252.743,-3587.437;Float;False;Property;_ScreenContribution;Screen Contribution;67;0;Create;True;0;0;0;False;0;False;0.3;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;379;674.0894,-796.4533;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1930;396.7602,1323.333;Inherit;False;Property;_StereoFix;Stereo Converge (flatten);88;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;2403;-2896.227,-3161.953;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3081;390.2725,-2181.688;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;902;-2166.427,-3296.125;Float;False;Property;_SparkleFresnel1;Fresnel Bias, Scale, Power;75;0;Create;False;0;0;0;False;0;False;0,10,0.1;0,10,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;838;-379.7362,-2057.717;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-235.7454,-1832.26;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;376;613.1367,-965.7909;Inherit;False;Property;_RimOutlineColour;Rim/Outline Colour;77;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.6544117,0.3560744,0.448663,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;571;2177.812,309.4184;Inherit;False;1199.604;463.6661;;11;349;627;353;351;1424;1425;1426;1996;1998;1999;2000;VRChat Friends-Only;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCRemapNode;2833;-2081.365,-3153.029;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;952;-7.092504,-1854.65;Inherit;False;Constant;_SpecCap_Null;SpecCap_Null;65;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;865.3638,-884.5739;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2360;-2825.617,-3339.046;Inherit;False;Property;_MotionIntensity;Motion Intensity;73;0;Create;True;0;0;0;False;0;False;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2686;-2925.21,-3665.781;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2841;-1751.871,-3208.453;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;384;671.9878,-620.4361;Inherit;False;Property;_Amount;Rim Opacity;79;0;Create;False;0;0;0;False;0;False;0;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3085;565.7098,-2165.792;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;2208;797.9037,1541.2;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3042;679.5027,1427.81;Inherit;False;VR MatCap;-1;;166;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NegateNode;2865;-2779.77,-3512.845;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2398;-2666.479,-3211.868;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;349;2184.999,581.2747;Inherit;True;Property;_FriendsOnlyRT;> FriendsOnly RenderTexture;97;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;2473;-2921.641,-4226.771;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3064;502.6766,-2281.163;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3035;675.3692,1207.173;Inherit;False;Matcap (legacy);-1;;165;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;700.915,-526.964;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-16.62045,-1991.412;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2002;-107.7466,-2063.491;Inherit;False;Property;_UseSpecularMatCap;Use Specular MatCap;50;0;Create;True;0;0;0;False;3;Toggle(_);Space(5);Header(. Specular Overlay);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;2840;-1756.607,-3117.057;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;2207;988.4868,1418.837;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2864;-2634.77,-3501.845;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2544;-2658.578,-3681.122;Inherit;False;2;2;0;FLOAT2;0.5,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2359;-2513.753,-3382.044;Inherit;False;2;2;0;FLOAT;0.1;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;3072;653.6027,-2322.338;Inherit;False;Property;_SpecularMode;Specular Mode;48;1;[Enum];Create;True;0;2;Additive;0;Multiplied;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;383;863.5611,-789.4644;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;2210;947.3047,1209.274;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1291;887.1605,-962.9463;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TexturePropertyNode;2181;430.7538,925.1613;Inherit;True;Property;_Matcap;Matcap (Alpha Supported);87;0;Create;False;0;0;0;False;0;False;None;5ffad72f50c3f2c43b291ed9ecaee2e8;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.DynamicAppendNode;2806;-1544.991,-3276.802;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3069;711.1685,-2211.141;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;20,20,20;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;370;1025.686,-620.0679;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1424;2471.958,608.8937;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2377;-1733.908,-4618.142;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;2857;-1557.08,-4549.486;Inherit;False;VR_Center_Eye;-1;;167;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;960;-3305.275,-4510.548;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;2001;173.2302,-2043.532;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3101;379.073,-1805.448;Inherit;False;Property;_SpecMatCapMode;SpecMatCap Mode;56;1;[Enum];Create;True;0;2;Additive;0;Multiplied;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2176;1216.404,1252.17;Inherit;True;Property;_Matcap1;;90;0;Create;False;0;0;0;False;0;False;2901;None;ca5f4329374a4554eb5fcb2a1bbd66c2;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;2949;-2805.42,-4294.17;Inherit;False;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;1281;1378.964,-959.7588;Inherit;False;Property;_RimMode;Rim Mode;78;1;[Enum];Create;True;0;3;Blend_Lerp;0;Multiply;1;AddSubtract;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2355;-2286.938,-3655.178;Inherit;False;4;4;0;FLOAT2;0,0;False;1;FLOAT2;0.25,0.25;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Compare;3065;841.861,-2322.36;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2166;1278.499,954.3699;Inherit;False;Property;_Legacy;Legacy;94;0;Create;True;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;2476;-1825.595,-3403.266;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;3107;196.6722,-1644.973;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;388;1187.295,-569.175;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;2955;-2394.781,-4389.675;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;2950;-2503.545,-4361.427;Inherit;False;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TFHCRemapNode;2505;-1375.406,-3277.37;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DistanceOpNode;2379;-1278.948,-4605.155;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;390;1199.985,-761.6016;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;695;-164.3803,-1401.789;Inherit;True;Property;_SpecularMask;Specular Mask;58;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;2372;-1563.788,-3523.686;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;2558;-2898.355,-4330.568;Inherit;False;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.LerpOp;372;1191.051,-953.8661;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;3103;-16.59805,-1596.301;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2175;1166.414,1044.558;Inherit;True;Property;_TextureSample0;Texture Sample 0;90;0;Create;True;0;0;0;False;0;False;2901;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;1425;2281.324,453.0254;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2395;-1105.859,-4591.359;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10000;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;2480;-1375.895,-3377.466;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1514;1678.067,-888.0831;Inherit;False;Property;_UseRim;Use Rim;76;0;Create;True;0;0;0;False;3;Toggle(_);;Header(.  Rim Fresnel  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3071;947.0646,-1771.22;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3108;374.5152,-1700.197;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1295;1178.112,-1581.713;Inherit;False;1534.433;513.8026;;13;450;331;330;329;326;805;462;461;327;808;970;328;1285;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1709;-1412.909,-4056.881;Inherit;False;Property;_SparkleTexColour;SparkleTex Saturation;64;0;Create;False;0;0;0;False;0;False;0;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2998;-1937.085,-3779.219;Inherit;True;TextureSuperSample;-1;;170;23a6a6e8fbe28134cac41513630794b1;0;3;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.FunctionNode;2999;-1959.521,-4233.813;Inherit;True;TextureSuperSample;-1;;169;23a6a6e8fbe28134cac41513630794b1;0;3;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.SamplerNode;2956;-1997.061,-4447.025;Inherit;True;Property;_TextureSample6;Texture Sample 6;100;0;Create;True;0;0;0;False;0;False;695;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ConditionalIfNode;1284;1471.39,-811.4344;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2954;-1679.011,-4076.228;Inherit;False;Property;_SparkleSuperSample;SuperSample (expensive);63;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;351;2454.413,358.424;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;2506;-1198.648,-3278.95;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3104;227.8669,-1618.731;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;1650.314,-747.1198;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Compare;2165;1512.686,989.6039;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2556;-1980.35,-3974.969;Inherit;True;Property;_TextureSample2;Texture Sample 2;100;0;Create;True;0;0;0;False;0;False;695;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;3115;139.5911,-1395.94;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;2919;1643.985,1203.188;Inherit;False;Property;_MatCapColor;MatCap Colour;93;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,0.6650944,0.6650944,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NegateNode;2458;-1339.98,-3461.59;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1518;1852.559,1299.273;Float;False;Property;_MatcapSaturation;Matcap Saturation;91;0;Create;True;0;0;0;False;0;False;1;0.5;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;2440;-949.1075,-3366.626;Inherit;False;Standard;WorldNormal;ViewDir;False;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;824;290.6329,-1484.535;Inherit;False;Property;_SpecMaskOpacity;SpecMatCap Opacity;59;0;Create;False;0;0;0;False;0;False;1;0.005;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;328;1232.592,-1529.267;Inherit;True;Property;_Emission;Emission Map;28;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;3070;544.8622,-1718.579;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2920;1836.649,1202.565;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FresnelNode;2371;-949.2859,-3526.725;Inherit;False;Standard;WorldNormal;ViewDir;False;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;408;1735.079,1074.02;Inherit;False;Property;_MatcapIntensity;Matcap Intensity;90;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2952;-1366.47,-4251.99;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;1710;-1141.289,-4054.098;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;353;2619.176,509.058;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;894;-970.2949,-3850.563;Float;False;Property;_Range;Range;66;0;Create;True;0;0;0;False;0;False;0.3;0;0.05;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2953;-1360.714,-3909.369;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;810;1693.109,955.861;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2396;-954.1793,-4589.258;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;3102;392.5117,-1683.574;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;897;-971.0718,-3928.603;Float;False;Property;_Threshold;Threshold;65;0;Create;True;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3114;318.2871,-1402.517;Inherit;False;True;False;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1513;1896.837,-860.0247;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;3109;1901.668,1474.806;Inherit;True;Property;_MatCapMask;MatCap Mask;95;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;3112;2210.614,1482.216;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;2813;-678.5715,-3379.984;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1517;2153.961,1301.211;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1704;-966.5813,-4122.643;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;558.7178,-1693.717;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;537.5108,-1526.968;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;898;-691.2943,-3902.36;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1705;-968.8975,-4023.922;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;1974.939,1054.194;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;2812;-687.014,-3525.774;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1743;-563.8309,-4342.658;Inherit;True;Property;_SparkleMask1;Sparkle Mask;74;0;Create;False;0;0;0;False;1;Space(5);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1999;2640.491,408.0493;Inherit;False;Property;_FriendsOnly1;Invert Friends Only;98;0;Create;False;0;0;0;False;3;Toggle(_);;;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1292;2059.22,-859.4677;Inherit;False;PostRimLight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2805;-264.2167,-3240.784;Inherit;False;2;2;0;FLOAT;200;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2810;-396.7144,-3706.016;Inherit;False;Constant;_Float0;Float 0;94;0;Create;True;0;0;0;False;0;False;2.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;1537.567,-1527.099;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;627;2761.13,488.6781;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3137;2250.739,-222.2424;Inherit;False;832.0293;300.472;MirrorSystem;5;3160;3159;3168;3142;3140;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;970;1524.552,-1415.231;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;2394;-790.2983,-4582.873;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;406;2232.303,1402.721;Inherit;False;Property;_MatcapOpacity;Matcap Opacity;89;0;Create;True;0;0;0;False;0;False;5;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;1647.938,-1245.289;Float;False;Property;_EmissionColor;Emission Colour;29;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;900;-630.6715,-4106.812;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;875;-431.5964,-3874.255;Float;False;Property;_SparkleColor1;Color;61;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3140;2280.56,-131.4182;Inherit;False;Property;_IsInMirror;In Mirror;100;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3113;2389.31,1475.639;Inherit;False;True;False;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2313;-565.6754,-3927.239;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2180;1582.552,1389.579;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1744;-244.263,-4333.875;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1279;1938.579,945.5255;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;2308;-510.6193,-3526.619;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;560;711.2657,-1601.443;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2801;-248.4582,-3701.65;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2564;-514.9366,-3409.495;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;461;1530.298,-1337.511;Inherit;False;Property;_ShadedEmission;Shaded Emission;31;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1516;2132.321,1084.221;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2264;1648.116,-629.5377;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1426;2890.585,646.5504;Inherit;False;Constant;_FriendsOnly_Null;FriendsOnly_Null;77;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3142;2278.235,-49.58194;Inherit;False;Property;_IsNotMirror;Not Mirror;101;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;1751.053,-1427.133;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Compare;2000;2954.491,467.0493;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1998;2878.466,362.3426;Inherit;False;Property;_FriendsOnly;Friends Only ON/OFF;96;0;Create;False;0;0;0;False;3;Toggle(_);Space(20);Header(VRC Friends Only);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;805;1881.495,-1246.593;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;2291;1831.352,-624.7445;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;807;2548.911,1302.324;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;2327.514,1034.28;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;450;1947.945,-1451.715;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;3159;2671.712,-174.14;Inherit;False;Property;_MirrorSystem;Use Mirror System;99;0;Create;False;0;0;0;False;3;Toggle(_);Space(10);Header(Mirror);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1278;2222.831,926.7556;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SwitchByFaceNode;2437;-304.9372,-3521.361;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;901;-387.2667,-4006.017;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.8,0,0;False;2;FLOAT3;0.85,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;852.0863,-1605.856;Inherit;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1745;-97.95087,-4208.689;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2811;-134.8032,-3818.807;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;3168;2559.604,-95.27997;Inherit;False;VRCMirrorToggle;-1;;191;906fee1dc8310a745a0658d5f2fa3fb4;0;2;5;INT;1;False;6;INT;1;False;1;INT;7
Node;AmplifyShaderEditor.RangedFloatNode;326;1875.891,-1157.456;Float;False;Property;_EmissionIntensity;Emission Intensity;30;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1996;3204.572,350.0397;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3147;3380.668,294.439;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;957;189.8956,-3633.724;Inherit;False;Constant;_Sparkle_Null;Sparkle_Null;66;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;3160;2918.911,-166.6043;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;INT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;2142.448,-1289.363;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;2287;1997.972,-629.599;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;405;2487.972,976.9373;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;877;72.66838,-3774.423;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;1827.217,-533.7396;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2993;-1173.753,-497.1392;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2003;147.5947,-3946.621;Inherit;False;Property;_UseSparkleShimmer;Use Sparkle/Shimmer;60;0;Create;True;0;0;0;False;3;Toggle(_);Space(5);Header(.  Sparkles  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;330;2129.723,-1149.804;Float;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3144;3168.178,-151.1746;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2004;365.0571,-3808.012;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;331;2323.342,-1248.401;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3058;2166.59,-518.0479;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;10,10,10;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1274;2686.021,972.123;Inherit;False;PostMatcap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2284;2203.972,-625.599;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;-970.6683,-494.0467;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2163;2152.229,-932.084;Inherit;False;1274;PostMatcap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;3146;3283.238,-174.4152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;2280;2357.972,-607.5985;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;334;2207.65,-410.3355;Inherit;False;Property;_Alpha;Alpha;9;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;2304.434,-335.2882;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;971;557.0648,-3810.448;Inherit;False;SparkleOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;2477.611,-1246.415;Inherit;False;Emission;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1021;2188.035,-1013.522;Inherit;False;Property;_UseMatcap;Use Matcap;86;0;Create;True;0;0;0;False;3;Toggle(_);Space(10);Header(.  MatCap  .);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1022;2470.695,-931.1481;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;3145;3059.669,-310.6737;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1294;2423.846,-690.4126;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2290;2547.845,-587.4398;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;10,10,10;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;2525.688,-317.4168;Inherit;False;Property;_Cutoff;Alpha Cutoff;10;0;Create;False;0;0;0;True;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;2516.751,-417.5501;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1702;2419.217,-495.7396;Inherit;False;971;SparkleOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ClipNode;1430;3137.46,-463.9726;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2807.245,-579.6193;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1346;2859.333,-1342.923;Inherit;False;670.9946;746.3742;custom properties;13;1345;1335;1344;1342;1431;1340;1339;1337;1432;1343;1338;1341;1469;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1344;2882.237,-914.3182;Float;False;Property;_ZTestMode;ZTestMode (LEqual);103;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1342;3202.625,-1136.015;Inherit;False;Property;_StencilFail;StencilFail;109;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1431;2886.58,-820.4198;Inherit;False;Property;_SrcBlend;Source Blend (One);111;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;2882.479,-1280.823;Half;False;Property;_StencilRef;Stencil ID;104;0;Create;False;0;0;0;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2478;-1850.895,-3479.466;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1335;3215.875,-918.9951;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3151.765,-825.441;Inherit;False;Property;_DstBlend;Destination Blend (Zero);112;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1923;3354.73,-577.434;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;2876.299,-1194.834;Half;False;Property;_ReadMask;ReadMask (non-zero);106;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-3863.645,-1257.62;Inherit;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;2875.299,-1112.257;Half;False;Property;_WriteMask;WriteMask (non-zero);105;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1343;3201.625,-1061.015;Inherit;False;Property;_StencilZFail;StencilZFail;110;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SamplerNode;2901;-1088.408,-1536.403;Inherit;True;Property;_TextureSample4;Texture Sample 4;91;0;Create;True;0;0;0;False;0;False;349;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3099;3610.803,-975.708;Inherit;False;Property;_outline_width;_outline_width;1;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-3907.077,-1671.387;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1560;-4223.124,45.83719;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.005;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1341;3206.338,-1208.357;Inherit;False;Property;_StencilOp;StencilOp;108;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1469;2892.559,-694.9409;Inherit;False;Property;_AlphaToCoverage;AlphaToCoverage (override alpha);8;1;[ToggleUI];Create;False;0;0;0;True;1;Space (5);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;2886.308,-1002.382;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);102;1;[ToggleUI];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3098;3608.803,-1048.708;Inherit;False;Property;_VRCFallbackDoublesided;VRC Fallback Doublesided;2;0;Create;True;0;0;0;True;1;Toggle(TINTED_OUTLINE);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1340;3181.625,-1281.015;Inherit;False;Property;_StencilComparison;Stencil Comparison;107;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1924;3771.631,-578.6443;Float;False;True;-1;2;ASEMaterialInspector;100;1;.GenesisAria/Arias Toon Shader WIP;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;1;1;True;1431;0;True;1432;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;True;1469;False;True;0;True;1335;True;True;True;True;True;False;0;False;-1;False;False;False;False;False;False;False;True;True;255;True;1337;255;True;1338;255;True;1339;7;True;1340;1;True;1341;1;True;1342;1;True;1343;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;1345;True;3;True;1344;True;False;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;2;Include;;False;;Native;Include;AutoLight.cginc;False;;Custom;Standard;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;1878;0;2937;16
WireConnection;1878;1;2937;17
WireConnection;1878;2;2937;18
WireConnection;1878;3;2937;20
WireConnection;1551;0;1878;0
WireConnection;1886;0;2937;23
WireConnection;1886;1;2937;29
WireConnection;1886;2;2937;30
WireConnection;1886;3;2937;31
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;1891;0;1551;3
WireConnection;2014;0;1886;0
WireConnection;1890;0;1589;0
WireConnection;1879;0;2014;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;3012;0;603;0
WireConnection;3014;0;428;0
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;3062;0;3059;1
WireConnection;3013;0;428;0
WireConnection;2958;0;2957;0
WireConnection;2958;5;3014;0
WireConnection;1665;0;1905;0
WireConnection;3049;1;2957;0
WireConnection;3049;49;3012;0
WireConnection;2148;0;2147;0
WireConnection;2961;0;2962;0
WireConnection;2961;2;3049;0
WireConnection;2961;3;2958;0
WireConnection;2154;0;2153;0
WireConnection;3061;0;3062;0
WireConnection;3061;1;3013;0
WireConnection;1246;0;1232;2
WireConnection;1246;1;2148;0
WireConnection;430;1;2961;0
WireConnection;430;2;3061;0
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;2144;0;2121;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;2151;0;2152;0
WireConnection;2151;2;2154;0
WireConnection;2151;3;2150;0
WireConnection;2140;0;2121;0
WireConnection;2140;1;1490;0
WireConnection;2140;2;2144;0
WireConnection;1235;0;430;0
WireConnection;2635;0;248;0
WireConnection;2635;1;2852;2
WireConnection;1876;0;633;1
WireConnection;1876;1;633;2
WireConnection;2017;0;2937;0
WireConnection;1233;0;1247;0
WireConnection;2159;0;2151;0
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;2635;0
WireConnection;1383;0;2017;0
WireConnection;1383;1;2159;0
WireConnection;2034;0;2140;0
WireConnection;962;0;1235;0
WireConnection;1382;0;1383;0
WireConnection;2215;0;1076;0
WireConnection;2026;0;2034;0
WireConnection;2035;1;2026;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;5;0;1165;0
WireConnection;5;1;2215;0
WireConnection;1296;0;5;0
WireConnection;1389;0;1381;0
WireConnection;2025;0;2035;0
WireConnection;2033;0;2025;0
WireConnection;1994;0;1480;0
WireConnection;1994;1;1297;0
WireConnection;1994;2;2033;0
WireConnection;1684;0;2937;20
WireConnection;1684;1;2937;31
WireConnection;1631;0;2937;18
WireConnection;1631;1;2937;30
WireConnection;1630;0;2937;17
WireConnection;1630;1;2937;29
WireConnection;1629;0;2937;16
WireConnection;1629;1;2937;23
WireConnection;1059;0;1058;0
WireConnection;1059;2;1994;0
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;1683;0;1682;0
WireConnection;1106;0;1059;0
WireConnection;1106;1;1107;0
WireConnection;1491;0;1382;0
WireConnection;1118;0;149;0
WireConnection;1118;1;1106;0
WireConnection;1118;2;2211;1
WireConnection;1908;1;1910;0
WireConnection;1908;0;1683;0
WireConnection;1406;0;1908;0
WireConnection;1254;0;1118;0
WireConnection;2082;0;2081;2
WireConnection;2213;0;2217;0
WireConnection;2213;1;2216;0
WireConnection;2213;2;2033;0
WireConnection;1125;0;1254;0
WireConnection;1125;1;1254;0
WireConnection;1486;0;1484;1
WireConnection;1486;1;1484;2
WireConnection;1486;2;2082;0
WireConnection;1499;0;641;0
WireConnection;2218;0;2213;0
WireConnection;32;1;1125;0
WireConnection;1489;0;1486;0
WireConnection;1489;1;1408;0
WireConnection;1489;2;3135;0
WireConnection;1032;0;1008;0
WireConnection;1507;0;1506;1
WireConnection;1507;1;1506;2
WireConnection;1033;0;1032;0
WireConnection;1033;1;32;0
WireConnection;662;0;1123;0
WireConnection;662;2;1499;0
WireConnection;662;3;642;0
WireConnection;3011;0;603;0
WireConnection;1504;0;1605;0
WireConnection;1504;2;1507;0
WireConnection;1504;3;1505;0
WireConnection;1914;0;1489;0
WireConnection;1914;1;1916;0
WireConnection;1914;2;1915;0
WireConnection;1010;0;1008;0
WireConnection;815;0;1033;0
WireConnection;2867;0;1914;0
WireConnection;2867;1;2870;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;2997;1;2982;0
WireConnection;3060;0;3059;1
WireConnection;3060;1;3011;0
WireConnection;2984;0;2982;0
WireConnection;1304;0;1504;0
WireConnection;645;0;1123;0
WireConnection;645;4;1492;0
WireConnection;645;2;641;0
WireConnection;645;3;642;0
WireConnection;682;0;662;0
WireConnection;1064;0;684;0
WireConnection;1064;1;1304;0
WireConnection;811;0;646;0
WireConnection;1026;0;1025;0
WireConnection;1026;2;1016;0
WireConnection;1026;3;815;0
WireConnection;2085;0;2867;0
WireConnection;2987;0;2988;0
WireConnection;2987;2;2997;0
WireConnection;2987;3;2984;0
WireConnection;654;0;645;0
WireConnection;602;1;2961;0
WireConnection;602;2;3060;0
WireConnection;664;0;682;0
WireConnection;813;0;18;0
WireConnection;665;0;654;0
WireConnection;665;1;664;0
WireConnection;1234;0;602;0
WireConnection;3117;0;2085;0
WireConnection;3117;1;2085;1
WireConnection;979;0;1026;0
WireConnection;670;0;645;0
WireConnection;3118;0;2085;1
WireConnection;3118;1;2085;2
WireConnection;680;0;1064;0
WireConnection;679;0;811;0
WireConnection;812;0;2987;0
WireConnection;1470;0;1106;0
WireConnection;344;0;1470;0
WireConnection;344;1;335;0
WireConnection;1036;0;1035;0
WireConnection;1036;2;680;0
WireConnection;1036;3;679;0
WireConnection;19;0;812;0
WireConnection;19;1;813;0
WireConnection;2224;0;2225;0
WireConnection;2224;2;2853;2
WireConnection;2224;3;1909;0
WireConnection;669;0;665;0
WireConnection;669;2;670;0
WireConnection;3119;0;3117;0
WireConnection;3119;1;3118;0
WireConnection;3055;0;1234;0
WireConnection;660;0;1036;0
WireConnection;660;2;669;0
WireConnection;2909;0;19;0
WireConnection;2237;0;2224;0
WireConnection;2237;1;2219;0
WireConnection;2109;0;3119;0
WireConnection;2109;1;2085;3
WireConnection;965;0;3055;0
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;2975;0;2976;0
WireConnection;2975;2;660;0
WireConnection;2975;3;954;0
WireConnection;30;0;346;0
WireConnection;2236;1;546;0
WireConnection;2911;0;2910;0
WireConnection;2911;1;2909;1
WireConnection;1783;0;2237;0
WireConnection;2093;0;2109;0
WireConnection;3121;0;3120;0
WireConnection;1500;0;30;0
WireConnection;1500;1;2975;0
WireConnection;553;0;2236;0
WireConnection;2426;0;2424;0
WireConnection;2426;1;2425;0
WireConnection;2098;0;2093;0
WireConnection;2098;4;3121;0
WireConnection;582;0;1330;0
WireConnection;2918;0;325;0
WireConnection;586;0;585;0
WireConnection;2908;0;2911;0
WireConnection;2908;1;2909;2
WireConnection;2908;2;2909;3
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;556;1;555;0
WireConnection;2289;0;1500;0
WireConnection;2503;0;2426;0
WireConnection;1777;0;2867;0
WireConnection;1777;1;2098;0
WireConnection;3087;0;3088;0
WireConnection;3087;1;3059;1
WireConnection;2917;0;2908;0
WireConnection;2917;1;2918;0
WireConnection;584;0;582;0
WireConnection;584;1;586;0
WireConnection;545;0;551;0
WireConnection;545;1;553;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;2289;0
WireConnection;3056;0;561;0
WireConnection;554;0;545;0
WireConnection;554;1;556;0
WireConnection;2839;0;2503;0
WireConnection;581;0;2917;0
WireConnection;581;1;584;0
WireConnection;3086;1;2961;0
WireConnection;3086;2;3087;0
WireConnection;3044;21;967;0
WireConnection;3044;27;1928;0
WireConnection;3034;9;2898;0
WireConnection;3034;45;1928;0
WireConnection;2804;0;2839;0
WireConnection;2900;0;2899;0
WireConnection;2900;1;3034;0
WireConnection;2294;0;554;0
WireConnection;3074;0;581;0
WireConnection;968;0;1922;0
WireConnection;3057;0;3056;0
WireConnection;1536;0;1537;0
WireConnection;1536;1;1530;0
WireConnection;1536;2;1534;0
WireConnection;2902;0;2899;0
WireConnection;2902;1;3044;0
WireConnection;3090;0;3086;0
WireConnection;2904;0;2905;0
WireConnection;2904;2;2900;0
WireConnection;2904;3;2902;0
WireConnection;3077;0;3074;0
WireConnection;3077;1;968;0
WireConnection;2834;0;2804;0
WireConnection;3091;0;3090;0
WireConnection;1713;2;1732;0
WireConnection;2348;0;2361;0
WireConnection;1531;0;1533;0
WireConnection;1531;2;1536;0
WireConnection;1531;3;1537;0
WireConnection;816;1;2294;0
WireConnection;816;2;3057;0
WireConnection;1918;0;3077;0
WireConnection;3094;0;3093;0
WireConnection;3080;0;3079;0
WireConnection;2357;0;2348;0
WireConnection;2349;0;2348;0
WireConnection;3097;0;2834;0
WireConnection;2405;0;2348;0
WireConnection;817;0;2904;0
WireConnection;3089;0;3091;0
WireConnection;360;0;1531;0
WireConnection;360;2;369;0
WireConnection;360;3;368;0
WireConnection;2472;0;1713;0
WireConnection;2863;0;2862;0
WireConnection;2234;0;816;0
WireConnection;2234;1;816;0
WireConnection;2234;2;816;0
WireConnection;2778;0;2866;1
WireConnection;2778;1;2866;2
WireConnection;2778;2;2866;3
WireConnection;1921;0;1919;0
WireConnection;2406;0;2404;0
WireConnection;3095;0;3096;0
WireConnection;3095;2;2942;0
WireConnection;3095;3;3094;0
WireConnection;1746;0;2472;0
WireConnection;2779;0;2778;0
WireConnection;2779;1;2863;0
WireConnection;2301;0;2234;0
WireConnection;2356;0;2349;0
WireConnection;2356;1;2357;0
WireConnection;1276;0;1918;0
WireConnection;3068;0;3067;0
WireConnection;379;0;360;0
WireConnection;379;1;2299;0
WireConnection;379;2;2300;0
WireConnection;2403;0;2405;0
WireConnection;2403;2;2406;0
WireConnection;3081;0;3080;0
WireConnection;3081;1;3075;0
WireConnection;838;0;837;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;2833;0;3097;0
WireConnection;382;0;376;0
WireConnection;382;1;379;0
WireConnection;2686;0;3095;0
WireConnection;2686;1;885;0
WireConnection;2841;0;902;2
WireConnection;2841;1;2833;0
WireConnection;3085;0;3081;0
WireConnection;3085;1;3075;0
WireConnection;2208;0;2209;0
WireConnection;3042;21;963;0
WireConnection;3042;27;1930;0
WireConnection;2865;0;2779;0
WireConnection;2398;0;2400;0
WireConnection;2398;2;2356;0
WireConnection;2398;3;2403;0
WireConnection;2473;0;1746;0
WireConnection;2473;1;2472;1
WireConnection;3064;0;3068;0
WireConnection;3064;1;2301;0
WireConnection;3035;9;2873;0
WireConnection;3035;45;1930;0
WireConnection;690;0;1920;0
WireConnection;690;1;691;0
WireConnection;690;2;838;0
WireConnection;2840;0;902;3
WireConnection;2840;1;2833;0
WireConnection;2207;0;3042;0
WireConnection;2207;2;2208;0
WireConnection;2864;0;2865;0
WireConnection;2864;1;2779;0
WireConnection;2544;0;2473;0
WireConnection;2544;1;2686;0
WireConnection;2359;0;2360;0
WireConnection;2359;1;2398;0
WireConnection;383;0;379;0
WireConnection;383;1;384;0
WireConnection;2210;0;3035;0
WireConnection;2210;2;2208;0
WireConnection;2806;0;902;1
WireConnection;2806;1;2841;0
WireConnection;2806;2;2840;0
WireConnection;3069;0;3064;0
WireConnection;3069;1;3085;0
WireConnection;370;0;382;0
WireConnection;370;1;1290;0
WireConnection;1424;0;349;1
WireConnection;1424;1;349;2
WireConnection;1424;2;349;3
WireConnection;960;2;1732;0
WireConnection;2001;0;2002;0
WireConnection;2001;2;690;0
WireConnection;2001;3;952;0
WireConnection;2176;0;2181;0
WireConnection;2176;1;2207;0
WireConnection;2949;0;1732;0
WireConnection;2355;0;2544;0
WireConnection;2355;2;2359;0
WireConnection;2355;3;2864;0
WireConnection;3065;0;3072;0
WireConnection;3065;2;3064;0
WireConnection;3065;3;3069;0
WireConnection;3107;0;2001;0
WireConnection;388;0;1290;0
WireConnection;388;1;370;0
WireConnection;388;2;384;0
WireConnection;2955;0;960;0
WireConnection;2950;0;1732;0
WireConnection;2505;0;2806;0
WireConnection;2379;0;2377;0
WireConnection;2379;1;2857;0
WireConnection;390;0;1291;0
WireConnection;390;1;382;0
WireConnection;390;2;383;0
WireConnection;2558;0;1732;0
WireConnection;372;0;1291;0
WireConnection;372;1;382;0
WireConnection;372;2;383;0
WireConnection;2175;0;2181;0
WireConnection;2175;1;2210;0
WireConnection;1425;0;1424;0
WireConnection;2395;0;2379;0
WireConnection;2480;0;2476;0
WireConnection;3071;0;3065;0
WireConnection;3108;0;3101;0
WireConnection;2998;4;2355;0
WireConnection;2998;1;2949;0
WireConnection;2999;4;2955;0
WireConnection;2999;1;2950;0
WireConnection;2956;0;1732;0
WireConnection;2956;1;960;0
WireConnection;1284;0;1281;0
WireConnection;1284;2;388;0
WireConnection;1284;3;390;0
WireConnection;1284;4;372;0
WireConnection;351;0;1425;0
WireConnection;2506;0;2505;0
WireConnection;3104;0;3107;0
WireConnection;3104;1;3103;0
WireConnection;2165;0;2166;0
WireConnection;2165;2;2175;0
WireConnection;2165;3;2176;0
WireConnection;2556;0;2558;0
WireConnection;2556;1;2355;0
WireConnection;3115;0;695;0
WireConnection;2458;0;2372;0
WireConnection;2440;0;2458;0
WireConnection;2440;4;2480;0
WireConnection;2440;1;2506;0
WireConnection;2440;2;2506;1
WireConnection;2440;3;2506;2
WireConnection;3070;0;3071;0
WireConnection;2920;0;2919;0
WireConnection;2371;0;2372;0
WireConnection;2371;4;2480;0
WireConnection;2371;1;2506;0
WireConnection;2371;2;2506;1
WireConnection;2371;3;2506;2
WireConnection;2952;0;2954;0
WireConnection;2952;2;2999;0
WireConnection;2952;3;2956;0
WireConnection;1710;0;1709;0
WireConnection;353;0;351;0
WireConnection;2953;0;2954;0
WireConnection;2953;2;2998;0
WireConnection;2953;3;2556;0
WireConnection;810;0;2165;0
WireConnection;2396;0;2395;0
WireConnection;3102;0;3108;0
WireConnection;3102;2;2001;0
WireConnection;3102;3;3104;0
WireConnection;3114;0;3115;0
WireConnection;1513;0;1514;0
WireConnection;1513;2;1284;0
WireConnection;1513;3;1515;0
WireConnection;3112;0;3109;0
WireConnection;2813;0;2440;0
WireConnection;1517;0;1518;0
WireConnection;1704;0;2952;0
WireConnection;1704;1;1710;0
WireConnection;701;0;3070;0
WireConnection;701;1;3102;0
WireConnection;696;0;3114;0
WireConnection;696;1;824;0
WireConnection;898;0;897;0
WireConnection;898;1;894;0
WireConnection;1705;0;2953;0
WireConnection;1705;1;1710;0
WireConnection;407;0;810;0
WireConnection;407;1;408;0
WireConnection;407;2;2920;0
WireConnection;2812;0;2371;0
WireConnection;1292;0;1513;0
WireConnection;2805;1;2804;0
WireConnection;808;0;328;0
WireConnection;627;0;353;0
WireConnection;2394;0;2396;0
WireConnection;900;0;1704;0
WireConnection;900;1;1705;0
WireConnection;900;2;2394;0
WireConnection;3113;0;3112;0
WireConnection;2313;0;898;0
WireConnection;2180;0;2165;0
WireConnection;1744;0;1743;0
WireConnection;2308;0;2812;0
WireConnection;560;1;701;0
WireConnection;560;2;696;0
WireConnection;2801;0;2810;0
WireConnection;2801;1;2805;0
WireConnection;2564;0;2813;0
WireConnection;1516;0;407;0
WireConnection;1516;1;1517;0
WireConnection;462;0;808;0
WireConnection;462;1;970;0
WireConnection;2000;0;1999;0
WireConnection;2000;2;627;0
WireConnection;2000;3;353;0
WireConnection;805;0;327;0
WireConnection;2291;0;2264;0
WireConnection;807;0;2180;0
WireConnection;807;1;406;0
WireConnection;807;2;3113;0
WireConnection;414;0;1279;0
WireConnection;414;1;1516;0
WireConnection;450;0;808;0
WireConnection;450;1;462;0
WireConnection;450;2;461;0
WireConnection;2437;0;2308;0
WireConnection;2437;1;2564;0
WireConnection;901;0;900;0
WireConnection;901;1;897;0
WireConnection;901;2;2313;0
WireConnection;983;0;560;0
WireConnection;1745;0;1744;0
WireConnection;1745;1;1743;4
WireConnection;2811;0;875;0
WireConnection;2811;1;2801;0
WireConnection;3168;5;3140;0
WireConnection;3168;6;3142;0
WireConnection;1996;0;1998;0
WireConnection;1996;2;2000;0
WireConnection;1996;3;1426;0
WireConnection;3147;0;1996;0
WireConnection;3160;0;3159;0
WireConnection;3160;2;3168;7
WireConnection;329;0;450;0
WireConnection;329;1;805;0
WireConnection;329;2;326;0
WireConnection;2287;0;2291;0
WireConnection;405;0;1278;0
WireConnection;405;1;414;0
WireConnection;405;2;807;0
WireConnection;877;0;1745;0
WireConnection;877;1;2811;0
WireConnection;877;2;901;0
WireConnection;877;3;2437;0
WireConnection;2993;0;2987;0
WireConnection;3144;0;3160;0
WireConnection;3144;1;3147;0
WireConnection;2004;0;2003;0
WireConnection;2004;2;877;0
WireConnection;2004;3;957;0
WireConnection;331;0;329;0
WireConnection;331;2;330;0
WireConnection;3058;0;1701;0
WireConnection;1274;0;405;0
WireConnection;2284;0;2287;0
WireConnection;2284;1;1701;0
WireConnection;1262;0;2993;0
WireConnection;3146;0;3144;0
WireConnection;2280;0;2284;0
WireConnection;2280;1;1701;0
WireConnection;2280;2;3058;0
WireConnection;971;0;2004;0
WireConnection;1285;0;331;0
WireConnection;1022;0;1021;0
WireConnection;1022;2;2163;0
WireConnection;1022;3;1292;0
WireConnection;3145;0;3146;0
WireConnection;2290;0;2280;0
WireConnection;333;0;334;0
WireConnection;333;1;1265;0
WireConnection;1430;0;333;0
WireConnection;1430;1;3145;0
WireConnection;1430;2;1433;0
WireConnection;470;0;1022;0
WireConnection;470;1;1294;0
WireConnection;470;2;2290;0
WireConnection;470;3;1702;0
WireConnection;1923;0;470;0
WireConnection;1923;3;1430;0
WireConnection;1861;0;430;0
WireConnection;1856;0;602;0
WireConnection;1560;2;1480;0
WireConnection;1560;3;1297;0
WireConnection;1924;0;1923;0
ASEEND*/
//CHKSM=BB68BF9DDAF12DB71D179584D069D64D5AFCB11D
