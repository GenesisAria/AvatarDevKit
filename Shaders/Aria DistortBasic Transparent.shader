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
		_Distortion("Distortion", Range( 0 , 1)) = 0.292
		_DistanceFade("Distance Fade", Float) = 0
		_DistanceFalloff("Distance Falloff", Float) = 1
		_RotationSpeed("Rotation Speed", Float) = 0
		[Toggle(_)][Header(Edge Fade)]_UseFresnel("Use Fresnel", Float) = 0
		_Scale("Scale", Range( 0 , 2)) = 1
		_Power("Power", Range( 0 , 10)) = 1
		[Space(15)]_AlphaMaskRA("Alpha Mask (R, A)", 2D) = "white" {}
		_Alpha("Alpha", Float) = 1
		[ToggleUI]_FadetoAlpha("Fade to Alpha", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Advanced  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 3
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (Zero)", Float) = 1
		[Space(5)][Header(Stencil)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask", Float) = 255
		_ReadMask("ReadMask", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

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
			#define ASE_NEEDS_FRAG_WORLD_POSITION


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
			uniform float _Distortion;
			uniform sampler2D _Normal;
			uniform float _RotationSpeed;
			uniform float _DistanceFade;
			uniform float _DistanceFalloff;
			uniform float _Scale;
			uniform float _Power;
			uniform float _Alpha;
			uniform sampler2D _AlphaMaskRA;
			uniform float4 _AlphaMaskRA_ST;
			uniform float _FadetoAlpha;
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
			
			float3 CenterEye1_g3(  )
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
				float2 texCoord96 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime97 = _Time.y * ( _RotationSpeed / 4.0 );
				float cos98 = cos( mulTime97 );
				float sin98 = sin( mulTime97 );
				float2 rotator98 = mul( texCoord96 - float2( 0.5,0.5 ) , float2x2( cos98 , -sin98 , sin98 , cos98 )) + float2( 0.5,0.5 );
				float3 localCenterEye1_g3 = CenterEye1_g3();
				float temp_output_4_0_g2 = distance( WorldPosition , ( (float)1 == 0.0 ? localCenterEye1_g3 : _WorldSpaceCameraPos ) );
				float temp_output_91_0 = pow( ( saturate( temp_output_4_0_g2 ) / _DistanceFade ) , _DistanceFalloff );
				float3 temp_output_32_0 = ( _Distortion * UnpackNormal( tex2D( _Normal, rotator98 ) ) * temp_output_91_0 );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult112 = normalize( ase_worldViewDir );
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float dotResult114 = dot( ase_worldNormal , ase_worldViewDir );
				float clampResult110 = clamp( dotResult114 , 1E-05 , 1.99999 );
				float3 ifLocalVar111 = 0;
				if( clampResult110 < 0.0 )
				ifLocalVar111 = -ase_worldNormal;
				float fresnelNdotV42 = dot( normalize( ifLocalVar111 ), normalizeResult112 );
				float fresnelNode42 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV42, _Power ) );
				float2 temp_output_30_0 = ( (ase_grabScreenPosNorm).xy + (( _UseFresnel == 1.0 ? ( temp_output_32_0 * ( 1.0 - saturate( fresnelNode42 ) ) ) : temp_output_32_0 )).xy );
				float4 screenColor8 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_ADBGrab,temp_output_30_0);
				float4 break118 = screenColor8;
				float2 uv_AlphaMaskRA = i.ase_texcoord2.xy * _AlphaMaskRA_ST.xy + _AlphaMaskRA_ST.zw;
				float4 tex2DNode62 = tex2D( _AlphaMaskRA, uv_AlphaMaskRA );
				float ifLocalVar123 = 0;
				UNITY_BRANCH 
				if( _FadetoAlpha <= 0.0 )
				ifLocalVar123 = 1.0;
				else
				ifLocalVar123 = temp_output_91_0;
				float4 appendResult63 = (float4(break118.r , break118.g , break118.b , saturate( ( break118.a * _Alpha * tex2DNode62.r * tex2DNode62.a * ifLocalVar123 ) )));
				
				
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
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;113;-2258.625,734.4691;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;115;-2273.526,588.2086;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;114;-2034.792,575.1597;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-2120.148,468.3033;Inherit;False;Property;_RotationSpeed;Rotation Speed;8;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;110;-1755.792,546.1597;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1E-05;False;2;FLOAT;1.99999;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;109;-1872.108,658.145;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;100;-1896.309,472.7872;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;104;-1887.666,82.51205;Inherit;False;View Distance;-1;;2;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,0,17,0;1;9;INT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;111;-1519.491,487.4597;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;105;-1537.103,81.32269;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-1712.555,787.5287;Inherit;False;Property;_Scale;Scale;10;0;Create;True;0;0;0;False;1;;False;1;0.85;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;96;-1858.55,339.2964;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;61;-1715.055,861.9288;Inherit;False;Property;_Power;Power;11;0;Create;True;0;0;0;False;0;False;1;0.5;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-1624.245,187.6082;Inherit;False;Property;_DistanceFade;Distance Fade;6;0;Create;True;0;0;0;False;0;False;0;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;97;-1747.945,467.8655;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;112;-1883.022,729.2692;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;98;-1517.992,313.7492;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FresnelNode;42;-1331.643,554.1417;Inherit;False;Standard;WorldNormal;ViewDir;True;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;89;-1366.504,81.72206;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-1378.831,191.5309;Inherit;False;Property;_DistanceFalloff;Distance Falloff;7;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;91;-1087.883,182.3871;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;73;-1095.108,550.2593;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;29;-1217.535,272.53;Inherit;True;Property;_Normal;Normal;4;0;Create;True;0;0;0;False;2;Space(10);Header(. Distortion .);False;-1;None;1327c15c4c3119941b11ecfe4f6063c4;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;31;-1141.173,10.75097;Float;False;Property;_Distortion;Distortion;5;0;Create;True;0;0;0;False;0;False;0.292;0.292;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;72;-951.9291,544.9852;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-846.4794,290.5171;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;93;-668.4205,230.4623;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-635.4606,126.3496;Float;False;Property;_UseFresnel;Use Fresnel;9;0;Create;True;0;0;0;False;3;Toggle(_);Header(Edge Fade);;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;40;-584.8727,-90.20881;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;68;-438.4642,236.2781;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;36;-274.4776,222.6013;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;39;-331.6754,-89.31384;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-285.8438,52.04929;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;126;-899.9429,420.2647;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-231.6643,716.7579;Inherit;False;Constant;_null;null;25;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;124;-256.3678,589.6075;Inherit;False;Property;_FadetoAlpha;Fade to Alpha;14;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;62;-184.0796,402.3304;Inherit;True;Property;_AlphaMaskRA;Alpha Mask (R, A);12;0;Create;True;0;0;0;False;1;Space(15);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;120;-29.82721,326.6636;Inherit;False;Property;_Alpha;Alpha;13;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;123;-56.82617,597.2778;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;118;354.613,75.97093;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;168.2131,332.3158;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;121;399.1728,277.6636;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;43;945.8884,-535.7718;Inherit;False;670.9946;746.3742;custom properties;9;58;56;55;54;53;52;50;48;47;;1,1,1,1;0;0
Node;AmplifyShaderEditor.IntNode;56;1289.181,-328.8636;Inherit;False;Property;_StencilFail;StencilFail;23;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;233.0255,-285.4054;Float;False;Property;_Offset;Offset;3;0;Create;True;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;-300;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;55;1292.893,-402.2057;Inherit;False;Property;_StencilOp;StencilOp;22;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;970.0344,-473.672;Half;False;Property;_StencilRef;Stencil ID;18;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;161;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;47;961.8544,-305.1056;Half;False;Property;_WriteMask;WriteMask;19;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;48;1268.18,-473.864;Inherit;False;Property;_StencilComparison;Stencil Comparison;21;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;45;194.5435,-462.7938;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);1;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;49;496.5614,-382.126;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;53;1288.181,-253.8636;Inherit;False;Property;_StencilZFail;StencilZFail;24;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;1243.89,-91.0233;Inherit;False;Property;_DstBlend;Destination Blend (Zero);16;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;1;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;191.4724,-374.7302;Float;False;Property;_ZTestMode;ZTestMode (LEqual);2;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;54;962.8544,-387.6826;Half;False;Property;_ReadMask;ReadMask;20;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;981.3415,-92.59331;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);15;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Advanced  .);False;3;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;63;516.1733,99.44327;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;41;701.0917,99.31697;Float;False;True;-1;2;ASEMaterialInspector;100;5;.GenesisAria/DistortBasic Transparent;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;1;1;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;255;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;7;True;_StencilComparison;1;True;_StencilOp;1;True;_StencilFail;1;True;_StencilZFail;7;False;;1;False;;1;False;;1;False;;False;True;2;True;_ZWriteMode;True;3;True;_ZTestMode;True;False;0;False;;0;False;;True;2;RenderType=Opaque=RenderType;Queue=Overlay=Queue=28767;True;6;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.ScreenColorNode;117;-44.73941,130.2318;Float;False;Global;_ADBGrabAlt;ADBGrabAlt;-1;0;Create;True;0;0;0;False;0;False;Object;-1;True;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenColorNode;8;-50.00999,-50.00227;Float;False;Global;_ADBGrab;ADBGrab;-1;0;Create;True;0;0;0;False;0;False;Object;-1;True;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;116;125.8277,70.37732;Inherit;False;Property;_GrabPassAltName;GrabPass AltName;17;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Original;Alternative;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
WireConnection;114;0;115;0
WireConnection;114;1;113;0
WireConnection;110;0;114;0
WireConnection;109;0;115;0
WireConnection;100;0;95;0
WireConnection;111;0;110;0
WireConnection;111;4;109;0
WireConnection;105;0;104;0
WireConnection;97;0;100;0
WireConnection;112;0;113;0
WireConnection;98;0;96;0
WireConnection;98;2;97;0
WireConnection;42;0;111;0
WireConnection;42;4;112;0
WireConnection;42;2;60;0
WireConnection;42;3;61;0
WireConnection;89;0;105;0
WireConnection;89;1;88;0
WireConnection;91;0;89;0
WireConnection;91;1;90;0
WireConnection;73;0;42;0
WireConnection;29;1;98;0
WireConnection;72;0;73;0
WireConnection;32;0;31;0
WireConnection;32;1;29;0
WireConnection;32;2;91;0
WireConnection;93;0;32;0
WireConnection;93;1;72;0
WireConnection;68;0;67;0
WireConnection;68;2;93;0
WireConnection;68;3;32;0
WireConnection;36;0;68;0
WireConnection;39;0;40;0
WireConnection;30;0;39;0
WireConnection;30;1;36;0
WireConnection;126;0;91;0
WireConnection;123;0;124;0
WireConnection;123;2;126;0
WireConnection;123;3;125;0
WireConnection;123;4;125;0
WireConnection;118;0;8;0
WireConnection;64;0;118;3
WireConnection;64;1;120;0
WireConnection;64;2;62;1
WireConnection;64;3;62;4
WireConnection;64;4;123;0
WireConnection;121;0;64;0
WireConnection;63;0;118;0
WireConnection;63;1;118;1
WireConnection;63;2;118;2
WireConnection;63;3;121;0
WireConnection;41;0;63;0
WireConnection;117;0;30;0
WireConnection;8;0;30;0
WireConnection;116;1;8;0
WireConnection;116;0;117;0
ASEEND*/
//CHKSM=0E00738D9FBFB4F5F1D4D41F6BA52DA350A63EBB
