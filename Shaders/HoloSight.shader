// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Arias HoloSight Transparent"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[Header(.  Main  .)]_MainTex("Texture", 2D) = "white" {}
		[ToggleUI]_TexGrey("Texture is Greyscale", Float) = 0
		[HDR]_Colour("> Colour", Color) = (1,1,1,1)
		_Power("Power", Float) = 1
		_Saturation("Saturation", Range( -1 , 5)) = 1
		[Space (5)][Toggle(COVERAGE_ON)] _AlphaToCoverage("AlphaToCoverage (antialiased override)", Float) = 1
		_A2CSampleBias("A2C Sample Bias", Float) = 1
		_CoverageClamp("Coverage Clamp", Float) = 0
		[ToggleUI]_AlphaGrey("Alpha From Greyscale", Float) = 0
		_Alpha("Alpha", Float) = 1
		_Cutoff("Alpha Cutoff", Float) = 0
		[Space(10)][Header(.  Parallax  .)]_ParallaxCookie("Parallax Cookie", 2D) = "black" {}
		[ToggleUI]_ParallaxAlpha("Alpha Only Tex", Float) = 0
		[HDR]_ParalaxColour("Paralax Colour", Color) = (1,1,1,0)
		_ParallaxPwr("Power", Float) = 1
		[Space(10)]_ParallaxScale("Parallax Scale", Float) = 0.5
		_ParallaxDepth("Parallax Depth", Float) = -10
		[Toggle(_PARALLAXDISTSCALE_ON)] _ParallaxDistScale("Parallax Dist Scale", Float) = 1
		[Enum(Y up,0,Z up,1)]_ParallaxAxis("Parallax Axis", Float) = 0
		[ToggleUI]_InfParallax("Infinite Parallax", Float) = 0
		_RotateSpeed("Rotate Speed", Float) = 0
		[Gamma][ToggleUI][Space(10)]_Noise("Noise", Float) = 0
		_NoiseRate("Noise Rate", Float) = 0
		_NoiseScale("Noise Scale", Range( 0 , 100)) = 0
		[Space(10)][Header(.  Light Colour  .)]_LightSaturation("Light Saturation", Float) = 0.6
		_BakedLightContrib("Baked Light Contrib", Float) = 1
		_MaxLight("Max Light", Float) = 0.9
		_MinLight("Min Light", Float) = 0.9
		[Toggle(_UNLIT_ON)] _Unlit("Unlit", Float) = 0
		[ToggleUI][Space(5)][Header(.  Shadow  .)]_UseShading("Use Shading", Float) = 1
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
		[HDR]_SColor("Specular Colour", Color) = (1,1,1,1)
		_SpecularStrength("Specular Strength", Float) = 0
		_SpecularSize("Specular Size", Range( 0 , 10)) = 1
		[Space(5)][Header(. Specular Overlay)][Toggle(_USESPECULARMATCAP_ON)] _UseSpecularMatCap("Use Specular MatCap", Float) = 0
		_SpecularMatcap("Specular Matcap", 2D) = "black" {}
		_SpecMatcapMultiply("SpecMatcap Multiply", Float) = 1
		_SpecMatcapSaturation("SpecMatcap Saturation", Float) = 1
		_SpecularMask("Specular Mask", 2D) = "white" {}
		[HDR]_SpecMatCapColour("SpecMatCap Colour", Color) = (1,1,1,1)
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
		[Enum(UnityEngine.Rendering.BlendOp)]_BlendOp("BlendOp", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 100

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		BlendOp [_BlendOp]
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
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
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
			#include "UnityStandardBRDF.cginc"
			#include "Lighting.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _PARALLAXDISTSCALE_ON
			#pragma shader_feature_local _UNLIT_ON
			#pragma multi_compile __ VERTEXLIGHT_ON
			#pragma shader_feature_local _USESPECULARMATCAP_ON
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _ReadMask;
			uniform float _SrcBlend;
			uniform int _StencilComparison;
			uniform int _StencilFail;
			uniform half _StencilRef;
			uniform int _Culling;
			uniform float _DstBlend;
			uniform int _StencilZFail;
			uniform int _StencilOp;
			uniform half _WriteMask;
			uniform float _ZWriteMode;
			uniform float _ZTestMode;
			uniform float _BlendOp;
			uniform float _Noise;
			uniform float _NoiseScale;
			uniform float _NoiseRate;
			uniform float _ParallaxAlpha;
			uniform sampler2D _ParallaxCookie;
			uniform float _InfParallax;
			uniform float _ParallaxDepth;
			uniform float _ParallaxScale;
			uniform float _ParallaxAxis;
			uniform float4 _ParallaxCookie_ST;
			uniform float _RotateSpeed;
			uniform float4 _ParalaxColour;
			uniform float _ParallaxPwr;
			uniform float _TexGrey;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float _Power;
			uniform float4 _Colour;
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
			uniform float4 _SColor;
			uniform float _SpecularOpacity;
			uniform sampler2D _SpecularMatcap;
			uniform float _SpecMatcapSaturation;
			uniform float _SpecMatcapMultiply;
			uniform float4 _SpecMatCapColour;
			uniform sampler2D _SpecularMask;
			uniform sampler2D _SpecMatCapNorm;
			uniform float _SpecMaskOpacity;
			uniform float _Alpha;
			uniform float _CoverageClamp;
			uniform float _AlphaGrey;
			uniform float _A2CSampleBias;
			uniform float _Cutoff;
			float2 texcoordscale(  )
			{
				return _ParallaxCookie_ST.xy;
			}
			
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
			
			float3 CenterEye1_g285(  )
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
			
			float3 CenterEye1_g282(  )
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
			
			float3 CenterEye1_g284(  )
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
			
			half4 StereoScreenUV1_g569( half4 screenuv )
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
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord1 = screenPos;
				float3 ase_worldTangent = UnityObjectToWorldDir(v.ase_tangent);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
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
				float4 screenPos = i.ase_texcoord1;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 appendResult2100 = (float2(ase_screenPosNorm.xy));
				float mulTime2023 = _Time.y * ( _NoiseRate * 0.1 );
				float2 temp_cast_1 = (mulTime2023).xx;
				float simplePerlin2D2016 = snoise( ( ( appendResult2100 * ( 100.0 - _NoiseScale ) ) - temp_cast_1 )*100.0 );
				simplePerlin2D2016 = simplePerlin2D2016*0.5 + 0.5;
				float2 localtexcoordscale2136 = texcoordscale();
				float3 localCenterEye1_g285 = CenterEye1_g285();
				float4 transform2073 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				#ifdef _PARALLAXDISTSCALE_ON
				float staticSwitch2141 = ( distance( float4( localCenterEye1_g285 , 0.0 ) , transform2073 ) / _ParallaxScale );
				#else
				float staticSwitch2141 = _ParallaxScale;
				#endif
				float3 ase_worldTangent = i.ase_texcoord3.xyz;
				float3 ase_worldNormal = i.ase_texcoord4.xyz;
				float3 ase_worldBitangent = i.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				ase_worldViewDir = Unity_SafeNormalize( ase_worldViewDir );
				float3 worldToObjDir2033 = normalize( mul( unity_WorldToObject, float4( ase_worldViewDir, 0 ) ).xyz );
				float3 appendResult2037 = (float3(worldToObjDir2033.x , worldToObjDir2033.z , worldToObjDir2033.y));
				float3 ifLocalVar2133 = 0;
				UNITY_BRANCH 
				if( _ParallaxAxis > 1.0 )
				ifLocalVar2133 = ase_tanViewDir;
				else if( _ParallaxAxis == 1.0 )
				ifLocalVar2133 = appendResult2037;
				else if( _ParallaxAxis < 1.0 )
				ifLocalVar2133 = worldToObjDir2033;
				float2 Offset1925 = ( ( _ParallaxDepth - 1 ) * ifLocalVar2133.xy * staticSwitch2141 ) + ( _InfParallax == 1.0 ? float2( 0.5,0.5 ) : i.ase_texcoord2.xy );
				float2 uv_ParallaxCookie = i.ase_texcoord2.xy * _ParallaxCookie_ST.xy + _ParallaxCookie_ST.zw;
				float mulTime2010 = _Time.y * _RotateSpeed;
				float cos2008 = cos( mulTime2010 );
				float sin2008 = sin( mulTime2010 );
				float2 rotator2008 = mul( ( ( localtexcoordscale2136 * ( Offset1925 + float2( -0.5,-0.5 ) ) ) + float2( 0.5,0.5 ) ) - ( ( uv_ParallaxCookie * float2( 0,0 ) ) + float2( 0.5,0.5 ) ) , float2x2( cos2008 , -sin2008 , sin2008 , cos2008 )) + ( ( uv_ParallaxCookie * float2( 0,0 ) ) + float2( 0.5,0.5 ) );
				float4 tex2DNode1927 = tex2D( _ParallaxCookie, rotator2008 );
				float3 temp_cast_3 = (_ParallaxPwr).xxx;
				float2 uv_MainTex = i.ase_texcoord2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode10 = tex2D( _MainTex, uv_MainTex );
				float3 appendResult2192 = (float3(tex2DNode10.r , tex2DNode10.r , tex2DNode10.r));
				float3 temp_cast_4 = (_Power).xxx;
				float3 temp_output_2179_0 = pow( ( _TexGrey == 1.0 ? appendResult2192 : (tex2DNode10).rgb ) , temp_cast_4 );
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
				float3 temp_output_157_0_g4 = float3( 0,0,0 );
				float3 objToWorld139_g4 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g4, 1 ) ).xyz;
				float temp_output_155_0_g4 = pow( distance( pos188_g4 , objToWorld139_g4 ) , 2.0 );
				float4 localVertexLightAttenuation86_g4 = VertexLightAttenuation86_g4();
				float4 break87_g4 = localVertexLightAttenuation86_g4;
				float attenx96_g4 = break87_g4.x;
				float temp_output_60_0_g4 = saturate( ( 1.0 - ( ( temp_output_155_0_g4 * attenx96_g4 ) / 25.0 ) ) );
				float temp_output_1896_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g4 ) * attenx96_g4 ) ) , ( temp_output_60_0_g4 * temp_output_60_0_g4 ) );
				float4 localVertexLightCol215_g4 = VertexLightCol215_g4();
				float4 temp_output_1896_17 = localVertexLightCol215_g4;
				float3 appendResult8_g4 = (float3(break4_g4.y , break5_g4.y , break6_g4.y));
				float3 pos290_g4 = appendResult8_g4;
				float3 objToWorld140_g4 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g4, 1 ) ).xyz;
				float temp_output_75_0_g4 = pow( distance( pos290_g4 , objToWorld140_g4 ) , 2.0 );
				float atteny97_g4 = break87_g4.y;
				float temp_output_107_0_g4 = saturate( ( 1.0 - ( ( temp_output_75_0_g4 * atteny97_g4 ) / 25.0 ) ) );
				float temp_output_1896_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g4 ) * atteny97_g4 ) ) , ( temp_output_107_0_g4 * temp_output_107_0_g4 ) );
				float4 localVertexLightCol319_g4 = VertexLightCol319_g4();
				float4 temp_output_1896_18 = localVertexLightCol319_g4;
				float3 appendResult9_g4 = (float3(break4_g4.z , break5_g4.z , break6_g4.z));
				float3 pos389_g4 = appendResult9_g4;
				float3 objToWorld141_g4 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g4, 1 ) ).xyz;
				float temp_output_79_0_g4 = pow( distance( pos389_g4 , objToWorld141_g4 ) , 2.0 );
				float attenz98_g4 = break87_g4.z;
				float temp_output_125_0_g4 = saturate( ( 1.0 - ( ( temp_output_79_0_g4 * attenz98_g4 ) / 25.0 ) ) );
				float temp_output_1896_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g4 ) * attenz98_g4 ) ) , ( temp_output_125_0_g4 * temp_output_125_0_g4 ) );
				float4 localVertexLightCol421_g4 = VertexLightCol421_g4();
				float4 temp_output_1896_20 = localVertexLightCol421_g4;
				float3 appendResult10_g4 = (float3(break4_g4.w , break5_g4.w , break6_g4.w));
				float3 pos491_g4 = appendResult10_g4;
				float3 objToWorld138_g4 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g4, 1 ) ).xyz;
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
				float4 temp_cast_7 = (_MinLight).xxxx;
				float4 temp_cast_8 = (_MaxLight).xxxx;
				float4 clampResult1914 = clamp( ( float4( ( ase_lightColor.rgb * ase_lightColor.a ) , 0.0 ) + float4( ( localShadeSH9bakedlight1488 * _BakedLightContrib ) , 0.0 ) + VertLight1406 ) , temp_cast_7 , temp_cast_8 );
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
				float2 uv_Normal = i.ase_texcoord2.xy * _Normal_ST.xy + _Normal_ST.zw;
				float3 tex2DNode425 = UnpackNormal( tex2D( _Normal, uv_Normal ) );
				float3 lerpResult430 = lerp( float3( 0,0,1 ) , tex2DNode425 , _NormalPower);
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
				float3 temp_cast_10 = (( ( 1.0 - temp_output_1106_0 ) * _ShadowDarkness )).xxx;
				float3 clampResult30 = clamp( ( RampShade979 - temp_cast_10 ) , float3( 0,0,0 ) , float3( 0.8,0.8,0.8 ) );
				float3 LightShaded968 = ( desaturateVar1777 * clampResult30 );
				float3 temp_cast_11 = (1.0).xxx;
				#ifdef _UNLIT_ON
				float3 staticSwitch2185 = temp_cast_11;
				#else
				float3 staticSwitch2185 = LightShaded968;
				#endif
				float3 desaturateInitialColor453 = ( temp_output_2179_0 * (_Colour).rgb * staticSwitch2185 );
				float desaturateDot453 = dot( desaturateInitialColor453, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar453 = lerp( desaturateInitialColor453, desaturateDot453.xxx, ( 1.0 - _Saturation ) );
				float3 desaturateInitialColor581 = desaturateVar453;
				float desaturateDot581 = dot( desaturateInitialColor581, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar581 = lerp( desaturateInitialColor581, desaturateDot581.xxx, ( ( 1.0 - RampShade979 ) * ( 1.0 - _ShadowSaturation ) ).x );
				float3 PostDesaturation1276 = (float3( 1E-06,1E-06,1E-06 ) + (desaturateVar581 - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 1E-06,1E-06,1E-06 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float2 uv_Emission = i.ase_texcoord2.xy * _Emission_ST.xy + _Emission_ST.zw;
				float3 temp_output_808_0 = (tex2D( _Emission, uv_Emission )).rgb;
				float3 lerpResult450 = lerp( temp_output_808_0 , ( temp_output_808_0 * LightShaded968 ) , _ShadedEmission);
				float3 temp_cast_13 = (3.0).xxx;
				float3 clampResult331 = clamp( ( lerpResult450 * (_EmissionColor).rgb * _EmissionIntensity ) , float3( 0,0,0 ) , temp_cast_13 );
				float3 Emission1285 = clampResult331;
				float3 Vert_LightDir1491 = normalizeResult1382;
				float3 normalizeResult1783 = normalize( ( ase_worldViewDir + Vert_LightDir1491 ) );
				float3 lerpResult602 = lerp( float3( 0,0,1 ) , tex2DNode425 , _NormalPowerSpecular);
				float3 tanNormal1234 = lerpResult602;
				float3 worldNormal1234 = float3(dot(tanToWorld0,tanNormal1234), dot(tanToWorld1,tanNormal1234), dot(tanToWorld2,tanNormal1234));
				float3 normalizeResult1248 = normalize( worldNormal1234 );
				float3 NormalSpecular965 = normalizeResult1248;
				float dotResult551 = dot( normalizeResult1783 , NormalSpecular965 );
				float3 lerpResult816 = lerp( float3( 0,0,0 ) , saturate( ( pow( dotResult551 , exp( _SpecularSize ) ) * pow( 10.0 , _SpecularStrength ) * (_SColor).rgb ) ) , _SpecularOpacity);
				float3 localCenterEye1_g282 = CenterEye1_g282();
				float3 ifLocalVar32_g281 = 0;
				UNITY_BRANCH 
				if( 0 == 1.0 )
				ifLocalVar32_g281 = localCenterEye1_g282;
				else if( 0 < 1.0 )
				ifLocalVar32_g281 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g281 = normalize( ( ifLocalVar32_g281 - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g281 = normalize( cross( normalizeResult19_g281 , _worldUp ) );
				float3 temp_output_21_0_g281 = NormalSpecular965;
				float dotResult10_g281 = dot( normalizeResult8_g281 , temp_output_21_0_g281 );
				float dotResult2_g281 = dot( _worldUp , normalizeResult19_g281 );
				float3 normalizeResult7_g281 = normalize( ( _worldUp - ( dotResult2_g281 * normalizeResult19_g281 ) ) );
				float dotResult9_g281 = dot( normalizeResult7_g281 , temp_output_21_0_g281 );
				float2 appendResult11_g281 = (float2(dotResult10_g281 , dotResult9_g281));
				float3 desaturateInitialColor1920 = (tex2D( _SpecularMatcap, ( ( appendResult11_g281 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) )).rgb;
				float desaturateDot1920 = dot( desaturateInitialColor1920, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1920 = lerp( desaturateInitialColor1920, desaturateDot1920.xxx, ( 1.0 - _SpecMatcapSaturation ) );
				#ifdef _USESPECULARMATCAP_ON
				float3 staticSwitch698 = ( desaturateVar1920 * _SpecMatcapMultiply * (_SpecMatCapColour).rgb );
				#else
				float3 staticSwitch698 = float3(0,0,0);
				#endif
				float3 localCenterEye1_g284 = CenterEye1_g284();
				float3 ifLocalVar32_g283 = 0;
				UNITY_BRANCH 
				if( 0 == 1.0 )
				ifLocalVar32_g283 = localCenterEye1_g284;
				else if( 0 < 1.0 )
				ifLocalVar32_g283 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g283 = normalize( ( ifLocalVar32_g283 - WorldPosition ) );
				float3 normalizeResult8_g283 = normalize( cross( normalizeResult19_g283 , _worldUp ) );
				float2 texCoord2113 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float3 temp_output_21_0_g283 = UnpackNormal( tex2D( _SpecMatCapNorm, texCoord2113 ) );
				float dotResult10_g283 = dot( normalizeResult8_g283 , temp_output_21_0_g283 );
				float dotResult2_g283 = dot( _worldUp , normalizeResult19_g283 );
				float3 normalizeResult7_g283 = normalize( ( _worldUp - ( dotResult2_g283 * normalizeResult19_g283 ) ) );
				float dotResult9_g283 = dot( normalizeResult7_g283 , temp_output_21_0_g283 );
				float2 appendResult11_g283 = (float2(dotResult10_g283 , dotResult9_g283));
				float3 lerpResult560 = lerp( float3( 0,0,0 ) , ( lerpResult816 + staticSwitch698 ) , ( tex2D( _SpecularMask, ( ( appendResult11_g283 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) ) * _SpecMaskOpacity ).rgb);
				float3 SpecularOut983 = lerpResult560;
				float localbits18_g569 = ( 0.0 );
				float luminance2201 = Luminance(SpecularOut983);
				float grayscale2176 = (temp_output_2179_0.r + temp_output_2179_0.g + temp_output_2179_0.b) / 3;
				float Alpha1262 = ( _AlphaGrey == 1.0 ? grayscale2176 : pow( tex2DNode10.a , _Power ) );
				float clampResult2182 = clamp( Alpha1262 , 0.0 , _CoverageClamp );
				float temp_output_3_0_g569 = ( luminance2201 + ( _Alpha * ( _CoverageClamp > 0.0 ? clampResult2182 : Alpha1262 ) ) );
				half4 screenuv1_g569 = ( screenPos / screenPos.w );
				half4 localStereoScreenUV1_g569 = StereoScreenUV1_g569( screenuv1_g569 );
				float4 break8_g569 = localStereoScreenUV1_g569;
				int x11_g569 = (int)fmod( break8_g569.x , 8.0 );
				int y11_g569 = (int)fmod( break8_g569.y , 8.0 );
				half localDither8x8Bayer11_g569 = Dither8x8Bayer( x11_g569 , y11_g569 );
				int localRenderSampleCount4_g569 = RenderSampleCount();
				#ifdef COVERAGE_ON
				float staticSwitch65_g569 = ( ( temp_output_3_0_g569 + ( ( 1.0 - localDither8x8Bayer11_g569 ) / ( localRenderSampleCount4_g569 / _A2CSampleBias ) ) ) * localRenderSampleCount4_g569 );
				#else
				float staticSwitch65_g569 = 0.0;
				#endif
				float covtoggle18_g569 = ceil( saturate( staticSwitch65_g569 ) );
				float finalAlpha18_g569 = staticSwitch65_g569;
				float preFinalAlpha18_g569 = temp_output_3_0_g569;
				{
				// Shift and subtract to get the needed amount of positive bits
				  if (covtoggle18_g569 == 1)
				{
				cov = (1u << (uint)(finalAlpha18_g569)) - 1u;
				finalAlpha18_g569 = 1;
				}
				  if (covtoggle18_g569 == 0)
				{
				cov = 0xFF;
				finalAlpha18_g569 = preFinalAlpha18_g569;
				}
				}
				clip( 1.0 - _Cutoff);
				float4 appendResult1983 = (float4(( pow( ( ( _Noise == 1.0 ? simplePerlin2D2016 : 1.0 ) * ( _ParallaxAlpha == 1.0 ? float3( 1,1,1 ) : (tex2DNode1927).rgb ) * (_ParalaxColour).rgb * tex2DNode1927.a ) , temp_cast_3 ) + PostDesaturation1276 + Emission1285 + SpecularOut983 ) , finalAlpha18_g569));
				
				
				finalColor = appendResult1983;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.CommentaryNode;1237;-4094.31,-1596.153;Inherit;False;1151.984;507.5215;;15;1861;1856;1858;965;1248;1234;602;603;962;1249;1235;430;428;425;1860;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1378;-3542.44,-966.6467;Inherit;False;2334.753;849.2582;;27;1665;1589;1551;1406;1683;1682;1684;1629;1631;1630;1491;1389;1381;1380;1382;1383;1379;1878;1879;1886;1890;1891;1905;1908;1910;1911;1896;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.SamplerNode;425;-4078.114,-1430.657;Inherit;True;Property;_Normal;Normal;46;1;[Normal];Create;False;0;0;0;False;2;Space(5);Header(.  Normals  .);False;425;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;-0.5;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;1896;-3478.548,-728.2628;Inherit;False;VertexLightData;-1;;4;d6cc1c00f5d200e45903717e6fa3d55c;4,158,0,159,0,160,0,161,0;1;157;FLOAT3;0,0,0;False;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.CommentaryNode;281;-2892.722,-1750.211;Inherit;False;1450.566;614.9301;Uses directional light or uses the static light direction;15;1296;5;1076;1165;633;1233;248;1247;252;249;251;1246;1245;1232;1876;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-4071.916,-1222.955;Inherit;False;Property;_NormalPower;Normal Power;47;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-2979.782,-288.8087;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;430;-3720.483,-1313.864;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;1245;-2871.272,-1542.836;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-2885.181,-1686.371;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-2650.649,-1540.923;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1235;-3504.993,-1313.861;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-2825.676,-281.4002;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;251;-2869.614,-1315.375;Float;False;Property;_StaticLightY;Static Light Y;40;0;Create;True;0;0;0;False;0;False;0.5;0.5;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-2869.52,-1389.659;Float;False;Property;_StaticLightX;Static Light X;39;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.5;0.5;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-2497.999,-1569.883;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;1379;-3113.446,-926.8948;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-2695.444,-281.3874;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-2867.898,-1243.334;Float;False;Property;_StaticLightZ;Static Light Z;41;0;Create;True;0;0;0;False;0;False;0.8;0.8;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;633;-2508.1,-1449.698;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.NormalizeNode;1249;-3312.798,-1314.481;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-3110.897,-349.5701;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-2319.105,-1419.702;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-2346.14,-1514.783;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;1891;-2506.718,-189.4073;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-3150.408,-1319.027;Inherit;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;248;-2536.064,-1328.078;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1890;-2559.773,-284.8499;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-2778.922,-832.5377;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-2363.542,-341.6096;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1382;-2588.283,-831.9765;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-2700.114,-923.4888;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1076;-2088.302,-1396.523;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-2128.246,-1495.052;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1911;-2335.592,-421.573;Inherit;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1905;-2124.317,-368.7635;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;5;-1892.56,-1413.257;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-2386.563,-885.7267;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-2233.31,-890.9108;Inherit;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-1691.565,-1419.027;Inherit;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-1850.442,-365.8699;Inherit;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4367.923,198.6169;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4350.809,112.0563;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-4357.299,20.07608;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1560;-4084.332,48.5182;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.01;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1059;-3676.601,38.67938;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3970.134,218.4577;Inherit;False;Property;_OffsetDot;Offset Dot;35;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3429.394,187.0093;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-3506.541,314.983;Float;False;Property;_ShadowSharpness1;Shadow Sharpness;36;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-3235.374,325.456;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1254;-3073.469,330.4835;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;573;-2887.652,157.6327;Inherit;False;1236.993;594.242;;11;979;1026;815;1025;1033;32;1032;1010;1008;1016;1125;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;1125;-2860.629,533.0309;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;1008;-2859.954,194.2375;Inherit;False;Property;_ShadowColour;Shadow Colour;33;0;Create;True;0;0;0;False;0;False;0.7098039,0.7098039,0.7098039,1;0.7098039,0.7098039,0.7098039,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;32;-2682.287,534.5632;Inherit;True;Property;_Ramp;Ramp;34;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;1032;-2550.022,348.9867;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;3;COLOR;0.5,0.5,0.5,0;False;4;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2544.063,219.9062;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1033;-2356.878,528.2568;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-2946.274,-699.0878;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-2950.3,-517.5125;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-2950.219,-609.0418;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-2949.745,-427.9516;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;815;-2200.593,520.5308;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-2670.897,-591.1256;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;1016;-2261.858,235.5987;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1025;-2280.057,426.9643;Inherit;False;Property;_GradientorRamp;Gradient or Ramp;32;1;[Enum];Create;True;0;2;Ramp_Texture;0;Linear_Gradient;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;1910;-2325.107,-717.4726;Inherit;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;1683;-2467.5,-590.7844;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch;1908;-2122.527,-601.6945;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-2329.637,56.81863;Inherit;False;Property;_ShadowDarkness;Shadow Darkness;37;0;Create;True;0;0;0;False;0;False;0.22;0.22;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-4062.665,-1533.222;Inherit;False;Property;_NormalPowerSpecular;Normal Power Specular;48;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-1858.873,307.4175;Inherit;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1470;-2277.808,-13.62446;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;602;-3725.314,-1475.514;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1775;-1312.181,246.7042;Inherit;False;Property;_BakedLightContrib;Baked Light Contrib;27;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1488;-1294.562,171.0424;Float;False;return ShadeSH9(half4(x, 1))@;3;Create;1;True;x;FLOAT3;0,1,0.5;In;;Float;False;ShadeSH9 (baked light);True;False;0;;False;1;0;FLOAT3;0,1,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-1837.354,-600.2346;Inherit;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2040.297,-1.493157;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;1484;-1170.576,56.28734;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2053.29,-85.44978;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1858;-3477.078,-1566.51;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.25,0.25,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-1080.509,318.4967;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-1808.715,-18.87046;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-996.2955,94.96313;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1774;-1070.824,205.5078;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-2076.642,-771.4263;Inherit;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;569;-1374.577,-2419.024;Inherit;False;2154.971;1142.927;;38;1782;1785;983;560;696;701;824;695;698;816;690;952;566;561;817;825;554;838;691;545;685;837;556;551;553;555;1783;967;1051;546;1909;1898;1919;1920;1921;2113;2205;1899;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.WorldNormalVector;1234;-3503.756,-1475.533;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1776;-516.7422,322.1091;Float;False;Property;_LightSaturation;Light Saturation;26;0;Create;True;0;0;0;False;2;Space(10);Header(.  Light Colour  .);False;0.6;0.6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;30;-1614.185,-10.51266;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1916;-767.5601,304.2833;Inherit;False;Property;_MinLight;Min Light;29;0;Create;True;0;0;0;False;0;False;0.9;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-1360.641,-2382.72;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-821.3895,192.3627;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1785;-1363.254,-2239.949;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-3267.568,-1560.215;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1248;-3314.798,-1475.48;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1915;-710.8563,375.4363;Inherit;False;Property;_MaxLight;Max Light;28;0;Create;True;0;0;0;False;0;False;0.9;0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-587.3646,160.6687;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0.8,0.8,0.8,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;1958;-1352.191,436.4779;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1782;-1089.578,-2351.724;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1778;-417.9402,241.8499;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1544;-569.8634,491.3146;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1898;-1290.188,-1628.376;Inherit;False;VR MatCap;-1;;281;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,1;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-867.1594,-2154.199;Inherit;False;Property;_SpecularSize;Specular Size;52;0;Create;True;0;0;0;False;0;False;1;3;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-1000.016,-2236.29;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1777;-408.4728,91.47132;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-902.2144,-2345.644;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;551;-704.9365,-2278.169;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-597.2936,-2082.992;Inherit;False;Property;_SpecularStrength;Specular Strength;51;0;Create;True;0;0;0;False;0;False;0;-0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ExpOpNode;553;-564.3043,-2215.325;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-739.3617,-1622.594;Inherit;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;56;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;685;-1032.21,-1725.01;Inherit;True;Property;_SpecularMatcap;Specular Matcap;54;0;Create;True;0;0;0;False;0;False;-1;None;8b03d9c3f04ce674ebfad06d2ad2e5c6;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;-185.3774,217.7857;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1295;977.5045,-1629.964;Inherit;False;1534.433;513.8026;;13;450;331;330;329;326;805;462;461;327;808;970;328;1285;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2114;819.1856,-1551.494;Inherit;False;0;328;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;2112;-1131.361,-207.6372;Inherit;False;0;10;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;545;-481.9503,-2341.079;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;328;1031.984,-1577.518;Inherit;True;Property;_Emission;Emission Map;42;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2086;801.0811,-743.0274;Inherit;False;Property;_NoiseScale;Noise Scale;25;0;Create;True;0;0;0;False;0;False;0;0;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;817;-729.6928,-1726.174;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;556;-389.1411,-2192.812;Inherit;False;False;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1347;63.85589,124.4743;Inherit;False;855.2606;338.8594;saturation;9;582;581;584;585;1330;586;325;453;454;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2079;866,-670;Inherit;False;Property;_NoiseRate;Noise Rate;24;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;2098;709.0807,-1017.027;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;1921;-475.5032,-1676.969;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2093;918.0807,-816.0274;Inherit;False;Constant;_Float0;Float 0;62;0;Create;True;0;0;0;False;0;False;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;970;1323.944,-1463.482;Inherit;False;968;LightShaded;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;585;81.0999,374.3862;Inherit;False;Property;_ShadowSaturation;Shadow Saturation;38;0;Create;True;0;0;0;False;0;False;1;1;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2094;1076.081,-810.0274;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2009;1432.435,-218.725;Inherit;False;Property;_RotateSpeed;Rotate Speed;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2101;1027.081,-667.0273;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;838;-748.7903,-1956.958;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;1336.959,-1575.35;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1330;95.6078,290.3381;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;2100;898.0807,-1012.027;Inherit;False;FLOAT2;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-77.34032,-2259.242;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-1006.393,-1823.989;Inherit;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;55;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-470.22,-1787.918;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;454;351.1966,208.4819;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2010;1428.608,-323.8929;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;566;74.26813,-2181.198;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;1550.445,-1475.384;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;952;-298.0586,-2028.655;Inherit;False;Constant;_SpecCap_Null;SpecCap_Null;65;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;1899;-446.5963,-1466.509;Inherit;False;VR MatCap;-1;;283;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,1;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;461;1329.69,-1385.762;Inherit;False;Property;_ShadedEmission;Shaded Emission;45;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;1447.33,-1293.54;Float;False;Property;_EmissionColor;Emission Color;43;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;2023;1150,-668;Inherit;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2085;1242.081,-890.0274;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0.05;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-204.7282,-2119.26;Inherit;False;Property;_SpecularOpacity;Specular Opacity;49;0;Create;True;0;0;0;False;2;Space(5);Header(.  Specular  .);False;1;0.7;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;582;363.7917,298.8784;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;586;366.7162,381.4955;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-261.1024,-1882.022;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;453;561.8796,195.0326;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;816;196.4796,-2065.069;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;824;-94.7949,-1784.201;Inherit;False;Property;_SpecMaskOpacity;SpecMask Opacity;59;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;805;1680.887,-1294.844;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;584;574.3521,297.0027;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;326;1675.283,-1205.707;Float;False;Property;_EmissionIntensity;Emission Intensity;44;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;450;1747.337,-1499.966;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;695;-128.5854,-1608.987;Inherit;True;Property;_SpecularMask;Specular Mask;57;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2095;1316.081,-700.0274;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;237.5336,-1917.055;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;1928;1676.005,-323.5399;Inherit;False;Property;_ParalaxColour;Paralax Colour;15;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;330;1929.115,-1198.055;Float;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;2016;1470.588,-694.6231;Inherit;False;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;1941.841,-1337.614;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;581;754.5635,232.9092;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;176.3058,-1757.166;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;1918;952.4561,236.3517;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;1E-06,1E-06,1E-06;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;2026;1718.547,-680.0073;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;560;372.4905,-1894.323;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2122;1873.755,-326.1509;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;331;2122.735,-1296.652;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;1146.35,228.4602;Inherit;False;PostDesaturation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;2277.004,-1294.666;Inherit;False;Emission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;1812.862,-6.435277;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1346;2859.333,-1342.923;Inherit;False;670.9946;746.3742;custom properties;12;1345;1335;1344;1342;1431;1340;1339;1337;1432;1343;1338;1341;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;2876.299,-1194.834;Half;False;Property;_ReadMask;ReadMask;65;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;2077;881,-935;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1431;2886.58,-820.4198;Inherit;False;Property;_SrcBlend;Source Blend (One);70;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1860;-3483.746,-1176.744;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.25,0.25,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1340;3181.625,-1281.015;Inherit;False;Property;_StencilComparison;Stencil Comparison;66;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1342;3202.625,-1136.015;Inherit;False;Property;_StencilFail;StencilFail;68;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;2882.479,-1280.823;Half;False;Property;_StencilRef;Stencil ID;63;0;Create;False;0;0;0;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1335;3215.875,-918.9951;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-3253.236,-1178.448;Inherit;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;1983;2800.553,-243.2918;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3151.765,-825.441;Inherit;False;Property;_DstBlend;Destination Blend (Zero);71;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1343;3201.625,-1061.015;Inherit;False;Property;_StencilZFail;StencilZFail;69;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1341;3206.338,-1208.357;Inherit;False;Property;_StencilOp;StencilOp;67;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;2875.299,-1112.257;Half;False;Property;_WriteMask;WriteMask;64;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;2008;1439.466,-495.6157;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2025;1498.949,-781.8145;Inherit;False;Property;_Noise;Noise;23;2;[Gamma];[ToggleUI];Create;True;0;0;0;False;1;Space(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1058;-3891.822,-3.546481;Inherit;False;Property;_UseShading;Use Shading;31;1;[ToggleUI];Create;True;0;0;0;False;2;Space(5);Header(.  Shadow  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;558.8113,-1894.835;Inherit;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;2885.308,-1002.382;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);61;1;[Toggle];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1344;2882.237,-914.3182;Float;False;Property;_ZTestMode;ZTestMode (LEqual);62;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;698;-67.75902,-1930.148;Inherit;False;Property;_UseSpecularMatCap;Use Specular MatCap;53;0;Create;True;0;0;0;False;2;Space(5);Header(. Specular Overlay);False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1026;-2021.075,307.2643;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;2045;-1154.869,-866.2086;Inherit;False;VR_Center_Eye;-1;;285;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.DistanceOpNode;2001;-904.116,-734.3073;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1980;-921.1144,-815.074;Inherit;False;Property;_ParallaxScale;Parallax Scale;17;0;Create;True;0;0;0;False;1;Space(10);False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2073;-1178.107,-755.2195;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;2071;-729.1033,-795.0988;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;2141;-597.1317,-815.7875;Inherit;False;Property;_ParallaxDistScale;Parallax Dist Scale;19;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;2033;-807.5816,-432.7753;Inherit;False;World;Object;True;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1926;-979.1345,-433.0265;Float;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;2037;-527.9816,-368.9753;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;2126;-603.7637,-538.6641;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;2111;1194.807,-298.3875;Inherit;False;2;2;0;FLOAT2;0.5,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2153;1054.392,-299.9456;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2154;780.5671,-295.0887;Inherit;False;0;1927;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;2170;-199.7072,-489.0457;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ParallaxMappingNode;1925;142.5091,-610.0769;Inherit;False;Normal;4;0;FLOAT2;0.5,0.25;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ClampOpNode;2120;384.673,-593.2541;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0.1;False;2;FLOAT2;1,0.9;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2140;891.6289,-566.9877;Inherit;False;2;2;0;FLOAT2;0.5,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;2136;578.6296,-641.0072;Inherit;False;return _ParallaxCookie_ST.xy@;2;Create;0;texcoord scale;False;True;0;;False;0;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2137;751.6294,-576.9877;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;1,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2139;579.6298,-557.007;Inherit;False;2;2;0;FLOAT2;0.5,0;False;1;FLOAT2;-0.5,-0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;2133;-370.8663,-527.3562;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;2150;-521.3828,-964.9648;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1949;-369.4651,-613.6862;Inherit;False;Property;_ParallaxDepth;Parallax Depth;18;0;Create;True;0;0;0;False;0;False;-10;-10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2034;-598.8819,-633.7664;Inherit;False;Property;_ParallaxAxis;Parallax Axis;20;1;[Enum];Create;True;0;2;Y up;0;Z up;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2173;-35.18222,-857.8167;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;2175;-244.1704,-819.1067;Inherit;False;Constant;_Vector1;Vector 1;63;0;Create;True;0;0;0;False;0;False;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;2174;-196.0242,-943.026;Inherit;False;Property;_InfParallax;Infinite Parallax;21;1;[ToggleUI];Create;False;0;2;Y up;0;Z up;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;10;-897.3066,-229.0958;Inherit;True;Property;_MainTex;Texture;1;0;Create;False;0;0;0;False;1;Header(.  Main  .);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;325;75.3989,193.7179;Float;False;Property;_Saturation;Saturation;5;0;Create;True;0;0;0;False;0;False;1;1;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;334;1508.21,-41.26706;Inherit;False;Property;_Alpha;Alpha;11;0;Create;True;0;0;0;False;0;False;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;159.4479,1.057565;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;-228.6421,95.10633;Inherit;False;LightShaded;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;2185;-29.94485,55.54826;Inherit;False;Property;_Unlit;Unlit;30;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2187;-66.80078,162.6462;Inherit;False;Constant;_unlit_null;unlit_null;67;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;2182;1323.144,15.43605;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-568.7085,-34.53592;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;2176;115.5348,-206.8025;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;2179;-56.2955,-236.551;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2180;-65.2955,-143.551;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2177;102.8416,-330.4237;Inherit;False;Property;_AlphaGrey;Alpha From Greyscale;10;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2178;336.8414,-249.4237;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2181;-217.819,-66.8123;Float;False;Property;_Power;Power;4;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2190;-219.5157,-248.0158;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-594.9019,-164.7357;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;2192;-377.5157,-250.0158;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2188;-322.5157,-329.0158;Inherit;False;Property;_TexGrey;Texture is Greyscale;2;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1927;1615.649,-524.6611;Inherit;True;Property;_ParallaxCookie;Parallax Cookie;13;0;Create;False;0;0;0;False;2;Space(10);Header(.  Parallax  .);False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2616.971,-262.2833;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1294;2351.572,-116.0766;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;2294.317,-190.8462;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1929;2295.163,-486.5587;Inherit;False;4;4;0;FLOAT;1;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2121;2457.755,-394.1509;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2123;2302.755,-332.1509;Inherit;False;Property;_ParallaxPwr;Power;16;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1941;1890.259,-524.679;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;2195;2260.455,-630.7775;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2194;2095.455,-594.7775;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2193;1895.945,-604.9185;Inherit;False;Property;_ParallaxAlpha;Alpha Only Tex;14;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2196;2696.708,-916.6202;Inherit;False;Property;_BlendOp;BlendOp;72;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.BlendOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClipNode;1430;2420.108,78.63734;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;2200.826,157.4726;Inherit;False;Property;_Cutoff;Alpha Cutoff;12;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2197;3044.412,-234.293;Float;False;True;-1;2;ASEMaterialInspector;100;18;.GenesisAria/Arias HoloSight Transparent;947b339f436a01f4f957695564bd3375;True;Unlit;0;0;Unlit;2;True;True;1;0;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;True;_BlendOp;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;True;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;0;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;0;True;_StencilComparison;0;True;_StencilOp;0;True;_StencilFail;0;True;_StencilZFail;0;False;;0;False;;0;False;;0;False;;True;True;1;True;_ZWriteMode;True;3;True;_ZTestMode;True;False;0;True;;0;False;;True;1;RenderType=Opaque=RenderType;True;7;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;True;7;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.RangedFloatNode;2198;1871.319,125.153;Inherit;False;Property;_A2CSampleBias;A2C Sample Bias;8;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2199;2110.764,57.67548;Inherit;False;Custom A2C;6;;569;445f8ff28d1a9f44092743e0eb84a83d;0;3;19;FLOAT;1;False;3;FLOAT;1;False;16;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;2183;1626.744,29.86026;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2184;1114.744,-69.13974;Inherit;False;Property;_CoverageClamp;Coverage Clamp;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;1095.984,92.28073;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;2333.943,-43.4035;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;509.2362,-252.9363;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2203;1990.816,3.819643;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2202;1639.076,-100.923;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LuminanceNode;2201;1811.331,-98.7406;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2205;-95.30031,-2399.953;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;837;-1012.791,-2012.959;Inherit;False;Property;_SpecMatCapColour;SpecMatCap Colour;58;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;18;-807.2459,-39.08972;Float;False;Property;_Colour;> Colour;3;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0.5,0.5,0.5,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2207;-317.7749,-2460.337;Float;False;Property;_SColor;Specular Colour;50;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-3161.263,-1480.59;Inherit;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;967;-1327.231,-1721.787;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2113;-997.6841,-1436.07;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;825;-773.2594,-1472.205;Inherit;True;Property;_SpecMatCapNorm;SpecMatCap Norm;60;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;1878;0;1896;16
WireConnection;1878;1;1896;17
WireConnection;1878;2;1896;18
WireConnection;1878;3;1896;20
WireConnection;430;1;425;0
WireConnection;430;2;428;0
WireConnection;1246;0;1232;2
WireConnection;1246;1;1245;0
WireConnection;1235;0;430;0
WireConnection;1551;0;1878;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;1249;0;1235;0
WireConnection;1886;0;1896;23
WireConnection;1886;1;1896;29
WireConnection;1886;2;1896;30
WireConnection;1886;3;1896;31
WireConnection;1876;0;633;1
WireConnection;1876;1;633;2
WireConnection;1233;0;1247;0
WireConnection;1891;0;1551;3
WireConnection;962;0;1249;0
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;1890;0;1589;0
WireConnection;1383;0;1896;0
WireConnection;1383;1;1379;0
WireConnection;1879;0;1886;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;1382;0;1383;0
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;248;0
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;5;0;1165;0
WireConnection;5;1;1076;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;1389;0;1381;0
WireConnection;1296;0;5;0
WireConnection;1665;0;1905;0
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
WireConnection;1010;0;1008;0
WireConnection;1033;0;1032;0
WireConnection;1033;1;32;0
WireConnection;1629;0;1896;16
WireConnection;1629;1;1896;23
WireConnection;1631;0;1896;18
WireConnection;1631;1;1896;30
WireConnection;1630;0;1896;17
WireConnection;1630;1;1896;29
WireConnection;1684;0;1896;20
WireConnection;1684;1;1896;31
WireConnection;815;0;1033;0
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;1683;0;1682;0
WireConnection;1908;1;1910;0
WireConnection;1908;0;1683;0
WireConnection;979;0;1026;0
WireConnection;1470;0;1106;0
WireConnection;602;1;425;0
WireConnection;602;2;603;0
WireConnection;1406;0;1908;0
WireConnection;344;0;1470;0
WireConnection;344;1;335;0
WireConnection;1858;0;602;0
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;1486;0;1484;1
WireConnection;1486;1;1484;2
WireConnection;1774;0;1488;0
WireConnection;1774;1;1775;0
WireConnection;1491;0;1382;0
WireConnection;1234;0;602;0
WireConnection;30;0;346;0
WireConnection;1489;0;1486;0
WireConnection;1489;1;1774;0
WireConnection;1489;2;1408;0
WireConnection;1856;0;1858;0
WireConnection;1248;0;1234;0
WireConnection;1914;0;1489;0
WireConnection;1914;1;1916;0
WireConnection;1914;2;1915;0
WireConnection;1958;0;30;0
WireConnection;1782;0;1909;0
WireConnection;1782;1;1785;0
WireConnection;1778;0;1776;0
WireConnection;1544;0;1958;0
WireConnection;1898;21;967;0
WireConnection;1777;0;1914;0
WireConnection;1777;1;1778;0
WireConnection;1783;0;1782;0
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;553;0;546;0
WireConnection;685;1;1898;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;1544;0
WireConnection;545;0;551;0
WireConnection;545;1;553;0
WireConnection;328;1;2114;0
WireConnection;817;0;685;0
WireConnection;556;1;555;0
WireConnection;1921;0;1919;0
WireConnection;2094;0;2093;0
WireConnection;2094;1;2086;0
WireConnection;2101;0;2079;0
WireConnection;838;0;837;0
WireConnection;808;0;328;0
WireConnection;2100;0;2098;0
WireConnection;554;0;545;0
WireConnection;554;1;556;0
WireConnection;554;2;2205;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;454;0;325;0
WireConnection;2010;0;2009;0
WireConnection;566;0;554;0
WireConnection;462;0;808;0
WireConnection;462;1;970;0
WireConnection;1899;21;825;0
WireConnection;2023;0;2101;0
WireConnection;2085;0;2100;0
WireConnection;2085;1;2094;0
WireConnection;582;0;1330;0
WireConnection;586;0;585;0
WireConnection;690;0;1920;0
WireConnection;690;1;691;0
WireConnection;690;2;838;0
WireConnection;453;0;19;0
WireConnection;453;1;454;0
WireConnection;816;1;566;0
WireConnection;816;2;561;0
WireConnection;805;0;327;0
WireConnection;584;0;582;0
WireConnection;584;1;586;0
WireConnection;450;0;808;0
WireConnection;450;1;462;0
WireConnection;450;2;461;0
WireConnection;695;1;1899;0
WireConnection;2095;0;2085;0
WireConnection;2095;1;2023;0
WireConnection;701;0;816;0
WireConnection;701;1;698;0
WireConnection;2016;0;2095;0
WireConnection;329;0;450;0
WireConnection;329;1;805;0
WireConnection;329;2;326;0
WireConnection;581;0;453;0
WireConnection;581;1;584;0
WireConnection;696;0;695;0
WireConnection;696;1;824;0
WireConnection;1918;0;581;0
WireConnection;2026;0;2025;0
WireConnection;2026;2;2016;0
WireConnection;560;1;701;0
WireConnection;560;2;696;0
WireConnection;2122;0;1928;0
WireConnection;331;0;329;0
WireConnection;331;2;330;0
WireConnection;1276;0;1918;0
WireConnection;1285;0;331;0
WireConnection;333;0;334;0
WireConnection;333;1;2183;0
WireConnection;1860;0;430;0
WireConnection;1861;0;1860;0
WireConnection;1983;0;470;0
WireConnection;1983;3;1430;0
WireConnection;2008;0;2140;0
WireConnection;2008;1;2111;0
WireConnection;2008;2;2010;0
WireConnection;983;0;560;0
WireConnection;698;1;952;0
WireConnection;698;0;690;0
WireConnection;1026;0;1025;0
WireConnection;1026;2;1016;0
WireConnection;1026;3;815;0
WireConnection;2001;0;2045;0
WireConnection;2001;1;2073;0
WireConnection;2071;0;2001;0
WireConnection;2071;1;1980;0
WireConnection;2141;1;1980;0
WireConnection;2141;0;2071;0
WireConnection;2033;0;1926;0
WireConnection;2037;0;2033;1
WireConnection;2037;1;2033;3
WireConnection;2037;2;2033;2
WireConnection;2111;0;2153;0
WireConnection;2153;0;2154;0
WireConnection;2170;0;2133;0
WireConnection;1925;0;2173;0
WireConnection;1925;1;1949;0
WireConnection;1925;2;2141;0
WireConnection;1925;3;2133;0
WireConnection;2120;0;1925;0
WireConnection;2140;0;2137;0
WireConnection;2137;0;2136;0
WireConnection;2137;1;2139;0
WireConnection;2139;0;1925;0
WireConnection;2133;0;2034;0
WireConnection;2133;2;2126;0
WireConnection;2133;3;2037;0
WireConnection;2133;4;2033;0
WireConnection;2173;0;2174;0
WireConnection;2173;2;2175;0
WireConnection;2173;3;2150;0
WireConnection;10;1;2112;0
WireConnection;19;0;2179;0
WireConnection;19;1;813;0
WireConnection;19;2;2185;0
WireConnection;968;0;1922;0
WireConnection;2185;1;968;0
WireConnection;2185;0;2187;0
WireConnection;2182;0;1265;0
WireConnection;2182;2;2184;0
WireConnection;813;0;18;0
WireConnection;2176;0;2179;0
WireConnection;2179;0;2190;0
WireConnection;2179;1;2181;0
WireConnection;2180;0;10;4
WireConnection;2180;1;2181;0
WireConnection;2178;0;2177;0
WireConnection;2178;2;2176;0
WireConnection;2178;3;2180;0
WireConnection;2190;0;2188;0
WireConnection;2190;2;2192;0
WireConnection;2190;3;812;0
WireConnection;812;0;10;0
WireConnection;2192;0;10;1
WireConnection;2192;1;10;1
WireConnection;2192;2;10;1
WireConnection;1927;1;2008;0
WireConnection;470;0;2121;0
WireConnection;470;1;1515;0
WireConnection;470;2;1294;0
WireConnection;470;3;1701;0
WireConnection;1929;0;2195;0
WireConnection;1929;1;2194;0
WireConnection;1929;2;2122;0
WireConnection;1929;3;1927;4
WireConnection;2121;0;1929;0
WireConnection;2121;1;2123;0
WireConnection;1941;0;1927;0
WireConnection;2195;0;2026;0
WireConnection;2194;0;2193;0
WireConnection;2194;3;1941;0
WireConnection;1430;0;2199;0
WireConnection;1430;2;1433;0
WireConnection;2197;0;1983;0
WireConnection;2199;3;2203;0
WireConnection;2199;16;2198;0
WireConnection;2183;0;2184;0
WireConnection;2183;2;2182;0
WireConnection;2183;3;1265;0
WireConnection;1262;0;2178;0
WireConnection;2203;0;2201;0
WireConnection;2203;1;333;0
WireConnection;2201;0;2202;0
WireConnection;2205;0;2207;0
WireConnection;965;0;1248;0
WireConnection;825;1;2113;0
ASEEND*/
//CHKSM=966AB83E364407342AF549EAE4650B0EC79A3D8A
