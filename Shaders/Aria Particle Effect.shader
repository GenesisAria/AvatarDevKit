// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Particle Effect Transparent"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[ToggleUI]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 0
		[Space(5)]_Offset("Offset", Float) = -300
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space (5)][Toggle(COVERAGE_ON)] _AlphaToCoverage("AlphaToCoverage (antialiased override)", Float) = 1
		_A2CSampleBias("A2C Sample Bias", Float) = 1
		[Space(10)]_AlphaPower("Alpha Power", Float) = 1
		_Cutoff("Alpha Cutoff", Float) = 1
		[Toggle(GREYTOALPHA_ON)] _AlphaGrey("Alpha From Greyscale", Float) = 0
		_Emission("Emission", 2D) = "white" {}
		[HDR]_Color("Colour", Color) = (1,1,1,1)
		_TexSaturation("Tex Saturation", Range( 0 , 2)) = 1
		_TexMultiply("Tex Multiply", Float) = 1
		_TexPower("Tex Power", Float) = 1
		[Toggle(_USEFLIPBOOK_ON)] _UseFlipbook("Use Flipbook", Float) = 0
		_FlipSetting("Col Row Start Time", Vector) = (0,0,0,0)
		[Space(5)][Header(. Noise .)][Toggle(_USENOISE_ON)] _UseNoise("Use Noise", Float) = 0
		_Noise("Noise", 2D) = "white" {}
		_NoiseColor("Noise Colour", Color) = (1,1,1,0)
		_NoiseTexMultiply("NoiseTex Multiply", Float) = 1
		_NoiseTexPower("NoiseTex Power", Float) = 1
		_NoiseTime("Noise Time", Float) = 1
		[KeywordEnum(Multiply,PreMultiply,Add)] _NoiseBlend("Noise Blend", Float) = 0
		_PanX("PanX", Float) = 0
		_PanY("PanY", Float) = 0
		ScaleNorm2("Normal Scale", Float) = 1
		_NoiseFade("Noise Fade", Range( 0 , 1)) = 1
		[ToggleUI]_IncludeFresnel("Include Fresnel", Float) = 0
		[Toggle(_NOISETOTEXTURE_ON)] _NoisetoTexture("Noise to Texture", Float) = 0
		_Emission2("Emission2", 2D) = "white" {}
		[ToggleUI]_Invert("Invert", Float) = 0
		_Emission2Multiply("Emission2 Multiply", Float) = 1
		_Emission2Power("Emission2 Power", Float) = 1
		_Saturation("Saturation", Range( -1 , 2)) = 2
		[HDR]_Color2("Colour2", Color) = (1,1,1,0)
		_PanX_E2("PanX", Float) = 0
		_PanY_E2("PanY", Float) = 0
		[ToggleUI][Enum(Multiply,0,AddMultiply,1)]_NoiseType("Noise Type", Float) = 0
		[Space(5)][Toggle(_PARALLAX_ON)] _Parallax("Parallax", Float) = 0
		[KeywordEnum(Normal,Planar)] _Type("Type", Float) = 0
		[KeywordEnum(Vertex,View)] _Dir("Dir", Float) = 0
		_ParallaxScale("Parallax Scale", Float) = 1
		_ParallaxHeight2("Parallax Height", Float) = 0.5
		[space(10)][Header(. Normals .)][Toggle(_NOISEDISTORT_ON)] _NoiseDistort("NoiseDistort", Float) = 0
		_Normal("Normal", 2D) = "bump" {}
		ScaleNorm("Scale Normal", Float) = 1
		_PanX_N("PanX", Float) = 0
		_PanY_N("PanY", Float) = 0
		[Header(. Fresnel)][Toggle(_USEFRESNEL_ON)] _UseFresnel("UseFresnel", Float) = 0
		_RimOutlineColour("Rim/Outline Colour", Color) = (0,0,0,0)
		[Enum(Blend_Lerp,0,Multiply,1,AddSubtract,2)]_RimMode("Rim Mode", Float) = 1
		_Amount1("Rim Opacity", Float) = 0
		_Power("Rim Power", Float) = 0
		_Scale("Rim Scale", Float) = 0
		_Min("Rim Min", Float) = 0
		_Max("Rim Max", Float) = 0
		[ToggleUI]_RimNormal("Rim Normal", Float) = 0
		_RimNormPow("Rim Normal Power", Range( 0 , 1)) = 0
		[Toggle(_DISTANCESCALE_ON)] _DistanceScale("Distance Scale", Float) = 0
		[Toggle(_FLIPNORMAL_ON)] _FlipNormal("Flip Normal", Float) = 0
		_RimEdgeFix("Edge Compensate (dist pow limit)", Vector) = (-0.03,4,0.075,0)
		[Header(. Parallax)][Toggle(_USEPARALLAX_ON)] _UseParallax("Use Parallax", Float) = 0
		[HDR]_ParallaxColour("Parallax Colour", Color) = (1,1,1,1)
		_ParallaxTexture("Parallax Texture (RGB,A)", 2D) = "black" {}
		_ParallaxHeight("Parallax Height", Float) = 0.5
		_ParallaxMask("Parallax Mask (R)", 2D) = "white" {}
		_ParallaxMaskPower("Parallax Mask Power", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Advanced  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (OneMinusSrcAlpha)", Float) = 10
		[Space(5)][Header(Stencil)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask (non-zero)", Float) = 255
		_ReadMask("ReadMask (non-zero)", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0

	}
	
	SubShader
	{
		LOD 100

		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" }

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		AlphaToMask Off
		Cull [_Culling]
		ColorMask RGBA
		ZWrite [_ZWriteMode]
		ZTest [_ZTestMode]
		Offset [_Offset] , 0
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
			#include "UnityStandardUtils.cginc"
			#include "UnityStandardBRDF.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_TANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _USENOISE_ON
			#pragma shader_feature_local _USEFLIPBOOK_ON
			#pragma shader_feature_local _USEFRESNEL_ON
			#pragma shader_feature_local _FLIPNORMAL_ON
			#pragma shader_feature_local _DISTANCESCALE_ON
			#pragma shader_feature_local _NOISEBLEND_MULTIPLY _NOISEBLEND_PREMULTIPLY _NOISEBLEND_ADD
			#pragma shader_feature_local _NOISEDISTORT_ON
			#pragma shader_feature_local _NOISETOTEXTURE_ON
			#pragma shader_feature_local _PARALLAX_ON
			#pragma shader_feature_local _TYPE_NORMAL _TYPE_PLANAR
			#pragma shader_feature_local _DIR_VERTEX _DIR_VIEW
			#pragma shader_feature_local _USEPARALLAX_ON
			#pragma shader_feature_local COVERAGE_ON
			#pragma shader_feature_local GREYTOALPHA_ON


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform int _StencilFail;
			uniform half _ReadMask;
			uniform float _ZTestMode;
			uniform float _DstBlend;
			uniform int _StencilOp;
			uniform int _StencilZFail;
			uniform int _StencilComparison;
			uniform half _StencilRef;
			uniform float _Offset;
			uniform half _WriteMask;
			uniform float _SrcBlend;
			uniform int _Culling;
			uniform float _ZWriteMode;
			uniform float _NoiseType;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;
			uniform float4 _FlipSetting;
			uniform float _TexSaturation;
			uniform float4 _Color;
			uniform float _TexMultiply;
			uniform float _TexPower;
			uniform half _RimMode;
			uniform float4 _RimOutlineColour;
			uniform float _Min;
			uniform float _Max;
			uniform half _RimNormal;
			uniform sampler2D _Normal;
			uniform float _PanX_N;
			uniform float _PanY_N;
			uniform float4 _Normal_ST;
			uniform float ScaleNorm;
			uniform float _RimNormPow;
			uniform float _Scale;
			uniform float _Power;
			uniform half _Amount1;
			uniform float3 _RimEdgeFix;
			uniform float _IncludeFresnel;
			uniform float _NoiseTexMultiply;
			uniform sampler2D _Noise;
			uniform float _PanX;
			uniform float _PanY;
			uniform float4 _Noise_ST;
			uniform float ScaleNorm2;
			uniform float _NoiseTexPower;
			uniform float _NoiseTime;
			uniform float4 _NoiseColor;
			uniform float _Invert;
			uniform sampler2D _Emission2;
			uniform float _PanX_E2;
			uniform float _PanY_E2;
			uniform float4 _Emission2_ST;
			uniform float _ParallaxHeight2;
			uniform float _ParallaxScale;
			uniform float _Saturation;
			uniform float _Emission2Power;
			uniform float4 _Color2;
			uniform float _Emission2Multiply;
			uniform float _NoiseFade;
			uniform sampler2D _ParallaxMask;
			uniform float4 _ParallaxMask_ST;
			uniform half _ParallaxMaskPower;
			uniform sampler2D _ParallaxTexture;
			uniform float4 _ParallaxTexture_ST;
			uniform float _ParallaxHeight;
			uniform half4 _ParallaxColour;
			uniform float _AlphaPower;
			uniform float _A2CSampleBias;
			uniform float _Cutoff;
			float3 CenterEye1_g561(  )
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

				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float3 ase_worldTangent = UnityObjectToWorldDir(v.ase_tangent);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				
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
				float2 uv_Emission = i.ase_texcoord1.xy * _Emission_ST.xy + _Emission_ST.zw;
				// *** BEGIN Flipbook UV Animation vars ***
				// Total tiles of Flipbook Texture
				float fbtotaltiles787 = _FlipSetting.x * _FlipSetting.y;
				// Offsets for cols and rows of Flipbook Texture
				float fbcolsoffset787 = 1.0f / _FlipSetting.x;
				float fbrowsoffset787 = 1.0f / _FlipSetting.y;
				// Speed of animation
				float fbspeed787 = _Time[ 1 ] * _FlipSetting.w;
				// UV Tiling (col and row offset)
				float2 fbtiling787 = float2(fbcolsoffset787, fbrowsoffset787);
				// UV Offset - calculate current tile linear index, and convert it to (X * coloffset, Y * rowoffset)
				// Calculate current tile linear index
				float fbcurrenttileindex787 = round( fmod( fbspeed787 + _FlipSetting.z, fbtotaltiles787) );
				fbcurrenttileindex787 += ( fbcurrenttileindex787 < 0) ? fbtotaltiles787 : 0;
				// Obtain Offset X coordinate from current tile linear index
				float fblinearindextox787 = round ( fmod ( fbcurrenttileindex787, _FlipSetting.x ) );
				// Multiply Offset X by coloffset
				float fboffsetx787 = fblinearindextox787 * fbcolsoffset787;
				// Obtain Offset Y coordinate from current tile linear index
				float fblinearindextoy787 = round( fmod( ( fbcurrenttileindex787 - fblinearindextox787 ) / _FlipSetting.x, _FlipSetting.y ) );
				// Reverse Y to get tiles from Top to Bottom
				fblinearindextoy787 = (int)(_FlipSetting.y-1) - fblinearindextoy787;
				// Multiply Offset Y by rowoffset
				float fboffsety787 = fblinearindextoy787 * fbrowsoffset787;
				// UV Offset
				float2 fboffset787 = float2(fboffsetx787, fboffsety787);
				// Flipbook UV
				half2 fbuv787 = uv_Emission * fbtiling787 + fboffset787;
				// *** END Flipbook UV Animation vars ***
				#ifdef _USEFLIPBOOK_ON
				float2 staticSwitch796 = fbuv787;
				#else
				float2 staticSwitch796 = uv_Emission;
				#endif
				float4 tex2DNode26 = tex2D( _Emission, staticSwitch796 );
				float3 desaturateInitialColor49 = tex2DNode26.rgb;
				float desaturateDot49 = dot( desaturateInitialColor49, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar49 = lerp( desaturateInitialColor49, desaturateDot49.xxx, ( 1.0 - _TexSaturation ) );
				float temp_output_774_0 = (tex2DNode26).a;
				float4 appendResult90 = (float4(desaturateVar49 , temp_output_774_0));
				float4 temp_output_48_0 = ( appendResult90 * _Color * i.ase_color * _TexMultiply );
				float3 temp_output_480_0 = (temp_output_48_0).xyz;
				float3 saferPower486 = abs( temp_output_480_0 );
				float3 temp_cast_3 = (_TexPower).xxx;
				float3 temp_output_486_0 = pow( saferPower486 , temp_cast_3 );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float2 appendResult723 = (float2(_PanX_N , _PanY_N));
				float2 uv_Normal = i.ase_texcoord1.xy * _Normal_ST.xy + _Normal_ST.zw;
				float2 panner719 = ( 1.0 * _Time.y * appendResult723 + uv_Normal);
				float3 ase_worldTangent = i.ase_texcoord3.xyz;
				float3 ase_worldBitangent = i.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal693 = UnpackScaleNormal( tex2D( _Normal, panner719 ), ScaleNorm );
				float3 worldNormal693 = float3(dot(tanToWorld0,tanNormal693), dot(tanToWorld1,tanNormal693), dot(tanToWorld2,tanNormal693));
				float3 lerpResult654 = lerp( ase_worldNormal , worldNormal693 , _RimNormPow);
				float3 ifLocalVar656 = 0;
				if( _RimNormal == 1.0 )
				ifLocalVar656 = lerpResult654;
				else if( _RimNormal < 1.0 )
				ifLocalVar656 = ase_worldNormal;
				#ifdef _FLIPNORMAL_ON
				float3 staticSwitch815 = -ifLocalVar656;
				#else
				float3 staticSwitch815 = ifLocalVar656;
				#endif
				float fresnelNdotV661 = dot( staticSwitch815, ase_worldViewDir );
				float fresnelNode661 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV661, _Power ) );
				float smoothstepResult665 = smoothstep( _Min , _Max , fresnelNode661);
				float3 temp_output_667_0 = ( (_RimOutlineColour).rgb * smoothstepResult665 );
				float3 localCenterEye1_g561 = CenterEye1_g561();
				float temp_output_4_0_g560 = distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g561 : _WorldSpaceCameraPos ) );
				float clampResult842 = clamp( ( temp_output_4_0_g560 * 15.0 ) , 0.0 , 0.75 );
				float dotResult705 = dot( ase_worldViewDir , ifLocalVar656 );
				#ifdef _DISTANCESCALE_ON
				float staticSwitch822 = ( clampResult842 * ( ( dotResult705 - 0.075 ) * _RimEdgeFix.x ) );
				#else
				float staticSwitch822 = 0.0;
				#endif
				float saferPower699 = abs( staticSwitch822 );
				float smoothstepResult697 = smoothstep( 0.0 , _RimEdgeFix.z , saturate( pow( saferPower699 , ( _RimEdgeFix.y * ( 1.0 - clampResult842 ) ) ) ));
				float temp_output_859_0 = pow( _Amount1 , smoothstepResult697 );
				float3 lerpResult674 = lerp( temp_output_486_0 , ( temp_output_667_0 + temp_output_486_0 ) , temp_output_859_0);
				float temp_output_671_0 = ( smoothstepResult665 * temp_output_859_0 );
				float3 lerpResult673 = lerp( temp_output_486_0 , temp_output_667_0 , temp_output_671_0);
				float3 lerpResult672 = lerp( temp_output_486_0 , temp_output_667_0 , temp_output_671_0);
				float3 ifLocalVar678 = 0;
				if( _RimMode > 1.0 )
				ifLocalVar678 = lerpResult674;
				else if( _RimMode == 1.0 )
				ifLocalVar678 = lerpResult673;
				else if( _RimMode < 1.0 )
				ifLocalVar678 = lerpResult672;
				#ifdef _USEFRESNEL_ON
				float3 staticSwitch770 = ifLocalVar678;
				#else
				float3 staticSwitch770 = temp_output_486_0;
				#endif
				float2 appendResult733 = (float2(_PanX , _PanY));
				float2 uv_Noise = i.ase_texcoord1.xy * _Noise_ST.xy + _Noise_ST.zw;
				float2 panner760 = ( 1.0 * _Time.y * ( float2( 0.5,0.5 ) * appendResult723 ) + i.ase_texcoord1.xy);
				float2 UV_Dist744 = (UnpackScaleNormal( tex2D( _Normal, panner760 ), ScaleNorm2 )).xy;
				#ifdef _NOISEDISTORT_ON
				float2 staticSwitch640 = ( uv_Noise + UV_Dist744 );
				#else
				float2 staticSwitch640 = uv_Noise;
				#endif
				float2 panner734 = ( 1.0 * _Time.y * appendResult733 + staticSwitch640);
				float grayscale590 = (tex2D( _Noise, panner734 ).rgb.r + tex2D( _Noise, panner734 ).rgb.g + tex2D( _Noise, panner734 ).rgb.b) / 3;
				float temp_output_611_0 = pow( ( _NoiseTexMultiply * grayscale590 ) , _NoiseTexPower );
				#ifdef _USEFRESNEL_ON
				float staticSwitch788 = temp_output_671_0;
				#else
				float staticSwitch788 = 1.0;
				#endif
				float rimOut681 = staticSwitch788;
				float rimfade802 = _Amount1;
				float lerpResult804 = lerp( temp_output_611_0 , ( rimOut681 * temp_output_611_0 ) , rimfade802);
				float temp_output_8_0_g562 = ( _IncludeFresnel == 1.0 ? lerpResult804 : temp_output_611_0 );
				float temp_output_9_0_g562 = _NoiseTime;
				float mulTime3_g562 = _Time.y * temp_output_9_0_g562;
				float temp_output_589_0 = ( ( sin( ( ( ( 2.0 * UNITY_PI ) * temp_output_8_0_g562 ) + mulTime3_g562 ) ) * 0.5 ) + 0.5 );
				float rimMask715 = pow( smoothstepResult697 , 2.0 );
				#ifdef _USEFRESNEL_ON
				float staticSwitch790 = ( rimMask715 * temp_output_589_0 );
				#else
				float staticSwitch790 = temp_output_589_0;
				#endif
				float3 temp_output_593_0 = ( staticSwitch790 * (_NoiseColor).rgb );
				float grayscale889 = (temp_output_486_0.r + temp_output_486_0.g + temp_output_486_0.b) / 3;
				float3 temp_cast_6 = (grayscale889).xxx;
				float2 appendResult729 = (float2(_PanX_E2 , _PanY_E2));
				float2 uv_Emission2 = i.ase_texcoord1.xy * _Emission2_ST.xy + _Emission2_ST.zw;
				float dotResult878 = dot( i.ase_normal , ase_worldViewDir );
				float lerpResult871 = lerp( 1.0 , dotResult878 , _ParallaxHeight2);
				float temp_output_874_0 = ( ( _ParallaxHeight2 * lerpResult871 ) + 1.0 );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				#if defined(_DIR_VERTEX)
				float3 staticSwitch883 = i.ase_tangent.xyz;
				#elif defined(_DIR_VIEW)
				float3 staticSwitch883 = ase_tanViewDir;
				#else
				float3 staticSwitch883 = i.ase_tangent.xyz;
				#endif
				float2 Offset864 = ( ( temp_output_874_0 - 1 ) * staticSwitch883.xy * _ParallaxScale ) + uv_Emission2;
				float2 Offset865 = ( ( temp_output_874_0 - 1 ) * ( staticSwitch883.xy / staticSwitch883.z ) * _ParallaxScale ) + uv_Emission2;
				#if defined(_TYPE_NORMAL)
				float2 staticSwitch861 = Offset864;
				#elif defined(_TYPE_PLANAR)
				float2 staticSwitch861 = Offset865;
				#else
				float2 staticSwitch861 = Offset864;
				#endif
				#ifdef _PARALLAX_ON
				float2 staticSwitch866 = staticSwitch861;
				#else
				float2 staticSwitch866 = uv_Emission2;
				#endif
				float2 panner730 = ( 1.0 * _Time.y * appendResult729 + staticSwitch866);
				float3 desaturateInitialColor631 = (tex2D( _Emission2, panner730 )).rgb;
				float desaturateDot631 = dot( desaturateInitialColor631, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar631 = lerp( desaturateInitialColor631, desaturateDot631.xxx, ( 1.0 - _Saturation ) );
				float3 temp_cast_7 = (_Emission2Power).xxx;
				float3 lerpResult598 = lerp( temp_cast_6 , max( ( pow( ( _Invert == 1.0 ? ( 1.0 - desaturateVar631 ) : desaturateVar631 ) , temp_cast_7 ) * (_Color2).rgb * _Emission2Multiply ) , float3( 0,0,0 ) ) , staticSwitch790);
				#ifdef _NOISETOTEXTURE_ON
				float3 staticSwitch606 = ( lerpResult598 * temp_output_486_0 );
				#else
				float3 staticSwitch606 = temp_output_486_0;
				#endif
				#if defined(_NOISEBLEND_MULTIPLY)
				float3 staticSwitch596 = ( temp_output_593_0 * staticSwitch606 );
				#elif defined(_NOISEBLEND_PREMULTIPLY)
				float3 staticSwitch596 = ( ( temp_output_593_0 * staticSwitch606 ) + staticSwitch606 );
				#elif defined(_NOISEBLEND_ADD)
				float3 staticSwitch596 = ( temp_output_593_0 + staticSwitch606 );
				#else
				float3 staticSwitch596 = ( temp_output_593_0 * staticSwitch606 );
				#endif
				float3 lerpResult623 = lerp( staticSwitch770 , staticSwitch596 , _NoiseFade);
				#ifdef _USENOISE_ON
				float3 staticSwitch607 = lerpResult623;
				#else
				float3 staticSwitch607 = temp_output_486_0;
				#endif
				float3 temp_cast_8 = (1.0).xxx;
				float2 uv_ParallaxMask = i.ase_texcoord1.xy * _ParallaxMask_ST.xy + _ParallaxMask_ST.zw;
				float2 uv_ParallaxTexture = i.ase_texcoord1.xy * _ParallaxTexture_ST.xy + _ParallaxTexture_ST.zw;
				float temp_output_61_0_g568 = ( _ParallaxHeight + 1.0 );
				ase_tanViewDir = Unity_SafeNormalize( ase_tanViewDir );
				float2 Offset29_g568 = ( ( temp_output_61_0_g568 - 1 ) * ase_tanViewDir.xy * _ParallaxScale ) + uv_ParallaxTexture;
				float2 Offset57_g568 = ( ( temp_output_61_0_g568 - 1 ) * ( ase_tanViewDir.xy / ase_tanViewDir.z ) * _ParallaxScale ) + uv_ParallaxTexture;
				float2 temp_output_59_0_g568 = ( (float)0 == 0.0 ? Offset29_g568 : Offset57_g568 );
				float4 tex2DNode41_g568 = tex2D( _ParallaxTexture, temp_output_59_0_g568 );
				#ifdef _USEPARALLAX_ON
				float3 staticSwitch643 = ( pow( tex2D( _ParallaxMask, uv_ParallaxMask ).r , _ParallaxMaskPower ) * (( tex2DNode41_g568 * _ParallaxColour * tex2DNode41_g568.a * _ParallaxColour.a )).rgb );
				#else
				float3 staticSwitch643 = temp_cast_8;
				#endif
				float3 temp_output_645_0 = ( staticSwitch607 * staticSwitch643 );
				float localbits18_g569 = ( 0.0 );
				float grayscale489 = (temp_output_480_0.r + temp_output_480_0.g + temp_output_480_0.b) / 3;
				#ifdef GREYTOALPHA_ON
				float staticSwitch498 = grayscale489;
				#else
				float staticSwitch498 = ( (temp_output_48_0).w * temp_output_774_0 );
				#endif
				float temp_output_3_0_g569 = pow( staticSwitch498 , _AlphaPower );
				float4 screenPos = i.ase_texcoord5;
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
				clip( staticSwitch498 - ( 1.0 - _Cutoff ));
				float4 appendResult481 = (float4(( _NoiseType == 1.0 ? ( staticSwitch607 + temp_output_645_0 ) : temp_output_645_0 ) , finalAlpha18_g569));
				
				
				finalColor = appendResult481;
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
Node;AmplifyShaderEditor.RangedFloatNode;722;-4107.261,-172.694;Inherit;False;Property;_PanY_N;PanY;48;0;Create;False;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;721;-4107.025,-246.694;Inherit;False;Property;_PanX_N;PanX;47;0;Create;False;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;723;-3973.025,-224.694;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;720;-3805.546,-105.4546;Inherit;False;0;747;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;719;-3488.541,-150.8916;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;758;-3483.239,-17.03827;Inherit;False;Property;ScaleNorm;Scale Normal;46;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;747;-4111.12,-441.5933;Inherit;True;Property;_Normal;Normal;45;0;Create;True;0;0;0;False;0;False;None;acea4ae30a1f5784e8095ee28af6783a;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode;649;-2843.481,-207.8207;Inherit;False;2199.725;764.5842;;34;678;674;673;675;672;670;667;689;663;691;660;715;802;681;788;671;792;814;665;666;658;659;661;657;655;662;656;654;653;650;652;815;816;859;Rim/Outline;1,0.141,0.141,1;0;0
Node;AmplifyShaderEditor.SamplerNode;749;-3296.566,-177.693;Inherit;True;Property;_TextureSample0;Texture Sample 0;60;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;693;-3008.304,-174.7233;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;652;-2799.161,-90.19717;Float;False;Property;_RimNormPow;Rim Normal Power;58;0;Create;False;0;0;0;False;0;False;0;0.05;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;650;-2807.035,81.00465;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;654;-2510.16,-143.6935;Inherit;False;3;0;FLOAT3;0.5,0.5,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;653;-2779.374,-10.71719;Half;False;Property;_RimNormal;Rim Normal;57;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;656;-2543.805,-9.093648;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;694;-3669.288,324.9958;Inherit;False;2117.057;387.6564;Edge Correction;18;705;701;706;718;697;698;699;822;833;829;831;841;842;851;852;855;856;821;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;706;-3619.73,533.399;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;841;-3328.006,317.2395;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;821;-3649.239,372.3519;Inherit;False;View Distance;-1;;560;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,0,17,0;1;9;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;705;-3399.454,497.6141;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;701;-3168.796,573.0638;Inherit;False;Property;_RimEdgeFix;Edge Compensate (dist pow limit);61;0;Create;False;0;0;0;False;0;False;-0.03,4,0.075;5,6,1.1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;856;-3091.783,480.7946;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.075;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;764;-3758.548,-348.2318;Inherit;False;2;2;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;831;-3274.916,371.0075;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;15;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;752;-3851.418,-548.8215;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;756;-3610.706,-514.782;Inherit;False;Property;ScaleNorm2;Normal Scale;26;0;Create;False;0;0;0;False;0;False;1;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;855;-2899.783,499.7946;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;760;-3609.716,-411.2145;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ClampOpNode;842;-3130.068,361.8105;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;852;-2765.615,495.3159;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;829;-2866.21,370.7665;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;751;-3405.661,-436.0493;Inherit;True;Property;_TextureSample1;Texture Sample 1;60;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;851;-2606.882,480.7811;Inherit;False;2;2;0;FLOAT;3;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;742;-3110.888,-435.0293;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;822;-2732.696,366.158;Inherit;False;Property;_DistanceScale;Distance Scale;59;0;Create;True;0;0;0;False;0;False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;699;-2508.661,370.9809;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;744;-2929.9,-435.5305;Inherit;False;UV_Dist;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;876;-4119.16,-1017.028;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;737;-2846.481,-1460.523;Inherit;False;0;588;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;745;-2802.271,-1340.056;Inherit;False;744;UV_Dist;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;833;-2216.782,571.4304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;816;-2361.871,78.45261;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;698;-2361.803,369.4228;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;877;-4129.606,-1158.167;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;815;-2213.572,10.3526;Inherit;False;Property;_FlipNormal;Flip Normal;60;0;Create;True;0;0;0;False;0;False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;878;-3913.949,-1054.056;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;662;-1532.161,399.3124;Half;False;Property;_Amount1;Rim Opacity;52;0;Create;False;0;0;0;False;0;False;0;2.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;697;-2151.001,362.4667;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.075;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;735;-2483.963,-1339.115;Inherit;False;Property;_PanX;PanX;24;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;657;-2214.501,119.4481;Float;False;Property;_Scale;Rim Scale;54;0;Create;False;0;0;0;False;0;False;0;0.475;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;736;-2483.961,-1262.734;Inherit;False;Property;_PanY;PanY;25;0;Create;False;0;0;0;False;0;False;0;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;862;-3885.97,-1139.311;Inherit;False;Property;_ParallaxHeight2;Parallax Height;43;0;Create;False;0;0;0;False;0;False;0.5;-1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;759;-2609.347,-1389.847;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;655;-2210.681,188.2169;Float;False;Property;_Power;Rim Power;53;0;Create;False;0;0;0;False;0;False;0;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;659;-2001.332,171.8857;Float;False;Property;_Min;Rim Min;55;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;733;-2355.726,-1344.543;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;658;-1873.831,174.8857;Float;False;Property;_Max;Rim Max;56;0;Create;False;0;0;0;False;0;False;0;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;640;-2459.729,-1448.447;Inherit;False;Property;_NoiseDistort;NoiseDistort;44;0;Create;True;0;0;0;False;2;space(10);Header(. Normals .);False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;871;-3694.94,-1076.903;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;859;-1480.064,324.5012;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;661;-1993.623,13.47363;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;734;-2148.726,-1344.543;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;872;-3557.945,-1132.481;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TangentVertexDataNode;868;-3653.991,-946.7914;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;665;-1760.871,15.08271;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;882;-3641.794,-801.7094;Inherit;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;814;-1572.687,175.9468;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;588;-1923.925,-1374.758;Inherit;True;Property;_Noise;Noise;18;0;Create;True;0;0;0;False;0;False;-1;None;faaad765f99ebf042892806a43c5acee;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;874;-3403.615,-1132.804;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;792;-1237.931,-164.1997;Inherit;False;Constant;_Float2;Float 2;67;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;863;-3498.697,-1025.293;Inherit;False;Property;_ParallaxScale;Parallax Scale;42;0;Create;True;0;0;0;False;0;False;1;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;671;-1536.751,-32.66736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;728;-3440.077,-1266.355;Inherit;False;0;597;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;883;-3424.794,-915.7094;Inherit;False;Property;_Dir;Dir;41;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Vertex;View;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;614;-1612.289,-1366.54;Inherit;False;Property;_NoiseTexMultiply;NoiseTex Multiply;20;0;Create;True;0;0;0;False;0;False;1;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;788;-1090.149,-152.7697;Inherit;False;Property;_MeshParticle;Mesh Particle;49;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;770;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ParallaxMappingNode;864;-3187.418,-1164.868;Inherit;False;Normal;4;0;FLOAT2;0.478,0.505;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ParallaxMappingNode;865;-3183.926,-1020.336;Inherit;False;Planar;4;0;FLOAT2;0.478,0.505;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TFHCGrayscale;590;-1615.567,-1281.399;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;681;-858.0303,-151.4268;Inherit;False;rimOut;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;769;-2736.255,-588.52;Inherit;False;0;773;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;861;-2829.952,-1098.55;Inherit;False;Property;_Type;Type;40;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Normal;Planar;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;612;-1415.153,-1202.351;Inherit;False;Property;_NoiseTexPower;NoiseTex Power;21;0;Create;True;0;0;0;False;0;False;1;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;-2699.335,-991.6151;Inherit;False;Property;_PanX_E2;PanX;36;0;Create;False;0;0;0;False;0;False;0;-0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;613;-1394.155,-1294.87;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;772;-2727.904,-471.409;Inherit;False;Property;_FlipSetting;Col Row Start Time;16;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;732;-2694.57,-917.6155;Inherit;False;Property;_PanY_E2;PanY;37;0;Create;False;0;0;0;False;0;False;0;-0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;611;-1231.353,-1237.25;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;802;-886.1619,424.6613;Inherit;False;rimfade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCFlipBookUVAnimation;787;-2506.7,-499.0361;Inherit;False;0;0;6;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;1;False;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;729;-2566.335,-1000.616;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;866;-2622.09,-1178.704;Inherit;False;Property;_Parallax;Parallax;39;0;Create;True;0;0;0;False;1;Space(5);False;0;0;1;True;;Toggle;2;Normal;Planar;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;730;-2406.699,-1149.148;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;796;-2309.551,-581.7932;Inherit;False;Property;_UseFlipbook;Use Flipbook;15;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;773;-2509.719,-756.3033;Inherit;True;Property;_Emission;Emission;10;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;50;-2184.823,-736.8018;Inherit;False;Property;_TexSaturation;Tex Saturation;12;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;682;-777.161,-1408.532;Float;False;Property;_IncludeFresnel;Include Fresnel;28;1;[ToggleUI];Create;True;0;2;Multiply;0;AddMultiply;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;51;-1903.168,-728.9781;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;632;-2096.094,-968.4151;Float;False;Property;_Saturation;Saturation;34;0;Create;True;0;0;0;False;0;False;2;0;-1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;718;-1685.934,461.7015;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;597;-2172.746,-1179.797;Inherit;True;Property;_Emission2;Emission2;30;0;Create;True;0;0;0;False;0;False;-1;None;941efa87814259346a7c242fde795503;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;26;-2064.285,-656.5904;Inherit;True;Property;_tex1;tex1;11;0;Create;True;0;0;0;False;0;False;-1;None;e0df874af196d854687b8f8e2e4113a0;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;774;-1743.279,-566.6714;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;683;-788.0605,-1313.058;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;715;-1288.029,481.6597;Inherit;False;rimMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;600;-1861.347,-1041.895;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;49;-1721.895,-657.6248;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;633;-1812.694,-961.9151;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;591;-924.5068,-1180.869;Inherit;False;Property;_NoiseTime;Noise Time;22;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;716;-593.6655,-1289.013;Inherit;False;715;rimMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;89;-1504.918,-426.381;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;813;-1542.487,-692.6609;Inherit;False;Property;_TexMultiply;Tex Multiply;13;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;589;-609.9875,-1213.131;Inherit;True;HypnoPi;-1;;562;f302050c500fe4841b663fe1fb2bac76;0;2;8;FLOAT;0;False;9;FLOAT;10;False;2;FLOAT;0;FLOAT;19
Node;AmplifyShaderEditor.ColorNode;47;-1748.261,-491.5611;Inherit;False;Property;_Color;Colour;11;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;0.5019608,0.1756863,0.2028759,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;90;-1543.766,-602.3112;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DesaturateOpNode;631;-1672.294,-1007.415;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;617;-1512.621,-1036.016;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;717;-415.6656,-1267.013;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;615;-1503.528,-1115.176;Float;False;Property;_Invert;Invert;31;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-1329.5,-516.8241;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;487;-1022.166,-581.8351;Inherit;False;Property;_TexPower;Tex Power;14;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;620;-1139.834,-818.0883;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;480;-1065.549,-508.3803;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;798;-242.414,-1059.868;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;486;-812.5333,-624.172;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;660;-2007.962,-159.1684;Float;False;Property;_RimOutlineColour;Rim/Outline Colour;50;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.3333314,0.164704,0.1815667,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;690;-618.5754,-425.6441;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;592;-945.4627,-1099.122;Inherit;False;Property;_NoiseColor;Noise Colour;19;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;797;-515.3945,-874.7739;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;594;-750.8117,-1101.436;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;691;-1514.35,-121.1442;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;667;-1538.849,93.12362;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;670;-1292.927,243.1731;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;673;-1139.051,137.0075;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;601;14.60378,-603.8536;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;602;64.12619,-823.1835;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;674;-1136.65,262.2112;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;604;71.80701,-703.9601;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;625;404.7671,-622.3395;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;478;-1183.549,-419.3799;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;626;244.0671,-595.2397;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;795;-1195.363,-360.0602;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;879;171.0854,-35.5219;Inherit;False;Aria Parallax Include;63;;568;972a5d25f3151a4479be2dcc9b9e75fa;2,56,0,55,0;1;60;INT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;489;-831.9346,-308.3423;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;644;242.537,-117.8389;Inherit;False;Constant;_Float0;Float 0;38;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;768;-1002.338,-414.7073;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;643;440.4919,-68.55001;Inherit;False;Property;_UseParallax;Use Parallax;62;0;Create;True;0;0;0;False;1;Header(. Parallax);False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;498;-398.3762,-411.1201;Inherit;False;Property;_AlphaGrey;Alpha From Greyscale;9;0;Create;False;0;0;0;False;0;False;0;0;0;True;GREYTOALPHA_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;476;-355.8252,-298.0928;Inherit;False;Property;_AlphaPower;Alpha Power;7;0;Create;True;0;0;0;True;1;Space(10);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;645;721.8615,-348.6104;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;475;-168.842,-314.5241;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;484;-213.4594,-224.8042;Inherit;False;Property;_A2CSampleBias;A2C Sample Bias;6;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-335.8377,-154.7361;Inherit;False;Property;_Cutoff;Alpha Cutoff;8;0;Create;False;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;646;801.5004,-493.8285;Float;False;Property;_NoiseType;Noise Type;38;2;[ToggleUI];[Enum];Create;True;0;2;Multiply;0;AddMultiply;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;648;843.0051,-418.5676;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;483;25.9855,-304.9618;Inherit;False;Custom A2C;4;;569;445f8ff28d1a9f44092743e0eb84a83d;0;3;19;FLOAT;1;False;3;FLOAT;1;False;16;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;479;-174.7301,-152.4754;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;24;1420.882,-1131.327;Inherit;False;670.9946;746.3742;custom properties;9;34;30;32;41;36;33;39;35;40;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClipNode;471;322.6442,-298.806;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0.005;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;647;983.0051,-425.5676;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;35;1764.175,-924.4186;Inherit;False;Property;_StencilFail;StencilFail;77;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;1437.848,-983.2374;Half;False;Property;_ReadMask;ReadMask (non-zero);74;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;1102.752,-886.4843;Float;False;Property;_ZTestMode;ZTestMode (LEqual);3;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;1718.884,-686.5784;Inherit;False;Property;_DstBlend;Destination Blend (OneMinusSrcAlpha);71;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;39;1767.887,-996.7606;Inherit;False;Property;_StencilOp;StencilOp;76;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;32;1763.175,-849.4187;Inherit;False;Property;_StencilZFail;StencilZFail;78;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;33;1743.174,-1069.419;Inherit;False;Property;_StencilComparison;Stencil Comparison;75;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;481;1369.319,-322.7293;Inherit;False;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;34;1444.028,-1069.227;Half;False;Property;_StencilRef;Stencil ID;72;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;1144.305,-797.1596;Float;False;Property;_Offset;Offset;2;0;Create;True;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;-300;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;1436.848,-899.6605;Half;False;Property;_WriteMask;WriteMask (non-zero);73;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;30;1456.336,-688.1484;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);70;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;38;803.8412,-941.88;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;1105.823,-974.548;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);1;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;666;-1380.405,330.0662;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;482;1534.152,-323.4542;Float;False;True;-1;2;ASEMaterialInspector;100;19;.GenesisAria/Particle Effect Transparent;9367a06897b8873449e3ea0a525cc048;True;Unlit;0;0;Unlit;2;True;True;1;0;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;255;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;7;True;_StencilComparison;1;True;_StencilOp;1;True;_StencilFail;1;True;_StencilZFail;7;False;;1;False;;1;False;;1;False;;True;True;1;True;_ZWriteMode;True;3;True;_ZTestMode;True;True;0;True;_Offset;0;False;;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;7;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;True;7;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;637827977615680823;0;1;True;False;;False;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;885;-382.884,-832.4792;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;790;-274.3862,-1173.608;Inherit;False;Property;_MeshParticle;Mesh Particle;49;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;770;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;803;-1163.962,-1455.857;Inherit;False;802;rimfade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;684;-1313.409,-1390.402;Inherit;False;681;rimOut;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;804;-960.9622,-1398.857;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;642;-1136.15,-1379.267;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;689;-1516.95,-117.2443;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;678;-933.6572,78.30175;Inherit;True;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;675;-937.8282,-1.510288;Half;False;Property;_RimMode;Rim Mode;51;1;[Enum];Create;True;0;3;Blend_Lerp;0;Multiply;1;AddSubtract;2;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;672;-1141.125,-37.4224;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;663;-1766.087,-158.8294;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;607;448.6526,-441.1416;Inherit;False;Property;_UseNoise;Use Noise;17;0;Create;True;0;0;0;False;2;Space(5);Header(. Noise .);False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;623;216.1479,-545.6929;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;596;204.7171,-726.8105;Inherit;False;Property;_NoiseBlend;Noise Blend;23;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Multiply;PreMultiply;Add;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;770;-505.4108,-523.4739;Inherit;False;Property;_UseFresnel;UseFresnel;49;0;Create;True;0;0;0;False;1;Header(. Fresnel);False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;627;-161.9173,-468.5434;Inherit;False;Property;_NoiseFade;Noise Fade;27;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;603;-45.84311,-707.3851;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;593;-148.3645,-969.5139;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;616;-1348.717,-1084.923;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;884;-736.3314,-832.8286;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;635;-1148.599,-746.4803;Float;False;Property;_Emission2Multiply;Emission2 Multiply;32;0;Create;True;0;0;0;False;0;False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;618;-1381.27,-814.3883;Inherit;False;Property;_Color2;Colour2;35;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;888;-1110.372,-958.5082;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;887;-1434.053,-919.6821;Float;False;Property;_Emission2Power;Emission2 Power;33;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;619;-886.9348,-835.4819;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;598;-530.5532,-842.4515;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;606;-361.251,-679.77;Inherit;False;Property;_NoisetoTexture;Noise to Texture;29;0;Create;True;0;0;0;False;0;False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;889;-738.2053,-727.9119;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
WireConnection;723;0;721;0
WireConnection;723;1;722;0
WireConnection;719;0;720;0
WireConnection;719;2;723;0
WireConnection;749;0;747;0
WireConnection;749;1;719;0
WireConnection;749;5;758;0
WireConnection;693;0;749;0
WireConnection;654;0;650;0
WireConnection;654;1;693;0
WireConnection;654;2;652;0
WireConnection;656;0;653;0
WireConnection;656;3;654;0
WireConnection;656;4;650;0
WireConnection;841;0;656;0
WireConnection;705;0;706;0
WireConnection;705;1;841;0
WireConnection;856;0;705;0
WireConnection;764;1;723;0
WireConnection;831;0;821;0
WireConnection;855;0;856;0
WireConnection;855;1;701;1
WireConnection;760;0;752;0
WireConnection;760;2;764;0
WireConnection;842;0;831;0
WireConnection;852;0;842;0
WireConnection;829;0;842;0
WireConnection;829;1;855;0
WireConnection;751;0;747;0
WireConnection;751;1;760;0
WireConnection;751;5;756;0
WireConnection;851;0;701;2
WireConnection;851;1;852;0
WireConnection;742;0;751;0
WireConnection;822;0;829;0
WireConnection;699;0;822;0
WireConnection;699;1;851;0
WireConnection;744;0;742;0
WireConnection;833;0;701;3
WireConnection;816;0;656;0
WireConnection;698;0;699;0
WireConnection;815;1;656;0
WireConnection;815;0;816;0
WireConnection;878;0;877;0
WireConnection;878;1;876;0
WireConnection;697;0;698;0
WireConnection;697;2;833;0
WireConnection;759;0;737;0
WireConnection;759;1;745;0
WireConnection;733;0;735;0
WireConnection;733;1;736;0
WireConnection;640;1;737;0
WireConnection;640;0;759;0
WireConnection;871;1;878;0
WireConnection;871;2;862;0
WireConnection;859;0;662;0
WireConnection;859;1;697;0
WireConnection;661;0;815;0
WireConnection;661;2;657;0
WireConnection;661;3;655;0
WireConnection;734;0;640;0
WireConnection;734;2;733;0
WireConnection;872;0;862;0
WireConnection;872;1;871;0
WireConnection;665;0;661;0
WireConnection;665;1;659;0
WireConnection;665;2;658;0
WireConnection;814;0;859;0
WireConnection;588;1;734;0
WireConnection;874;0;872;0
WireConnection;671;0;665;0
WireConnection;671;1;814;0
WireConnection;883;1;868;0
WireConnection;883;0;882;0
WireConnection;788;1;792;0
WireConnection;788;0;671;0
WireConnection;864;0;728;0
WireConnection;864;1;874;0
WireConnection;864;2;863;0
WireConnection;864;3;883;0
WireConnection;865;0;728;0
WireConnection;865;1;874;0
WireConnection;865;2;863;0
WireConnection;865;3;883;0
WireConnection;590;0;588;0
WireConnection;681;0;788;0
WireConnection;861;1;864;0
WireConnection;861;0;865;0
WireConnection;613;0;614;0
WireConnection;613;1;590;0
WireConnection;611;0;613;0
WireConnection;611;1;612;0
WireConnection;802;0;662;0
WireConnection;787;0;769;0
WireConnection;787;1;772;1
WireConnection;787;2;772;2
WireConnection;787;3;772;4
WireConnection;787;4;772;3
WireConnection;729;0;731;0
WireConnection;729;1;732;0
WireConnection;866;1;728;0
WireConnection;866;0;861;0
WireConnection;730;0;866;0
WireConnection;730;2;729;0
WireConnection;796;1;769;0
WireConnection;796;0;787;0
WireConnection;51;0;50;0
WireConnection;718;0;697;0
WireConnection;597;1;730;0
WireConnection;26;0;773;0
WireConnection;26;1;796;0
WireConnection;774;0;26;0
WireConnection;683;0;682;0
WireConnection;683;2;804;0
WireConnection;683;3;611;0
WireConnection;715;0;718;0
WireConnection;600;0;597;0
WireConnection;49;0;26;0
WireConnection;49;1;51;0
WireConnection;633;0;632;0
WireConnection;589;8;683;0
WireConnection;589;9;591;0
WireConnection;90;0;49;0
WireConnection;90;3;774;0
WireConnection;631;0;600;0
WireConnection;631;1;633;0
WireConnection;617;0;631;0
WireConnection;717;0;716;0
WireConnection;717;1;589;0
WireConnection;48;0;90;0
WireConnection;48;1;47;0
WireConnection;48;2;89;0
WireConnection;48;3;813;0
WireConnection;620;0;618;0
WireConnection;480;0;48;0
WireConnection;798;0;790;0
WireConnection;486;0;480;0
WireConnection;486;1;487;0
WireConnection;690;0;486;0
WireConnection;797;0;798;0
WireConnection;594;0;592;0
WireConnection;691;0;690;0
WireConnection;667;0;663;0
WireConnection;667;1;665;0
WireConnection;670;0;667;0
WireConnection;670;1;689;0
WireConnection;673;0;689;0
WireConnection;673;1;667;0
WireConnection;673;2;671;0
WireConnection;601;0;593;0
WireConnection;601;1;606;0
WireConnection;602;0;593;0
WireConnection;602;1;606;0
WireConnection;674;0;689;0
WireConnection;674;1;670;0
WireConnection;674;2;859;0
WireConnection;604;0;603;0
WireConnection;604;1;606;0
WireConnection;625;0;596;0
WireConnection;478;0;48;0
WireConnection;626;0;625;0
WireConnection;795;0;774;0
WireConnection;489;0;480;0
WireConnection;768;0;478;0
WireConnection;768;1;795;0
WireConnection;643;1;644;0
WireConnection;643;0;879;0
WireConnection;498;1;768;0
WireConnection;498;0;489;0
WireConnection;645;0;607;0
WireConnection;645;1;643;0
WireConnection;475;0;498;0
WireConnection;475;1;476;0
WireConnection;648;0;607;0
WireConnection;648;1;645;0
WireConnection;483;3;475;0
WireConnection;483;16;484;0
WireConnection;479;0;31;0
WireConnection;471;0;483;0
WireConnection;471;1;498;0
WireConnection;471;2;479;0
WireConnection;647;0;646;0
WireConnection;647;2;648;0
WireConnection;647;3;645;0
WireConnection;481;0;647;0
WireConnection;481;3;471;0
WireConnection;666;0;697;0
WireConnection;666;1;662;0
WireConnection;482;0;481;0
WireConnection;885;0;598;0
WireConnection;885;1;486;0
WireConnection;790;1;589;0
WireConnection;790;0;717;0
WireConnection;804;0;611;0
WireConnection;804;1;642;0
WireConnection;804;2;803;0
WireConnection;642;0;684;0
WireConnection;642;1;611;0
WireConnection;689;0;691;0
WireConnection;678;0;675;0
WireConnection;678;2;674;0
WireConnection;678;3;673;0
WireConnection;678;4;672;0
WireConnection;672;0;689;0
WireConnection;672;1;667;0
WireConnection;672;2;671;0
WireConnection;663;0;660;0
WireConnection;607;1;486;0
WireConnection;607;0;623;0
WireConnection;623;0;770;0
WireConnection;623;1;626;0
WireConnection;623;2;627;0
WireConnection;596;1;602;0
WireConnection;596;0;604;0
WireConnection;596;2;601;0
WireConnection;770;1;486;0
WireConnection;770;0;678;0
WireConnection;603;0;593;0
WireConnection;603;1;606;0
WireConnection;593;0;790;0
WireConnection;593;1;594;0
WireConnection;616;0;615;0
WireConnection;616;2;617;0
WireConnection;616;3;631;0
WireConnection;884;0;619;0
WireConnection;888;0;616;0
WireConnection;888;1;887;0
WireConnection;619;0;888;0
WireConnection;619;1;620;0
WireConnection;619;2;635;0
WireConnection;598;0;889;0
WireConnection;598;1;884;0
WireConnection;598;2;797;0
WireConnection;606;1;486;0
WireConnection;606;0;885;0
WireConnection;889;0;486;0
ASEEND*/
//CHKSM=E2AA029A86CFC7E1CAE18954E246EA8F1BC915A3