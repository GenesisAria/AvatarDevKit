// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Arias Toon Shader WIP"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[Header(.  Main  .)]_MainTex("Texture", 2D) = "white" {}
		[HDR]_Color("> Color", Color) = (1,1,1,1)
		_Hue("Hue", Range( 0 , 1)) = 0
		_Saturation("Saturation", Range( -2 , 5)) = 1
		[Toggle][Space (5)]_AlphaToCoverage("AlphaToCoverage (override alpha)", Float) = 0
		_Alpha("Alpha", Range( 0 , 1)) = 1
		_Cutoff("Alpha Cutoff", Float) = 0
		_LightMultiplier("Light Multiplier", Float) = 1.1
		_BakedLightContrib("Baked Light Contrib", Float) = 0.8
		_MaxLight("Max Light", Float) = 0.9
		_MinLight("Min Light", Float) = 0.9
		[Space(5)][Header(.  Shadow  .)][Toggle(_)]_UseShading("Use Shading", Float) = 1
		[Enum(Surface,0,World2Object,1)]_LightMode("Lighting Mode", Float) = 0
		[Enum(Ramp_Texture,0,Linear_Gradient,1)]_GradientorRamp("Gradient or Ramp", Float) = 1
		_ShadowColour("Shadow Colour", Color) = (0.7098039,0.7098039,0.7098039,1)
		_Ramp("Ramp", 2D) = "white" {}
		_OffsetDot("Offset Dot", Range( -1 , 1)) = 0
		_ShadowSharpness1("Shadow Sharpness", Float) = 1
		_ShadowDarkness("Shadow Darkness", Float) = 0.22
		_ShadowSaturation("Shadow Saturation", Range( -2 , 2)) = 0.85
		_LightMask("Light Mask", 2D) = "white" {}
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.68
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.09
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.44
		[Space(5)][Header(.  Emission  .)]_Emission("Emission Map", 2D) = "black" {}
		[HDR]_EmissionColor("Emission Colour", Color) = (0,0,0,0)
		_EmissionIntensity("Emission Intensity", Float) = 1
		_ShadedEmission("Shaded Emission", Float) = 0
		[Normal][Space(5)][Header(.  Normals  .)]_Normal("Normal", 2D) = "bump" {}
		_NormalPower("Normal Power", Range( 0 , 1)) = 0
		_NormalPowerSpecular("Normal Power Specular", Range( 0 , 1)) = 0.5
		[Space(5)][Header(.  Soft Shading  .)][Toggle]_ShadeEnable("Shade Enable", Float) = 1
		[Enum(FixedColour,0,LightColour,1)]_ShadeColorDynamic("ShadeColor Dynamic", Float) = 1
		_ShadeColour("Shade Colour", Color) = (0,0,0,0)
		_ShadePower("Shade Power", Range( 0 , 2)) = 0
		_ShadeScale("Shade Scale", Range( 2 , 200)) = 0
		_MultiplyDynamic("MultiplyDynamic", Range( 0 , 1)) = 0.75
		[Space(5)][Header(.  Specular  .)]_SpecularOpacity("Specular Opacity", Range( 0 , 1)) = 1
		_SpecularSize("Specular Size", Range( 0 , 10)) = 1
		_SpecularStrength("Specular Strength", Float) = 0
		[Toggle(_)]_StereoFixSpec("Stereo Converge (flatten)", Float) = 0
		[Toggle(_)][Space(5)][Header(. Specular Overlay)]_UseSpecularMatCap("Use Specular MatCap", Float) = 0
		_SpecularMatcap("Specular Matcap", 2D) = "black" {}
		[Toggle(_)]_StereoFixSpecCap("Stereo Converge (flatten)", Float) = 0
		_SpecMatcapMultiply("SpecMatcap Multiply", Float) = 1
		_SpecMatcapSaturation("SpecMatcap Saturation", Float) = 1
		[HDR]_SpecMatCapColor("SpecMatCap Colour", Color) = (1,1,1,1)
		[Toggle(_)]_Legacy2("Legacy", Float) = 0
		[Space(10)]_SpecularMask("Specular Mask", 2D) = "white" {}
		_SpecMaskOpacity("SpecMask Opacity", Float) = 1
		_SpecMatCapNorm("SpecMatCap Norm", 2D) = "white" {}
		[Toggle(_)][Space(5)][Header(.  Sparkles  .)]_UseSparkles("Use Sparkles", Float) = 0
		[HDR]_SparkleColor1("Color", Color) = (1,1,1,0)
		_SparklePattern("Sparkle Pattern", 2D) = "black" {}
		_SparkleTexColour("SparkleTex Colour", Range( 0 , 1)) = 0
		_Threshold("Threshold", Range( 0 , 1)) = 0
		_Range("Range", Range( 0.05 , 1)) = 0.3
		_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.3
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
		[Toggle(_)][Space(20)][Header(VRC Friends Only)]_FriendsOnly("Friends Only ON/OFF", Float) = 0
		_FriendsOnlyRT("> FriendsOnly RenderTexture", 2D) = "white" {}
		[Toggle(_)]_FriendsOnly1("Invert Friends Only", Float) = 0
		[Toggle][Space(10)][Header(.  Advanced  .)]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space(5)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask", Float) = 0
		_ReadMask("ReadMask", Float) = 0
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
			#include "Lighting.cginc"
			#include "UnityShaderVariables.cginc"
			#include "UnityStandardUtils.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#pragma multi_compile __ VERTEXLIGHT_ON
			#pragma instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap forwardadd
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _StencilRef;
			uniform float _DstBlend;
			uniform float _AlphaToCoverage;
			uniform int _Culling;
			uniform int _StencilFail;
			uniform float _ZWriteMode;
			uniform half _ReadMask;
			uniform int _StencilComparison;
			uniform float _ZTestMode;
			uniform float _SrcBlend;
			uniform int _StencilOp;
			uniform int _StencilZFail;
			uniform half _WriteMask;
			uniform float _UseMatcap;
			uniform float _UseRim;
			uniform float _RimMode;
			uniform float _Hue;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _Color;
			uniform float _BakedLightContrib;
			uniform float _MinLight;
			uniform float _MaxLight;
			uniform float _LightMultiplier;
			uniform float _GradientorRamp;
			uniform float4 _ShadowColour;
			uniform float _ShadowSharpness1;
			uniform float _UseShading;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform float _NormalPower;
			uniform float _StaticLightX;
			uniform float _StaticLightY;
			uniform float _StaticLightZ;
			uniform float _LightMode;
			uniform float _OffsetDot;
			uniform sampler2D _LightMask;
			uniform float4 _LightMask_ST;
			uniform sampler2D _Ramp;
			uniform float _ShadowDarkness;
			uniform float _ShadeEnable;
			uniform float _ShadeColorDynamic;
			uniform float _MultiplyDynamic;
			uniform float4 _ShadeColour;
			uniform float _ShadeScale;
			uniform float _ShadePower;
			uniform float _Saturation;
			uniform float _ShadowSaturation;
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
			uniform float _MatcapSpin;
			uniform float _MatcapIntensity;
			uniform float4 _MatCapColor;
			uniform float _MatcapSaturation;
			uniform float _MatcapOpacity;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;
			uniform float _ShadedEmission;
			uniform float4 _EmissionColor;
			uniform float _EmissionIntensity;
			uniform float _StereoFixSpec;
			uniform float _NormalPowerSpecular;
			uniform float _SpecularSize;
			uniform float _SpecularStrength;
			uniform float _SpecularOpacity;
			uniform float _UseSpecularMatCap;
			uniform float _Legacy2;
			uniform sampler2D _SpecularMatcap;
			uniform float _StereoFixSpecCap;
			uniform float _SpecMatcapSaturation;
			uniform float _SpecMatcapMultiply;
			uniform float4 _SpecMatCapColor;
			uniform sampler2D _SpecularMask;
			uniform sampler2D _SpecMatCapNorm;
			uniform float _SpecMaskOpacity;
			uniform float _UseSparkles;
			uniform sampler2D _SparkleMask1;
			uniform float4 _SparkleMask1_ST;
			uniform float4 _SparkleColor1;
			uniform float _Threshold;
			uniform float _Range;
			uniform sampler2D _SparklePattern;
			uniform float4 _SparklePattern_ST;
			uniform float _SparkleTexColour;
			uniform float _ScreenContribution;
			uniform float _MotionIntensity;
			uniform float _MotionType;
			uniform float _MotionSpeed;
			uniform float _RotateLinear;
			uniform float _WorldPosContribution;
			uniform float3 _SparkleFresnel1;
			uniform float _Alpha;
			uniform float _FriendsOnly;
			uniform float _FriendsOnly1;
			uniform sampler2D _FriendsOnlyRT;
			uniform float4 _FriendsOnlyRT_ST;
			uniform float _Cutoff;
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
			float4 VertexLightCol114_g8(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightPosX3_g8(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g8(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g8(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g8(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol215_g8(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g8(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g8(  )
			{
				return unity_LightColor[3];
			}
			
			float3 ShadeSH9bakedlight1488( float3 x )
			{
				return ShadeSH9(half4(x, 1));
			}
			
			float3 CenterEye1_g9(  )
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
			
			float3 CenterEye46_g51(  )
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
			
			float3 CenterEye16_g52(  )
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
			
			float3 CenterEye1_g10(  )
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
			
			float3 CenterEye46_g48(  )
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
			
			float3 CenterEye16_g47(  )
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
			
			float3 CenterEye16_g55(  )
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
			
			float3 CenterEye72_g53(  )
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
			
			float3 CenterEye1_g54(  )
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
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode10 = tex2D( _MainTex, uv_MainTex );
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float4 localVertexLightCol114_g8 = VertexLightCol114_g8();
				float4 temp_output_2079_16 = localVertexLightCol114_g8;
				float4 localVertexLightPosX3_g8 = VertexLightPosX3_g8();
				float4 break4_g8 = localVertexLightPosX3_g8;
				float4 localVertexLightPosY2_g8 = VertexLightPosY2_g8();
				float4 break5_g8 = localVertexLightPosY2_g8;
				float4 localVertexLightPosZ1_g8 = VertexLightPosZ1_g8();
				float4 break6_g8 = localVertexLightPosZ1_g8;
				float3 appendResult7_g8 = (float3(break4_g8.x , break5_g8.x , break6_g8.x));
				float3 pos188_g8 = appendResult7_g8;
				float3 objToWorld139_g8 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_155_0_g8 = pow( distance( pos188_g8 , objToWorld139_g8 ) , 2.0 );
				float4 localVertexLightAttenuation86_g8 = VertexLightAttenuation86_g8();
				float4 break87_g8 = localVertexLightAttenuation86_g8;
				float attenx96_g8 = break87_g8.x;
				float temp_output_60_0_g8 = saturate( ( 1.0 - ( ( temp_output_155_0_g8 * attenx96_g8 ) / 25.0 ) ) );
				float temp_output_2079_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g8 ) * attenx96_g8 ) ) , ( temp_output_60_0_g8 * temp_output_60_0_g8 ) );
				float4 localVertexLightCol215_g8 = VertexLightCol215_g8();
				float4 temp_output_2079_17 = localVertexLightCol215_g8;
				float3 appendResult8_g8 = (float3(break4_g8.y , break5_g8.y , break6_g8.y));
				float3 pos290_g8 = appendResult8_g8;
				float3 objToWorld140_g8 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_75_0_g8 = pow( distance( pos290_g8 , objToWorld140_g8 ) , 2.0 );
				float atteny97_g8 = break87_g8.y;
				float temp_output_107_0_g8 = saturate( ( 1.0 - ( ( temp_output_75_0_g8 * atteny97_g8 ) / 25.0 ) ) );
				float temp_output_2079_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g8 ) * atteny97_g8 ) ) , ( temp_output_107_0_g8 * temp_output_107_0_g8 ) );
				float4 localVertexLightCol319_g8 = VertexLightCol319_g8();
				float4 temp_output_2079_18 = localVertexLightCol319_g8;
				float3 appendResult9_g8 = (float3(break4_g8.z , break5_g8.z , break6_g8.z));
				float3 pos389_g8 = appendResult9_g8;
				float3 objToWorld141_g8 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_79_0_g8 = pow( distance( pos389_g8 , objToWorld141_g8 ) , 2.0 );
				float attenz98_g8 = break87_g8.z;
				float temp_output_125_0_g8 = saturate( ( 1.0 - ( ( temp_output_79_0_g8 * attenz98_g8 ) / 25.0 ) ) );
				float temp_output_2079_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g8 ) * attenz98_g8 ) ) , ( temp_output_125_0_g8 * temp_output_125_0_g8 ) );
				float4 localVertexLightCol421_g8 = VertexLightCol421_g8();
				float4 temp_output_2079_20 = localVertexLightCol421_g8;
				float3 appendResult10_g8 = (float3(break4_g8.w , break5_g8.w , break6_g8.w));
				float3 pos491_g8 = appendResult10_g8;
				float3 objToWorld138_g8 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_83_0_g8 = pow( distance( pos491_g8 , objToWorld138_g8 ) , 2.0 );
				float attenw99_g8 = break87_g8.w;
				float temp_output_116_0_g8 = saturate( ( 1.0 - ( ( temp_output_83_0_g8 * attenw99_g8 ) / 25.0 ) ) );
				float temp_output_2079_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g8 ) * attenw99_g8 ) ) , ( temp_output_116_0_g8 * temp_output_116_0_g8 ) );
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch1908 = saturate( ( ( temp_output_2079_16 * temp_output_2079_23 ) + ( temp_output_2079_17 * temp_output_2079_29 ) + ( temp_output_2079_18 * temp_output_2079_30 ) + ( temp_output_2079_20 * temp_output_2079_31 ) ) );
				#else
				float4 staticSwitch1908 = float4(0,0,0,0);
				#endif
				float4 VertLight1406 = staticSwitch1908;
				float3 x1488 = float3( 0,1,0.5 );
				float3 localShadeSH9bakedlight1488 = ShadeSH9bakedlight1488( x1488 );
				float3 desaturateInitialColor2843 = ( localShadeSH9bakedlight1488 * _BakedLightContrib );
				float desaturateDot2843 = dot( desaturateInitialColor2843, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2843 = lerp( desaturateInitialColor2843, desaturateDot2843.xxx, 0.25 );
				float4 temp_cast_4 = (_MinLight).xxxx;
				float4 temp_cast_5 = (_MaxLight).xxxx;
				float4 clampResult1914 = clamp( ( float4( ( ase_lightColor.rgb * ase_lightColor.a * ( 1.0 - _WorldSpaceLightPos0.w ) ) , 0.0 ) + VertLight1406 + float4( desaturateVar2843 , 0.0 ) ) , temp_cast_4 , temp_cast_5 );
				float4 temp_output_2867_0 = ( clampResult1914 * _LightMultiplier );
				float4 break2085 = temp_output_2867_0;
				float3 desaturateInitialColor1777 = temp_output_2867_0.xyz;
				float desaturateDot1777 = dot( desaturateInitialColor1777, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1777 = lerp( desaturateInitialColor1777, desaturateDot1777.xxx, (0.25 + (saturate( ( ( break2085.x + break2085.y + break2085.z ) * break2085.w ) ) - 0.0) * (0.0 - 0.25) / (1.0 - 0.0)) );
				float2 uv_Normal = i.ase_texcoord1.xy * _Normal_ST.xy + _Normal_ST.zw;
				float3 tex2DNode425 = UnpackNormal( tex2D( _Normal, uv_Normal ) );
				float3 lerpResult430 = lerp( float3( 0,0,1 ) , tex2DNode425 , _NormalPower);
				float3 ase_worldTangent = i.ase_texcoord2.xyz;
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float3 ase_worldBitangent = i.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal1235 = lerpResult430;
				float3 worldNormal1235 = float3(dot(tanToWorld0,tanNormal1235), dot(tanToWorld1,tanNormal1235), dot(tanToWorld2,tanNormal1235));
				float3 normalizeResult1249 = normalize( worldNormal1235 );
				float3 NormalShade962 = normalizeResult1249;
				float4 transform2147 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 normalizeResult1233 = normalize( ( _WorldSpaceLightPos0.xyz - ( _WorldSpaceLightPos0.w * (transform2147).xyz ) ) );
				float3 appendResult248 = (float3(_StaticLightX , _StaticLightY , _StaticLightZ));
				float3 localCenterEye1_g9 = CenterEye1_g9();
				float3 temp_output_4_0_g9 = ( localCenterEye1_g9 - WorldPosition );
				float3 normalizeResult5_g9 = normalize( temp_output_4_0_g9 );
				float3 lerpResult2635 = lerp( appendResult248 , normalizeResult5_g9 , float3( 0.3333,0.3333,0.3333 ));
				float3 Dir_LightDir2215 = ( ( ase_lightColor.rgb * ase_lightColor.a ) > float3( 0,0,0 ) ? normalizeResult1233 : lerpResult2635 );
				float dotResult5 = dot( NormalShade962 , Dir_LightDir2215 );
				float NdotL1296 = dotResult5;
				float3 VertLightPos12017 = appendResult7_g8;
				float4 transform2153 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 Lightmode2159 = ( _LightMode == 1.0 ? (transform2153).xyz : WorldPosition );
				float3 normalizeResult1382 = normalize( ( VertLightPos12017 - Lightmode2159 ) );
				float dotResult1381 = dot( NormalShade962 , normalizeResult1382 );
				float Vert_NdotL1389 = dotResult1381;
				float VertAtten2014 = ( temp_output_2079_23 + temp_output_2079_29 + temp_output_2079_30 + temp_output_2079_31 );
				float4 break1551 = ( temp_output_2079_16 + temp_output_2079_17 + temp_output_2079_18 + temp_output_2079_20 );
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
				float3 temp_cast_8 = (( ( 1.0 - temp_output_1106_0 ) * _ShadowDarkness )).xxx;
				float3 clampResult30 = clamp( ( RampShade979 - temp_cast_8 ) , float3( 0,0,0 ) , float3( 0.8,0.8,0.8 ) );
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
				float4 LightShaded2289 = ( float4( clampResult30 , 0.0 ) * (( _ShadeEnable )?( lerpResult660 ):( float4( float3(1,1,1) , 0.0 ) )) );
				float4 LightColour968 = ( float4( desaturateVar1777 , 0.0 ) * LightShaded2289 );
				float3 hsvTorgb2909 = RGBToHSV( ( float4( (tex2DNode10).rgb , 0.0 ) * float4( (_Color).rgb , 0.0 ) * LightColour968 ).xyz );
				float3 hsvTorgb2908 = HSVToRGB( float3(( _Hue + hsvTorgb2909.x ),hsvTorgb2909.y,hsvTorgb2909.z) );
				float3 desaturateInitialColor2917 = hsvTorgb2908;
				float desaturateDot2917 = dot( desaturateInitialColor2917, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2917 = lerp( desaturateInitialColor2917, desaturateDot2917.xxx, ( 1.0 - _Saturation ) );
				float3 desaturateInitialColor581 = desaturateVar2917;
				float desaturateDot581 = dot( desaturateInitialColor581, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar581 = lerp( desaturateInitialColor581, desaturateDot581.xxx, ( ( 1.0 - RampShade979 ) * ( 1.0 - _ShadowSaturation ) ).x );
				float3 PostDesaturation1276 = (float3( 0.0001,0.0001,0.0001 ) + (desaturateVar581 - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.0001,0.0001,0.0001 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 lerpResult1536 = lerp( ase_worldNormal , NormalShade962 , _Scale1);
				float fresnelNdotV360 = dot( ( _RimNormal == 1.0 ? lerpResult1536 : ase_worldNormal ), ase_worldViewDir );
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
				float4 PostRimLight1292 = ( _UseRim == 1.0 ? ifLocalVar1284 : float4( PostDesaturation1276 , 0.0 ) );
				float3 localCenterEye46_g51 = CenterEye46_g51();
				float3 worldToViewDir27_g51 = normalize( mul( UNITY_MATRIX_V, float4( ( ( _StereoFix == 1.0 ? localCenterEye46_g51 : _WorldSpaceCameraPos ) - WorldPosition ), 0 ) ).xyz );
				float3 NormalShadePrecalc1861 = lerpResult430;
				float3 tanNormal1_g51 = NormalShadePrecalc1861;
				float3 worldNormal1_g51 = float3(dot(tanToWorld0,tanNormal1_g51), dot(tanToWorld1,tanNormal1_g51), dot(tanToWorld2,tanNormal1_g51));
				float3 worldToViewDir13_g51 = normalize( mul( UNITY_MATRIX_V, float4( worldNormal1_g51, 0 ) ).xyz );
				float mulTime2208 = _Time.y * _MatcapSpin;
				float cos2210 = cos( mulTime2208 );
				float sin2210 = sin( mulTime2208 );
				float2 rotator2210 = mul( (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g51 ) , worldToViewDir13_g51 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) - float2( 0.5,0.5 ) , float2x2( cos2210 , -sin2210 , sin2210 , cos2210 )) + float2( 0.5,0.5 );
				float3 localCenterEye16_g52 = CenterEye16_g52();
				float3 normalizeResult19_g52 = normalize( ( ( _StereoFix == 1.0 ? localCenterEye16_g52 : _WorldSpaceCameraPos ) - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g52 = normalize( cross( normalizeResult19_g52 , _worldUp ) );
				float3 temp_output_29_0_g52 = BlendNormals( ase_worldNormal , NormalShadePrecalc1861 );
				float dotResult10_g52 = dot( normalizeResult8_g52 , temp_output_29_0_g52 );
				float dotResult2_g52 = dot( _worldUp , normalizeResult19_g52 );
				float3 normalizeResult7_g52 = normalize( ( _worldUp - ( dotResult2_g52 * normalizeResult19_g52 ) ) );
				float dotResult9_g52 = dot( normalizeResult7_g52 , temp_output_29_0_g52 );
				float2 appendResult11_g52 = (float2(dotResult10_g52 , dotResult9_g52));
				float cos2207 = cos( mulTime2208 );
				float sin2207 = sin( mulTime2208 );
				float2 rotator2207 = mul( ( ( appendResult11_g52 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) - float2( 0.5,0.5 ) , float2x2( cos2207 , -sin2207 , sin2207 , cos2207 )) + float2( 0.5,0.5 );
				float4 temp_output_2165_0 = ( _Legacy == 1.0 ? tex2D( _Matcap, rotator2210 ) : tex2D( _Matcap, rotator2207 ) );
				float3 desaturateInitialColor1516 = ( (temp_output_2165_0).rgb * _MatcapIntensity * (_MatCapColor).rgb );
				float desaturateDot1516 = dot( desaturateInitialColor1516, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1516 = lerp( desaturateInitialColor1516, desaturateDot1516.xxx, ( 1.0 - _MatcapSaturation ) );
				float4 lerpResult405 = lerp( PostRimLight1292 , ( PostRimLight1292 * float4( desaturateVar1516 , 0.0 ) ) , ( (temp_output_2165_0).a * _MatcapOpacity ));
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
				float3 localCenterEye1_g10 = CenterEye1_g10();
				float3 temp_output_4_0_g10 = ( localCenterEye1_g10 - WorldPosition );
				float3 normalizeResult5_g10 = normalize( temp_output_4_0_g10 );
				float3 normalizeResult1783 = normalize( ( ( _StereoFixSpec == 1.0 ? normalizeResult5_g10 : ase_worldViewDir ) + FinalLightDir2218 ) );
				float3 lerpResult602 = lerp( float3( 0,0,1 ) , tex2DNode425 , _NormalPowerSpecular);
				float3 tanNormal1234 = lerpResult602;
				float3 worldNormal1234 = float3(dot(tanToWorld0,tanNormal1234), dot(tanToWorld1,tanNormal1234), dot(tanToWorld2,tanNormal1234));
				float3 normalizeResult1248 = normalize( worldNormal1234 );
				float3 NormalSpecular965 = normalizeResult1248;
				float dotResult551 = dot( normalizeResult1783 , NormalSpecular965 );
				float clampResult2294 = clamp( ( pow( dotResult551 , exp( ( 10.0 - _SpecularSize ) ) ) * pow( 10.0 , _SpecularStrength ) ) , 0.0001 , 100.0 );
				float lerpResult816 = lerp( 0.0 , clampResult2294 , _SpecularOpacity);
				float3 appendResult2234 = (float3(lerpResult816 , lerpResult816 , lerpResult816));
				float3 localCenterEye46_g48 = CenterEye46_g48();
				float3 worldToViewDir27_g48 = normalize( mul( UNITY_MATRIX_V, float4( ( ( _StereoFixSpecCap == 1.0 ? localCenterEye46_g48 : _WorldSpaceCameraPos ) - WorldPosition ), 0 ) ).xyz );
				float3 tanNormal1_g48 = NormalShadePrecalc1861;
				float3 worldNormal1_g48 = float3(dot(tanToWorld0,tanNormal1_g48), dot(tanToWorld1,tanNormal1_g48), dot(tanToWorld2,tanNormal1_g48));
				float3 worldToViewDir13_g48 = normalize( mul( UNITY_MATRIX_V, float4( worldNormal1_g48, 0 ) ).xyz );
				float3 localCenterEye16_g47 = CenterEye16_g47();
				float3 normalizeResult19_g47 = normalize( ( ( _StereoFixSpecCap == 1.0 ? localCenterEye16_g47 : _WorldSpaceCameraPos ) - WorldPosition ) );
				float3 normalizeResult8_g47 = normalize( cross( normalizeResult19_g47 , _worldUp ) );
				float3 NormalSpecularPrecalc1856 = ( lerpResult602 - float3( 0.25,0.25,0 ) );
				float3 temp_output_29_0_g47 = BlendNormals( ase_worldNormal , NormalSpecularPrecalc1856 );
				float dotResult10_g47 = dot( normalizeResult8_g47 , temp_output_29_0_g47 );
				float dotResult2_g47 = dot( _worldUp , normalizeResult19_g47 );
				float3 normalizeResult7_g47 = normalize( ( _worldUp - ( dotResult2_g47 * normalizeResult19_g47 ) ) );
				float dotResult9_g47 = dot( normalizeResult7_g47 , temp_output_29_0_g47 );
				float2 appendResult11_g47 = (float2(dotResult10_g47 , dotResult9_g47));
				float3 desaturateInitialColor1920 = (( _Legacy2 == 1.0 ? tex2D( _SpecularMatcap, (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g48 ) , worldToViewDir13_g48 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) ) : tex2D( _SpecularMatcap, ( ( appendResult11_g47 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) ) )).rgb;
				float desaturateDot1920 = dot( desaturateInitialColor1920, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1920 = lerp( desaturateInitialColor1920, desaturateDot1920.xxx, ( 1.0 - _SpecMatcapSaturation ) );
				float3 localCenterEye16_g55 = CenterEye16_g55();
				float3 normalizeResult19_g55 = normalize( ( ( 0.0 == 1.0 ? localCenterEye16_g55 : _WorldSpaceCameraPos ) - WorldPosition ) );
				float3 normalizeResult8_g55 = normalize( cross( normalizeResult19_g55 , _worldUp ) );
				float3 temp_output_29_0_g55 = BlendNormals( ase_worldNormal , UnpackNormal( tex2D( _SpecMatCapNorm, i.ase_texcoord1.xy ) ) );
				float dotResult10_g55 = dot( normalizeResult8_g55 , temp_output_29_0_g55 );
				float dotResult2_g55 = dot( _worldUp , normalizeResult19_g55 );
				float3 normalizeResult7_g55 = normalize( ( _worldUp - ( dotResult2_g55 * normalizeResult19_g55 ) ) );
				float dotResult9_g55 = dot( normalizeResult7_g55 , temp_output_29_0_g55 );
				float2 appendResult11_g55 = (float2(dotResult10_g55 , dotResult9_g55));
				float3 lerpResult560 = lerp( float3( 0,0,0 ) , ( saturate( appendResult2234 ) + ( _UseSpecularMatCap == 1.0 ? ( desaturateVar1920 * _SpecMatcapMultiply * (_SpecMatCapColor).rgb ) : float3(0,0,0) ) ) , ( tex2D( _SpecularMask, ( ( appendResult11_g55 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) ) * _SpecMaskOpacity ).rgb);
				float3 SpecularOut983 = lerpResult560;
				float3 lerpResult2280 = lerp( ( (desaturateVar2291).xyz * SpecularOut983 ) , SpecularOut983 , float3( 0.5,0.5,0.5 ));
				float2 uv_SparkleMask1 = i.ase_texcoord1.xy * _SparkleMask1_ST.xy + _SparkleMask1_ST.zw;
				float4 tex2DNode1743 = tex2D( _SparkleMask1, uv_SparkleMask1 );
				float3 desaturateInitialColor1744 = tex2DNode1743.rgb;
				float desaturateDot1744 = dot( desaturateInitialColor1744, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1744 = lerp( desaturateInitialColor1744, desaturateDot1744.xxx, 1.0 );
				float clampResult2503 = clamp( distance( WorldPosition , _WorldSpaceCameraPos ) , 0.0 , 100.0 );
				float temp_output_2804_0 = ( 1.0 - (0.0 + (clampResult2503 - 0.0) * (0.01 - 0.0) / (1.0 - 0.0)) );
				float3 temp_cast_31 = (_Threshold).xxx;
				float3 temp_cast_32 = (saturate( ( _Threshold + _Range ) )).xxx;
				float2 uv_SparklePattern = i.ase_texcoord1.xy * _SparklePattern_ST.xy + _SparklePattern_ST.zw;
				float2 break2472 = uv_SparklePattern;
				float2 appendResult2473 = (float2(-break2472.x , break2472.y));
				float temp_output_1710_0 = ( 1.0 - _SparkleTexColour );
				float3 desaturateInitialColor1704 = tex2D( _SparklePattern, appendResult2473 ).rgb;
				float desaturateDot1704 = dot( desaturateInitialColor1704, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1704 = lerp( desaturateInitialColor1704, desaturateDot1704.xxx, temp_output_1710_0 );
				float3 localCenterEye72_g53 = CenterEye72_g53();
				float4 appendResult76_g53 = (float4(( WorldPosition - localCenterEye72_g53 ) , 0.0));
				float4 temp_output_77_0_g53 = mul( UNITY_MATRIX_V, appendResult76_g53 );
				float2 break83_g53 = ( (temp_output_77_0_g53).xy / (temp_output_77_0_g53).z );
				float2 appendResult86_g53 = (float2(( ( _ScreenParams.z / _ScreenParams.w ) * break83_g53.x ) , ( break83_g53.y * 2.0 )));
				float2 appendResult101_g53 = (float2(1.0 , 1.0));
				float2 appendResult102_g53 = (float2(0.0 , 0.0));
				float mulTime2348 = _Time.y * _MotionSpeed;
				float2 appendResult2356 = (float2(sin( mulTime2348 ) , cos( mulTime2348 )));
				float2 appendResult2405 = (float2(mulTime2348 , 0.0));
				float cos2403 = cos( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float sin2403 = sin( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float2 rotator2403 = mul( appendResult2405 - float2( 0.5,0.5 ) , float2x2( cos2403 , -sin2403 , sin2403 , cos2403 )) + float2( 0.5,0.5 );
				float temp_output_2779_0 = ( ( WorldPosition.x + WorldPosition.y + WorldPosition.z ) * ( _WorldPosContribution / 10.0 ) );
				float2 appendResult2864 = (float2(-temp_output_2779_0 , temp_output_2779_0));
				float3 desaturateInitialColor1705 = tex2D( _SparklePattern, ( ( uv_SparklePattern + ( ( ( ( ( -appendResult86_g53 * float2( 1,0.5 ) ) + float2( 0.5,0.5 ) ) * appendResult101_g53 ) + appendResult102_g53 ) * _ScreenContribution ) ) + float2( 0.25,0.25 ) + ( _MotionIntensity * ( _MotionType == 1.0 ? appendResult2356 : rotator2403 ) ) + appendResult2864 ) ).rgb;
				float desaturateDot1705 = dot( desaturateInitialColor1705, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1705 = lerp( desaturateInitialColor1705, desaturateDot1705.xxx, temp_output_1710_0 );
				float3 localCenterEye1_g54 = CenterEye1_g54();
				float3 smoothstepResult901 = smoothstep( temp_cast_31 , temp_cast_32 , ( desaturateVar1704 * desaturateVar1705 * ( 1.0 - pow( ( distance( WorldPosition , localCenterEye1_g54 ) / 10000.0 ) , 0.5 ) ) ));
				float3 normalizeResult2480 = normalize( ase_worldViewDir );
				float temp_output_2833_0 = (-1.0 + (temp_output_2804_0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0));
				float3 appendResult2806 = (float3(_SparkleFresnel1.x , ( _SparkleFresnel1.y * temp_output_2833_0 ) , pow( _SparkleFresnel1.z , temp_output_2833_0 )));
				float3 break2506 = (float3( 0,0,0 ) + (appendResult2806 - float3( 0,0,0 )) * (float3( 0.1,0.1,0.1 ) - float3( 0,0,0 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float fresnelNdotV2371 = dot( NormalSpecular965, normalizeResult2480 );
				float fresnelNode2371 = ( break2506.x + break2506.y * pow( max( 1.0 - fresnelNdotV2371 , 0.0001 ), break2506.z ) );
				float fresnelNdotV2440 = dot( -NormalSpecular965, normalizeResult2480 );
				float fresnelNode2440 = ( break2506.x + break2506.y * pow( max( 1.0 - fresnelNdotV2440 , 0.0001 ), break2506.z ) );
				float switchResult2437 = (((ase_vface>0)?(( 1.0 - saturate( fresnelNode2371 ) )):(( 1.0 - saturate( fresnelNode2440 ) ))));
				float4 temp_cast_36 = (0.0).xxxx;
				float4 SparkleOut971 = ( _UseSparkles == 1.0 ? ( float4( ( desaturateVar1744 * tex2DNode1743.a ) , 0.0 ) * ( _SparkleColor1 * ( 2.5 * ( 200.0 * temp_output_2804_0 ) ) ) * float4( smoothstepResult901 , 0.0 ) * switchResult2437 ) : temp_cast_36 );
				float Alpha1262 = tex2DNode10.a;
				float2 uv_FriendsOnlyRT = i.ase_texcoord1.xy * _FriendsOnlyRT_ST.xy + _FriendsOnlyRT_ST.zw;
				float4 tex2DNode349 = tex2D( _FriendsOnlyRT, uv_FriendsOnlyRT );
				float temp_output_353_0 = ( ceil( saturate( ( tex2DNode349.r + tex2DNode349.g + tex2DNode349.b ) ) ) * 2.0 );
				clip( ( _FriendsOnly == 1.0 ? ( _FriendsOnly1 == 1.0 ? ( 1.0 - temp_output_353_0 ) : temp_output_353_0 ) : 1.0 ) - _Cutoff);
				float4 appendResult1923 = (float4(( ( _UseMatcap == 1.0 ? PostMatcap1274 : PostRimLight1292 ) + Emission1285 + float4( ( lerpResult2280 * float3( 10,10,10 ) ) , 0.0 ) + SparkleOut971 ).rgb , ( _Alpha * Alpha1262 )));
				
				
				finalColor = appendResult1923;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18814
-1655;61;1552;819;-1584.511;1057.615;1.3;True;False
Node;AmplifyShaderEditor.CommentaryNode;1378;-3927.051,-1093.842;Inherit;False;2099.93;995.9517;;34;2150;1491;1406;1908;1910;1683;1682;1631;1630;1629;1684;1389;1381;1382;1380;1383;2017;1665;1905;1911;1879;1891;1890;2014;1589;1886;1551;1878;2079;2151;2152;2153;2154;2159;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;2079;-3865.887,-690.8165;Inherit;False;VertexLightData;-1;;8;d6cc1c00f5d200e45903717e6fa3d55c;0;0;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-3314.32,-239.4102;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-3185.587,-237.5177;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-3445.435,-300.1715;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-3029.982,-231.9888;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1891;-2922.302,-146.5111;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1890;-2895.816,-244.8842;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2014;-3115.186,-313.8863;Inherit;False;VertAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;281;-3257.708,-1772.316;Inherit;False;1450.566;634.3398;Uses directional light or uses the static light direction;19;1296;5;1165;2215;1076;1876;633;1233;248;251;249;252;1247;1246;2148;1232;2147;2635;2852;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-2699.583,-274.9366;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1911;-2770.239,-364.0493;Inherit;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2147;-3247.611,-1598.09;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;1905;-2520.487,-309.339;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1237;-4452.212,-1760.064;Inherit;False;1151.984;507.5215;;14;1861;1856;965;1248;1234;602;603;962;1249;1235;430;428;425;2205;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-3250.167,-1708.476;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2153;-3900.967,-1024.566;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;2148;-3047.611,-1557.09;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;425;-4436.017,-1594.568;Inherit;True;Property;_Normal;Normal;29;1;[Normal];Create;False;0;0;0;False;2;Space(5);Header(.  Normals  .);False;425;None;5625397229980b84c9b785be6a32b6ae;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;-0.5;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;428;-4429.819,-1386.866;Inherit;False;Property;_NormalPower;Normal Power;30;0;Create;True;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-2261.945,-307.735;Inherit;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;430;-4078.385,-1477.775;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-3234.506,-1411.764;Float;False;Property;_StaticLightX;Static Light X;22;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;-0.19;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2152;-3658.939,-1053.726;Inherit;False;Property;_LightMode;Lighting Mode;13;1;[Enum];Create;False;0;2;Surface;0;World2Object;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-3234.6,-1337.48;Float;False;Property;_StaticLightY;Static Light Y;23;0;Create;True;0;0;0;False;0;False;0.09;0.41;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2121;-5693.687,167.8933;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-3232.884,-1265.439;Float;False;Property;_StaticLightZ;Static Light Z;24;0;Create;True;0;0;0;False;0;False;0.44;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-2827.469,-1587.531;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2154;-3685.07,-951.0638;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2150;-3824.15,-839.7948;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-2681.782,-1631.293;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-5528.973,88.07441;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2151;-3452.72,-978.1118;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;633;-2922.086,-1466.803;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;248;-2901.05,-1350.183;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;2852;-2914.528,-1239.806;Inherit;False;VR_Center_Eye;-1;;9;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.WorldNormalVector;1235;-3862.895,-1477.772;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2144;-5438.546,162.7086;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;2635;-2590.92,-1330.52;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.3333,0.3333,0.3333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2159;-3293.512,-951.7102;Inherit;False;Lightmode;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-2589.126,-1505.888;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-2707.091,-1425.807;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2017;-3478.189,-724.6907;Inherit;False;VertLightPos1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1249;-3670.7,-1478.392;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2140;-5244.652,80.38123;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-3508.31,-1482.938;Inherit;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-3113.46,-783.1392;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1076;-2395.121,-1419.628;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2034;-5014.051,149.5636;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.33;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2215;-2246.785,-1414.851;Inherit;False;Dir_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-3034.652,-874.0899;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-2268.066,-1505.157;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2026;-4850.679,147.8314;Inherit;False;False;2;0;FLOAT;2;False;1;FLOAT;25;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1382;-2922.821,-782.578;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-2721.101,-836.3279;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2035;-4687.051,119.5636;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;5;-2008.379,-1443.362;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-2567.848,-841.5119;Inherit;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-3284.757,-559.6434;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-3284.838,-468.1142;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SaturateNode;2025;-4559.94,119.3055;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-2014.986,-1524.105;Inherit;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-3280.812,-649.6893;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-3284.283,-378.5533;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4467.923,-81.3831;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2033;-4420.051,119.5636;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4462.809,-175.9437;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-3005.435,-541.7272;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1058;-3891.822,-3.546481;Inherit;False;Property;_UseShading;Use Shading;12;0;Create;True;0;0;0;False;3;Space(5);Header(.  Shadow  .);Toggle(_);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1683;-2802.038,-541.3859;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Vector4Node;1910;-2659.645,-668.0741;Inherit;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;1994;-4163.124,24.73143;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1059;-3676.601,38.67938;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1488;-1663.691,-104.5293;Float;False;return ShadeSH9(half4(x, 1))@;3;False;1;True;x;FLOAT3;0,1,0.5;In;;Float;False;ShadeSH9 (baked light);True;False;0;1;0;FLOAT3;0,1,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3803.967,209.8628;Inherit;False;Property;_OffsetDot;Offset Dot;17;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-2569.631,-760.9693;Inherit;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1775;-1671.31,-25.86761;Inherit;False;Property;_BakedLightContrib;Baked Light Contrib;9;0;Create;True;0;0;0;False;0;False;0.8;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1908;-2457.065,-552.296;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;2081;-1551.388,-615.7753;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SamplerNode;2211;-3633.483,565.0453;Inherit;True;Property;_LightMask;Light Mask;21;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;2082;-1497.492,-508.216;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;793;-1491.692,292.0861;Inherit;False;1728.081;844.5872;;31;1499;642;1280;954;660;1036;669;680;670;665;679;1035;811;654;1064;664;646;684;682;1304;662;1492;1123;641;1504;1505;1506;1507;1605;645;1545;Soft Shading;0,0,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-2171.892,-550.8361;Inherit;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;2216;-4483.883,274.6541;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-3554.867,472.5686;Float;False;Property;_ShadowSharpness1;Shadow Sharpness;18;0;Create;False;0;0;0;False;0;False;1;300;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;1484;-1568.94,-429.2212;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3429.394,187.0093;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1774;-1428.953,-106.064;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2217;-4478.769,201.0935;Inherit;False;2215;Dir_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;2843;-1442.103,-196.1983;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.25;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-3283.7,483.0416;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-1557.285,-282.5464;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;2213;-4245.272,206.0288;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;641;-1446.222,890.4534;Inherit;False;Property;_ShadeScale;Shade Scale;36;0;Create;True;0;0;0;False;0;False;0;0;2;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-1314.07,-425.8162;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;1506;-1467.995,499.4117;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;1123;-1381.556,962.0286;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1916;-1246.578,-191.3982;Inherit;False;Property;_MinLight;Min Light;11;0;Create;True;0;0;0;False;0;False;0.9;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1254;-3121.795,488.0691;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1605;-1464.346,329.1173;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1507;-1318.348,522.7611;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1505;-1472.995,423.3388;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-1230.204,-315.5521;Inherit;False;3;3;0;FLOAT3;1,1,1;False;1;FLOAT4;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;1499;-1059.518,1022.315;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;573;-2950.687,325.724;Inherit;False;1236.993;594.242;;11;979;1026;815;1025;1033;32;1032;1010;1008;1016;1125;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1915;-1250.612,-122.6674;Inherit;False;Property;_MaxLight;Max Light;10;0;Create;True;0;0;0;False;0;False;0.9;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;642;-1451.954,1051.083;Inherit;False;Property;_ShadePower;Shade Power;35;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2218;-4092.111,201.2454;Inherit;False;FinalLightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1504;-1099.484,442.1145;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.005;False;2;FLOAT3;0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;1008;-2922.989,362.3288;Inherit;False;Property;_ShadowColour;Shadow Colour;15;0;Create;True;0;0;0;False;0;False;0.7098039,0.7098039,0.7098039,1;0.7098039,0.7098039,0.7098039,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1125;-2923.663,701.1221;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-1075.993,-252.6413;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0.8,0.8,0.8,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1492;-1386.786,811.745;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FresnelNode;662;-856.192,976.2939;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2870;-1072.83,-97.41284;Inherit;False;Property;_LightMultiplier;Light Multiplier;8;0;Create;True;0;0;0;False;0;False;1.1;1.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1304;-946.9219,446.7606;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCRemapNode;1032;-2661.056,520.0779;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;3;COLOR;0.5,0.5,0.5,0;False;4;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;32;-2745.322,702.6544;Inherit;True;Property;_Ramp;Ramp;16;0;Create;False;0;0;0;False;0;False;-1;None;c320938fa0c7f9043aabb704290909a3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;645;-857.1354,799.933;Inherit;False;Standard;WorldNormal;LightDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;682;-561.265,989.8443;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.015;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2867;-914.9591,-235.2769;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;646;-1382.249,641.8676;Inherit;False;Property;_ShadeColour;Shade Colour;34;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;684;-1100.039,342.8162;Float;False;Property;_MultiplyDynamic;MultiplyDynamic;37;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;664;-577.1899,884.1156;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;654;-602.8362,785.0902;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;2085;-751.7468,-150.9431;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1033;-2419.912,696.348;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2619.097,379.9975;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;811;-1136.77,644.2842;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1064;-785.9371,396.4425;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;665;-409.7408,795.5952;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1025;-2343.091,595.0555;Inherit;False;Property;_GradientorRamp;Gradient or Ramp;14;1;[Enum];Create;True;0;2;Ramp_Texture;0;Linear_Gradient;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;815;-2263.627,688.622;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;680;-628.5598,398.8192;Inherit;False;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;3;FLOAT4;0.88,0.88,0.88,0.88;False;4;FLOAT4;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;670;-342.7129,971.2403;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.015;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;679;-833.9374,623.0983;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.88,0.88,0.88;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1016;-2324.892,403.69;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2086;-635.8839,-151.0253;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1035;-536.6813,582.2916;Inherit;False;Property;_ShadeColorDynamic;ShadeColor Dynamic;33;1;[Enum];Create;True;0;2;FixedColour;0;LightColour;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1036;-289.0835,603.5837;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;669;-212.8571,816.5682;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1026;-2084.109,475.3556;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2109;-518.6432,-108.4541;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;2100;-411.793,-35.03058;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;954;-289.6415,414.307;Inherit;False;Constant;_Shade_Null;Shade_Null;65;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-1921.907,475.5088;Inherit;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-2384.912,242.3639;Inherit;False;Property;_ShadowDarkness;Shadow Darkness;19;0;Create;True;0;0;0;False;0;False;0.22;0.125;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1470;-2333.083,171.9208;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;660;-25.61246,790.3435;Inherit;False;3;0;FLOAT4;1,0,0,0;False;1;FLOAT4;1,1,1,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2148.509,185.2552;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2298.727,98.62732;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1280;-20.40296,413.9091;Inherit;False;Property;_ShadeEnable;Shade Enable;32;0;Create;True;0;0;0;False;2;Space(5);Header(.  Soft Shading  .);False;1;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;2101;-728.7235,-10.51245;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-1842.333,145.0186;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;1545;154.9164,375.568;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SaturateNode;2093;-697.1163,13.8803;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;2098;-529.7989,9.643082;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.25;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1546;-408.1775,242.9377;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClampOpNode;30;-1672.803,203.3764;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1500;-385.6465,157.8072;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;2868;-368.8297,-94.41284;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2289;-253.181,18.1054;Inherit;False;LightShaded;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DesaturateOpNode;1777;-407.7096,-210.1704;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;18;-670.9791,-342.361;Float;False;Property;_Color;> Color;2;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;603;-4420.568,-1697.133;Inherit;False;Property;_NormalPowerSpecular;Normal Power Specular;31;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;10;-760.0398,-536.3671;Inherit;True;Property;_MainTex;Texture;1;0;Create;False;0;0;0;False;1;Header(.  Main  .);False;-1;None;724eb9d6c0dc3f14bada14b549e170d6;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;-193.5055,-210.2624;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-426.4418,-341.8072;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;602;-4083.216,-1639.425;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;-20.58304,-251.3231;Inherit;False;LightColour;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-404.2352,-504.1069;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;569;-1621.408,-2462.519;Inherit;False;2674.146;1264.229;;54;2884;2886;2853;983;560;701;696;2301;695;824;2001;2002;952;690;2234;691;825;816;1920;838;2294;817;561;1921;837;869;1919;554;545;556;1928;551;967;555;553;1783;1051;2236;2237;546;2224;2219;2225;1909;2897;2898;2899;2900;2901;2902;2904;2905;2906;2907;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.FunctionNode;2853;-1269.682,-2195.713;Inherit;False;VR_Center_Eye;-1;;10;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.CommentaryNode;870;-3662.99,-4330.357;Inherit;False;4620.688;1565.347;;89;2833;2840;2806;2834;2812;2686;2478;2813;971;2004;957;2003;877;1745;2437;901;2811;2313;2308;2564;900;1744;2801;875;2810;2805;2394;898;2440;1743;1705;1704;2371;2550;2396;897;1710;2804;2480;2458;2506;2556;894;1709;2355;2558;2372;2395;2473;2476;2505;2839;2544;2503;2779;902;2379;1746;2359;2778;2426;2398;2472;1713;2360;2377;2356;2425;2424;960;2403;2400;885;2405;2357;2406;2349;1732;2348;2404;2361;2841;2861;2862;2863;2864;2865;2866;2857;Sparkles Effect;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;237.9263,-340.6653;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;1347;-11.9223,-162.9602;Inherit;False;1438.375;441.9759;hue & saturation;12;581;325;586;584;582;1330;585;2908;2911;2918;2910;2917;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldNormalVector;1234;-3861.658,-1639.444;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-1262.735,-2346.66;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;2225;-1262.735,-2426.66;Inherit;False;Property;_StereoFixSpec;Stereo Converge (flatten);41;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2224;-990.7347,-2410.66;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2910;157.7784,-109.3161;Inherit;False;Property;_Hue;Hue;3;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2424;-1880.703,-3067.481;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;2219;-1262.735,-2106.66;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;2425;-2130.466,-2962.248;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RGBToHSVNode;2909;380.659,-322.0913;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalizeNode;1248;-3672.7,-1639.391;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1330;18.25009,113.4692;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2911;585.777,-63.29576;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;2426;-1692.488,-3000.085;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-925.894,-2173.576;Inherit;False;Property;_SpecularSize;Specular Size;39;0;Create;True;0;0;0;False;0;False;1;3;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;585;3.742184,197.5173;Inherit;False;Property;_ShadowSaturation;Shadow Saturation;20;0;Create;True;0;0;0;False;0;False;0.85;0.8;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;393;-34.49131,-1010.172;Inherit;False;1664.971;591.2498;;24;1284;372;1281;390;388;370;1291;383;1290;384;382;379;376;360;368;369;1530;1531;1533;1534;1536;1537;2299;2300;Rim/Outline;1,0.141,0.141,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-3519.165,-1644.501;Inherit;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;325;10.67726,-19.47965;Float;False;Property;_Saturation;Saturation;4;0;Create;True;0;0;0;False;0;False;1;1.2;-2;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2237;-798.735,-2378.66;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-654.735,-2362.66;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2205;-3861.884,-1731.925;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.25,0.25,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1537;-1.646707,-709.1924;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;586;289.3586,204.6265;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1530;-20.01568,-966.9301;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;2503;-1548.697,-2995.87;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-801.3511,-2279.966;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.HSVToRGBNode;2908;755.8286,-67.83642;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;2918;327.3724,30.93677;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1534;-18.96252,-881.5684;Inherit;False;Property;_Scale1;Rim Normal Power;75;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;582;286.434,122.0095;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2236;-634.0715,-2208.564;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;584;496.9945,120.1337;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;551;-487.6718,-2365.546;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ExpOpNode;553;-487.0396,-2271.702;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1533;0.8238602,-802.0875;Inherit;False;Property;_RimNormal;Rim Normal;74;1;[Toggle];Create;True;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;2917;1023.315,65.18153;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-3587.47,-1726.126;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;2839;-1394.913,-2994.922;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1536;304.6267,-942.9253;Inherit;False;3;0;FLOAT3;0.5,0.5,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-448.4506,-2191.079;Inherit;False;Property;_SpecularStrength;Specular Strength;40;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-3861.138,-1338.359;Inherit;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;556;-137.2515,-2254.672;Inherit;False;False;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2361;-3179.528,-3141.44;Inherit;False;Property;_MotionSpeed;Motion Speed;61;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;967;-1598.962,-1685.728;Inherit;False;1856;NormalSpecularPrecalc;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;369;220.3718,-627.3718;Inherit;False;Property;_Scale;Rim Scale;71;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;545;-166.6069,-2354.573;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2804;-1215.952,-2993.791;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1531;273.6504,-801.9625;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;368;234.6099,-535.8052;Inherit;False;Property;_Power;Rim Power;70;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2898;-1598.962,-1845.728;Inherit;False;1861;NormalShadePrecalc;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;581;1260.778,172.5469;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1928;-1598.962,-1763.91;Inherit;False;Property;_StereoFixSpecCap;Stereo Converge (flatten);44;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;360;443.4379,-796.7625;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;33.00309,-2329.737;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2404;-3254.697,-3313.688;Inherit;False;Property;_RotateLinear;Rotate Linear;62;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2866;-2905.334,-3659.85;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;2300;483.0557,-541.4279;Inherit;False;Property;_Max;Rim Max;73;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2884;-1326.962,-1701.728;Inherit;False;VR MatCap;-1;;47;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;27;FLOAT;0;False;21;FLOAT3;0,0,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;2348;-3002.967,-3136.882;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2299;456.0557,-622.4279;Inherit;False;Property;_Min;Rim Min;72;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2897;-1326.962,-1845.728;Inherit;False;Matcap (legacy);-1;;48;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0.5;False;45;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;2834;-1082.571,-3032.983;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;437;350.9002,393.3461;Inherit;False;2516.223;776.2;Comment;29;963;1274;405;1278;414;807;406;1516;2180;1279;1517;407;1518;810;408;2165;2166;2176;2175;2181;1930;2207;2208;2209;2210;2873;2896;2919;2920;Matcap > Alpha Supported;0.8221117,0.184,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2862;-3018.605,-3490.507;Float;False;Property;_WorldPosContribution;WorldPos Contribution;59;0;Create;True;0;0;0;False;0;False;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1918;1487.39,170.7895;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.0001,0.0001,0.0001;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2899;-1577.246,-2047.864;Inherit;True;Property;_SpecularMatcap;Specular Matcap;43;0;Create;False;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;1930;387.6413,907.5331;Inherit;False;Property;_StereoFix;Stereo Converge (flatten);78;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2405;-2720.193,-3305.197;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode;379;674.0894,-796.4533;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;2349;-2607.011,-3179.647;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2209;573.5739,1079.491;Inherit;False;Property;_MatcapSpin;MatcapSpin;82;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;2406;-2985.614,-3303.644;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;6.27;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;561;38.61523,-2168.753;Inherit;False;Property;_SpecularOpacity;Specular Opacity;38;0;Create;True;0;0;0;False;2;Space(5);Header(.  Specular  .);False;1;0.01;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2905;-884.0963,-2002.447;Inherit;False;Property;_Legacy2;Legacy;48;0;Create;False;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;1732;-3226.377,-4165.456;Inherit;True;Property;_SparklePattern;Sparkle Pattern;54;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleAddOpNode;2778;-2703.624,-3637.727;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;963;400.1699,983.3749;Inherit;False;1861;NormalShadePrecalc;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2863;-2669.108,-3511.776;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;376;613.1367,-965.7909;Inherit;False;Property;_RimOutlineColour;Rim/Outline Colour;67;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2900;-1024.563,-1920.773;Inherit;True;Property;_TextureSample3;Texture Sample 3;90;0;Create;True;0;0;0;False;0;False;2181;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;2294;190.4163,-2291.064;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.0001;False;2;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;2833;-2055.371,-3167.383;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;1681.283,165.898;Inherit;False;PostDesaturation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2902;-1023.872,-1733.273;Inherit;True;Property;_TextureSample5;Texture Sample 5;90;0;Create;True;0;0;0;False;0;False;2181;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CosOpNode;2357;-2603.726,-3111.953;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2873;367.6592,703.8314;Inherit;False;1861;NormalShadePrecalc;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;902;-2075.433,-3383.479;Float;False;Property;_SparkleFresnel1;Fresnel Bias, Scale, Power;65;0;Create;False;0;0;0;False;0;False;0,10,0.1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;2840;-1665.613,-3204.411;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2896;674.6592,708.8314;Inherit;False;Matcap (legacy);-1;;51;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0.5;False;45;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2356;-2456.2,-3153.412;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2841;-1660.877,-3295.807;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2400;-2525.446,-3389.006;Inherit;False;Property;_MotionType;Motion Type;60;1;[Enum];Create;True;0;2;Linear;0;Circular;1;0;False;1;Space(5);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;816;369.3903,-2303.413;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;700.915,-526.964;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;2403;-2536.801,-3301.502;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-669.5865,-1667.672;Inherit;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;46;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2885;678.7927,929.4678;Inherit;False;VR MatCap;-1;;52;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;27;FLOAT;0;False;21;FLOAT3;0,0,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;2208;775.3476,1042.858;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2779;-2532.206,-3637.825;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.0075;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2861;-2814.854,-3888.65;Inherit;False;VR_ScreenSpaceUV;-1;;53;83887303006e6e7459722034b3b9f189;0;4;97;FLOAT;1;False;98;FLOAT;1;False;99;FLOAT;0;False;100;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Compare;2904;-663.7876,-1836.726;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;885;-2852.307,-3734.442;Float;False;Property;_ScreenContribution;Screen Contribution;58;0;Create;True;0;0;0;False;0;False;0.3;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;865.3638,-884.5739;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;960;-2902.177,-4246.793;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;384;671.9878,-620.4361;Inherit;False;Property;_Amount;Rim Opacity;69;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1713;-2880.475,-4054.37;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;2472;-2651.774,-4242.71;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RotatorNode;2207;965.9309,920.4949;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2234;530.8363,-2324.481;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;837;-610.3494,-2088.389;Inherit;False;Property;_SpecMatCapColor;SpecMatCap Colour;47;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;2806;-1453.997,-3364.156;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1921;-405.7281,-1722.047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;2865;-2379.334,-3659.85;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;370;1025.686,-620.0679;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;2210;924.749,710.9324;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1291;887.1605,-962.9463;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2360;-2384.171,-3508.42;Inherit;False;Property;_MotionIntensity;Motion Intensity;63;0;Create;True;0;0;0;False;0;False;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;869;-746.0214,-1525.291;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;817;-504.8264,-1834.555;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2377;-2051.28,-4284.732;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Compare;2398;-2307.053,-3351.417;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;383;863.5611,-789.4644;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2686;-2524.774,-3812.785;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;2857;-1874.452,-4216.076;Inherit;False;VR_Center_Eye;-1;;54;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.TexturePropertyNode;2181;408.1978,426.8195;Inherit;True;Property;_Matcap;Matcap (Alpha Supported);77;0;Create;False;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;2175;1143.858,546.2161;Inherit;True;Property;_TextureSample0;Texture Sample 0;90;0;Create;True;0;0;0;False;0;False;825;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;388;1187.295,-569.175;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-235.7454,-1832.26;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;372;1191.051,-953.8661;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2176;1193.848,753.8284;Inherit;True;Property;_Matcap1;;90;0;Create;False;0;0;0;False;0;False;825;None;ca5f4329374a4554eb5fcb2a1bbd66c2;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;2476;-1734.601,-3490.62;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;390;1199.985,-761.6016;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2166;1255.943,456.028;Inherit;False;Property;_Legacy;Legacy;84;0;Create;True;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;838;-392.9857,-2056.512;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;2906;648.658,-2222.628;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;1746;-2522.745,-4271.146;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;825;-515.968,-1552.495;Inherit;True;Property;_SpecMatCapNorm;SpecMatCap Norm;51;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DistanceOpNode;2379;-1596.32,-4271.745;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-607.6281,-1918.792;Inherit;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;45;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2544;-2258.142,-3828.126;Inherit;False;2;2;0;FLOAT2;0.5,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2864;-2234.334,-3648.85;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2359;-2038.808,-3635.168;Inherit;False;2;2;0;FLOAT;0.1;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TFHCRemapNode;2505;-1284.412,-3364.724;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2372;-1472.794,-3611.04;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1281;1378.964,-959.7588;Inherit;False;Property;_RimMode;Rim Mode;68;1;[Enum];Create;True;0;3;Blend_Lerp;0;Multiply;1;AddSubtract;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1295;1178.112,-1581.713;Inherit;False;1534.433;513.8026;;13;450;331;330;329;326;805;462;461;327;808;970;328;1285;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;571;1989.813,-155.4902;Inherit;False;1199.604;463.6661;;11;349;627;353;351;1424;1425;1426;1996;1998;1999;2000;VRChat Friends-Only;1,1,1,1;0;0
Node;AmplifyShaderEditor.WireNode;2558;-2495.257,-4066.814;Inherit;False;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;1650.314,-747.1198;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;2473;-2377.774,-4272.71;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;2886;-181.2001,-1503.057;Inherit;False;VR MatCap;-1;;55;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;27;FLOAT;0;False;21;FLOAT3;0,0,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;2907;458.2247,-2153.296;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;2919;1621.429,704.8459;Inherit;False;Property;_MatCapColor;MatCap Colour;83;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1514;1678.067,-888.0831;Inherit;False;Property;_UseRim;Use Rim;66;0;Create;True;0;0;0;False;3;Toggle(_);;Header(.  Rim Fresnel  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1709;-1806.364,-3936.772;Inherit;False;Property;_SparkleTexColour;SparkleTex Colour;55;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1284;1471.39,-811.4344;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-16.62045,-1991.412;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2395;-1423.231,-4257.949;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10000;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;952;-5.315271,-1854.65;Inherit;False;Constant;_SpecCap_Null;SpecCap_Null;65;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;2458;-1248.986,-3548.944;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2002;-26.7466,-2078.491;Inherit;False;Property;_UseSpecularMatCap;Use Specular MatCap;42;0;Create;True;0;0;0;False;3;Toggle(_);Space(5);Header(. Specular Overlay);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2165;1490.13,491.2621;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.NormalizeNode;2480;-1284.901,-3464.82;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2355;-1954.237,-3836.05;Inherit;False;4;4;0;FLOAT2;0,0;False;1;FLOAT2;0.25,0.25;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;2506;-1107.654,-3366.304;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;2556;-1808.022,-3865.244;Inherit;True;Property;_TextureSample2;Texture Sample 2;100;0;Create;True;0;0;0;False;0;False;1732;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;2396;-1271.552,-4255.848;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;894;-1171.299,-3773.917;Float;False;Property;_Range;Range;57;0;Create;True;0;0;0;False;0;False;0.3;0;0.05;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;328;1232.592,-1529.267;Inherit;True;Property;_Emission;Emission Map;25;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;2440;-858.1138,-3453.98;Inherit;False;Standard;WorldNormal;ViewDir;False;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;2371;-858.2922,-3614.079;Inherit;False;Standard;WorldNormal;ViewDir;False;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;810;1670.553,457.5191;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;408;1712.523,575.6776;Inherit;False;Property;_MatcapIntensity;Matcap Intensity;80;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;897;-1070.903,-3898.586;Float;False;Property;_Threshold;Threshold;56;0;Create;True;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;695;143.7581,-1652.483;Inherit;True;Property;_SpecularMask;Specular Mask;49;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;2920;1814.093,704.2229;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1518;1613.003,982.9312;Float;False;Property;_MatcapSaturation;Matcap Saturation;81;0;Create;True;0;0;0;False;0;False;1;1;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;824;184.5911,-1772.766;Inherit;False;Property;_SpecMaskOpacity;SpecMask Opacity;50;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1513;1896.837,-860.0247;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1710;-1534.744,-3933.989;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2301;472.6919,-2116.115;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;2001;267.4235,-2034.646;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2550;-2149.324,-4112.819;Inherit;True;Property;_TextureSample1;Texture Sample 1;100;0;Create;True;0;0;0;False;0;False;1732;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;349;1997,116.3659;Inherit;True;Property;_FriendsOnlyRT;> FriendsOnly RenderTexture;86;0;Create;False;0;0;0;False;0;False;-1;None;82b3c1c318ad4cf47a66ffc8a2859a78;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;970;1524.552,-1415.231;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1424;2283.96,143.9849;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1705;-1339.485,-3895.465;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2810;-305.7209,-3793.369;Inherit;False;Constant;_Float0;Float 0;94;0;Create;True;0;0;0;False;0;False;2.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;546.2772,-1917.648;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1704;-1370.995,-4049.963;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2805;-173.2231,-3328.138;Inherit;False;2;2;0;FLOAT;200;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;898;-786.9644,-3845.716;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;1952.383,555.8519;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;1537.567,-1527.099;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;448.6492,-1800.662;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;2813;-587.5778,-3467.338;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1292;2059.22,-859.4677;Inherit;False;PostRimLight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1517;1901.405,978.8695;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2394;-1107.671,-4249.463;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2812;-596.0203,-3613.128;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1743;-489.6627,-4231.884;Inherit;True;Property;_SparkleMask1;Sparkle Mask;64;0;Create;False;0;0;0;False;1;Space(5);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;2264;1648.116,-629.5377;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;560;705.934,-1939.117;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;900;-962.0844,-4025.886;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1744;-170.0948,-4223.101;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1279;1916.023,447.1837;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2801;-157.4646,-3789.004;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2180;1559.996,891.2372;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;406;2081.747,978.3789;Inherit;False;Property;_MatcapOpacity;Matcap Opacity;79;0;Create;True;0;0;0;False;0;False;5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;1751.053,-1427.133;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;875;-340.6028,-3961.608;Float;False;Property;_SparkleColor1;Color;53;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;2564;-423.943,-3496.849;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;2308;-419.6257,-3613.973;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1516;2109.765,585.8789;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1425;2093.326,-11.88314;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;461;1530.298,-1337.511;Inherit;False;Property;_ShadedEmission;Shaded Emission;28;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;1647.938,-1245.289;Float;False;Property;_EmissionColor;Emission Colour;26;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;2313;-661.3455,-3870.595;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;450;1947.945,-1451.715;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CeilOpNode;351;2266.414,-106.4846;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;2291;1831.352,-624.7445;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;807;2360.355,900.9818;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1745;-23.78265,-4097.915;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1278;2200.275,428.4138;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;2304.958,535.9379;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;901;-529.2374,-3977.755;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.8,0,0;False;2;FLOAT3;0.85,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;846.7546,-1943.53;Inherit;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;326;1875.891,-1157.456;Float;False;Property;_EmissionIntensity;Emission Intensity;27;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2811;-43.72089,-3920.369;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SwitchByFaceNode;2437;-213.9436,-3608.715;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;805;1881.495,-1246.593;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;877;163.662,-3861.776;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;2287;1997.972,-629.599;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;1984.217,-544.7396;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;330;2129.723,-1149.804;Float;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;405;2465.416,478.5954;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;353;2431.177,44.14935;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2003;179.9406,-3947.373;Inherit;False;Property;_UseSparkles;Use Sparkles;52;0;Create;True;0;0;0;False;3;Toggle(_);Space(5);Header(.  Sparkles  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;2142.448,-1289.363;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;957;280.8892,-3721.078;Inherit;False;Constant;_Sparkle_Null;Sparkle_Null;66;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;-411.9253,-427.1794;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;331;2323.342,-1248.401;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Compare;2004;456.0507,-3895.365;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2284;2203.972,-625.599;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1999;2452.493,-56.85925;Inherit;False;Property;_FriendsOnly1;Invert Friends Only;87;0;Create;False;0;0;0;False;3;Toggle(_);;;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;627;2573.131,23.76944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1274;2663.465,473.7811;Inherit;False;PostMatcap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1998;2690.467,-102.566;Inherit;False;Property;_FriendsOnly;Friends Only ON/OFF;85;0;Create;False;0;0;0;False;3;Toggle(_);Space(20);Header(VRC Friends Only);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;2304.434,-335.2882;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;2477.611,-1246.415;Inherit;False;Emission;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1426;2702.587,181.6416;Inherit;False;Constant;_FriendsOnly_Null;FriendsOnly_Null;77;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;334;2207.65,-410.3355;Inherit;False;Property;_Alpha;Alpha;6;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2163;2152.229,-932.084;Inherit;False;1274;PostMatcap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;2280;2375.972,-618.5985;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1021;2188.035,-1013.522;Inherit;False;Property;_UseMatcap;Use Matcap;76;0;Create;True;0;0;0;False;3;Toggle(_);Space(10);Header(.  MatCap  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2000;2766.493,2.140751;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;971;648.0585,-3897.801;Inherit;False;SparkleOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;2528.312,-388.0042;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1022;2470.695,-931.1481;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;1996;3016.573,-114.8689;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;2895.654,-337.9704;Inherit;False;Property;_Cutoff;Alpha Cutoff;7;0;Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1702;2419.217,-495.7396;Inherit;False;971;SparkleOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2290;2522.845,-593.4398;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;10,10,10;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1294;2423.846,-690.4126;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClipNode;1430;3137.46,-463.9726;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2807.245,-579.6193;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1346;2859.333,-1342.923;Inherit;False;670.9946;746.3742;custom properties;13;1345;1335;1344;1342;1431;1340;1339;1337;1432;1343;1338;1341;1469;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;2901;-1088.408,-1536.403;Inherit;True;Property;_TextureSample4;Texture Sample 4;91;0;Create;True;0;0;0;False;0;False;2181;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1344;2882.237,-914.3182;Float;False;Property;_ZTestMode;ZTestMode (LEqual);89;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1923;3354.73,-577.434;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Compare;1560;-4149.332,-156.4818;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.005;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3151.765,-825.441;Inherit;False;Property;_DstBlend;Destination Blend (Zero);98;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1469;2892.559,-694.9409;Inherit;False;Property;_AlphaToCoverage;AlphaToCoverage (override alpha);5;1;[Toggle];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1342;3202.625,-1136.015;Inherit;False;Property;_StencilFail;StencilFail;95;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;2885.308,-1002.382;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);88;1;[Toggle];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1341;3206.338,-1208.357;Inherit;False;Property;_StencilOp;StencilOp;94;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2478;-1759.901,-3566.82;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1343;3201.625,-1061.015;Inherit;False;Property;_StencilZFail;StencilZFail;96;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;2875.299,-1112.257;Half;False;Property;_WriteMask;WriteMask;91;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1335;3215.875,-918.9951;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1340;3181.625,-1281.015;Inherit;False;Property;_StencilComparison;Stencil Comparison;93;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1431;2886.58,-820.4198;Inherit;False;Property;_SrcBlend;Source Blend (One);97;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;2882.479,-1280.823;Half;False;Property;_StencilRef;Stencil ID;90;0;Create;False;0;0;0;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;2876.299,-1194.834;Half;False;Property;_ReadMask;ReadMask;92;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1924;3554.631,-581.6443;Float;False;True;-1;2;ASEMaterialInspector;100;1;.GenesisAria/Arias Toon Shader WIP;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;1;1;True;1431;0;True;1432;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;True;1469;False;True;0;True;1335;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;True;255;True;1337;255;True;1338;255;True;1339;7;True;1340;1;True;1341;1;True;1342;1;True;1343;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;1345;True;3;True;1344;True;False;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;2;Include;;False;;Native;Include;AutoLight.cginc;False;;Custom;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;True;;False;0
WireConnection;1878;0;2079;16
WireConnection;1878;1;2079;17
WireConnection;1878;2;2079;18
WireConnection;1878;3;2079;20
WireConnection;1551;0;1878;0
WireConnection;1886;0;2079;23
WireConnection;1886;1;2079;29
WireConnection;1886;2;2079;30
WireConnection;1886;3;2079;31
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;1891;0;1551;3
WireConnection;1890;0;1589;0
WireConnection;2014;0;1886;0
WireConnection;1879;0;2014;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;2148;0;2147;0
WireConnection;1665;0;1905;0
WireConnection;430;1;425;0
WireConnection;430;2;428;0
WireConnection;1246;0;1232;2
WireConnection;1246;1;2148;0
WireConnection;2154;0;2153;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;2151;0;2152;0
WireConnection;2151;2;2154;0
WireConnection;2151;3;2150;0
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;1235;0;430;0
WireConnection;2144;0;2121;0
WireConnection;2635;0;248;0
WireConnection;2635;1;2852;2
WireConnection;2159;0;2151;0
WireConnection;1233;0;1247;0
WireConnection;1876;0;633;1
WireConnection;1876;1;633;2
WireConnection;2017;0;2079;0
WireConnection;1249;0;1235;0
WireConnection;2140;0;2121;0
WireConnection;2140;1;1490;0
WireConnection;2140;2;2144;0
WireConnection;962;0;1249;0
WireConnection;1383;0;2017;0
WireConnection;1383;1;2159;0
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;2635;0
WireConnection;2034;0;2140;0
WireConnection;2215;0;1076;0
WireConnection;2026;0;2034;0
WireConnection;1382;0;1383;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;2035;1;2026;0
WireConnection;5;0;1165;0
WireConnection;5;1;2215;0
WireConnection;1389;0;1381;0
WireConnection;1630;0;2079;17
WireConnection;1630;1;2079;29
WireConnection;1631;0;2079;18
WireConnection;1631;1;2079;30
WireConnection;2025;0;2035;0
WireConnection;1296;0;5;0
WireConnection;1629;0;2079;16
WireConnection;1629;1;2079;23
WireConnection;1684;0;2079;20
WireConnection;1684;1;2079;31
WireConnection;2033;0;2025;0
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;1683;0;1682;0
WireConnection;1994;0;1480;0
WireConnection;1994;1;1297;0
WireConnection;1994;2;2033;0
WireConnection;1059;0;1058;0
WireConnection;1059;2;1994;0
WireConnection;1491;0;1382;0
WireConnection;1908;1;1910;0
WireConnection;1908;0;1683;0
WireConnection;2082;0;2081;2
WireConnection;1406;0;1908;0
WireConnection;1106;0;1059;0
WireConnection;1106;1;1107;0
WireConnection;1774;0;1488;0
WireConnection;1774;1;1775;0
WireConnection;2843;0;1774;0
WireConnection;1118;0;149;0
WireConnection;1118;1;1106;0
WireConnection;1118;2;2211;1
WireConnection;2213;0;2217;0
WireConnection;2213;1;2216;0
WireConnection;2213;2;2033;0
WireConnection;1486;0;1484;1
WireConnection;1486;1;1484;2
WireConnection;1486;2;2082;0
WireConnection;1254;0;1118;0
WireConnection;1507;0;1506;1
WireConnection;1507;1;1506;2
WireConnection;1489;0;1486;0
WireConnection;1489;1;1408;0
WireConnection;1489;2;2843;0
WireConnection;1499;0;641;0
WireConnection;2218;0;2213;0
WireConnection;1504;0;1605;0
WireConnection;1504;2;1507;0
WireConnection;1504;3;1505;0
WireConnection;1125;0;1254;0
WireConnection;1125;1;1254;0
WireConnection;1914;0;1489;0
WireConnection;1914;1;1916;0
WireConnection;1914;2;1915;0
WireConnection;662;0;1123;0
WireConnection;662;2;1499;0
WireConnection;662;3;642;0
WireConnection;1304;0;1504;0
WireConnection;1032;0;1008;0
WireConnection;32;1;1125;0
WireConnection;645;0;1123;0
WireConnection;645;4;1492;0
WireConnection;645;2;641;0
WireConnection;645;3;642;0
WireConnection;682;0;662;0
WireConnection;2867;0;1914;0
WireConnection;2867;1;2870;0
WireConnection;664;0;682;0
WireConnection;654;0;645;0
WireConnection;2085;0;2867;0
WireConnection;1033;0;1032;0
WireConnection;1033;1;32;0
WireConnection;1010;0;1008;0
WireConnection;811;0;646;0
WireConnection;1064;0;684;0
WireConnection;1064;1;1304;0
WireConnection;665;0;654;0
WireConnection;665;1;664;0
WireConnection;815;0;1033;0
WireConnection;680;0;1064;0
WireConnection;670;0;645;0
WireConnection;679;0;811;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;2086;0;2085;0
WireConnection;2086;1;2085;1
WireConnection;2086;2;2085;2
WireConnection;1036;0;1035;0
WireConnection;1036;2;680;0
WireConnection;1036;3;679;0
WireConnection;669;0;665;0
WireConnection;669;2;670;0
WireConnection;1026;0;1025;0
WireConnection;1026;2;1016;0
WireConnection;1026;3;815;0
WireConnection;2109;0;2086;0
WireConnection;2109;1;2085;3
WireConnection;2100;0;2109;0
WireConnection;979;0;1026;0
WireConnection;1470;0;1106;0
WireConnection;660;0;1036;0
WireConnection;660;2;669;0
WireConnection;344;0;1470;0
WireConnection;344;1;335;0
WireConnection;1280;0;954;0
WireConnection;1280;1;660;0
WireConnection;2101;0;2100;0
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;1545;0;1280;0
WireConnection;2093;0;2101;0
WireConnection;2098;0;2093;0
WireConnection;1546;0;1545;0
WireConnection;30;0;346;0
WireConnection;1500;0;30;0
WireConnection;1500;1;1546;0
WireConnection;2868;0;2098;0
WireConnection;2289;0;1500;0
WireConnection;1777;0;2867;0
WireConnection;1777;1;2868;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;2289;0
WireConnection;813;0;18;0
WireConnection;602;1;425;0
WireConnection;602;2;603;0
WireConnection;968;0;1922;0
WireConnection;812;0;10;0
WireConnection;19;0;812;0
WireConnection;19;1;813;0
WireConnection;19;2;968;0
WireConnection;1234;0;602;0
WireConnection;2224;0;2225;0
WireConnection;2224;2;2853;2
WireConnection;2224;3;1909;0
WireConnection;2909;0;19;0
WireConnection;1248;0;1234;0
WireConnection;2911;0;2910;0
WireConnection;2911;1;2909;1
WireConnection;2426;0;2424;0
WireConnection;2426;1;2425;0
WireConnection;965;0;1248;0
WireConnection;2237;0;2224;0
WireConnection;2237;1;2219;0
WireConnection;1783;0;2237;0
WireConnection;2205;0;602;0
WireConnection;586;0;585;0
WireConnection;2503;0;2426;0
WireConnection;2908;0;2911;0
WireConnection;2908;1;2909;2
WireConnection;2908;2;2909;3
WireConnection;2918;0;325;0
WireConnection;582;0;1330;0
WireConnection;2236;1;546;0
WireConnection;584;0;582;0
WireConnection;584;1;586;0
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;553;0;2236;0
WireConnection;2917;0;2908;0
WireConnection;2917;1;2918;0
WireConnection;1856;0;2205;0
WireConnection;2839;0;2503;0
WireConnection;1536;0;1537;0
WireConnection;1536;1;1530;0
WireConnection;1536;2;1534;0
WireConnection;1861;0;430;0
WireConnection;556;1;555;0
WireConnection;545;0;551;0
WireConnection;545;1;553;0
WireConnection;2804;0;2839;0
WireConnection;1531;0;1533;0
WireConnection;1531;2;1536;0
WireConnection;1531;3;1537;0
WireConnection;581;0;2917;0
WireConnection;581;1;584;0
WireConnection;360;0;1531;0
WireConnection;360;2;369;0
WireConnection;360;3;368;0
WireConnection;554;0;545;0
WireConnection;554;1;556;0
WireConnection;2884;27;1928;0
WireConnection;2884;21;967;0
WireConnection;2348;0;2361;0
WireConnection;2897;9;2898;0
WireConnection;2897;45;1928;0
WireConnection;2834;0;2804;0
WireConnection;1918;0;581;0
WireConnection;2405;0;2348;0
WireConnection;379;0;360;0
WireConnection;379;1;2299;0
WireConnection;379;2;2300;0
WireConnection;2349;0;2348;0
WireConnection;2406;0;2404;0
WireConnection;2778;0;2866;1
WireConnection;2778;1;2866;2
WireConnection;2778;2;2866;3
WireConnection;2863;0;2862;0
WireConnection;2900;0;2899;0
WireConnection;2900;1;2897;0
WireConnection;2294;0;554;0
WireConnection;2833;0;2834;0
WireConnection;1276;0;1918;0
WireConnection;2902;0;2899;0
WireConnection;2902;1;2884;0
WireConnection;2357;0;2348;0
WireConnection;2840;0;902;3
WireConnection;2840;1;2833;0
WireConnection;2896;9;2873;0
WireConnection;2896;45;1930;0
WireConnection;2356;0;2349;0
WireConnection;2356;1;2357;0
WireConnection;2841;0;902;2
WireConnection;2841;1;2833;0
WireConnection;816;1;2294;0
WireConnection;816;2;561;0
WireConnection;2403;0;2405;0
WireConnection;2403;2;2406;0
WireConnection;2885;27;1930;0
WireConnection;2885;21;963;0
WireConnection;2208;0;2209;0
WireConnection;2779;0;2778;0
WireConnection;2779;1;2863;0
WireConnection;2904;0;2905;0
WireConnection;2904;2;2900;0
WireConnection;2904;3;2902;0
WireConnection;382;0;376;0
WireConnection;382;1;379;0
WireConnection;960;2;1732;0
WireConnection;1713;2;1732;0
WireConnection;2472;0;960;0
WireConnection;2207;0;2885;0
WireConnection;2207;2;2208;0
WireConnection;2234;0;816;0
WireConnection;2234;1;816;0
WireConnection;2234;2;816;0
WireConnection;2806;0;902;1
WireConnection;2806;1;2841;0
WireConnection;2806;2;2840;0
WireConnection;1921;0;1919;0
WireConnection;2865;0;2779;0
WireConnection;370;0;382;0
WireConnection;370;1;1290;0
WireConnection;2210;0;2896;0
WireConnection;2210;2;2208;0
WireConnection;817;0;2904;0
WireConnection;2398;0;2400;0
WireConnection;2398;2;2356;0
WireConnection;2398;3;2403;0
WireConnection;383;0;379;0
WireConnection;383;1;384;0
WireConnection;2686;0;2861;0
WireConnection;2686;1;885;0
WireConnection;2175;0;2181;0
WireConnection;2175;1;2210;0
WireConnection;388;0;1290;0
WireConnection;388;1;370;0
WireConnection;388;2;384;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;372;0;1291;0
WireConnection;372;1;382;0
WireConnection;372;2;383;0
WireConnection;2176;0;2181;0
WireConnection;2176;1;2207;0
WireConnection;390;0;1291;0
WireConnection;390;1;382;0
WireConnection;390;2;383;0
WireConnection;838;0;837;0
WireConnection;2906;0;2234;0
WireConnection;1746;0;2472;0
WireConnection;825;1;869;0
WireConnection;2379;0;2377;0
WireConnection;2379;1;2857;0
WireConnection;2544;0;1713;0
WireConnection;2544;1;2686;0
WireConnection;2864;0;2865;0
WireConnection;2864;1;2779;0
WireConnection;2359;0;2360;0
WireConnection;2359;1;2398;0
WireConnection;2505;0;2806;0
WireConnection;2558;0;1732;0
WireConnection;2473;0;1746;0
WireConnection;2473;1;2472;1
WireConnection;2886;21;825;0
WireConnection;2907;0;2906;0
WireConnection;1284;0;1281;0
WireConnection;1284;2;388;0
WireConnection;1284;3;390;0
WireConnection;1284;4;372;0
WireConnection;690;0;1920;0
WireConnection;690;1;691;0
WireConnection;690;2;838;0
WireConnection;2395;0;2379;0
WireConnection;2458;0;2372;0
WireConnection;2165;0;2166;0
WireConnection;2165;2;2175;0
WireConnection;2165;3;2176;0
WireConnection;2480;0;2476;0
WireConnection;2355;0;2544;0
WireConnection;2355;2;2359;0
WireConnection;2355;3;2864;0
WireConnection;2506;0;2505;0
WireConnection;2556;0;2558;0
WireConnection;2556;1;2355;0
WireConnection;2396;0;2395;0
WireConnection;2440;0;2458;0
WireConnection;2440;4;2480;0
WireConnection;2440;1;2506;0
WireConnection;2440;2;2506;1
WireConnection;2440;3;2506;2
WireConnection;2371;0;2372;0
WireConnection;2371;4;2480;0
WireConnection;2371;1;2506;0
WireConnection;2371;2;2506;1
WireConnection;2371;3;2506;2
WireConnection;810;0;2165;0
WireConnection;695;1;2886;0
WireConnection;2920;0;2919;0
WireConnection;1513;0;1514;0
WireConnection;1513;2;1284;0
WireConnection;1513;3;1515;0
WireConnection;1710;0;1709;0
WireConnection;2301;0;2907;0
WireConnection;2001;0;2002;0
WireConnection;2001;2;690;0
WireConnection;2001;3;952;0
WireConnection;2550;0;1732;0
WireConnection;2550;1;2473;0
WireConnection;1424;0;349;1
WireConnection;1424;1;349;2
WireConnection;1424;2;349;3
WireConnection;1705;0;2556;0
WireConnection;1705;1;1710;0
WireConnection;701;0;2301;0
WireConnection;701;1;2001;0
WireConnection;1704;0;2550;0
WireConnection;1704;1;1710;0
WireConnection;2805;1;2804;0
WireConnection;898;0;897;0
WireConnection;898;1;894;0
WireConnection;407;0;810;0
WireConnection;407;1;408;0
WireConnection;407;2;2920;0
WireConnection;808;0;328;0
WireConnection;696;0;695;0
WireConnection;696;1;824;0
WireConnection;2813;0;2440;0
WireConnection;1292;0;1513;0
WireConnection;1517;0;1518;0
WireConnection;2394;0;2396;0
WireConnection;2812;0;2371;0
WireConnection;560;1;701;0
WireConnection;560;2;696;0
WireConnection;900;0;1704;0
WireConnection;900;1;1705;0
WireConnection;900;2;2394;0
WireConnection;1744;0;1743;0
WireConnection;2801;0;2810;0
WireConnection;2801;1;2805;0
WireConnection;2180;0;2165;0
WireConnection;462;0;808;0
WireConnection;462;1;970;0
WireConnection;2564;0;2813;0
WireConnection;2308;0;2812;0
WireConnection;1516;0;407;0
WireConnection;1516;1;1517;0
WireConnection;1425;0;1424;0
WireConnection;2313;0;898;0
WireConnection;450;0;808;0
WireConnection;450;1;462;0
WireConnection;450;2;461;0
WireConnection;351;0;1425;0
WireConnection;2291;0;2264;0
WireConnection;807;0;2180;0
WireConnection;807;1;406;0
WireConnection;1745;0;1744;0
WireConnection;1745;1;1743;4
WireConnection;414;0;1279;0
WireConnection;414;1;1516;0
WireConnection;901;0;900;0
WireConnection;901;1;897;0
WireConnection;901;2;2313;0
WireConnection;983;0;560;0
WireConnection;2811;0;875;0
WireConnection;2811;1;2801;0
WireConnection;2437;0;2308;0
WireConnection;2437;1;2564;0
WireConnection;805;0;327;0
WireConnection;877;0;1745;0
WireConnection;877;1;2811;0
WireConnection;877;2;901;0
WireConnection;877;3;2437;0
WireConnection;2287;0;2291;0
WireConnection;405;0;1278;0
WireConnection;405;1;414;0
WireConnection;405;2;807;0
WireConnection;353;0;351;0
WireConnection;329;0;450;0
WireConnection;329;1;805;0
WireConnection;329;2;326;0
WireConnection;1262;0;10;4
WireConnection;331;0;329;0
WireConnection;331;2;330;0
WireConnection;2004;0;2003;0
WireConnection;2004;2;877;0
WireConnection;2004;3;957;0
WireConnection;2284;0;2287;0
WireConnection;2284;1;1701;0
WireConnection;627;0;353;0
WireConnection;1274;0;405;0
WireConnection;1285;0;331;0
WireConnection;2280;0;2284;0
WireConnection;2280;1;1701;0
WireConnection;2000;0;1999;0
WireConnection;2000;2;627;0
WireConnection;2000;3;353;0
WireConnection;971;0;2004;0
WireConnection;333;0;334;0
WireConnection;333;1;1265;0
WireConnection;1022;0;1021;0
WireConnection;1022;2;2163;0
WireConnection;1022;3;1292;0
WireConnection;1996;0;1998;0
WireConnection;1996;2;2000;0
WireConnection;1996;3;1426;0
WireConnection;2290;0;2280;0
WireConnection;1430;0;333;0
WireConnection;1430;1;1996;0
WireConnection;1430;2;1433;0
WireConnection;470;0;1022;0
WireConnection;470;1;1294;0
WireConnection;470;2;2290;0
WireConnection;470;3;1702;0
WireConnection;1923;0;470;0
WireConnection;1923;3;1430;0
WireConnection;1560;2;1480;0
WireConnection;1560;3;1297;0
WireConnection;1924;0;1923;0
ASEEND*/
//CHKSM=59503822BCE96C7445FF0AD549DAC309A6D9C037
