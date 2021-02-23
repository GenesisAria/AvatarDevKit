// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "GenesisAria/Arias HoloSight Transparent"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[Header(.  Main  .)]_MainTex("Texture", 2D) = "white" {}
		[HDR]_Color("> Color", Color) = (1,1,1,1)
		_Saturation("Saturation", Range( -1 , 5)) = 1
		[Toggle][Space (5)]_AlphaToCoverage("AlphaToCoverage (override alpha)", Float) = 0
		_Alpha("Alpha", Range( 0 , 1)) = 1
		_Cutoff("Alpha Cutoff", Float) = 0
		[Space(10)][Header(.  Parallax  .)]_ParallaxCookie("Parallax Cookie (no alpha)", 2D) = "black" {}
		[HDR]_ParalaxColour("Paralax Colour", Color) = (1,1,1,0)
		_ParallaxScale("Parallax Scale", Float) = 0.5
		_ParallaxDepth("Parallax Depth", Float) = -10
		[Enum(Y up,0,Z up,1)]_FixMeshAxis("Fix Mesh Axis", Float) = 0
		_XAdjust("X Adjust", Range( -1 , 1)) = 0.5
		_YAdjust("Y Adjust", Range( -1 , 1)) = 0.5
		[Gamma][Toggle(_)]_Noise("Noise", Float) = 0
		_NoiseRate("Noise Rate", Float) = 0
		_RotateSpeed("Rotate Speed", Float) = 0
		[Space(10)][Header(.  Light Colour  .)]_LightSaturation("Light Saturation", Float) = 0.6
		_BakedLightContrib("Baked Light Contrib", Float) = 1
		_MaxLight("Max Light", Float) = 0.9
		_MinLight("Min Light", Float) = 0.9
		[Space(5)][Header(.  Shadow  .)][Toggle(_)]_UseShading("Use Shading", Float) = 1
		[Enum(Ramp_Texture,0,Linear_Gradient,1)]_GradientorRamp("Gradient or Ramp", Float) = 1
		_ShadowColour("Shadow Colour", Color) = (0.7098039,0.7098039,0.7098039,1)
		_Ramp("Ramp", 2D) = "white" {}
		_OffsetDot("Offset Dot", Range( -1 , 1)) = 0
		_ShadowSharpness1("Shadow Sharpness", Float) = 1
		_ShadowDarkness("Shadow Darkness", Float) = 0.22
		_ShadowSaturation("Shadow Saturation", Range( -1 , 5)) = 1
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.5
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.5
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.8
		[Space(5)][Header(.  Emission  .)]_Emission("Emission Map", 2D) = "black" {}
		[HDR]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		_EmissionIntensity("Emission Intensity", Float) = 1
		_ShadedEmission("Shaded Emission", Float) = 0
		[Normal][Space(5)][Header(.  Normals  .)]_Normal("Normal", 2D) = "bump" {}
		_NormalPower("Normal Power", Range( 0 , 1)) = 0
		_NormalPowerSpecular("Normal Power Specular", Range( 0 , 1)) = 0.5
		[Space(5)][Header(.  Specular  .)]_SpecularOpacity("Specular Opacity", Range( 0 , 1)) = 1
		_SpecularSize("Specular Size", Range( 0 , 10)) = 1
		_SpecularStrength("Specular Strength", Float) = 0
		[Space(5)][Header(. Specular Overlay)][Toggle(_USESPECULARMATCAP_ON)] _UseSpecularMatCap("Use Specular MatCap", Float) = 0
		_SpecularMatcap("Specular Matcap", 2D) = "black" {}
		_SpecMatcapMultiply("SpecMatcap Multiply", Float) = 1
		_SpecMatcapSaturation("SpecMatcap Saturation", Float) = 1
		_SpecularMask("Specular Mask", 2D) = "white" {}
		[HDR]_SpecMatCapColor("SpecMatCap Color", Color) = (1,1,1,1)
		_SpecMaskOpacity("SpecMask Opacity", Float) = 1
		_SpecMatCapNorm("SpecMatCap Norm", 2D) = "white" {}
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
			#include "UnityStandardBRDF.cginc"
			#include "Lighting.cginc"
			#include "UnityStandardUtils.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile __ VERTEXLIGHT_ON
			#pragma shader_feature _USESPECULARMATCAP_ON


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
			uniform float _ZTestMode;
			uniform int _StencilFail;
			uniform float _AlphaToCoverage;
			uniform half _WriteMask;
			uniform int _Culling;
			uniform half _ReadMask;
			uniform float _DstBlend;
			uniform int _StencilComparison;
			uniform float _SrcBlend;
			uniform float _ZWriteMode;
			uniform int _StencilOp;
			uniform int _StencilZFail;
			uniform float _Noise;
			uniform float _NoiseRate;
			uniform sampler2D _ParallaxCookie;
			uniform float _ParallaxDepth;
			uniform float _ParallaxScale;
			uniform float _FixMeshAxis;
			uniform float _XAdjust;
			uniform float _YAdjust;
			uniform float _RotateSpeed;
			uniform float4 _ParalaxColour;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _Color;
			uniform float _BakedLightContrib;
			uniform float _MinLight;
			uniform float _MaxLight;
			uniform float _LightSaturation;
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
			uniform float _OffsetDot;
			uniform sampler2D _Ramp;
			uniform float _ShadowDarkness;
			uniform float _Saturation;
			uniform float _ShadowSaturation;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;
			uniform float _ShadedEmission;
			uniform float4 _EmissionColor;
			uniform float _EmissionIntensity;
			uniform float _NormalPowerSpecular;
			uniform float _SpecularSize;
			uniform float _SpecularStrength;
			uniform float _SpecularOpacity;
			uniform sampler2D _SpecularMatcap;
			uniform float _SpecMatcapSaturation;
			uniform float _SpecMatcapMultiply;
			uniform float4 _SpecMatCapColor;
			uniform sampler2D _SpecularMask;
			uniform sampler2D _SpecMatCapNorm;
			uniform float _SpecMaskOpacity;
			uniform float _Alpha;
			uniform float _Cutoff;
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
			float3 CenterEye1_g276(  )
			{
				#if defined(USING_STEREO_MATRICES)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 ShadeSH9bakedlight1488( float3 x )
			{
				return ShadeSH9(half4(x, 1));
			}
			
			float4 VertexLightCol114_g4(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightPosX3_g4(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g4(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g4(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g4(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol215_g4(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g4(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g4(  )
			{
				return unity_LightColor[3];
			}
			
			float3 CenterEye16_g275(  )
			{
				#if defined(USING_STEREO_MATRICES)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
			}
			
			float3 CenterEye16_g277(  )
			{
				#if defined(USING_STEREO_MATRICES)
				float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
				float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
				float3 centerEye = lerp(leftEye, rightEye, 0.5);
				#else
				float3 centerEye = _WorldSpaceCameraPos;
				#endif
				return centerEye;
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
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float mulTime2023 = _Time.y * ( _NoiseRate * 10.0 );
				float simplePerlin2D2016 = snoise( i.ase_texcoord1.xy*mulTime2023 );
				simplePerlin2D2016 = simplePerlin2D2016*0.5 + 0.5;
				float3 localCenterEye1_g276 = CenterEye1_g276();
				float4 transform2073 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = Unity_SafeNormalize( ase_worldViewDir );
				float3 worldToObjDir2033 = normalize( mul( unity_WorldToObject, float4( ase_worldViewDir, 0 ) ).xyz );
				float3 appendResult2037 = (float3(worldToObjDir2033.x , worldToObjDir2033.z , worldToObjDir2033.y));
				float2 appendResult2082 = (float2(_XAdjust , _YAdjust));
				float2 saferPower2084 = max( appendResult2082 , 0.0001 );
				float2 Offset1925 = ( ( _ParallaxDepth - 1 ) * ( ( _FixMeshAxis == 1.0 ? appendResult2037 : worldToObjDir2033 ) + float3( pow( saferPower2084 , 2.0 ) ,  0.0 ) ).xy * ( distance( float4( localCenterEye1_g276 , 0.0 ) , transform2073 ) / _ParallaxScale ) ) + float2( 0.478,0.505 );
				float mulTime2010 = _Time.y * _RotateSpeed;
				float cos2008 = cos( mulTime2010 );
				float sin2008 = sin( mulTime2010 );
				float2 rotator2008 = mul( saturate( Offset1925 ) - float2( 0.5,0.5 ) , float2x2( cos2008 , -sin2008 , sin2008 , cos2008 )) + float2( 0.5,0.5 );
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode10 = tex2D( _MainTex, uv_MainTex );
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float3 x1488 = float3( 0,1,0.5 );
				float3 localShadeSH9bakedlight1488 = ShadeSH9bakedlight1488( x1488 );
				float4 localVertexLightCol114_g4 = VertexLightCol114_g4();
				float4 temp_output_1896_16 = localVertexLightCol114_g4;
				float4 localVertexLightPosX3_g4 = VertexLightPosX3_g4();
				float4 break4_g4 = localVertexLightPosX3_g4;
				float4 localVertexLightPosY2_g4 = VertexLightPosY2_g4();
				float4 break5_g4 = localVertexLightPosY2_g4;
				float4 localVertexLightPosZ1_g4 = VertexLightPosZ1_g4();
				float4 break6_g4 = localVertexLightPosZ1_g4;
				float3 appendResult7_g4 = (float3(break4_g4.x , break5_g4.x , break6_g4.x));
				float3 pos188_g4 = appendResult7_g4;
				float3 objToWorld139_g4 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_45_0_g4 = pow( distance( pos188_g4 , objToWorld139_g4 ) , 2.0 );
				float4 localVertexLightAttenuation86_g4 = VertexLightAttenuation86_g4();
				float4 break87_g4 = localVertexLightAttenuation86_g4;
				float attenx96_g4 = break87_g4.x;
				float temp_output_60_0_g4 = saturate( ( 1.0 - ( ( temp_output_45_0_g4 * attenx96_g4 ) / 25.0 ) ) );
				float temp_output_1896_23 = min( ( 1.0 + ( ( 1.0 / temp_output_45_0_g4 ) * attenx96_g4 ) ) , ( temp_output_60_0_g4 * temp_output_60_0_g4 ) );
				float4 localVertexLightCol215_g4 = VertexLightCol215_g4();
				float4 temp_output_1896_17 = localVertexLightCol215_g4;
				float3 appendResult8_g4 = (float3(break4_g4.y , break5_g4.y , break6_g4.y));
				float3 pos290_g4 = appendResult8_g4;
				float3 objToWorld140_g4 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_75_0_g4 = pow( distance( pos290_g4 , objToWorld140_g4 ) , 2.0 );
				float atteny97_g4 = break87_g4.y;
				float temp_output_107_0_g4 = saturate( ( 1.0 - ( ( temp_output_75_0_g4 * atteny97_g4 ) / 25.0 ) ) );
				float temp_output_1896_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g4 ) * atteny97_g4 ) ) , ( temp_output_107_0_g4 * temp_output_107_0_g4 ) );
				float4 localVertexLightCol319_g4 = VertexLightCol319_g4();
				float4 temp_output_1896_18 = localVertexLightCol319_g4;
				float3 appendResult9_g4 = (float3(break4_g4.z , break5_g4.z , break6_g4.z));
				float3 pos389_g4 = appendResult9_g4;
				float3 objToWorld141_g4 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_79_0_g4 = pow( distance( pos389_g4 , objToWorld141_g4 ) , 2.0 );
				float attenz98_g4 = break87_g4.z;
				float temp_output_125_0_g4 = saturate( ( 1.0 - ( ( temp_output_79_0_g4 * attenz98_g4 ) / 25.0 ) ) );
				float temp_output_1896_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g4 ) * attenz98_g4 ) ) , ( temp_output_125_0_g4 * temp_output_125_0_g4 ) );
				float4 localVertexLightCol421_g4 = VertexLightCol421_g4();
				float4 temp_output_1896_20 = localVertexLightCol421_g4;
				float3 appendResult10_g4 = (float3(break4_g4.w , break5_g4.w , break6_g4.w));
				float3 pos491_g4 = appendResult10_g4;
				float3 objToWorld138_g4 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
				float temp_output_83_0_g4 = pow( distance( pos491_g4 , objToWorld138_g4 ) , 2.0 );
				float attenw99_g4 = break87_g4.w;
				float temp_output_116_0_g4 = saturate( ( 1.0 - ( ( temp_output_83_0_g4 * attenw99_g4 ) / 25.0 ) ) );
				float temp_output_1896_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g4 ) * attenw99_g4 ) ) , ( temp_output_116_0_g4 * temp_output_116_0_g4 ) );
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch1908 = saturate( ( ( temp_output_1896_16 * temp_output_1896_23 ) + ( temp_output_1896_17 * temp_output_1896_29 ) + ( temp_output_1896_18 * temp_output_1896_30 ) + ( temp_output_1896_20 * temp_output_1896_31 ) ) );
				#else
				float4 staticSwitch1908 = float4(0,0,0,0);
				#endif
				float4 VertLight1406 = staticSwitch1908;
				float4 temp_cast_4 = (_MinLight).xxxx;
				float4 temp_cast_5 = (_MaxLight).xxxx;
				float4 clampResult1914 = clamp( ( float4( ( ase_lightColor.rgb * ase_lightColor.a ) , 0.0 ) + float4( ( localShadeSH9bakedlight1488 * _BakedLightContrib ) , 0.0 ) + VertLight1406 ) , temp_cast_4 , temp_cast_5 );
				float3 desaturateInitialColor1777 = clampResult1914.xyz;
				float desaturateDot1777 = dot( desaturateInitialColor1777, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1777 = lerp( desaturateInitialColor1777, desaturateDot1777.xxx, ( 1.0 - _LightSaturation ) );
				float4 break1551 = ( temp_output_1896_16 + temp_output_1896_17 + temp_output_1896_18 + temp_output_1896_20 );
				#ifdef VERTEXLIGHT_ON
				float staticSwitch1905 = ( ( temp_output_1896_23 + temp_output_1896_29 + temp_output_1896_30 + temp_output_1896_31 ) * saturate( ( break1551.x + break1551.y + break1551.z ) ) * break1551.w );
				#else
				float staticSwitch1905 = 0.0;
				#endif
				float VertTotal1665 = staticSwitch1905;
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
				float3 normalizeResult1233 = normalize( ( _WorldSpaceLightPos0.xyz - ( _WorldSpaceLightPos0.w * WorldPosition ) ) );
				float3 appendResult248 = (float3(_StaticLightX , _StaticLightY , _StaticLightZ));
				float dotResult5 = dot( NormalShade962 , ( ( ase_lightColor.rgb * ase_lightColor.a ) > float3( 0,0,0 ) ? normalizeResult1233 : appendResult248 ) );
				float NdotL1296 = dotResult5;
				float3 normalizeResult1382 = normalize( ( appendResult7_g4 - WorldPosition ) );
				float dotResult1381 = dot( NormalShade962 , normalizeResult1382 );
				float Vert_NdotL1389 = dotResult1381;
				float temp_output_1106_0 = ( ( _UseShading == 1.0 ? ( VertTotal1665 < 0.01 ? NdotL1296 : Vert_NdotL1389 ) : 0.0 ) - _OffsetDot );
				float temp_output_1254_0 = saturate( ( _ShadowSharpness1 * temp_output_1106_0 ) );
				float3 lerpResult1016 = lerp( (_ShadowColour).rgb , float3( 1,1,1 ) , temp_output_1254_0);
				float2 appendResult1125 = (float2(temp_output_1254_0 , temp_output_1254_0));
				float3 RampShade979 = ( _GradientorRamp == 1.0 ? lerpResult1016 : (( (float4( 0.5,0.5,0.5,0 ) + (_ShadowColour - float4( 0,0,0,0 )) * (float4( 1,1,1,0 ) - float4( 0.5,0.5,0.5,0 )) / (float4( 1,1,1,0 ) - float4( 0,0,0,0 ))) * tex2D( _Ramp, appendResult1125 ) )).rgb );
				float3 temp_cast_7 = (( ( 1.0 - temp_output_1106_0 ) * _ShadowDarkness )).xxx;
				float3 clampResult30 = clamp( ( RampShade979 - temp_cast_7 ) , float3( 0,0,0 ) , float3( 0.8,0.8,0.8 ) );
				float3 LightShaded968 = ( desaturateVar1777 * clampResult30 );
				float3 desaturateInitialColor453 = ( (tex2DNode10).rgb * (_Color).rgb * LightShaded968 );
				float desaturateDot453 = dot( desaturateInitialColor453, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar453 = lerp( desaturateInitialColor453, desaturateDot453.xxx, ( 1.0 - _Saturation ) );
				float3 desaturateInitialColor581 = desaturateVar453;
				float desaturateDot581 = dot( desaturateInitialColor581, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar581 = lerp( desaturateInitialColor581, desaturateDot581.xxx, ( ( 1.0 - RampShade979 ) * ( 1.0 - _ShadowSaturation ) ).x );
				float3 PostDesaturation1276 = (float3( 1E-06,1E-06,1E-06 ) + (desaturateVar581 - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 1E-06,1E-06,1E-06 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float2 uv_Emission = i.ase_texcoord1.xy * _Emission_ST.xy + _Emission_ST.zw;
				float3 temp_output_808_0 = (tex2D( _Emission, uv_Emission )).rgb;
				float3 lerpResult450 = lerp( temp_output_808_0 , ( temp_output_808_0 * LightShaded968 ) , _ShadedEmission);
				float3 temp_cast_9 = (3.0).xxx;
				float3 clampResult331 = clamp( ( lerpResult450 * (_EmissionColor).rgb * _EmissionIntensity ) , float3( 0,0,0 ) , temp_cast_9 );
				float3 Emission1285 = clampResult331;
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 Vert_LightDir1491 = normalizeResult1382;
				float3 normalizeResult1783 = normalize( ( ase_worldViewDir + Vert_LightDir1491 ) );
				float3 lerpResult602 = lerp( float3( 0,0,1 ) , tex2DNode425 , _NormalPowerSpecular);
				float3 tanNormal1234 = lerpResult602;
				float3 worldNormal1234 = float3(dot(tanToWorld0,tanNormal1234), dot(tanToWorld1,tanNormal1234), dot(tanToWorld2,tanNormal1234));
				float3 normalizeResult1248 = normalize( worldNormal1234 );
				float3 NormalSpecular965 = normalizeResult1248;
				float dotResult551 = dot( normalizeResult1783 , NormalSpecular965 );
				float3 lerpResult816 = lerp( float3( 0,0,0 ) , saturate( ( pow( dotResult551 , exp( _SpecularSize ) ) * pow( 10.0 , _SpecularStrength ) * NormalSpecular965 ) ) , _SpecularOpacity);
				float3 localCenterEye16_g275 = CenterEye16_g275();
				float3 normalizeResult19_g275 = normalize( ( localCenterEye16_g275 - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g275 = normalize( cross( normalizeResult19_g275 , _worldUp ) );
				float3 NormalSpecularPrecalc1856 = ( lerpResult602 - float3( 0.25,0.25,0 ) );
				float3 temp_output_23_0_g275 = BlendNormals( ase_worldNormal , NormalSpecularPrecalc1856 );
				float dotResult10_g275 = dot( normalizeResult8_g275 , temp_output_23_0_g275 );
				float dotResult2_g275 = dot( _worldUp , normalizeResult19_g275 );
				float3 normalizeResult7_g275 = normalize( ( _worldUp - ( normalizeResult19_g275 * dotResult2_g275 ) ) );
				float dotResult9_g275 = dot( normalizeResult7_g275 , temp_output_23_0_g275 );
				float2 appendResult11_g275 = (float2(dotResult10_g275 , dotResult9_g275));
				float3 desaturateInitialColor1920 = (tex2D( _SpecularMatcap, ( ( appendResult11_g275 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) )).rgb;
				float desaturateDot1920 = dot( desaturateInitialColor1920, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1920 = lerp( desaturateInitialColor1920, desaturateDot1920.xxx, ( 1.0 - _SpecMatcapSaturation ) );
				#ifdef _USESPECULARMATCAP_ON
				float3 staticSwitch698 = ( desaturateVar1920 * _SpecMatcapMultiply * (_SpecMatCapColor).rgb );
				#else
				float3 staticSwitch698 = float3(0,0,0);
				#endif
				float3 localCenterEye16_g277 = CenterEye16_g277();
				float3 normalizeResult19_g277 = normalize( ( localCenterEye16_g277 - WorldPosition ) );
				float3 normalizeResult8_g277 = normalize( cross( normalizeResult19_g277 , _worldUp ) );
				float3 temp_output_23_0_g277 = BlendNormals( ase_worldNormal , UnpackNormal( tex2D( _SpecMatCapNorm, i.ase_texcoord1.xy ) ) );
				float dotResult10_g277 = dot( normalizeResult8_g277 , temp_output_23_0_g277 );
				float dotResult2_g277 = dot( _worldUp , normalizeResult19_g277 );
				float3 normalizeResult7_g277 = normalize( ( _worldUp - ( normalizeResult19_g277 * dotResult2_g277 ) ) );
				float dotResult9_g277 = dot( normalizeResult7_g277 , temp_output_23_0_g277 );
				float2 appendResult11_g277 = (float2(dotResult10_g277 , dotResult9_g277));
				float3 lerpResult560 = lerp( float3( 0,0,0 ) , ( lerpResult816 + staticSwitch698 ) , ( tex2D( _SpecularMask, ( ( appendResult11_g277 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) ) * _SpecMaskOpacity ).rgb);
				float3 SpecularOut983 = lerpResult560;
				float Alpha1262 = tex2DNode10.a;
				clip( 1.0 - _Cutoff);
				float4 appendResult1983 = (float4(( (( ( _Noise == 1.0 ? simplePerlin2D2016 : 1.0 ) * tex2D( _ParallaxCookie, rotator2008 ) * _ParalaxColour )).rgb + PostDesaturation1276 + Emission1285 + SpecularOut983 ) , ( _Alpha * Alpha1262 )));
				
				
				finalColor = appendResult1983;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18713
-1660;57;1592;857;-458.0161;612.7458;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;1237;-4094.31,-1596.153;Inherit;False;1151.984;507.5215;;15;1861;1856;1858;965;1248;1234;602;603;962;1249;1235;430;428;425;1860;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;281;-2892.722,-1750.211;Inherit;False;1450.566;614.9301;Uses directional light or uses the static light direction;15;1296;5;1076;1165;633;1233;248;1247;252;249;251;1246;1245;1232;1876;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-4071.916,-1222.955;Inherit;False;Property;_NormalPower;Normal Power;38;0;Create;True;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;425;-4078.114,-1430.657;Inherit;True;Property;_Normal;Normal;37;1;[Normal];Create;False;0;0;0;False;2;Space(5);Header(.  Normals  .);False;425;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;-0.5;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;1896;-3478.548,-728.2628;Inherit;False;VertexLightData;-1;;4;d6cc1c00f5d200e45903717e6fa3d55c;0;0;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.CommentaryNode;1378;-3542.44,-966.6467;Inherit;False;2334.753;849.2582;;26;1665;1589;1551;1406;1683;1682;1684;1629;1631;1630;1491;1389;1381;1380;1382;1383;1379;1878;1879;1886;1890;1891;1905;1908;1910;1911;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.LerpOp;430;-3720.483,-1313.864;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-2979.782,-288.8087;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-2885.181,-1686.371;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.WorldPosInputsNode;1245;-2871.272,-1542.836;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-2825.676,-281.4002;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.WorldNormalVector;1235;-3504.993,-1313.861;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-2650.649,-1540.923;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-2695.444,-281.3874;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;633;-2508.1,-1449.698;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.NormalizeNode;1249;-3312.798,-1314.481;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-2867.898,-1243.334;Float;False;Property;_StaticLightZ;Static Light Z;32;0;Create;True;0;0;0;False;0;False;0.8;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-2869.614,-1315.375;Float;False;Property;_StaticLightY;Static Light Y;31;0;Create;True;0;0;0;False;0;False;0.5;0.41;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-2869.52,-1389.659;Float;False;Property;_StaticLightX;Static Light X;30;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.5;-0.19;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-2497.999,-1569.883;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;1379;-3113.446,-926.8948;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-2778.922,-832.5377;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;248;-2536.064,-1328.078;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-3150.408,-1319.027;Inherit;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1890;-2559.773,-284.8499;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-2346.14,-1514.783;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-3110.897,-349.5701;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-2319.105,-1419.702;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;1891;-2506.718,-189.4073;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1076;-2088.302,-1396.523;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1911;-2335.592,-421.573;Inherit;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-2128.246,-1495.052;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1382;-2588.283,-831.9765;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-2363.542,-341.6096;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-2700.114,-923.4888;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1905;-2124.317,-368.7635;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;5;-1892.56,-1413.257;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-2386.563,-885.7267;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-1691.565,-1419.027;Inherit;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-1850.442,-365.8699;Inherit;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-2233.31,-890.9108;Inherit;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4367.923,198.6169;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4350.809,112.0563;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-4357.299,20.07608;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1058;-3891.822,-3.546481;Inherit;False;Property;_UseShading;Use Shading;22;0;Create;True;0;0;0;False;3;Space(5);Header(.  Shadow  .);Toggle(_);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1560;-4084.332,48.5182;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.01;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3970.134,218.4577;Inherit;False;Property;_OffsetDot;Offset Dot;26;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1059;-3676.601,38.67938;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3429.394,187.0093;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-3506.541,314.983;Float;False;Property;_ShadowSharpness1;Shadow Sharpness;27;0;Create;False;0;0;0;False;0;False;1;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-3235.374,325.456;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1254;-3073.469,330.4835;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;573;-2887.652,157.6327;Inherit;False;1236.993;594.242;;11;979;1026;815;1025;1033;32;1032;1010;1008;1016;1125;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.ColorNode;1008;-2859.954,194.2375;Inherit;False;Property;_ShadowColour;Shadow Colour;24;0;Create;True;0;0;0;False;0;False;0.7098039,0.7098039,0.7098039,1;0.7098039,0.7098039,0.7098039,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1125;-2860.629,533.0309;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;32;-2682.287,534.5632;Inherit;True;Property;_Ramp;Ramp;25;0;Create;False;0;0;0;False;0;False;-1;None;c320938fa0c7f9043aabb704290909a3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;1032;-2550.022,348.9867;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;3;COLOR;0.5,0.5,0.5,0;False;4;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1033;-2356.878,528.2568;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2544.063,219.9062;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-2946.274,-699.0878;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-2950.3,-517.5125;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-2949.745,-427.9516;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-2950.219,-609.0418;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;815;-2200.593,520.5308;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1025;-2280.057,426.9643;Inherit;False;Property;_GradientorRamp;Gradient or Ramp;23;1;[Enum];Create;True;0;2;Ramp_Texture;0;Linear_Gradient;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-2670.897,-591.1256;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;1016;-2261.858,235.5987;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1026;-2021.075,307.2643;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector4Node;1910;-2325.107,-717.4726;Inherit;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;1683;-2467.5,-590.7844;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-2329.637,56.81863;Inherit;False;Property;_ShadowDarkness;Shadow Darkness;28;0;Create;True;0;0;0;False;0;False;0.22;0.125;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-4062.665,-1533.222;Inherit;False;Property;_NormalPowerSpecular;Normal Power Specular;39;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-1858.873,307.4175;Inherit;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1470;-2277.808,-13.62446;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1908;-2122.527,-601.6945;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;602;-3725.314,-1475.514;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2053.29,-85.44978;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2040.297,-1.493157;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1775;-1312.181,246.7042;Inherit;False;Property;_BakedLightContrib;Baked Light Contrib;19;0;Create;True;0;0;0;False;0;False;1;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-1837.354,-600.2346;Inherit;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LightColorNode;1484;-1170.576,56.28734;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.CustomExpressionNode;1488;-1294.562,171.0424;Float;False;return ShadeSH9(half4(x, 1))@;3;False;1;True;x;FLOAT3;0,1,0.5;In;;Float;False;ShadeSH9 (baked light);True;False;0;1;0;FLOAT3;0,1,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;569;-1374.577,-2421.741;Inherit;False;2154.971;1142.927;;37;1782;1785;983;560;696;701;824;695;698;816;690;952;566;561;817;825;554;838;691;545;1266;685;837;556;869;551;553;555;1783;967;1051;546;1909;1898;1919;1920;1921;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.WorldNormalVector;1234;-3503.756,-1475.533;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-2076.642,-771.4263;Inherit;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1774;-1070.824,205.5078;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-996.2955,94.96313;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-1080.509,318.4967;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-1808.715,-18.87046;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1858;-3477.078,-1566.51;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.25,0.25,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1776;-516.7422,322.1091;Float;False;Property;_LightSaturation;Light Saturation;18;0;Create;True;0;0;0;False;2;Space(10);Header(.  Light Colour  .);False;0.6;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;30;-1614.185,-10.51266;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-3267.568,-1560.215;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-821.3895,192.3627;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1916;-767.5601,304.2833;Inherit;False;Property;_MinLight;Min Light;21;0;Create;True;0;0;0;False;0;False;0.9;0.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1915;-710.8563,375.4363;Inherit;False;Property;_MaxLight;Max Light;20;0;Create;True;0;0;0;False;0;False;0.9;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-1360.641,-2385.437;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalizeNode;1248;-3314.798,-1475.48;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1785;-1363.254,-2242.666;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;1958;-1352.191,436.4779;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1926;-148.7385,-384.7102;Float;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;967;-1327.231,-1724.504;Inherit;False;1856;NormalSpecularPrecalc;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1778;-417.9402,241.8499;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-3161.263,-1480.59;Inherit;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-587.3646,160.6687;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0.8,0.8,0.8,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1782;-1089.578,-2354.441;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;1544;-569.8634,491.3146;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1777;-408.4728,91.47132;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2005;81.9,-211.5;Inherit;False;Property;_XAdjust;X Adjust;12;0;Create;True;0;0;0;False;0;False;0.5;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-902.2144,-2348.36;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2006;80.60001,-132.1;Inherit;False;Property;_YAdjust;Y Adjust;13;0;Create;True;0;0;0;False;0;False;0.5;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-1000.016,-2239.006;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1898;-1290.188,-1631.093;Inherit;False;VR MatCap;-1;;275;70ea9bc890dab6b42ba77ce7cb65ac19;0;1;21;FLOAT3;0,0,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-867.1594,-2156.916;Inherit;False;Property;_SpecularSize;Specular Size;41;0;Create;True;0;0;0;False;0;False;1;6.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;2033;34.8143,-385.459;Inherit;False;World;Object;True;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;2037;279.8143,-330.459;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-739.3617,-1625.311;Inherit;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-597.2936,-2085.709;Inherit;False;Property;_SpecularStrength;Specular Strength;42;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ExpOpNode;553;-564.3043,-2218.042;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2034;273.7093,-455.1559;Inherit;False;Property;_FixMeshAxis;Fix Mesh Axis;11;1;[Enum];Create;True;0;2;Y up;0;Z up;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;685;-1032.21,-1727.727;Inherit;True;Property;_SpecularMatcap;Specular Matcap;44;0;Create;True;0;0;0;False;0;False;-1;None;cf4845bd31824ab48a85d069ba8442cf;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1295;977.5045,-1629.964;Inherit;False;1534.433;513.8026;;13;450;331;330;329;326;805;462;461;327;808;970;328;1285;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.DotProductOpNode;551;-704.9365,-2280.886;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2082;454.5289,-279.0109;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;2045;36.8223,-690.2982;Inherit;False;VR_Center_Eye;-1;;276;c8866f5c3b9339443aaf9087a76ba9d4;1,13,1;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;-185.3774,217.7857;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2073;37.5836,-583.3092;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;2084;628.8344,-274.1273;Inherit;False;True;2;0;FLOAT2;0,0;False;1;FLOAT;2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;-174.0982,91.86793;Inherit;False;LightShaded;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;837;-1012.791,-2015.676;Inherit;False;Property;_SpecMatCapColor;SpecMatCap Color;48;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;328;1031.984,-1577.518;Inherit;True;Property;_Emission;Emission Map;33;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1980;270.5769,-639.1637;Inherit;False;Property;_ParallaxScale;Parallax Scale;9;0;Create;True;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;10;-897.3066,-229.0958;Inherit;True;Property;_MainTex;Texture;1;0;Create;False;0;0;0;False;1;Header(.  Main  .);False;-1;None;df0834bf12e5143448016b13815c67fa;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;817;-729.6928,-1728.891;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;2035;444.9203,-452.762;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;18;-807.2459,-38.08972;Float;False;Property;_Color;> Color;2;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;545;-481.9503,-2343.796;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;2001;287.5754,-558.3969;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1266;-260.9381,-2374.193;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1347;63.85589,124.4743;Inherit;False;855.2606;338.8594;saturation;9;582;581;584;585;1330;586;325;453;454;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;869;-1010.365,-1511.512;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;1921;-475.5032,-1679.686;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;556;-389.1411,-2195.528;Inherit;False;False;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;970;1323.944,-1463.482;Inherit;False;968;LightShaded;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-77.34032,-2261.959;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;585;81.0999,374.3862;Inherit;False;Property;_ShadowSaturation;Shadow Saturation;29;0;Create;True;0;0;0;False;0;False;1;0.65;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2079;861,-677;Inherit;False;Property;_NoiseRate;Noise Rate;15;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-470.22,-1790.635;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1330;95.6078,290.3381;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;1336.959,-1575.35;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-563.7085,-34.53592;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;838;-748.7903,-1959.675;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-541.5019,-196.8357;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;825;-788.3113,-1511.716;Inherit;True;Property;_SpecMatCapNorm;SpecMatCap Norm;50;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;2076;711.9996,-431.0885;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1949;618.4262,-626.3761;Inherit;False;Property;_ParallaxDepth;Parallax Depth;10;0;Create;True;0;0;0;False;0;False;-10;-10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;325;75.3989,193.7179;Float;False;Property;_Saturation;Saturation;3;0;Create;True;0;0;0;False;0;False;1;1;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-1006.393,-1826.706;Inherit;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;45;0;Create;True;0;0;0;False;0;False;1;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2071;485.588,-593.1885;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;58.89498,7.761091;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;952;-298.0586,-2031.372;Inherit;False;Constant;_SpecCap_Null;SpecCap_Null;65;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;2009;1006.435,-345.725;Inherit;False;Property;_RotateSpeed;Rotate Speed;17;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2080;1008,-672;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;1550.445,-1475.384;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-204.7282,-2121.976;Inherit;False;Property;_SpecularOpacity;Specular Opacity;40;0;Create;True;0;0;0;False;2;Space(5);Header(.  Specular  .);False;1;0.58;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-261.1024,-1884.739;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ParallaxMappingNode;1925;844.3226,-521.2302;Inherit;False;Normal;4;0;FLOAT2;0.478,0.505;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;582;363.7917,298.8784;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;454;351.1966,208.4819;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;1447.33,-1293.54;Float;False;Property;_EmissionColor;Emission Color;34;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;1899;-446.5963,-1469.226;Inherit;False;VR MatCap;-1;;277;70ea9bc890dab6b42ba77ce7cb65ac19;0;1;21;FLOAT3;0,0,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;586;366.7162,381.4955;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;461;1329.69,-1385.762;Inherit;False;Property;_ShadedEmission;Shaded Emission;36;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;566;74.26813,-2183.914;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;326;1675.283,-1205.707;Float;False;Property;_EmissionIntensity;Emission Intensity;35;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;695;-128.5854,-1611.704;Inherit;True;Property;_SpecularMask;Specular Mask;47;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;805;1680.887,-1294.844;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;2077;1050,-866;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;453;561.8796,195.0326;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;584;574.3521,297.0027;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;450;1747.337,-1499.966;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;2023;1213,-651;Inherit;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2013;1122.388,-511.8187;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;2010;1219.608,-384.8929;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;824;-94.7949,-1786.918;Inherit;False;Property;_SpecMaskOpacity;SpecMask Opacity;49;0;Create;True;0;0;0;False;0;False;1;0.005;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;816;196.4796,-2067.786;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;698;-67.75902,-1932.865;Inherit;False;Property;_UseSpecularMatCap;Use Specular MatCap;43;0;Create;True;0;0;0;False;2;Space(5);Header(. Specular Overlay);False;0;0;1;True;;Toggle;2;Key0;Key1;Create;False;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2025;1498.949,-781.8145;Inherit;False;Property;_Noise;Noise;14;1;[Gamma];Create;True;0;0;0;False;1;Toggle(_);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;176.3058,-1759.883;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;1941.841,-1337.614;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;581;754.5635,232.9092;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;2008;1405.466,-497.6157;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;2016;1457.588,-695.6231;Inherit;False;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;330;1929.115,-1198.055;Float;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;237.5336,-1919.772;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;1928;1670.005,-326.5399;Inherit;False;Property;_ParalaxColour;Paralax Colour;8;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;4,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1927;1615.649,-524.6611;Inherit;True;Property;_ParallaxCookie;Parallax Cookie (no alpha);7;0;Create;False;0;0;0;False;2;Space(10);Header(.  Parallax  .);False;-1;None;f885efef1a091274fa436219d452511d;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;560;372.4905,-1897.04;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;331;2122.735,-1296.652;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;-549.192,-119.9081;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1918;952.4561,236.3517;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;1E-06,1E-06,1E-06;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;2026;1718.547,-680.0073;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1929;1997.163,-513.5587;Inherit;False;3;3;0;FLOAT;1;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;558.8113,-1897.552;Inherit;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;2277.004,-1294.666;Inherit;False;Emission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;1146.35,228.4602;Inherit;False;PostDesaturation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;1588.984,46.28073;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;334;1492.2,-28.76657;Inherit;False;Property;_Alpha;Alpha;5;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;2117.317,-264.8462;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;1941;2168.259,-384.679;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;1812.862,-6.435277;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1294;2174.572,-190.0766;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;2155.741,77.16531;Inherit;False;Property;_Cutoff;Alpha Cutoff;6;0;Create;False;0;0;0;True;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;2156.943,-117.4035;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1346;2859.333,-1342.923;Inherit;False;670.9946;746.3742;custom properties;13;1345;1335;1344;1342;1431;1340;1339;1337;1432;1343;1338;1341;1469;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2431.971,-307.2833;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClipNode;1430;2375.023,-1.669938;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2024;1318.698,-760.211;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2081;1083.401,-750.1594;Inherit;False;Property;_NoiseScale;Noise Scale;16;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1343;3201.625,-1061.015;Inherit;False;Property;_StencilZFail;StencilZFail;59;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1983;2800.553,-243.2918;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3151.765,-825.441;Inherit;False;Property;_DstBlend;Destination Blend (Zero);61;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1431;2886.58,-820.4198;Inherit;False;Property;_SrcBlend;Source Blend (One);60;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1341;3206.338,-1208.357;Inherit;False;Property;_StencilOp;StencilOp;57;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1340;3181.625,-1281.015;Inherit;False;Property;_StencilComparison;Stencil Comparison;56;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-3253.236,-1178.448;Inherit;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1860;-3483.746,-1176.744;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.25,0.25,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1335;3215.875,-918.9951;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1344;2882.237,-914.3182;Float;False;Property;_ZTestMode;ZTestMode (LEqual);52;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;2882.479,-1280.823;Half;False;Property;_StencilRef;Stencil ID;53;0;Create;False;0;0;0;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;2875.299,-1112.257;Half;False;Property;_WriteMask;WriteMask;54;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;2876.299,-1194.834;Half;False;Property;_ReadMask;ReadMask;55;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;2885.308,-1002.382;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);51;1;[Toggle];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1342;3202.625,-1136.015;Inherit;False;Property;_StencilFail;StencilFail;58;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1469;2892.559,-694.9409;Inherit;False;Property;_AlphaToCoverage;AlphaToCoverage (override alpha);4;1;[Toggle];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1985;3044.412,-234.293;Float;False;True;-1;2;ASEMaterialInspector;100;1;GenesisAria/Arias HoloSight Transparent;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;1;1;True;1431;0;True;1432;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;True;0;True;1469;True;0;True;1335;True;True;True;True;True;0;False;-1;False;False;False;True;True;255;True;1337;255;True;1338;255;True;1339;7;True;1340;1;True;1341;1;True;1342;1;True;1343;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;1345;True;3;True;1344;True;False;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;430;1;425;0
WireConnection;430;2;428;0
WireConnection;1878;0;1896;16
WireConnection;1878;1;1896;17
WireConnection;1878;2;1896;18
WireConnection;1878;3;1896;20
WireConnection;1551;0;1878;0
WireConnection;1235;0;430;0
WireConnection;1246;0;1232;2
WireConnection;1246;1;1245;0
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;1249;0;1235;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;1383;0;1896;0
WireConnection;1383;1;1379;0
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;962;0;1249;0
WireConnection;1890;0;1589;0
WireConnection;1233;0;1247;0
WireConnection;1886;0;1896;23
WireConnection;1886;1;1896;29
WireConnection;1886;2;1896;30
WireConnection;1886;3;1896;31
WireConnection;1876;0;633;1
WireConnection;1876;1;633;2
WireConnection;1891;0;1551;3
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;248;0
WireConnection;1382;0;1383;0
WireConnection;1879;0;1886;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;5;0;1165;0
WireConnection;5;1;1076;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;1296;0;5;0
WireConnection;1665;0;1905;0
WireConnection;1389;0;1381;0
WireConnection;1560;0;1490;0
WireConnection;1560;2;1480;0
WireConnection;1560;3;1297;0
WireConnection;1059;0;1058;0
WireConnection;1059;2;1560;0
WireConnection;1106;0;1059;0
WireConnection;1106;1;1107;0
WireConnection;1118;0;149;0
WireConnection;1118;1;1106;0
WireConnection;1254;0;1118;0
WireConnection;1125;0;1254;0
WireConnection;1125;1;1254;0
WireConnection;32;1;1125;0
WireConnection;1032;0;1008;0
WireConnection;1033;0;1032;0
WireConnection;1033;1;32;0
WireConnection;1010;0;1008;0
WireConnection;1629;0;1896;16
WireConnection;1629;1;1896;23
WireConnection;1631;0;1896;18
WireConnection;1631;1;1896;30
WireConnection;1684;0;1896;20
WireConnection;1684;1;1896;31
WireConnection;1630;0;1896;17
WireConnection;1630;1;1896;29
WireConnection;815;0;1033;0
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;1026;0;1025;0
WireConnection;1026;2;1016;0
WireConnection;1026;3;815;0
WireConnection;1683;0;1682;0
WireConnection;979;0;1026;0
WireConnection;1470;0;1106;0
WireConnection;1908;1;1910;0
WireConnection;1908;0;1683;0
WireConnection;602;1;425;0
WireConnection;602;2;603;0
WireConnection;344;0;1470;0
WireConnection;344;1;335;0
WireConnection;1406;0;1908;0
WireConnection;1234;0;602;0
WireConnection;1491;0;1382;0
WireConnection;1774;0;1488;0
WireConnection;1774;1;1775;0
WireConnection;1486;0;1484;1
WireConnection;1486;1;1484;2
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;1858;0;602;0
WireConnection;30;0;346;0
WireConnection;1856;0;1858;0
WireConnection;1489;0;1486;0
WireConnection;1489;1;1774;0
WireConnection;1489;2;1408;0
WireConnection;1248;0;1234;0
WireConnection;1958;0;30;0
WireConnection;1778;0;1776;0
WireConnection;965;0;1248;0
WireConnection;1914;0;1489;0
WireConnection;1914;1;1916;0
WireConnection;1914;2;1915;0
WireConnection;1782;0;1909;0
WireConnection;1782;1;1785;0
WireConnection;1544;0;1958;0
WireConnection;1777;0;1914;0
WireConnection;1777;1;1778;0
WireConnection;1783;0;1782;0
WireConnection;1898;21;967;0
WireConnection;2033;0;1926;0
WireConnection;2037;0;2033;1
WireConnection;2037;1;2033;3
WireConnection;2037;2;2033;2
WireConnection;553;0;546;0
WireConnection;685;1;1898;0
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;2082;0;2005;0
WireConnection;2082;1;2006;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;1544;0
WireConnection;2084;0;2082;0
WireConnection;968;0;1922;0
WireConnection;817;0;685;0
WireConnection;2035;0;2034;0
WireConnection;2035;2;2037;0
WireConnection;2035;3;2033;0
WireConnection;545;0;551;0
WireConnection;545;1;553;0
WireConnection;2001;0;2045;0
WireConnection;2001;1;2073;0
WireConnection;1921;0;1919;0
WireConnection;556;1;555;0
WireConnection;554;0;545;0
WireConnection;554;1;556;0
WireConnection;554;2;1266;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;808;0;328;0
WireConnection;813;0;18;0
WireConnection;838;0;837;0
WireConnection;812;0;10;0
WireConnection;825;1;869;0
WireConnection;2076;0;2035;0
WireConnection;2076;1;2084;0
WireConnection;2071;0;2001;0
WireConnection;2071;1;1980;0
WireConnection;19;0;812;0
WireConnection;19;1;813;0
WireConnection;19;2;968;0
WireConnection;2080;0;2079;0
WireConnection;462;0;808;0
WireConnection;462;1;970;0
WireConnection;690;0;1920;0
WireConnection;690;1;691;0
WireConnection;690;2;838;0
WireConnection;1925;1;1949;0
WireConnection;1925;2;2071;0
WireConnection;1925;3;2076;0
WireConnection;582;0;1330;0
WireConnection;454;0;325;0
WireConnection;1899;21;825;0
WireConnection;586;0;585;0
WireConnection;566;0;554;0
WireConnection;695;1;1899;0
WireConnection;805;0;327;0
WireConnection;453;0;19;0
WireConnection;453;1;454;0
WireConnection;584;0;582;0
WireConnection;584;1;586;0
WireConnection;450;0;808;0
WireConnection;450;1;462;0
WireConnection;450;2;461;0
WireConnection;2023;0;2080;0
WireConnection;2013;0;1925;0
WireConnection;2010;0;2009;0
WireConnection;816;1;566;0
WireConnection;816;2;561;0
WireConnection;698;1;952;0
WireConnection;698;0;690;0
WireConnection;696;0;695;0
WireConnection;696;1;824;0
WireConnection;329;0;450;0
WireConnection;329;1;805;0
WireConnection;329;2;326;0
WireConnection;581;0;453;0
WireConnection;581;1;584;0
WireConnection;2008;0;2013;0
WireConnection;2008;2;2010;0
WireConnection;2016;0;2077;0
WireConnection;2016;1;2023;0
WireConnection;701;0;816;0
WireConnection;701;1;698;0
WireConnection;1927;1;2008;0
WireConnection;560;1;701;0
WireConnection;560;2;696;0
WireConnection;331;0;329;0
WireConnection;331;2;330;0
WireConnection;1262;0;10;4
WireConnection;1918;0;581;0
WireConnection;2026;0;2025;0
WireConnection;2026;2;2016;0
WireConnection;1929;0;2026;0
WireConnection;1929;1;1927;0
WireConnection;1929;2;1928;0
WireConnection;983;0;560;0
WireConnection;1285;0;331;0
WireConnection;1276;0;1918;0
WireConnection;1941;0;1929;0
WireConnection;333;0;334;0
WireConnection;333;1;1265;0
WireConnection;470;0;1941;0
WireConnection;470;1;1515;0
WireConnection;470;2;1294;0
WireConnection;470;3;1701;0
WireConnection;1430;0;333;0
WireConnection;1430;2;1433;0
WireConnection;2024;0;2077;0
WireConnection;2024;1;2081;0
WireConnection;1983;0;470;0
WireConnection;1983;3;1430;0
WireConnection;1861;0;1860;0
WireConnection;1860;0;430;0
WireConnection;1985;0;1983;0
ASEEND*/
//CHKSM=B0BE7FFA7FB88BA05E0AF8219D7FD511DF759B50