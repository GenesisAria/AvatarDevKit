// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/DistortBasic Transparent"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[ToggleUI]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space(5)]_Offset("Offset", Float) = -300
		[Space(10)][Header(. Distortion .)]_Normal("Normal", 2D) = "bump" {}
		[Toggle(_USEASMATCAP_ON)] _UseAsMatcap("Use As Matcap", Float) = 0
		_Distortion("Distortion", Float) = 1
		_RotationSpeed("Rotation Speed", Float) = 0
		_DistanceFade("Distance Fade", Float) = 0
		_DistanceFalloff("Distance Falloff", Float) = 1
		[Toggle(_)][Header(Edge Fade)]_UseFresnel("Use Fresnel", Float) = 0
		_Scale("Scale", Float) = 1
		_Power("Power", Float) = 1
		[ToggleUI]_IncludeDistort("Include Distort", Float) = 0
		_Multiply("Multiply", Float) = 1
		[Space(15)]_AlphaMaskRA("Alpha Mask (R, A)", 2D) = "white" {}
		[Toggle(_USEASMATCAP1_ON)] _UseAsMatcap1("Use As Matcap", Float) = 0
		_Alpha("Alpha", Float) = 1
		[ToggleUI]_FadetoAlpha("Fade to Alpha", Float) = 0
		[ToggleUI]_MasktoDistortion("Mask to Distortion", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Advanced  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 3
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (Zero)", Float) = 1
		[Space(5)][Header(Stencil)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask", Float) = 255
		_ReadMask("ReadMask", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" "Queue"="Overlay+28767" }
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
		
		GrabPass{ "_ADBGrab" }

		Pass
		{
			Name "Unlit"

			CGPROGRAM

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
			#include "UnityStandardUtils.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _USEASMATCAP_ON
			#pragma shader_feature_local _USEASMATCAP1_ON


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform int _StencilFail;
			uniform float _Offset;
			uniform int _StencilOp;
			uniform half _StencilRef;
			uniform half _WriteMask;
			uniform int _StencilComparison;
			uniform float _ZWriteMode;
			uniform int _Culling;
			uniform int _StencilZFail;
			uniform float _DstBlend;
			uniform float _ZTestMode;
			uniform half _ReadMask;
			uniform float _SrcBlend;
			ASE_DECLARE_SCREENSPACE_TEXTURE( _ADBGrab )
			uniform float _UseFresnel;
			uniform float _IncludeDistort;
			uniform float _DistanceFade;
			uniform float _DistanceFalloff;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform float _RotationSpeed;
			uniform float _Distortion;
			uniform float _MasktoDistortion;
			uniform float _Alpha;
			uniform sampler2D _AlphaMaskRA;
			uniform float4 _AlphaMaskRA_ST;
			uniform float _FadetoAlpha;
			uniform float _Scale;
			uniform float _Power;
			uniform float _Multiply;
			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			float3 CenterEye1_g7062(  )
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
			
			float3 CenterEye1_g7(  )
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
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord1 = screenPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
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
				float4 screenPos = i.ase_texcoord1;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 transform5_g7061 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 localCenterEye1_g7062 = CenterEye1_g7062();
				float temp_output_4_0_g7061 = distance( transform5_g7061 , float4( ( (float)1 == 0.0 ? localCenterEye1_g7062 : _WorldSpaceCameraPos ) , 0.0 ) );
				float saferPower164 = abs( saturate( ( 1.0 - (0.0 + (temp_output_4_0_g7061 - 0.0) * (1.0 - 0.0) / (_DistanceFade - 0.0)) ) ) );
				float temp_output_164_0 = pow( saferPower164 , _DistanceFalloff );
				float temp_output_147_0 = ( _DistanceFade == 0.0 ? 1.0 : temp_output_164_0 );
				float2 uv_Normal = i.ase_texcoord2.xy * _Normal_ST.xy + _Normal_ST.zw;
				float3 localCenterEye1_g7 = CenterEye1_g7();
				float3 ifLocalVar50_g6 = 0;
				UNITY_BRANCH 
				if( 0 == 1.0 )
				ifLocalVar50_g6 = localCenterEye1_g7;
				else if( 0 < 1.0 )
				ifLocalVar50_g6 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g6 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g6 - WorldPosition ), 0 ) ).xyz );
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float3 worldToViewDir13_g6 = normalize( mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz );
				#ifdef _USEASMATCAP_ON
				float2 staticSwitch142 = (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g6 ) , worldToViewDir13_g6 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 )));
				#else
				float2 staticSwitch142 = uv_Normal;
				#endif
				float mulTime97 = _Time.y * ( _RotationSpeed / 4.0 );
				float cos98 = cos( mulTime97 );
				float sin98 = sin( mulTime97 );
				float2 rotator98 = mul( staticSwitch142 - float2( 0.5,0.5 ) , float2x2( cos98 , -sin98 , sin98 , cos98 )) + float2( 0.5,0.5 );
				float2 uv_AlphaMaskRA = i.ase_texcoord2.xy * _AlphaMaskRA_ST.xy + _AlphaMaskRA_ST.zw;
				float3 localCenterEye1_g9 = CenterEye1_g9();
				float3 ifLocalVar50_g8 = 0;
				UNITY_BRANCH 
				if( 0 == 1.0 )
				ifLocalVar50_g8 = localCenterEye1_g9;
				else if( 0 < 1.0 )
				ifLocalVar50_g8 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g8 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g8 - WorldPosition ), 0 ) ).xyz );
				float3 worldToViewDir13_g8 = normalize( mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz );
				#ifdef _USEASMATCAP1_ON
				float2 staticSwitch146 = (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g8 ) , worldToViewDir13_g8 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 )));
				#else
				float2 staticSwitch146 = uv_AlphaMaskRA;
				#endif
				float ifLocalVar123 = 0;
				UNITY_BRANCH 
				if( _FadetoAlpha <= 0.0 )
				ifLocalVar123 = 1.0;
				else
				ifLocalVar123 = temp_output_164_0;
				float temp_output_64_0 = ( _Alpha * tex2D( _AlphaMaskRA, staticSwitch146 ).r * ifLocalVar123 );
				float3 lerpResult128 = lerp( float3( 0,0,1 ) , ( temp_output_147_0 * UnpackScaleNormal( tex2D( _Normal, rotator98 ), _Distortion ) ) , ( _MasktoDistortion == 1.0 ? saturate( temp_output_64_0 ) : 1.0 ));
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult112 = normalize( ase_worldViewDir );
				float dotResult114 = dot( ase_worldNormal , ase_worldViewDir );
				float clampResult110 = clamp( dotResult114 , 1E-05 , 1.99999 );
				float3 ifLocalVar111 = 0;
				if( clampResult110 >= 0.0 )
				ifLocalVar111 = ase_worldNormal;
				else
				ifLocalVar111 = -ase_worldNormal;
				float fresnelNdotV42 = dot( normalize( ifLocalVar111 ), normalizeResult112 );
				float fresnelNode42 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV42, _Power ) );
				float3 temp_output_93_0 = ( lerpResult128 * ( 1.0 - saturate( fresnelNode42 ) ) );
				float2 temp_output_30_0 = ( (ase_grabScreenPosNorm).xy + (( _UseFresnel == 1.0 ? ( _IncludeDistort == 1.0 ? ( temp_output_93_0 * _Multiply * ( 1.0 - fresnelNode42 ) ) : temp_output_93_0 ) : lerpResult128 )).xy );
				float4 screenColor8 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_ADBGrab,temp_output_30_0);
				float4 break118 = screenColor8;
				float4 appendResult63 = (float4(break118.r , break118.g , break118.b , saturate( ( break118.a * temp_output_64_0 ) )));
				clip( ceil( temp_output_147_0 ) - 0.001);
				
				
				finalColor = appendResult63;
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
Node;AmplifyShaderEditor.WorldNormalVector;115;-2273.526,588.2086;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;95;-2120.148,468.3033;Inherit;False;Property;_RotationSpeed;Rotation Speed;7;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;110;-1755.792,546.1597;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1E-05;False;2;FLOAT;1.99999;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;100;-1896.309,472.7872;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;97;-1747.945,467.8655;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;40;-584.8727,-90.20881;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;39;-331.6754,-89.31384;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-231.6643,716.7579;Inherit;False;Constant;_null;null;25;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;62;-184.0796,402.3304;Inherit;True;Property;_AlphaMaskRA;Alpha Mask (R, A);15;0;Create;True;0;0;0;False;1;Space(15);False;-1;None;e77f207a8f594e84e836a20f235e5a1e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;120;-29.82721,326.6636;Inherit;False;Property;_Alpha;Alpha;17;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;118;354.613,75.97093;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.CommentaryNode;43;945.8884,-535.7718;Inherit;False;670.9946;746.3742;custom properties;9;58;56;55;54;53;52;50;48;47;;1,1,1,1;0;0
Node;AmplifyShaderEditor.IntNode;56;1289.181,-328.8636;Inherit;False;Property;_StencilFail;StencilFail;28;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;233.0255,-285.4054;Float;False;Property;_Offset;Offset;3;0;Create;True;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;-300;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;55;1292.893,-402.2057;Inherit;False;Property;_StencilOp;StencilOp;27;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;970.0344,-473.672;Half;False;Property;_StencilRef;Stencil ID;23;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;47;961.8544,-305.1056;Half;False;Property;_WriteMask;WriteMask;24;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;48;1268.18,-473.864;Inherit;False;Property;_StencilComparison;Stencil Comparison;26;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;45;194.5435,-462.7938;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);1;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;49;496.5614,-382.126;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;53;1288.181,-253.8636;Inherit;False;Property;_StencilZFail;StencilZFail;29;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;1243.89,-91.0233;Inherit;False;Property;_DstBlend;Destination Blend (Zero);21;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;191.4724,-374.7302;Float;False;Property;_ZTestMode;ZTestMode (LEqual);2;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;54;962.8544,-387.6826;Half;False;Property;_ReadMask;ReadMask;25;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;981.3415,-92.59331;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);20;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Advanced  .);False;3;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;117;-44.73941,130.2318;Float;False;Global;_ADBGrabAlt;ADBGrabAlt;-1;0;Create;True;0;0;0;False;0;False;Object;-1;True;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenColorNode;8;-50.00999,-50.00227;Float;False;Global;_ADBGrab;ADBGrab;-1;0;Create;True;0;0;0;False;0;False;Object;-1;True;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;116;125.8277,70.37732;Inherit;False;Property;_GrabPassAltName;GrabPass AltName;22;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Original;Alternative;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;123;-56.82617,597.2778;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;124;-256.3678,589.6075;Inherit;False;Property;_FadetoAlpha;Fade to Alpha;18;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;42;-1331.643,554.1417;Inherit;True;Standard;WorldNormal;ViewDir;True;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;113;-2294.684,797.5726;Inherit;True;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalizeNode;112;-1962.653,757.816;Inherit;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;114;-1979.201,588.6818;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;73;-1050.034,553.2642;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;109;-1882.625,674.6719;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;72;-905.3527,549.4926;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;136;-1001.679,649.2364;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-1711.053,787.5287;Inherit;False;Property;_Scale;Scale;11;0;Create;True;0;0;0;False;1;;False;1;1.22;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-1715.055,861.9288;Inherit;False;Property;_Power;Power;12;0;Create;True;0;0;0;False;0;False;1;0.29;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-188.3438,40.34929;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Compare;68;-368.7643,181.378;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;126;-970.1429,420.2647;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-926.1461,363.0884;Inherit;False;Property;_MasktoDistortion;Mask to Distortion;19;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-354.6607,49.64957;Float;False;Property;_UseFresnel;Use Fresnel;10;0;Create;True;0;0;0;False;3;Toggle(_);Header(Edge Fade);;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;93;-693.7206,39.76228;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;137;-522.0836,121.3231;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;139;-662.3884,159.0329;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;129;-692.3538,345.3293;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;96;-2330.451,292.3601;Inherit;False;0;29;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;143;-2363.192,183.1084;Inherit;False;Matcap (legacy);-1;;6;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;142;-1794.881,287.1295;Inherit;False;Property;_UseAsMatcap;Use As Matcap;5;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;144;-712.9667,896.1378;Inherit;False;0;62;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;145;-749.5133,793.2288;Inherit;False;Matcap (legacy);-1;;8;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;128;-850.3599,235.1027;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;36;-230.2776,179.7012;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;98;-1512.376,300.2712;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;140;-875.4448,105.3791;Float;False;Property;_Multiply;Multiply;14;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-977.3791,257.9172;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;111;-1525.107,529.0168;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-1445.712,418.0897;Float;False;Property;_Distortion;Distortion;6;0;Create;True;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;29;-1261.874,283.4409;Inherit;True;Property;_Normal;Normal;4;0;Create;True;0;0;0;False;2;Space(10);Header(. Distortion .);False;-1;None;9fa2cdd34fdea504a9252424b5454664;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;146;-426.6876,492.4836;Inherit;False;Property;_UseAsMatcap1;Use As Matcap;16;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;138;-863.083,-13.45079;Float;False;Property;_IncludeDistort;Include Distort;13;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-1718.345,180.4198;Inherit;False;Property;_DistanceFalloff;Distance Falloff;9;0;Create;True;0;0;0;False;0;False;1;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;168.2131,332.3158;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;295.8955,290.9619;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;121;420.44,272.6;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;133;342.8331,408.5667;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;135;438.9707,457.2929;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;41;787.0394,82.10645;Float;False;True;-1;2;ASEMaterialInspector;100;5;.GenesisAria/DistortBasic Transparent;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;1;1;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;255;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;7;True;_StencilComparison;1;True;_StencilOp;1;True;_StencilFail;1;True;_StencilZFail;7;False;;1;False;;1;False;;1;False;;False;True;2;True;_ZWriteMode;True;3;True;_ZTestMode;True;False;0;False;;0;False;;True;2;RenderType=Opaque=RenderType;Queue=Overlay=Queue=28767;True;6;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.DynamicAppendNode;63;475.1733,82.44327;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClipNode;175;616.3397,81.50348;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0.001;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;165;-2223.224,63.23304;Inherit;False;View Distance;-1;;7061;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,1,17,0;1;9;INT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;172;-1756.109,9.080879;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;173;-1575.131,9.461983;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;164;-1307.524,10.86182;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;20;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;174;-1432.637,11.81733;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-2029.367,-63.97797;Inherit;False;Property;_DistanceFade;Distance Fade;8;0;Create;False;0;0;0;False;0;False;0;150;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;176;-1163.844,-22.75626;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;147;-1129.895,-28.87525;Inherit;True;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;178;-870.2308,-159.0202;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;180;551.6568,-74.96343;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
WireConnection;110;0;114;0
WireConnection;100;0;95;0
WireConnection;97;0;100;0
WireConnection;39;0;40;0
WireConnection;62;1;146;0
WireConnection;118;0;8;0
WireConnection;117;0;30;0
WireConnection;8;0;30;0
WireConnection;116;1;8;0
WireConnection;116;0;117;0
WireConnection;123;0;124;0
WireConnection;123;2;126;0
WireConnection;123;3;125;0
WireConnection;123;4;125;0
WireConnection;42;0;111;0
WireConnection;42;4;112;0
WireConnection;42;2;60;0
WireConnection;42;3;61;0
WireConnection;112;0;113;0
WireConnection;114;0;115;0
WireConnection;114;1;113;0
WireConnection;73;0;42;0
WireConnection;109;0;115;0
WireConnection;72;0;73;0
WireConnection;136;0;42;0
WireConnection;30;0;39;0
WireConnection;30;1;36;0
WireConnection;68;0;67;0
WireConnection;68;2;137;0
WireConnection;68;3;128;0
WireConnection;126;0;164;0
WireConnection;93;0;128;0
WireConnection;93;1;72;0
WireConnection;137;0;138;0
WireConnection;137;2;139;0
WireConnection;137;3;93;0
WireConnection;139;0;93;0
WireConnection;139;1;140;0
WireConnection;139;2;136;0
WireConnection;129;0;134;0
WireConnection;129;2;135;0
WireConnection;142;1;96;0
WireConnection;142;0;143;0
WireConnection;128;1;32;0
WireConnection;128;2;129;0
WireConnection;36;0;68;0
WireConnection;98;0;142;0
WireConnection;98;2;97;0
WireConnection;32;0;147;0
WireConnection;32;1;29;0
WireConnection;111;0;110;0
WireConnection;111;2;115;0
WireConnection;111;3;115;0
WireConnection;111;4;109;0
WireConnection;29;1;98;0
WireConnection;29;5;31;0
WireConnection;146;1;144;0
WireConnection;146;0;145;0
WireConnection;64;0;120;0
WireConnection;64;1;62;1
WireConnection;64;2;123;0
WireConnection;132;0;118;3
WireConnection;132;1;64;0
WireConnection;121;0;132;0
WireConnection;133;0;64;0
WireConnection;135;0;133;0
WireConnection;41;0;175;0
WireConnection;63;0;118;0
WireConnection;63;1;118;1
WireConnection;63;2;118;2
WireConnection;63;3;121;0
WireConnection;175;0;63;0
WireConnection;175;1;180;0
WireConnection;172;0;165;0
WireConnection;172;2;88;0
WireConnection;173;0;172;0
WireConnection;164;0;174;0
WireConnection;164;1;90;0
WireConnection;174;0;173;0
WireConnection;176;0;88;0
WireConnection;147;0;176;0
WireConnection;147;3;164;0
WireConnection;178;0;147;0
WireConnection;180;0;178;0
ASEEND*/
//CHKSM=1E0C92B397733455B6320022930B8490AF5117E7
