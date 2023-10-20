// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Particle Basic Lit Transparent"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[ToggleUI]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 0
		[Space(5)]_Offset("Offset", Float) = 0
		_DistanceOffset("Distance Offset", Range( -50 , 50)) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space(10)]_AlphaPower("Alpha Power", Float) = 1
		_Cutoff("Alpha Cutoff", Float) = 1
		[Toggle(GREYTOALPHA_ON)] _AlphaGrey("Alpha From Greyscale", Float) = 0
		[Toggle(MULTALPHA_ON)] _MultipliedAlpha("Mixed Alpha", Float) = 0
		_MainTex("MainTex", 2D) = "black" {}
		[HDR]_Colour("Colour", Color) = (1,1,1,1)
		_TexSaturation("Tex Saturation", Range( 0 , 2)) = 2
		_TexPower("Tex Power", Float) = 1
		[Header(. Lighting .)]_LightMulti("Light Multiplier", Float) = 1
		_MaxLight("Max Light (x2)", Range( 0 , 1)) = 0.5
		_MinLight("Min Light", Range( 0 , 1)) = 0.01
		[Header(. Lighting .)]_BakedMulti("Baked Multiplier", Float) = 1
		_LightColourBias("LightColour Bias (keep white)", Color) = (1,1,1,0)
		[Space(5)][Header(.  Shadow  .)][Toggle(SHADING_ON)] _UseShading("Use Shading", Float) = 0
		[Space(5)]_ShadowColour("Shadow Colour", Color) = (0.85,0.85,0.85,1)
		[Normal]_Normal("Normal (N)", 2D) = "bump" {}
		_NormalScale("Scale Normal", Float) = 1
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.68
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.55
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.44
		[Space(10)][Header(. Use Particle Vertex Stream .)][Header(requires vertex stream centre)][Toggle(_VERTEXSTREAM_ON)] _VertexStream("Vertex Stream", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Advanced  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (OneMinusSrcAlpha)", Float) = 10
		[Space(5)][Header(Stencil)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask (non-zero)", Float) = 255
		_ReadMask("ReadMask (non-zero)", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(Surface,0,Object2World,1)]_LightMode("Lighting Mode", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "LightMode"="ForwardBase" }
	LOD 100

		CGINCLUDE
		#pragma target 4.6
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
			Name "Lit"

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
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _VERTEXSTREAM_ON
			#pragma shader_feature_local SHADING_ON
			#pragma multi_compile __ VERTEXLIGHT_ON
			#pragma shader_feature_local GREYTOALPHA_ON
			#pragma shader_feature_local MULTALPHA_ON


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _ZWriteMode;
			uniform int _StencilComparison;
			uniform float _DstBlend;
			uniform float _Offset;
			uniform half _ReadMask;
			uniform int _StencilOp;
			uniform int _Culling;
			uniform float _ZTestMode;
			uniform half _WriteMask;
			uniform int _StencilFail;
			uniform int _StencilZFail;
			uniform half _StencilRef;
			uniform float _SrcBlend;
			uniform float _DistanceOffset;
			uniform sampler2D _Normal;
			uniform float _NormalScale;
			uniform half _StaticLightX;
			uniform half _StaticLightY;
			uniform half _StaticLightZ;
			uniform half _LightMode;
			uniform float4 _ShadowColour;
			uniform half _BakedMulti;
			uniform half _LightMulti;
			uniform half4 _LightColourBias;
			uniform float _MinLight;
			uniform half _MaxLight;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float _TexSaturation;
			uniform float4 _Colour;
			uniform float _TexPower;
			uniform float _AlphaPower;
			uniform float _Cutoff;
			float3 CenterEye1_g6490(  )
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
			
			float3 CenterEye1_g6486(  )
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
			
			half3 SHArgbambientDir(  )
			{
				return float4(Unity_SafeNormalize(unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz), 1.0);
			}
			
			float4 VertexLightPosX3_g6495(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g6495(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g6495(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g6495(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol114_g6495(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightCol215_g6495(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g6495(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g6495(  )
			{
				return unity_LightColor[3];
			}
			
			float3 unity_SHArgb3_g6492(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 appendResult610 = (float3(v.ase_texcoord.z , v.ase_texcoord.w , v.ase_texcoord1.x));
				#ifdef _VERTEXSTREAM_ON
				float3 staticSwitch612 = appendResult610;
				#else
				float3 staticSwitch612 = v.vertex.xyz;
				#endif
				float3 localCenterEye1_g6490 = CenterEye1_g6490();
				float temp_output_614_0 = distance( staticSwitch612 , localCenterEye1_g6490 );
				float clampResult617 = clamp( ( temp_output_614_0 - _ProjectionParams.y ) , 0.0 , 0.35 );
				float clampResult616 = clamp( temp_output_614_0 , _ProjectionParams.y , 0.05 );
				
				float3 ase_worldTangent = UnityObjectToWorldDir(v.ase_tangent);
				o.ase_texcoord2.xyz = ase_worldTangent;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				
				o.ase_texcoord1 = v.ase_texcoord;
				o.ase_texcoord5 = v.ase_texcoord1;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = ( -ase_worldViewDir * ( ( clampResult617 * clampResult616 * (0.5 + (temp_output_614_0 - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) ) * ( _DistanceOffset * 10.0 ) ) );
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
				float3 temp_cast_0 = (1.0).xxx;
				float2 texCoord584 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float3 ase_worldTangent = i.ase_texcoord2.xyz;
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float3 ase_worldBitangent = i.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal587 = UnpackScaleNormal( tex2D( _Normal, texCoord584 ), _NormalScale );
				float3 worldNormal587 = float3(dot(tanToWorld0,tanNormal587), dot(tanToWorld1,tanNormal587), dot(tanToWorld2,tanNormal587));
				float3 Normal585 = worldNormal587;
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float4 appendResult252 = (float4(i.ase_texcoord1.z , i.ase_texcoord1.w , i.ase_texcoord5.x , 1.0));
				#ifdef _VERTEXSTREAM_ON
				float4 staticSwitch589 = appendResult252;
				#else
				float4 staticSwitch589 = float4(0,0,0,1);
				#endif
				float4 transform86 = mul(unity_ObjectToWorld,staticSwitch589);
				float4 VertCenter703 = transform86;
				float3 normalizeResult657 = normalize( ( _WorldSpaceLightPos0.xyz - ( _WorldSpaceLightPos0.w * (VertCenter703).xyz ) ) );
				float3 appendResult653 = (float3(_StaticLightX , _StaticLightY , _StaticLightZ));
				float3 localCenterEye1_g6486 = CenterEye1_g6486();
				float3 temp_output_4_0_g6486 = ( localCenterEye1_g6486 - WorldPosition );
				float3 normalizeResult5_g6486 = normalize( temp_output_4_0_g6486 );
				float3 lerpResult656 = lerp( appendResult653 , normalizeResult5_g6486 , float3( 0.3333,0.3333,0.3333 ));
				half3 Dir_LightDir659 = ( ( ase_lightColor.rgb * ase_lightColor.a ) > float3( 0,0,0 ) ? normalizeResult657 : lerpResult656 );
				half3 localSHArgbambientDir6_g6487 = SHArgbambientDir();
				float dotResult661 = dot( Normal585 , ( Dir_LightDir659 + localSHArgbambientDir6_g6487 ) );
				float NdotL663 = dotResult661;
				float4 localVertexLightPosX3_g6495 = VertexLightPosX3_g6495();
				float4 break4_g6495 = localVertexLightPosX3_g6495;
				float4 localVertexLightPosY2_g6495 = VertexLightPosY2_g6495();
				float4 break5_g6495 = localVertexLightPosY2_g6495;
				float4 localVertexLightPosZ1_g6495 = VertexLightPosZ1_g6495();
				float4 break6_g6495 = localVertexLightPosZ1_g6495;
				float3 appendResult7_g6495 = (float3(break4_g6495.x , break5_g6495.x , break6_g6495.x));
				half3 VertLightPos1529 = appendResult7_g6495;
				float3 ifLocalVar528 = 0;
				UNITY_BRANCH 
				if( _LightMode == 1.0 )
				ifLocalVar528 = (VertCenter703).xyz;
				else if( _LightMode < 1.0 )
				ifLocalVar528 = WorldPosition;
				half3 Lightmode533 = ifLocalVar528;
				float3 normalizeResult538 = normalize( ( VertLightPos1529 - Lightmode533 ) );
				float dotResult544 = dot( Normal585 , normalizeResult538 );
				float Vert_NdotL545 = dotResult544;
				float3 pos188_g6495 = appendResult7_g6495;
				float3 appendResult711 = (float3(i.ase_texcoord1.z , i.ase_texcoord1.w , i.ase_texcoord5.x));
				#ifdef _VERTEXSTREAM_ON
				float3 staticSwitch712 = appendResult711;
				#else
				float3 staticSwitch712 = float3( 0,0,0 );
				#endif
				float3 temp_output_157_0_g6495 = staticSwitch712;
				float3 objToWorld139_g6495 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g6495, 1 ) ).xyz;
				float temp_output_155_0_g6495 = pow( distance( pos188_g6495 , objToWorld139_g6495 ) , 2.0 );
				float4 localVertexLightAttenuation86_g6495 = VertexLightAttenuation86_g6495();
				float4 break87_g6495 = localVertexLightAttenuation86_g6495;
				float attenx96_g6495 = break87_g6495.x;
				float temp_output_60_0_g6495 = saturate( ( 1.0 - ( ( temp_output_155_0_g6495 * attenx96_g6495 ) / 25.0 ) ) );
				float temp_output_715_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g6495 ) * attenx96_g6495 ) ) , ( temp_output_60_0_g6495 * temp_output_60_0_g6495 ) );
				float3 appendResult8_g6495 = (float3(break4_g6495.y , break5_g6495.y , break6_g6495.y));
				float3 pos290_g6495 = appendResult8_g6495;
				float3 objToWorld140_g6495 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g6495, 1 ) ).xyz;
				float temp_output_75_0_g6495 = pow( distance( pos290_g6495 , objToWorld140_g6495 ) , 2.0 );
				float atteny97_g6495 = break87_g6495.y;
				float temp_output_107_0_g6495 = saturate( ( 1.0 - ( ( temp_output_75_0_g6495 * atteny97_g6495 ) / 25.0 ) ) );
				float temp_output_715_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g6495 ) * atteny97_g6495 ) ) , ( temp_output_107_0_g6495 * temp_output_107_0_g6495 ) );
				float3 appendResult9_g6495 = (float3(break4_g6495.z , break5_g6495.z , break6_g6495.z));
				float3 pos389_g6495 = appendResult9_g6495;
				float3 objToWorld141_g6495 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g6495, 1 ) ).xyz;
				float temp_output_79_0_g6495 = pow( distance( pos389_g6495 , objToWorld141_g6495 ) , 2.0 );
				float attenz98_g6495 = break87_g6495.z;
				float temp_output_125_0_g6495 = saturate( ( 1.0 - ( ( temp_output_79_0_g6495 * attenz98_g6495 ) / 25.0 ) ) );
				float temp_output_715_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g6495 ) * attenz98_g6495 ) ) , ( temp_output_125_0_g6495 * temp_output_125_0_g6495 ) );
				float3 appendResult10_g6495 = (float3(break4_g6495.w , break5_g6495.w , break6_g6495.w));
				float3 pos491_g6495 = appendResult10_g6495;
				float3 objToWorld138_g6495 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g6495, 1 ) ).xyz;
				float temp_output_83_0_g6495 = pow( distance( pos491_g6495 , objToWorld138_g6495 ) , 2.0 );
				float attenw99_g6495 = break87_g6495.w;
				float temp_output_116_0_g6495 = saturate( ( 1.0 - ( ( temp_output_83_0_g6495 * attenw99_g6495 ) / 25.0 ) ) );
				float temp_output_715_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g6495 ) * attenw99_g6495 ) ) , ( temp_output_116_0_g6495 * temp_output_116_0_g6495 ) );
				half VertAtten502 = ( temp_output_715_23 + temp_output_715_29 + temp_output_715_30 + temp_output_715_31 );
				float4 localVertexLightCol114_g6495 = VertexLightCol114_g6495();
				float4 temp_output_715_16 = localVertexLightCol114_g6495;
				float4 localVertexLightCol215_g6495 = VertexLightCol215_g6495();
				float4 temp_output_715_17 = localVertexLightCol215_g6495;
				float4 localVertexLightCol319_g6495 = VertexLightCol319_g6495();
				float4 temp_output_715_18 = localVertexLightCol319_g6495;
				float4 localVertexLightCol421_g6495 = VertexLightCol421_g6495();
				float4 temp_output_715_20 = localVertexLightCol421_g6495;
				float4 break495 = ( temp_output_715_16 + temp_output_715_17 + temp_output_715_18 + temp_output_715_20 );
				#ifdef VERTEXLIGHT_ON
				float staticSwitch507 = ( VertAtten502 * saturate( ( break495.x + break495.y + break495.z ) ) * break495.w );
				#else
				float staticSwitch507 = 0.0;
				#endif
				half VertTotal513 = staticSwitch507;
				float lerpResult670 = lerp( VertTotal513 , VertAtten502 , VertTotal513);
				float lerpResult676 = lerp( NdotL663 , Vert_NdotL545 , ( 1.0 - saturate( ( 1.0 / pow( ( lerpResult670 * 10.0 ) , 2.0 ) ) ) ));
				#ifdef SHADING_ON
				float3 staticSwitch682 = saturate( ( lerpResult676 + ( ( 1.0 - lerpResult676 ) * (_ShadowColour).rgb ) ) );
				#else
				float3 staticSwitch682 = temp_cast_0;
				#endif
				float temp_output_551_0 = ( 1.0 - _WorldSpaceLightPos0.w );
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch536 = ( ( temp_output_715_16 * temp_output_715_23 ) + ( temp_output_715_17 * temp_output_715_29 ) + ( temp_output_715_18 * temp_output_715_30 ) + ( temp_output_715_20 * temp_output_715_31 ) );
				#else
				float4 staticSwitch536 = half4(0,0,0,0);
				#endif
				float4 VertLight542 = staticSwitch536;
				float3 localunity_SHArgb3_g6492 = unity_SHArgb3_g6492();
				float3 saferPower564 = abs( ( ( ( ase_lightColor.rgb * float3( 1,1,1 ) * temp_output_551_0 ) + ( (VertLight542).xyz * float3( 0.5,0.5,0.5 ) * temp_output_551_0 ) + ( localunity_SHArgb3_g6492 * _BakedMulti ) ) * _LightMulti * (_LightColourBias).rgb ) );
				float3 temp_cast_1 = (_MinLight).xxx;
				float3 clampResult563 = clamp( pow( saferPower564 , 0.8 ) , temp_cast_1 , float3( 2,2,2 ) );
				float3 break5_g6489 = clampResult563;
				float3 clampResult569 = clamp( clampResult563 , float3( 0,0,0 ) , ( ( _MaxLight * 2.0 * max( max( break5_g6489.x , break5_g6489.y ) , max( break5_g6489.y , break5_g6489.z ) ) ) / clampResult563 ) );
				float3 AllLight570 = clampResult569;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode26 = tex2D( _MainTex, uv_MainTex );
				float3 desaturateInitialColor49 = tex2DNode26.rgb;
				float desaturateDot49 = dot( desaturateInitialColor49, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar49 = lerp( desaturateInitialColor49, desaturateDot49.xxx, ( 1.0 - _TexSaturation ) );
				float4 appendResult90 = (float4(desaturateVar49 , tex2DNode26.a));
				float4 temp_output_48_0 = ( appendResult90 * _Colour * i.ase_color );
				float3 temp_output_480_0 = (temp_output_48_0).xyz;
				float3 saferPower486 = abs( temp_output_480_0 );
				float3 temp_cast_5 = (_TexPower).xxx;
				float temp_output_478_0 = (temp_output_48_0).w;
				float grayscale489 = (temp_output_480_0.r + temp_output_480_0.g + temp_output_480_0.b) / 3;
				#ifdef MULTALPHA_ON
				float staticSwitch579 = ( grayscale489 * i.ase_color.a * temp_output_478_0 );
				#else
				float staticSwitch579 = ( grayscale489 * i.ase_color.a );
				#endif
				#ifdef GREYTOALPHA_ON
				float staticSwitch578 = staticSwitch579;
				#else
				float staticSwitch578 = temp_output_478_0;
				#endif
				float saferPower475 = abs( staticSwitch578 );
				clip( staticSwitch578 - ( 1.0 - _Cutoff ));
				float4 appendResult481 = (float4(( staticSwitch682 * AllLight570 * pow( saferPower486 , temp_cast_5 ) ) , pow( saferPower475 , _AlphaPower )));
				
				
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
Node;AmplifyShaderEditor.CommentaryNode;492;-3771.075,-2275.878;Inherit;False;2099.93;995.9517;;34;547;545;544;542;541;538;536;535;533;532;530;529;528;527;526;523;521;518;516;515;513;507;506;504;502;501;500;498;497;495;494;705;712;711;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;494;-3158.344,-1421.445;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;495;-3029.614,-1419.553;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleAddOpNode;498;-2874.008,-1414.024;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;643;-5811.971,-2148.069;Inherit;False;1883.061;637.1891;Uses directional light or uses the static light direction;21;664;663;662;661;660;659;658;657;656;655;654;653;652;651;650;649;648;647;646;645;704;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;497;-3289.461,-1482.206;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;501;-2744.841,-1414.919;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;500;-2727.325,-1326.546;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;502;-2959.212,-1495.921;Half;False;VertAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;646;-5804.43,-2084.229;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;506;-2543.608,-1456.972;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;504;-2614.262,-1546.084;Half;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;645;-5601.874,-1932.843;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;647;-5787.147,-1641.191;Half;False;Property;_StaticLightZ;Static Light Z;24;0;Create;True;0;0;0;False;0;False;0.44;0.44;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;648;-5381.732,-1963.283;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;507;-2364.511,-1491.374;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;649;-5788.769,-1787.516;Half;False;Property;_StaticLightX;Static Light X;22;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;0.68;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;527;-3124.838,-1831.724;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;523;-3128.864,-1650.149;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;521;-3128.307,-1560.588;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;526;-3128.781,-1741.678;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;650;-5788.862,-1713.233;Half;False;Property;_StaticLightY;Static Light Y;23;0;Create;True;0;0;0;False;0;False;0.55;0.55;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;652;-5476.349,-1842.556;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.CommentaryNode;683;-1578.429,-1881.973;Inherit;False;1832.555;536.1137;LightDir Threshold;14;680;679;678;677;676;675;674;673;672;671;670;687;686;691;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ComponentMaskNode;518;-3529.095,-2133.098;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;515;-3502.964,-2235.762;Half;False;Property;_LightMode;Lighting Mode;35;1;[Enum];Create;False;0;2;Surface;0;Object2World;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;653;-5455.313,-1725.936;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;513;-2105.97,-1489.77;Half;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;516;-3668.175,-2021.829;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;654;-5468.791,-1615.558;Inherit;False;VR_Center_Eye;-1;;6486;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;584;-4003.927,-1004.839;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;651;-5236.045,-2007.046;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;530;-2849.46,-1723.762;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TexturePropertyNode;640;-4010.831,-1195.945;Inherit;True;Property;_Normal;Normal (N);20;1;[Normal];Create;False;0;0;0;False;0;False;None;None;True;bump;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;582;-3975.07,-881.6403;Float;False;Property;_NormalScale;Scale Normal;21;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;532;-2644.669,-1868.109;Half;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;678;-1511.129,-1598.613;Inherit;False;513;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;528;-3299.426,-2130.556;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;657;-5143.389,-1881.641;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;536;-2442.09,-1752.331;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;656;-5145.183,-1706.272;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.3333,0.3333,0.3333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;677;-1289.414,-1652.605;Inherit;False;502;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;655;-5261.354,-1801.559;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;533;-3137.536,-2133.745;Half;False;Lightmode;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;571;-3631.969,-860.2089;Inherit;False;2081.032;521.23;;22;569;568;567;566;565;564;563;562;561;560;559;558;557;556;555;554;553;552;551;550;549;548;Light Colour;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;529;-3195.215,-1953.725;Half;False;VertLightPos1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;542;-2156.917,-1750.871;Float;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Compare;658;-4972.383,-1796.38;Inherit;False;2;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;670;-1073.683,-1614.786;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;664;-4823.101,-1725.033;Inherit;False;GetBakedLight;-1;;6487;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.SimpleSubtractOpNode;535;-2957.487,-1965.174;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;671;-890.6132,-1617.29;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;659;-4823.956,-1795.694;Half;False;Dir_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;585;-3164.882,-1181.294;Float;False;Normal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;549;-3573.497,-823.8973;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleAddOpNode;660;-4611.724,-1790.798;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;541;-2844.006,-2057.749;Inherit;False;585;Normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;672;-727.2412,-1620.023;Inherit;False;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;550;-3374.723,-730.1337;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ComponentMaskNode;556;-3423.379,-602.088;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;551;-3311.277,-801.1284;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;673;-563.6135,-1647.29;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;544;-2565.125,-2018.362;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;553;-3101.937,-596.2731;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;552;-3101.089,-707.8818;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;661;-4358.667,-1862.411;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;558;-2924.385,-814.8214;Half;False;Property;_LightColourBias;LightColour Bias (keep white);17;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;50;-1590.478,-1022.419;Inherit;False;Property;_TexSaturation;Tex Saturation;11;0;Create;True;0;0;0;False;0;False;2;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;51;-1308.823,-1014.595;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;26;-1445.196,-942.1674;Inherit;True;Property;_MainTex;MainTex;9;0;Create;True;0;0;0;False;0;False;-1;None;9e53a32f54fe6d04992b85319ae40091;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;674;-436.5012,-1647.549;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;545;-2416.939,-2021.78;Float;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;663;-4157.191,-1869.047;Float;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;557;-2892.209,-639.8824;Inherit;False;3;3;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;559;-2642.385,-814.8214;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;675;-296.6135,-1647.29;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;49;-1127.551,-943.2419;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;680;-333.717,-1734.188;Inherit;False;545;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;679;-319.6018,-1826.748;Inherit;False;663;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;560;-2638.289,-629.0134;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;90;-949.4218,-887.9283;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;47;-1448.399,-750.7405;Inherit;False;Property;_Colour;Colour;10;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;4.76561,4.76561,4.76561,0.7490196;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;676;-104.4646,-1741.423;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;564;-2494.431,-545.954;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;562;-2647.281,-448.0195;Float;False;Property;_MinLight;Min Light;15;0;Create;True;0;0;0;False;0;False;0.01;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;686;-219.0234,-1544.503;Float;False;Property;_ShadowColour;Shadow Colour;19;0;Create;True;0;0;0;False;1;Space(5);False;0.85,0.85,0.85,1;0.85,0.85,0.85,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;89;-1242.859,-660.4873;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-900.8589,-737.4225;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;691;36.62811,-1607.907;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;563;-2330.906,-542.0192;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;608;-2560.152,36.47097;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;687;-7.77585,-1544.198;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;607;-2562.228,-131.753;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PosVertexDataNode;609;-2341.485,-179.6414;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;610;-2302.035,-22.00892;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;565;-2233.832,-645.769;Half;False;Property;_MaxLight;Max Light (x2);14;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;684;221.3206,-1562.707;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;566;-2179.048,-574.5223;Inherit;False;Float3 Max;-1;;6489;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;480;-763.2135,-743.3516;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;693;337.6281,-1650.907;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;612;-2109.513,-44.09549;Inherit;False;Property;_VertexStream;Vertex Stream;25;0;Create;True;0;0;0;False;0;False;0;0;1;True;;Toggle;2;Key0;Key1;Reference;695;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;489;-680.0398,-584.8043;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;567;-1949.373,-619.8005;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;611;-1949.62,170.9968;Inherit;False;VR_Center_Eye;-1;;6490;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.ComponentMaskNode;478;-634.5986,-374.7068;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;574;-418.4508,-466.2926;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ProjectionParams;613;-2023.716,-196.6818;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DistanceOpNode;614;-1692.91,-19.72152;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;690;455.6281,-1647.907;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;577;-444.2991,-569.9556;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;568;-1896.725,-453.4632;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;681;408.1942,-1725.314;Half;False;Constant;_Shading_Null;Shading_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;569;-1694.507,-474.6611;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;615;-1448.997,-256.5865;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;682;584.8665,-1675.178;Inherit;False;Property;_UseShading;Use Shading;18;0;Create;True;0;0;0;False;2;Space(5);Header(.  Shadow  .);False;0;0;0;True;SHADING_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;579;-254.124,-494.3236;Inherit;False;Property;_MultipliedAlpha;Mixed Alpha;8;0;Create;False;0;0;0;False;0;False;0;0;0;True;MULTALPHA_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;476;-161.0205,-270.5198;Inherit;False;Property;_AlphaPower;Alpha Power;5;0;Create;True;0;0;0;True;1;Space(10);False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;616;-1443.561,-156.1115;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;578;-75.12402,-398.3236;Inherit;False;Property;_AlphaGrey;Alpha From Greyscale;7;0;Create;False;0;0;0;False;0;False;0;0;0;True;GREYTOALPHA_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-150.9332,-181.1631;Inherit;False;Property;_Cutoff;Alpha Cutoff;6;0;Create;False;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;487;-458.1506,-647.565;Inherit;False;Property;_TexPower;Tex Power;12;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;617;-1282.773,-258.6946;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.35;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;689;637.4022,-1561.288;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;618;-1704.12,135.2072;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCRemapNode;619;-1471.572,-31.91242;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;331;-1121.847,47.79904;Inherit;False;Property;_DistanceOffset;Distance Offset;3;0;Create;True;0;0;0;False;0;False;0;0;-50;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;570;-1513.637,-478.245;Float;False;AllLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;475;12.25409,-287.5106;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;479;13.96609,-175.6619;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;486;-279.7903,-701.8801;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;470;-856.9102,53.31573;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;688;-67.64368,-841.2408;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;621;-991.3891,-168.6342;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;620;-1477.812,135.1387;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;622;-1125.681,-5.976015;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;24;1106.568,-655.7527;Inherit;False;670.9946;746.3742;custom properties;9;41;40;39;36;35;34;33;32;30;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;572;-93.68219,-723.2415;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;400;-712.679,-10.82376;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClipNode;471;518.6696,-297.5925;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0.005;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;676.8234,-774.3481;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);1;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;33;1428.86,-593.8448;Inherit;False;Property;_StencilComparison;Stencil Comparison;34;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;135;-1276.262,1092.279;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;8;-1498.166,761.5735;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;354;-619.9573,741.1852;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;83;-495.3981,1034.517;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;40;1404.57,-211.0041;Inherit;False;Property;_DstBlend;Destination Blend (OneMinusSrcAlpha);30;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;352;-32.7381,102.039;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0.5,0.5,0.5,0.5;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode;64;-1841.629,951.9661;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;129;-1863.826,822.9081;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;112;-1312.248,807.9111;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;592;-2608.511,335.8785;Inherit;False;Constant;_Vector4;Vector 4;31;0;Create;True;0;0;0;False;0;False;0,0,0,1;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;353;-633.9573,1037.185;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;86;-2214.034,550.7049;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;91;715.3054,-596.9597;Float;False;Property;_Offset;Offset;2;0;Create;True;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;1123.534,-507.6634;Half;False;Property;_ReadMask;ReadMask (non-zero);33;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;-1037.059,820.5901;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;39;1453.573,-521.1865;Inherit;False;Property;_StencilOp;StencilOp;36;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-1879.702,607.5383;Inherit;False;Property;_DistanceFalloff;Distance Falloff;27;0;Create;True;0;0;0;False;2;;;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;695;-212.0004,658.4898;Inherit;False;Property;_VertexStream;Vertex Stream;25;0;Create;True;0;0;0;False;3;Space(10);Header(. Use Particle Vertex Stream .);Header(requires vertex stream centre);False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;107;-1691.312,745.5351;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;327;-556.6102,-62.29578;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;448;-704.5934,-259.8261;Inherit;False;return unity_StereoEyeIndex[0]@;1;Create;0;leftEye;True;False;0;;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;38;374.8412,-741.6801;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;481;756.4673,-317.0497;Inherit;False;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;131;-474.1254,652.9921;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DistanceOpNode;6;-1960.174,692.3057;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;449;-703.2585,-194.9692;Inherit;False;return unity_StereoEyeIndex[1]@;1;Create;0;rightEye;True;False;0;;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;673.7523,-686.2844;Float;False;Property;_ZTestMode;ZTestMode (LEqual);4;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;385;-2221.31,725.3951;Inherit;False;VR_Center_Eye;-1;;6491;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,1;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;56;-1024.168,1067.955;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;547;-2413.656,-1943.004;Half;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;590;-836.6659,771.2483;Inherit;False;Property;_DistanceScale;Distance Scale;26;0;Create;True;0;0;0;False;1;Space(20);False;0;0;0;True;DISTSCALE_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;36;1122.534,-424.0863;Half;False;Property;_WriteMask;WriteMask (non-zero);32;0;Create;False;0;0;0;True;0;False;255;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;113;-2115.715,840.7001;Inherit;False;Property;_DistanceValue;Distance Value;28;0;Create;True;0;0;0;False;2;;;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;591;-839.4109,1041.807;Inherit;False;Property;_DistanceScale;Distance Scale;23;0;Create;True;0;0;0;False;1;Space(20);False;0;0;0;True;DISTSCALE_ON;Toggle;2;Key0;Key1;Reference;590;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;35;1449.861,-448.8444;Inherit;False;Property;_StencilFail;StencilFail;37;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;32;1448.861,-373.8444;Inherit;False;Property;_StencilZFail;StencilZFail;38;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;1129.714,-593.6528;Half;False;Property;_StencilRef;Stencil ID;31;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;580;927.6738,-285.6881;Float;False;True;-1;2;ASEMaterialInspector;100;5;.GenesisAria/Particle Basic Lit Transparent;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Lit;2;True;True;1;1;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;255;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;7;True;_StencilComparison;1;True;_StencilOp;1;True;_StencilFail;1;True;_StencilZFail;7;False;;1;False;;1;False;;1;False;;True;True;1;True;_ZWriteMode;True;3;True;_ZTestMode;True;True;0;True;_Offset;0;False;;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;LightMode=ForwardBase;True;6;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.RangedFloatNode;30;1142.022,-212.5741;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);29;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Advanced  .);False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;72;-1858.087,1275.627;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;73;-1599.971,1217.147;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;71;-1858.162,1107.403;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;662;-4796.439,-1867.155;Inherit;False;585;Normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;703;-2013.685,522.0475;Inherit;False;VertCenter;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;705;-3709.022,-2133.292;Inherit;False;703;VertCenter;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.NormalizeNode;538;-2810.195,-1965.698;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;581;-3647.471,-1181.047;Inherit;True;Property;_TextureSample1;Texture Sample 1;100;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;587;-3347.526,-1176.02;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;548;-3603.673,-602.551;Inherit;False;542;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;573;-303.4906,-768.972;Inherit;False;570;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;707;103.9659,-776.502;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;251;-2863.313,576.2036;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;250;-2863.387,407.9785;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;252;-2602.196,516.7235;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch;589;-2454.432,506.5296;Inherit;False;Property;_VertexStream;Vertex Stream;25;0;Create;True;0;0;0;False;0;False;0;0;1;True;;Toggle;2;Key0;Key1;Reference;695;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;711;-3710.334,-1672.364;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;710;-3914.525,-1736.109;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;709;-3913.451,-1574.884;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;712;-3798.401,-1854.055;Inherit;False;Property;_VertexStream1;Vertex Stream;25;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;695;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;704;-5799.228,-1932.807;Inherit;False;703;VertCenter;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;715;-3575.397,-1848.454;Inherit;False;VertexLightData;-1;;6495;d6cc1c00f5d200e45903717e6fa3d55c;4,158,0,159,0,160,0,161,0;1;157;FLOAT3;0,0,0;False;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-3098.423,-487.634;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-2875.151,-468.8329;Half;False;Property;_LightMulti;Light Multiplier;13;0;Create;False;1;;0;0;False;1;Header(. Lighting .);False;1;0.333;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;555;-3383.931,-509.5486;Inherit;False;GetBakedLight;-1;;6492;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.RangedFloatNode;716;-3382.386,-417.1215;Half;False;Property;_BakedMulti;Baked Multiplier;16;0;Create;False;1;;0;0;False;1;Header(. Lighting .);False;1;1;0;0;0;1;FLOAT;0
WireConnection;494;0;715;16
WireConnection;494;1;715;17
WireConnection;494;2;715;18
WireConnection;494;3;715;20
WireConnection;495;0;494;0
WireConnection;498;0;495;0
WireConnection;498;1;495;1
WireConnection;498;2;495;2
WireConnection;497;0;715;23
WireConnection;497;1;715;29
WireConnection;497;2;715;30
WireConnection;497;3;715;31
WireConnection;501;0;498;0
WireConnection;500;0;495;3
WireConnection;502;0;497;0
WireConnection;506;0;502;0
WireConnection;506;1;501;0
WireConnection;506;2;500;0
WireConnection;645;0;704;0
WireConnection;648;0;646;2
WireConnection;648;1;645;0
WireConnection;507;1;504;0
WireConnection;507;0;506;0
WireConnection;527;0;715;16
WireConnection;527;1;715;23
WireConnection;523;0;715;18
WireConnection;523;1;715;30
WireConnection;521;0;715;20
WireConnection;521;1;715;31
WireConnection;526;0;715;17
WireConnection;526;1;715;29
WireConnection;518;0;705;0
WireConnection;653;0;649;0
WireConnection;653;1;650;0
WireConnection;653;2;647;0
WireConnection;513;0;507;0
WireConnection;651;0;646;1
WireConnection;651;1;648;0
WireConnection;530;0;527;0
WireConnection;530;1;526;0
WireConnection;530;2;523;0
WireConnection;530;3;521;0
WireConnection;528;0;515;0
WireConnection;528;3;518;0
WireConnection;528;4;516;0
WireConnection;657;0;651;0
WireConnection;536;1;532;0
WireConnection;536;0;530;0
WireConnection;656;0;653;0
WireConnection;656;1;654;2
WireConnection;655;0;652;1
WireConnection;655;1;652;2
WireConnection;533;0;528;0
WireConnection;529;0;715;0
WireConnection;542;0;536;0
WireConnection;658;0;655;0
WireConnection;658;2;657;0
WireConnection;658;3;656;0
WireConnection;670;0;678;0
WireConnection;670;1;677;0
WireConnection;670;2;678;0
WireConnection;535;0;529;0
WireConnection;535;1;533;0
WireConnection;671;0;670;0
WireConnection;659;0;658;0
WireConnection;585;0;587;0
WireConnection;660;0;659;0
WireConnection;660;1;664;7
WireConnection;672;0;671;0
WireConnection;556;0;548;0
WireConnection;551;0;549;2
WireConnection;673;1;672;0
WireConnection;544;0;541;0
WireConnection;544;1;538;0
WireConnection;553;0;556;0
WireConnection;553;2;551;0
WireConnection;552;0;550;1
WireConnection;552;2;551;0
WireConnection;661;0;662;0
WireConnection;661;1;660;0
WireConnection;51;0;50;0
WireConnection;674;0;673;0
WireConnection;545;0;544;0
WireConnection;663;0;661;0
WireConnection;557;0;552;0
WireConnection;557;1;553;0
WireConnection;557;2;554;0
WireConnection;559;0;558;0
WireConnection;675;0;674;0
WireConnection;49;0;26;0
WireConnection;49;1;51;0
WireConnection;560;0;557;0
WireConnection;560;1;561;0
WireConnection;560;2;559;0
WireConnection;90;0;49;0
WireConnection;90;3;26;4
WireConnection;676;0;679;0
WireConnection;676;1;680;0
WireConnection;676;2;675;0
WireConnection;564;0;560;0
WireConnection;48;0;90;0
WireConnection;48;1;47;0
WireConnection;48;2;89;0
WireConnection;691;0;676;0
WireConnection;563;0;564;0
WireConnection;563;1;562;0
WireConnection;687;0;686;0
WireConnection;610;0;607;3
WireConnection;610;1;607;4
WireConnection;610;2;608;1
WireConnection;684;0;691;0
WireConnection;684;1;687;0
WireConnection;566;7;563;0
WireConnection;480;0;48;0
WireConnection;693;0;676;0
WireConnection;693;1;684;0
WireConnection;612;1;609;0
WireConnection;612;0;610;0
WireConnection;489;0;480;0
WireConnection;567;0;565;0
WireConnection;567;2;566;0
WireConnection;478;0;48;0
WireConnection;574;0;489;0
WireConnection;574;1;89;4
WireConnection;574;2;478;0
WireConnection;614;0;612;0
WireConnection;614;1;611;0
WireConnection;690;0;693;0
WireConnection;577;0;489;0
WireConnection;577;1;89;4
WireConnection;568;0;567;0
WireConnection;568;1;563;0
WireConnection;569;0;563;0
WireConnection;569;2;568;0
WireConnection;615;0;614;0
WireConnection;615;1;613;2
WireConnection;682;1;681;0
WireConnection;682;0;690;0
WireConnection;579;1;577;0
WireConnection;579;0;574;0
WireConnection;616;0;614;0
WireConnection;616;1;613;2
WireConnection;578;1;478;0
WireConnection;578;0;579;0
WireConnection;617;0;615;0
WireConnection;689;0;682;0
WireConnection;619;0;614;0
WireConnection;570;0;569;0
WireConnection;475;0;578;0
WireConnection;475;1;476;0
WireConnection;479;0;31;0
WireConnection;486;0;480;0
WireConnection;486;1;487;0
WireConnection;470;0;331;0
WireConnection;688;0;689;0
WireConnection;621;0;617;0
WireConnection;621;1;616;0
WireConnection;621;2;619;0
WireConnection;620;0;618;0
WireConnection;622;0;620;0
WireConnection;572;0;688;0
WireConnection;572;1;573;0
WireConnection;572;2;486;0
WireConnection;400;0;621;0
WireConnection;400;1;470;0
WireConnection;471;0;475;0
WireConnection;471;1;578;0
WireConnection;471;2;479;0
WireConnection;135;0;73;0
WireConnection;135;1;64;0
WireConnection;8;0;107;0
WireConnection;8;1;5;0
WireConnection;354;0;590;0
WireConnection;83;0;353;0
WireConnection;352;1;695;0
WireConnection;129;0;113;0
WireConnection;112;0;8;0
WireConnection;353;0;591;0
WireConnection;86;0;589;0
WireConnection;132;0;112;0
WireConnection;132;1;64;0
WireConnection;695;1;131;0
WireConnection;695;0;83;0
WireConnection;107;0;6;0
WireConnection;107;1;129;0
WireConnection;327;0;622;0
WireConnection;327;1;400;0
WireConnection;481;0;572;0
WireConnection;481;3;471;0
WireConnection;131;0;354;0
WireConnection;6;0;86;0
WireConnection;6;1;385;0
WireConnection;56;0;112;0
WireConnection;56;1;135;0
WireConnection;547;0;538;0
WireConnection;590;0;132;0
WireConnection;591;0;56;0
WireConnection;580;0;481;0
WireConnection;580;1;327;0
WireConnection;73;0;71;3
WireConnection;73;1;71;4
WireConnection;73;2;72;1
WireConnection;703;0;86;0
WireConnection;538;0;535;0
WireConnection;581;0;640;0
WireConnection;581;1;584;0
WireConnection;581;5;582;0
WireConnection;587;0;581;0
WireConnection;252;0;250;3
WireConnection;252;1;250;4
WireConnection;252;2;251;1
WireConnection;589;1;592;0
WireConnection;589;0;252;0
WireConnection;711;0;710;3
WireConnection;711;1;710;4
WireConnection;711;2;709;1
WireConnection;712;0;711;0
WireConnection;715;157;712;0
WireConnection;554;0;555;0
WireConnection;554;1;716;0
ASEEND*/
//CHKSM=DC2F811DBED7240AB0554679F36283CACEEA3F6C
