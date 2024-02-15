// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Screen psychedelic"
{
	Properties
	{
		_DistanceOffset("Distance Offset", Range( 0 , 100)) = 0
		_ScaleX("Scale X", Float) = 1
		_ScaleY("Scale Y", Float) = 1
		_MainTex("MainTex", 2D) = "white" {}
		_Colour("Colour", Color) = (1,1,1,1)
		_Saturation("Saturation", Float) = 1
		_TexPower("Tex Power", Float) = 1
		_TexRotate("Tex Rotate", Float) = 1
		_Multiply("Multiply", Float) = 1
		_GrabPower("Grab Power", Float) = 0
		_Normal("Normal", 2D) = "white" {}
		_NormRotate("Norm Rotate", Float) = 1
		_NormalPower("Normal Power", Float) = 1
		_HueCycleNorm("Hue Cycle Norm", Float) = 1
		_GreyCycleNorm("Grey Cycle Norm", Float) = 1
		_CycleTweak("Cycle Tweak", Vector) = (0,0,0,0)
		_EffectFade("Effect Fade", Float) = 0.5
		_HDRClamp("HDR Clamp", Float) = 3
		_DarknessTweak("Darkness Tweak", Vector) = (5,2,2,2)
		[Toggle(_NOISETOTEX_ON)] _NoisetoTex("Noise to Tex", Float) = 0
		_NoisePower("Noise Power", Float) = 1
		_NoiseMultiply("Noise Multiply", Float) = 1
		_DistortPower("Distort Power", Float) = 0.1
		_PulseRate("Pulse Rate", Float) = 0.25
		_PulseStrength("Pulse Strength", Float) = 0
		_PulseOrigin("Pulse Origin", Range( 0 , 0.5)) = 0.5
		_DepthPower("Depth Power", Float) = 0.5
		_DepthBias("Depth Bias", Float) = 50
		_DepthMultiply("Depth Multiply", Float) = 50
		[Header(default required for transparent camera)][Enum(NoUpdateAlpha,14,Default,15)]_ColorMask("Alpha Render (Colour Mask)", Float) = 15
		[ToggleUI]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 8
		_Opacity("Opacity", Float) = 1
		[Space(5)][Header(Stencil)]_StencilRef("Stencil ID", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		_WriteMask("WriteMask (non-zero)", Float) = 255
		_ReadMask("ReadMask (non-zero)", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Debug  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (OneMinusSrcAlpha)", Float) = 10
		[Enum(UnityEngine.Rendering.BlendOp)]_BlendOp("BlendOp", Float) = 1

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" "Queue"="Overlay+28767" }
	LOD 100

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		BlendOp [_BlendOp]
		AlphaToMask Off
		Cull [_Culling]
		ColorMask [_ColorMask]
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
		
		GrabPass{ "_TrippyGrab2" }

		Pass
		{
			Name "Unlit"

			CGPROGRAM

			#define ASE_ABSOLUTE_VERTEX_POS 1
			#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
			#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
			#else
			#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
			#endif


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _NOISETOTEX_ON


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _DstBlend;
			uniform float _SrcBlend;
			uniform int _StencilComparison;
			uniform half _StencilRef;
			uniform int _StencilZFail;
			uniform int _StencilFail;
			uniform half _ReadMask;
			uniform int _StencilOp;
			uniform half _WriteMask;
			uniform float _ZWriteMode;
			uniform int _Culling;
			uniform float _ZTestMode;
			uniform half _ColorMask;
			uniform float _BlendOp;
			uniform float _ScaleX;
			uniform float _ScaleY;
			uniform float _DistanceOffset;
			ASE_DECLARE_SCREENSPACE_TEXTURE( _TrippyGrab2 )
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform half _NormRotate;
			uniform half _HueCycleNorm;
			uniform half _GreyCycleNorm;
			uniform float _PulseOrigin;
			uniform float _PulseRate;
			uniform float _PulseStrength;
			uniform float _DistortPower;
			uniform float _HDRClamp;
			uniform float _Multiply;
			uniform float4 _Colour;
			uniform sampler2D _MainTex;
			UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
			uniform float _DepthMultiply;
			uniform float _DepthPower;
			uniform float _DepthBias;
			uniform float _NormalPower;
			uniform float4 _MainTex_ST;
			uniform float _NoisePower;
			uniform float _NoiseMultiply;
			uniform half _TexRotate;
			uniform float2 _CycleTweak;
			uniform float _TexPower;
			uniform float _Saturation;
			uniform float _GrabPower;
			uniform float4 _DarknessTweak;
			uniform float _EffectFade;
			uniform float _Opacity;
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

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float temp_output_21_0_g7060 = min( v.vertex.xyz.z , ( _ProjectionParams.y * -1.0 ) );
				float3 appendResult29_g7060 = (float3(( ( _ScaleX + 2.0 ) * v.vertex.xyz.x * temp_output_21_0_g7060 ) , ( ( _ScaleY + 0.5 ) * v.vertex.xyz.y * temp_output_21_0_g7060 ) , ( ( temp_output_21_0_g7060 * 1.01 ) + -_DistanceOffset )));
				float3 viewToObj30_g7060 = mul( unity_WorldToObject, mul( UNITY_MATRIX_I_V , float4( appendResult29_g7060, 1 ) ) ).xyz;
				
				o.ase_texcoord1 = v.vertex;
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = viewToObj30_g7060;
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
				float temp_output_21_0_g7060 = min( i.ase_texcoord1.xyz.z , ( _ProjectionParams.y * -1.0 ) );
				float3 appendResult29_g7060 = (float3(( ( _ScaleX + 2.0 ) * i.ase_texcoord1.xyz.x * temp_output_21_0_g7060 ) , ( ( _ScaleY + 0.5 ) * i.ase_texcoord1.xyz.y * temp_output_21_0_g7060 ) , ( ( temp_output_21_0_g7060 * 1.01 ) + -_DistanceOffset )));
				float3 viewToObj30_g7060 = mul( unity_WorldToObject, mul( UNITY_MATRIX_I_V , float4( appendResult29_g7060, 1 ) ) ).xyz;
				float4 unityObjectToClipPos36_g7060 = UnityObjectToClipPos( viewToObj30_g7060 );
				float4 computeGrabScreenPos37_g7060 = ComputeGrabScreenPos( ( ( unityObjectToClipPos36_g7060 + float4( 0.564,-0.288,0,0 ) ) * float4( 0.879,1.72,1,1 ) ) );
				float2 break9_g7060 = (computeGrabScreenPos37_g7060).xy;
				float temp_output_16_0_g7060 = ( ( ( ( ( _ScreenParams.z / _ScreenParams.w ) * break9_g7060.x ) + -0.5 ) * 2.25 ) + 0.5 );
				float temp_output_12_0_g7060 = ( ( ( break9_g7060.y + -0.5 ) * 1.15 ) + 0.5 );
				float2 appendResult47_g7060 = (float2(temp_output_16_0_g7060 , temp_output_12_0_g7060));
				float2 uv_Normal = i.ase_texcoord2.xy * _Normal_ST.xy + _Normal_ST.zw;
				float2 temp_output_1073_0 = ( ( ( uv_Normal + float2( -0.5,-0.5 ) ) * float2( 1.5,1.5 ) ) + float2( 0.5,0.4 ) );
				float mulTime816 = _Time.y * _NormRotate;
				float cos808 = cos( mulTime816 );
				float sin808 = sin( mulTime816 );
				float2 rotator808 = mul( temp_output_1073_0 - float2( 0.5,0.45 ) , float2x2( cos808 , -sin808 , sin808 , cos808 )) + float2( 0.5,0.45 );
				float cos807 = cos( -mulTime816 );
				float sin807 = sin( -mulTime816 );
				float2 rotator807 = mul( temp_output_1073_0 - float2( 0.45,0.4 ) , float2x2( cos807 , -sin807 , sin807 , cos807 )) + float2( 0.45,0.4 );
				float3 hsvTorgb4_g7041 = RGBToHSV( float4( ( pow( (tex2D( _Normal, rotator808 )).rgb , 0.75 ) * float3( 1.5,1.5,1.5 ) * pow( (tex2D( _Normal, rotator807 )).rgb , 0.75 ) ) , 0.0 ).rgb );
				float mulTime819 = _Time.y * _HueCycleNorm;
				float mulTime826 = _Time.y * _GreyCycleNorm;
				float temp_output_1063_0 = ( ( sin( mulTime826 ) * 0.5 ) + 0.5 );
				float3 hsvTorgb8_g7041 = HSVToRGB( float3(( hsvTorgb4_g7041.x + mulTime819 ),( hsvTorgb4_g7041.y + 0.0 ),( hsvTorgb4_g7041.z + temp_output_1063_0 )) );
				float2 appendResult1126 = (float2(-1.0 , -_PulseOrigin));
				float temp_output_8_0_g7042 = ( distance( ( ( uv_Normal * float2( 2,1 ) ) + appendResult1126 ) , float2( 0,0 ) ) * 1.0 );
				float mulTime1064 = _Time.y * _PulseRate;
				float temp_output_9_0_g7042 = -( mulTime1064 * 0.001 );
				float mulTime3_g7042 = _Time.y * temp_output_9_0_g7042;
				float saferPower909 = abs( ( ( sin( ( ( ( 2.0 * UNITY_PI ) * temp_output_8_0_g7042 ) + mulTime3_g7042 ) ) * 0.5 ) + 0.5 ) );
				float3 temp_cast_3 = (( ( pow( saferPower909 , 3.0 ) + -0.4 ) * _PulseStrength )).xxx;
				float3 temp_cast_4 = (_DistortPower).xxx;
				float3 noise793 = pow( pow( saturate( hsvTorgb8_g7041 ) , temp_cast_3 ) , temp_cast_4 );
				float4 screenColor699 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_TrippyGrab2,( float3( appendResult47_g7060 ,  0.0 ) * noise793 ).xy);
				float3 temp_output_704_0 = ( ( (screenColor699).rgb * float3( 2,2,2 ) ) + float3( 0.0001,0.0001,0.0001 ) );
				float3 temp_cast_6 = (_HDRClamp).xxx;
				float temp_output_21_0_g7059 = min( i.ase_texcoord1.xyz.z , ( _ProjectionParams.y * -1.0 ) );
				float3 appendResult29_g7059 = (float3(( ( _ScaleX + 2.0 ) * i.ase_texcoord1.xyz.x * temp_output_21_0_g7059 ) , ( ( _ScaleY + 0.5 ) * i.ase_texcoord1.xyz.y * temp_output_21_0_g7059 ) , ( ( temp_output_21_0_g7059 * 1.01 ) + -_DistanceOffset )));
				float3 viewToObj30_g7059 = mul( unity_WorldToObject, mul( UNITY_MATRIX_I_V , float4( appendResult29_g7059, 1 ) ) ).xyz;
				float4 unityObjectToClipPos36_g7059 = UnityObjectToClipPos( viewToObj30_g7059 );
				float4 computeGrabScreenPos37_g7059 = ComputeGrabScreenPos( ( ( unityObjectToClipPos36_g7059 + float4( 0.564,-0.288,0,0 ) ) * float4( 0.879,1.72,1,1 ) ) );
				float2 break9_g7059 = (computeGrabScreenPos37_g7059).xy;
				float temp_output_16_0_g7059 = ( ( ( ( ( _ScreenParams.z / _ScreenParams.w ) * break9_g7059.x ) + -0.5 ) * 2.25 ) + 0.5 );
				float temp_output_12_0_g7059 = ( ( ( break9_g7059.y + -0.5 ) * 1.15 ) + 0.5 );
				float2 appendResult47_g7059 = (float2(temp_output_16_0_g7059 , temp_output_12_0_g7059));
				float saferPower780 = abs( ( ( tex2D( _CameraDepthTexture, ( float3( appendResult47_g7059 ,  0.0 ) * noise793 ).xy ).r + 0.001 ) * _DepthMultiply ) );
				float3 temp_cast_9 = (_NormalPower).xxx;
				float2 uv_MainTex = i.ase_texcoord2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 temp_cast_10 = (_NoisePower).xx;
				#ifdef _NOISETOTEX_ON
				float2 staticSwitch797 = ( ( ( ( pow( (noise793).xy , temp_cast_10 ) * uv_MainTex ) + float2( -0.5,-0.5 ) ) * _NoiseMultiply ) + float2( 0.5,0.5 ) );
				#else
				float2 staticSwitch797 = uv_MainTex;
				#endif
				float2 break9_g7058 = staticSwitch797;
				float temp_output_16_0_g7058 = ( ( ( ( ( _ScreenParams.z / _ScreenParams.w ) * break9_g7058.x ) + -0.5 ) * 2.25 ) + 0.5 );
				float temp_output_12_0_g7058 = ( ( ( break9_g7058.y + -0.5 ) * 1.15 ) + 0.5 );
				float2 appendResult23_g7058 = (float2(temp_output_16_0_g7058 , ( 1.0 - temp_output_12_0_g7058 )));
				float3 temp_output_859_0 = ( ( pow( saferPower780 , _DepthPower ) + _DepthBias ) * pow( noise793 , temp_cast_9 ) * float3( ( appendResult23_g7058 + float2( -0.5,-0.5 ) ) ,  0.0 ) );
				float mulTime619 = _Time.y * _TexRotate;
				float cos634 = cos( mulTime619 );
				float sin634 = sin( mulTime619 );
				float2 rotator634 = mul( temp_output_859_0.xy - float2( 0,0 ) , float2x2( cos634 , -sin634 , sin634 , cos634 )) + float2( 0,0 );
				float cos632 = cos( -mulTime619 );
				float sin632 = sin( -mulTime619 );
				float2 rotator632 = mul( temp_output_859_0.xy - float2( 0,0 ) , float2x2( cos632 , -sin632 , sin632 , cos632 )) + float2( 0,0 );
				float cos627 = cos( ( 1.0 - mulTime619 ) );
				float sin627 = sin( ( 1.0 - mulTime619 ) );
				float2 rotator627 = mul( ( temp_output_859_0 + float3( -0.5,-0.5,0 ) ).xy - float2( -0.5,-0.5 ) , float2x2( cos627 , -sin627 , sin627 , cos627 )) + float2( -0.5,-0.5 );
				float2 break1056 = ( rotator627 * float2( 5,5 ) );
				float2 appendResult1057 = (float2(break1056.x , ( 1.0 - break1056.y )));
				float3 temp_output_678_0 = ( pow( ( (tex2D( _MainTex, ( rotator634 * float2( 3,3 ) ) )).rgb + float3( 1,1,1 ) ) , 3.0 ) * pow( ( (tex2D( _MainTex, ( rotator632 * float2( 2,2 ) ) )).rgb + float3( 0.05,0.05,0.05 ) ) , 1.0 ) * ( pow( ( (tex2D( _MainTex, appendResult1057 )).rgb * float3( 1,1,1 ) ) , 1.5 ) + float3( 0.05,0.05,0.05 ) ) );
				float3 hsvTorgb4_g6981 = RGBToHSV( float4( temp_output_678_0 , 0.0 ).rgb );
				float grayscale942 = (temp_output_678_0.r + temp_output_678_0.g + temp_output_678_0.b) / 3;
				float temp_output_8_0_g7040 = pow( ( grayscale942 * _CycleTweak.x ) , _CycleTweak.y );
				float temp_output_9_0_g7040 = ( 0.25 * temp_output_1063_0 );
				float mulTime3_g7040 = _Time.y * temp_output_9_0_g7040;
				float3 hsvTorgb8_g6981 = HSVToRGB( float3(( hsvTorgb4_g6981.x + mulTime819 ),( hsvTorgb4_g6981.y + 0.0 ),( hsvTorgb4_g6981.z + ( ( ( sin( ( ( ( 2.0 * UNITY_PI ) * temp_output_8_0_g7040 ) + mulTime3_g7040 ) ) * 0.5 ) + 0.5 ) * 0.025 ) )) );
				float3 temp_cast_19 = (_TexPower).xxx;
				float temp_output_956_0 = ( 1.0 - _Saturation );
				float3 desaturateInitialColor954 = pow( saturate( hsvTorgb8_g6981 ) , temp_cast_19 );
				float desaturateDot954 = dot( desaturateInitialColor954, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar954 = lerp( desaturateInitialColor954, desaturateDot954.xxx, temp_output_956_0 );
				float3 temp_output_684_0 = ( ( _Multiply * (_Colour).rgb ) * float3( 5,5,5 ) * desaturateVar954 );
				float3 saferPower710 = abs( min( temp_output_704_0 , float3( 1,1,1 ) ) );
				float3 temp_cast_20 = (_GrabPower).xxx;
				float3 temp_output_721_0 = ( pow( temp_output_684_0 , 2.0 ) * float3( 10,10,10 ) * max( pow( saferPower710 , temp_cast_20 ) , float3( 0,0,0 ) ) );
				float3 saferPower1104 = abs( temp_output_684_0 );
				float3 temp_cast_21 = (_DarknessTweak.x).xxx;
				float3 appendResult1110 = (float3(_DarknessTweak.y , _DarknessTweak.z , _DarknessTweak.w));
				float3 saferPower1112 = abs( ( 1.0 - ( pow( saferPower1104 , temp_cast_21 ) * appendResult1110 ) ) );
				float3 temp_output_1112_0 = pow( saferPower1112 , 2.0 );
				float grayscale1130 = (temp_output_1112_0.r + temp_output_1112_0.g + temp_output_1112_0.b) / 3;
				float3 lerpResult1123 = lerp( ( temp_output_721_0 / grayscale1130 ) , ( temp_output_721_0 - temp_output_1112_0 ) , float3( 0.9,0.9,0.9 ));
				float3 desaturateInitialColor1129 = lerpResult1123;
				float desaturateDot1129 = dot( desaturateInitialColor1129, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1129 = lerp( desaturateInitialColor1129, desaturateDot1129.xxx, temp_output_956_0 );
				float3 lerpResult722 = lerp( min( temp_output_704_0 , temp_cast_6 ) , desaturateVar1129 , _EffectFade);
				clip( _Opacity - 0.001);
				float4 appendResult728 = (float4((lerpResult722).xyz , 0.0));
				
				
				finalColor = appendResult728;
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
Node;AmplifyShaderEditor.CommentaryNode;128;412.2488,-558.8584;Inherit;False;670.9946;746.3742;custom properties;10;140;139;138;137;136;135;134;131;130;129;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;129;710.251,-114.1098;Inherit;False;Property;_DstBlend;Destination Blend (OneMinusSrcAlpha);43;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;130;447.7028,-115.6798;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);42;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Debug  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;134;734.5409,-496.9505;Inherit;False;Property;_StencilComparison;Stencil Comparison;39;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;135;435.3948,-496.7585;Half;False;Property;_StencilRef;Stencil ID;35;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;136;754.542,-276.9501;Inherit;False;Property;_StencilZFail;StencilZFail;41;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;137;755.542,-351.9501;Inherit;False;Property;_StencilFail;StencilFail;40;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;138;429.2149,-410.7691;Half;False;Property;_ReadMask;ReadMask (non-zero);38;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;139;759.2539,-424.2921;Inherit;False;Property;_StencilOp;StencilOp;36;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;140;428.2149,-327.192;Half;False;Property;_WriteMask;WriteMask (non-zero);37;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;142;-39.59565,-647.5538;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);31;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;141;-312.978,-614.8859;Inherit;False;Property;_Culling;Culling (off is doublesided);32;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;1;2;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;143;-42.66676,-559.4901;Float;False;Property;_ZTestMode;ZTestMode (LEqual);33;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;8;8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;144;51.39487,-452.7377;Half;False;Property;_ColorMask;Alpha Render (Colour Mask);30;2;[Header];[Enum];Create;False;1;default required for transparent camera;2;NoUpdateAlpha;14;Default;15;0;True;0;False;15;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;622;-3633.26,-694.9681;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;624;-3740.211,-52.33698;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;655;-2880.112,-710.8488;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;659;-2978.713,-385.9709;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;660;-3009.524,-61.89579;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;776;-4622.391,-500.5604;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;50;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;780;-4418.523,-497.6983;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;618;-4036.434,-193.2573;Half;False;Property;_TexRotate;Tex Rotate;8;0;Create;True;0;0;0;False;0;False;1;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;619;-3884.434,-184.2573;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;815;-4381.232,400.5117;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;816;-4563.708,395.8469;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;814;-4723.708,379.8469;Half;False;Property;_NormRotate;Norm Rotate;12;0;Create;True;0;0;0;False;0;False;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;804;-4618.669,189.3986;Inherit;True;Property;_Normal;Normal;11;0;Create;True;0;0;0;False;0;False;None;0b365c3f883d54bbf8994ed5f1b892b9;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.PowerNode;833;-3995.516,-4.074448;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;834;-4553.534,-282.0107;Inherit;False;Property;_DepthPower;Depth Power;27;0;Create;True;0;0;0;False;0;False;0.5;0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;836;-4196.107,-65.68884;Inherit;False;793;noise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;800;-2785.856,284.341;Inherit;False;Property;_TexPower;Tex Power;7;0;Create;True;0;0;0;False;0;False;1;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;848;-3072.077,193.4791;Inherit;False;HueShift;-1;;6981;9f07e9ddd8ab81c47b3582f22189b65b;0;4;14;COLOR;0,0,0,0;False;15;FLOAT;0;False;16;FLOAT;0;False;17;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;850;-3101.744,172.24;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;637;-3153.652,-716.2941;Inherit;True;Property;_tsrtsr1;tsrtsr;0;0;Create;True;0;0;0;False;0;False;-1;None;4d9e182ddee87194bb7c9e452801e60a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;650;-3253.995,-385.904;Inherit;True;Property;_tsrtsr;tsrtsr;0;0;Create;True;0;0;0;False;0;False;-1;None;4d9e182ddee87194bb7c9e452801e60a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;648;-3277.32,-63.23276;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;4d9e182ddee87194bb7c9e452801e60a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;798;-5472.204,-678.4891;Inherit;False;Property;_NoiseMultiply;Noise Multiply;22;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;631;-3512.472,-577.606;Inherit;True;Property;_MainTex;MainTex;4;0;Create;True;0;0;0;False;0;False;None;bb248a7f1e54e9b40a365d4cae715541;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.DistanceOpNode;902;-4374.403,826.4346;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;832;-4197.719,18.98386;Inherit;False;Property;_NormalPower;Normal Power;13;0;Create;True;0;0;0;False;0;False;1;0.025;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;806;-4032.87,463.6911;Inherit;True;Property;_TextureSample2;Texture Sample 1;29;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;805;-4047.534,233.954;Inherit;True;Property;_TextureSample1;Texture Sample 1;29;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;813;-3763.241,458.0275;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;944;-3252.105,331.4882;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;938;-3628.105,92.48819;Inherit;False;2;2;0;FLOAT;0.5;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;882;-5502.505,-295.7849;Inherit;False;793;noise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;859;-3841.095,-505.2952;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;796;-5446.187,-757.1576;Inherit;False;Property;_NoisePower;Noise Power;21;0;Create;True;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;779;-5837.118,-472.9612;Inherit;False;0;764;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;777;-5512.138,-433.9724;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-0.111,-0.11;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;778;-5337.065,-487.8894;Inherit;False;2;2;0;FLOAT2;1.29,1.29;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;896;-1972.932,-235.7524;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1041;-2258.255,85.05707;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;939;-3459.105,145.4882;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;940;-3320.105,165.4882;Inherit;False;HypnoPi;-1;;7040;f302050c500fe4841b663fe1fb2bac76;0;2;8;FLOAT;0;False;9;FLOAT;1;False;2;FLOAT;0;FLOAT;19
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;943;-3727.105,192.4882;Inherit;False;2;2;0;FLOAT;0.25;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;942;-3835.105,114.4882;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;799;-2617.856,190.341;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;634;-3559.808,-357.6064;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;632;-3580.133,-36.42517;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;1044;-2537.624,82.44015;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;683;-2446.662,100.6719;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;678;-2717.162,-19.36664;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;1045;-2539.521,147.2583;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;685;-2848.477,596.2016;Inherit;False;Property;_DistortPower;Distort Power;23;0;Create;True;0;0;0;False;0;False;0.1;0.015;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;941;-3606.105,185.4882;Inherit;False;Property;_CycleTweak;Cycle Tweak;16;0;Create;True;0;0;0;False;0;False;0,0;2.5,-5.5;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.ColorNode;681;-2531.792,-195.3862;Inherit;False;Property;_Colour;Colour;5;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,0.9899999,0.9924409,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;831;-3237.425,350.1717;Inherit;False;HueShift;-1;;7041;9f07e9ddd8ab81c47b3582f22189b65b;0;4;14;COLOR;0,0,0,0;False;15;FLOAT;0;False;16;FLOAT;0;False;17;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1048;-4427.514,634.7837;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;2,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;907;-3006.91,363.2012;Inherit;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;922;-2788.788,364.3239;Inherit;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;909;-3879.565,823.3036;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;911;-3739.82,826.2783;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;-0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;910;-3540.156,820.513;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;793;-2444.089,381.3903;Inherit;True;noise;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-3774.943,317.0132;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;810;-3467.935,323.8401;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;1.5,1.5,1.5;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;594;-5265.04,-615.7166;Inherit;False;0;631;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;794;-5684.174,-897.7047;Inherit;False;793;noise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;961;-5524.717,-896.8521;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;795;-5335.083,-895.9056;Inherit;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0.2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1053;-4722.245,-899.8554;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;792;-5135.64,-897.4415;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1052;-4980.195,-896.9915;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-0.5,-0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;797;-4817.633,-684.6528;Inherit;False;Property;_NoisetoTex;Noise to Tex;20;0;Create;True;0;0;0;False;0;False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1051;-4463.995,-898.8914;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1054;-3708.977,1035.206;Inherit;False;Property;_PulseStrength;Pulse Strength;25;0;Create;True;0;0;0;False;0;False;0;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;629;-3294.154,-780.66;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;5,5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1056;-3191.006,-808.5005;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;1057;-2920.006,-811.5005;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;1055;-3065.006,-788.5005;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1058;-3612.006,-775.5005;Inherit;False;2;2;0;FLOAT3;-0.5,0,0;False;1;FLOAT3;-0.5,-0.5,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;627;-3466.259,-778.9686;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;-0.5,-0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;639;-3375.789,-356.3326;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;3,3;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;643;-3414.114,-34.66148;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;2,2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;844;-4061.943,825.0592;Inherit;True;HypnoPi;-1;;7042;f302050c500fe4841b663fe1fb2bac76;0;2;8;FLOAT;0;False;9;FLOAT;0.001;False;2;FLOAT;0;FLOAT;19
Node;AmplifyShaderEditor.SimpleTimeNode;1064;-4113.882,642.1082;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;-4273.108,641.9338;Inherit;False;Property;_PulseRate;Pulse Rate;24;0;Create;True;0;0;0;False;0;False;0.25;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;906;-4256.536,726.8424;Inherit;False;2;2;0;FLOAT;0.25;False;1;FLOAT;0.001;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;905;-4119.249,735.892;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;827;-3876.623,685.6367;Half;False;Property;_GreyCycleNorm;Grey Cycle Norm;15;0;Create;True;0;0;0;False;0;False;1;0.025;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;826;-3685.714,688.6228;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;935;-3528.064,687.59;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1062;-3411.708,690.9822;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1063;-3279.384,688.7999;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1065;-3108.48,742.0505;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;819;-3515.866,555.4445;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;820;-3710.378,550.2974;Half;False;Property;_HueCycleNorm;Hue Cycle Norm;14;0;Create;True;0;0;0;False;0;False;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;921;-4179.916,824.8595;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;955;-2577.513,292.1981;Inherit;False;Property;_Saturation;Saturation;6;0;Create;True;0;0;0;False;0;False;1;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;661;-2838.383,-643.4265;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;676;-2964.387,-280.265;Inherit;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;3;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1042;-2281.985,7.739531;Inherit;False;Property;_Multiply;Multiply;9;0;Create;True;0;0;0;False;0;False;1;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;948;-3205.105,264.4882;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.025;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;835;-4766.594,-279.0355;Inherit;False;Property;_DepthMultiply;Depth Multiply;29;0;Create;True;0;0;0;False;0;False;50;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1070;-4249.662,-478.2975;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1038;-4136.667,-639.4871;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-0.5,-0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1069;-4362.902,-351.6796;Inherit;False;Property;_DepthBias;Depth Bias;28;0;Create;True;0;0;0;False;0;False;50;0.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;775;-4751.975,-495.6604;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.001;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;809;-4920.39,500.3446;Inherit;False;0;804;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;1071;-4680.235,502.1996;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-0.5,-0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1072;-4568.235,502.1996;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;1.5,1.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1073;-4448.235,504.1996;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.4;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;807;-4232.529,408.6459;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.45,0.4;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;808;-4232.127,229.2172;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.45;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;932;-3596.075,318.632;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.75;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;933;-3591.075,447.632;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.75;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;675;-2901.104,5.294116;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;669;-2842.318,-527.0905;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;671;-3005.074,5.615619;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.05,0.05,0.05;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;677;-2686.641,-520.3207;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.05,0.05,0.05;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;668;-2771.135,-378.8392;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;131;449.2089,-25.30397;Inherit;False;Property;_BlendOp;BlendOp;44;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.BlendOp;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;684;-2015.329,172.5816;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;5,5,5;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;727;-704.0908,22.40271;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;851;-693.9019,146.725;Inherit;False;Property;_Opacity;Opacity;34;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;764;-5053.93,-523.3171;Inherit;True;Global;_CameraDepthTexture;_CameraDepthTexture;45;0;Create;True;0;0;0;False;0;False;-1;None;;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;701;-1702.64,-202.1845;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScreenColorNode;699;-1856.106,-210.6933;Float;False;Global;_TrippyGrab2;TrippyGrab2;-1;0;Create;True;0;0;0;False;0;False;Object;-1;True;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1043;-1491.81,-170.3582;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;704;-1332.933,-154.3273;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.0001,0.0001,0.0001;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode;1117;-1088.338,-90.85678;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;3.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1118;-1265.338,-59.85678;Inherit;False;Property;_HDRClamp;HDR Clamp;18;0;Create;True;0;0;0;False;0;False;3;2.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;722;-847.9118,18.82409;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0.75;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;705;-2013.212,-93.11569;Inherit;False;Property;_GrabPower;Grab Power;10;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;1111;-1679.338,-134.8568;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;710;-1564.994,-81.27888;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.25;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;714;-1683.768,-6.45961;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;1104;-1736.338,83.14322;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.25;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1106;-1583.338,44.14322;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;10,10,10;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;1110;-1716.338,173.1432;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;1081;-1783.271,299.5775;Inherit;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1102;-1466.338,27.14322;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;903;-4464.17,728.3976;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-1,-0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NegateNode;1125;-4756.354,782.6589;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1124;-5023.354,775.6589;Inherit;False;Property;_PulseOrigin;Pulse Origin;26;0;Create;True;0;0;0;False;0;False;0.5;0.253;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1126;-4620.354,766.6589;Inherit;False;FLOAT2;4;0;FLOAT;-1;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;1112;-1338.338,26.14322;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector4Node;1109;-2077.338,1.143219;Inherit;False;Property;_DarknessTweak;Darkness Tweak;19;0;Create;True;0;0;0;False;0;False;5,2,2,2;0.5,3,3,3;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;956;-2428.714,295.4578;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1127;-2151.836,439.8827;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1121;-1192.038,126.2432;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1108;-1209.038,218.2432;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;954;-2282.714,212.6548;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1116;-774.338,263.5432;Inherit;False;Property;_EffectFade;Effect Fade;17;0;Create;True;0;0;0;False;0;False;0.5;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1129;-976.7753,293.3596;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1123;-1066.138,179.3432;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.9,0.9,0.9;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;1130;-1179.575,24.25951;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1131;-4481.234,-635.7476;Inherit;False;Screenspace Include;0;;7058;8326627392ade6a49869c3928468b5af;2,44,0,46,0;1;32;FLOAT2;0,0;False;2;FLOAT2;31;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1132;-5819.875,-576.9503;Inherit;False;Screenspace Include;0;;7059;8326627392ade6a49869c3928468b5af;2,44,1,46,1;1;32;FLOAT2;0,0;False;2;FLOAT2;31;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1133;-2235.773,-355.3741;Inherit;False;Screenspace Include;0;;7060;8326627392ade6a49869c3928468b5af;2,44,1,46,1;1;32;FLOAT2;0,0;False;2;FLOAT2;31;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;530;156,-64;Float;False;True;-1;2;ASEMaterialInspector;100;5;.GenesisAria/Screen psychedelic;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;1;1;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;True;_BlendOp;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;True;True;True;True;True;True;0;True;_ColorMask;False;False;False;False;False;False;True;True;True;0;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;0;True;_StencilComparison;0;True;_StencilOp;0;True;_StencilFail;0;True;_StencilZFail;0;False;;0;False;;0;False;;0;False;;True;True;1;True;_ZWriteMode;True;3;True;_ZTestMode;True;False;0;False;;0;False;;True;2;RenderType=Opaque=RenderType;Queue=Overlay=Queue=28767;True;7;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;0;638361894895851037;0;1;True;False;;False;0
Node;AmplifyShaderEditor.DynamicAppendNode;728;-198.0909,-7.597309;Inherit;False;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.ClipNode;1134;-424.4675,120.375;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.001;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;721;-1435.141,130.7309;Inherit;True;3;3;0;FLOAT3;1,1,1;False;1;FLOAT3;10,10,10;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
WireConnection;622;0;619;0
WireConnection;624;0;619;0
WireConnection;655;0;637;0
WireConnection;659;0;650;0
WireConnection;660;0;648;0
WireConnection;776;0;775;0
WireConnection;776;1;835;0
WireConnection;780;0;776;0
WireConnection;780;1;834;0
WireConnection;619;0;618;0
WireConnection;815;0;816;0
WireConnection;816;0;814;0
WireConnection;833;0;836;0
WireConnection;833;1;832;0
WireConnection;848;14;850;0
WireConnection;848;15;819;0
WireConnection;848;17;948;0
WireConnection;850;0;1045;0
WireConnection;637;0;631;0
WireConnection;637;1;1057;0
WireConnection;650;0;631;0
WireConnection;650;1;639;0
WireConnection;648;0;631;0
WireConnection;648;1;643;0
WireConnection;902;0;903;0
WireConnection;806;0;804;0
WireConnection;806;1;807;0
WireConnection;805;0;804;0
WireConnection;805;1;808;0
WireConnection;813;0;806;0
WireConnection;944;0;1063;0
WireConnection;938;0;942;0
WireConnection;938;1;941;1
WireConnection;859;0;1070;0
WireConnection;859;1;833;0
WireConnection;859;2;1038;0
WireConnection;777;0;779;0
WireConnection;778;0;1132;31
WireConnection;778;1;882;0
WireConnection;896;0;1133;31
WireConnection;896;1;793;0
WireConnection;1041;0;1042;0
WireConnection;1041;1;683;0
WireConnection;939;0;938;0
WireConnection;939;1;941;2
WireConnection;940;8;939;0
WireConnection;940;9;943;0
WireConnection;943;1;944;0
WireConnection;942;0;1044;0
WireConnection;799;0;848;0
WireConnection;799;1;800;0
WireConnection;634;0;859;0
WireConnection;634;2;619;0
WireConnection;632;0;859;0
WireConnection;632;2;624;0
WireConnection;1044;0;678;0
WireConnection;683;0;681;0
WireConnection;678;0;676;0
WireConnection;678;1;675;0
WireConnection;678;2;677;0
WireConnection;1045;0;678;0
WireConnection;831;14;810;0
WireConnection;831;15;819;0
WireConnection;831;17;1063;0
WireConnection;1048;0;809;0
WireConnection;907;0;831;0
WireConnection;907;1;1065;0
WireConnection;922;0;907;0
WireConnection;922;1;685;0
WireConnection;909;0;844;0
WireConnection;911;0;909;0
WireConnection;910;0;911;0
WireConnection;910;1;1054;0
WireConnection;793;0;922;0
WireConnection;812;0;805;0
WireConnection;810;0;932;0
WireConnection;810;2;933;0
WireConnection;961;0;794;0
WireConnection;795;0;961;0
WireConnection;795;1;796;0
WireConnection;1053;0;1052;0
WireConnection;1053;1;798;0
WireConnection;792;0;795;0
WireConnection;792;1;594;0
WireConnection;1052;0;792;0
WireConnection;797;1;594;0
WireConnection;797;0;1051;0
WireConnection;1051;0;1053;0
WireConnection;629;0;627;0
WireConnection;1056;0;629;0
WireConnection;1057;0;1056;0
WireConnection;1057;1;1055;0
WireConnection;1055;0;1056;1
WireConnection;1058;0;859;0
WireConnection;627;0;1058;0
WireConnection;627;2;622;0
WireConnection;639;0;634;0
WireConnection;643;0;632;0
WireConnection;844;8;921;0
WireConnection;844;9;905;0
WireConnection;1064;0;1050;0
WireConnection;906;0;1064;0
WireConnection;905;0;906;0
WireConnection;826;0;827;0
WireConnection;935;0;826;0
WireConnection;1062;0;935;0
WireConnection;1063;0;1062;0
WireConnection;1065;0;910;0
WireConnection;819;0;820;0
WireConnection;921;0;902;0
WireConnection;661;0;655;0
WireConnection;676;0;668;0
WireConnection;948;0;940;0
WireConnection;1070;0;780;0
WireConnection;1070;1;1069;0
WireConnection;1038;0;1131;31
WireConnection;775;0;764;1
WireConnection;1071;0;809;0
WireConnection;1072;0;1071;0
WireConnection;1073;0;1072;0
WireConnection;807;0;1073;0
WireConnection;807;2;815;0
WireConnection;808;0;1073;0
WireConnection;808;2;816;0
WireConnection;932;0;812;0
WireConnection;933;0;813;0
WireConnection;675;0;671;0
WireConnection;669;0;661;0
WireConnection;671;0;660;0
WireConnection;677;0;669;0
WireConnection;668;0;659;0
WireConnection;684;0;1041;0
WireConnection;684;2;954;0
WireConnection;727;0;722;0
WireConnection;764;1;778;0
WireConnection;701;0;699;0
WireConnection;699;0;896;0
WireConnection;1043;0;701;0
WireConnection;704;0;1043;0
WireConnection;1117;0;704;0
WireConnection;1117;1;1118;0
WireConnection;722;0;1117;0
WireConnection;722;1;1129;0
WireConnection;722;2;1116;0
WireConnection;1111;0;704;0
WireConnection;710;0;1111;0
WireConnection;710;1;705;0
WireConnection;714;0;710;0
WireConnection;1104;0;684;0
WireConnection;1104;1;1109;1
WireConnection;1106;0;1104;0
WireConnection;1106;1;1110;0
WireConnection;1110;0;1109;2
WireConnection;1110;1;1109;3
WireConnection;1110;2;1109;4
WireConnection;1081;0;684;0
WireConnection;1102;0;1106;0
WireConnection;903;0;1048;0
WireConnection;903;1;1126;0
WireConnection;1125;0;1124;0
WireConnection;1126;1;1125;0
WireConnection;1112;0;1102;0
WireConnection;956;0;955;0
WireConnection;1127;0;956;0
WireConnection;1121;0;721;0
WireConnection;1121;1;1130;0
WireConnection;1108;0;721;0
WireConnection;1108;1;1112;0
WireConnection;954;0;799;0
WireConnection;954;1;956;0
WireConnection;1129;0;1123;0
WireConnection;1129;1;956;0
WireConnection;1123;0;1121;0
WireConnection;1123;1;1108;0
WireConnection;1130;0;1112;0
WireConnection;1131;32;797;0
WireConnection;530;0;728;0
WireConnection;530;1;1133;0
WireConnection;728;0;727;0
WireConnection;728;3;1134;0
WireConnection;1134;1;851;0
WireConnection;721;0;1081;0
WireConnection;721;2;714;0
ASEEND*/
//CHKSM=365F6A61AB5FC85E74F4698A41F5C6CE562DC345
