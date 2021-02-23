// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/DistortBasic Transparent"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[Toggle]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space(5)]_Offset("Offset", Float) = -300
		[Space(10)][Header(. Distortion .)]_Normal("Normal", 2D) = "bump" {}
		_Distortion("Distortion", Range( 0 , 1)) = 0.292
		_DistanceFade("Distance Fade", Float) = 0
		_DistanceFalloff("Distance Falloff", Float) = 1
		[Toggle(_)][Header(Edge Fade)]_UseFresnel("Use Fresnel", Float) = 0
		_Scale("Scale", Range( 0 , 2)) = 1
		_Power("Power", Range( 0 , 10)) = 1
		[Space(15)]_AlphaMask("Alpha Mask", 2D) = "white" {}
		[Toggle][Space (5)]_AlphaToCoverage("AlphaToCoverage (override alpha)", Float) = 0
		_Cutoff("Alpha Cutoff", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Advanced  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (Zero)", Float) = 10
		[Space(5)][Header(Stencil)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask", Float) = 0
		_ReadMask("ReadMask", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		_RotationSpeed("Rotation Speed", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" "Queue"="Overlay+28767" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask [_AlphaToCoverage]
		Cull Back
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
		
		GrabPass{ }

		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
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

			uniform half _StencilRef;
			uniform int _StencilComparison;
			uniform float _ZTestMode;
			uniform float _Offset;
			uniform int _StencilFail;
			uniform half _WriteMask;
			uniform int _Culling;
			uniform int _StencilOp;
			uniform float _SrcBlend;
			uniform float _AlphaToCoverage;
			uniform float _Cutoff;
			uniform half _ReadMask;
			uniform int _StencilZFail;
			uniform float _ZWriteMode;
			uniform float _DstBlend;
			ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
			uniform float _UseFresnel;
			uniform float _Distortion;
			uniform sampler2D _Normal;
			uniform float _RotationSpeed;
			uniform float _DistanceFade;
			uniform float _DistanceFalloff;
			uniform float _Scale;
			uniform float _Power;
			uniform sampler2D _AlphaMask;
			uniform float4 _AlphaMask_ST;
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
				float3 temp_output_32_0 = ( _Distortion * UnpackNormal( tex2D( _Normal, rotator98 ) ) * pow( ( distance( WorldPosition , _WorldSpaceCameraPos ) / _DistanceFade ) , _DistanceFalloff ) );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float fresnelNdotV42 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode42 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV42, _Power ) );
				float4 screenColor8 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( (ase_grabScreenPosNorm).xy + (( _UseFresnel == 1.0 ? ( temp_output_32_0 * ( 1.0 - saturate( fresnelNode42 ) ) ) : temp_output_32_0 )).xy ));
				float2 uv_AlphaMask = i.ase_texcoord2.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
				float4 appendResult63 = (float4(screenColor8.r , screenColor8.g , screenColor8.b , ( screenColor8.a * tex2D( _AlphaMask, uv_AlphaMask ).a )));
				
				
				finalColor = appendResult63;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18713
226;34;1356;811;2390.665;177.4623;1.3;True;False
Node;AmplifyShaderEditor.RangedFloatNode;95;-2120.148,468.3033;Inherit;False;Property;_RotationSpeed;Rotation Speed;23;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;85;-1923.662,-0.8836316;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceCameraPos;86;-1955.816,163.2846;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleDivideOpNode;100;-1896.309,472.7872;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;97;-1747.945,467.8655;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-1629.891,592.3681;Inherit;False;Property;_Scale;Scale;9;0;Create;True;0;0;0;False;1;;False;1;1.35;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-1624.245,187.6082;Inherit;False;Property;_DistanceFade;Distance Fade;6;0;Create;True;0;0;0;False;0;False;0;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;87;-1593.561,79.01634;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;96;-1858.55,339.2964;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;61;-1632.391,666.7681;Inherit;False;Property;_Power;Power;10;0;Create;True;0;0;0;False;0;False;1;0.6;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-1378.831,191.5309;Inherit;False;Property;_DistanceFalloff;Distance Falloff;7;0;Create;True;0;0;0;False;0;False;1;-0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;89;-1366.504,81.72206;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;98;-1517.992,313.7492;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FresnelNode;42;-1321.979,529.9811;Inherit;False;Standard;WorldNormal;ViewDir;True;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;91;-1087.883,182.3871;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;73;-1095.108,529.3201;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;29;-1217.535,272.53;Inherit;True;Property;_Normal;Normal;4;0;Create;True;0;0;0;False;2;Space(10);Header(. Distortion .);False;-1;None;302951faffe230848aa0d3df7bb70faa;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;31;-1141.173,10.75097;Float;False;Property;_Distortion;Distortion;5;0;Create;True;0;0;0;False;0;False;0.292;0.292;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-786.5411,290.5171;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;72;-951.9291,524.046;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-535.5635,128.847;Float;False;Property;_UseFresnel;Use Fresnel;8;0;Create;True;0;0;0;False;3;Toggle(_);Header(Edge Fade);;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;93;-568.5234,232.9597;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GrabScreenPosition;40;-484.9755,-87.71138;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;68;-338.567,238.7755;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;36;-174.5805,225.0987;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;39;-231.7782,-86.81641;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;36.62508,137.2995;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;62;36.92036,359.3304;Inherit;True;Property;_AlphaMask;Alpha Mask;11;0;Create;True;0;0;0;False;1;Space(15);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenColorNode;8;224.0004,85.8997;Float;False;Global;_ScreenGrab0;Screen Grab 0;-1;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;1;0;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;43;945.8884,-535.7718;Inherit;False;670.9946;746.3742;custom properties;9;58;56;55;54;53;52;50;48;47;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;419.2131,284.3158;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;981.3415,-92.59331;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);14;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Advanced  .);False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;1243.89,-91.0233;Inherit;False;Property;_DstBlend;Destination Blend (Zero);15;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;191.4724,-374.7302;Float;False;Property;_ZTestMode;ZTestMode (LEqual);2;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;45;194.5435,-462.7938;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);1;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;53;1288.181,-253.8636;Inherit;False;Property;_StencilZFail;StencilZFail;22;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;54;962.8544,-387.6826;Half;False;Property;_ReadMask;ReadMask;18;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;233.0255,-285.4054;Float;False;Property;_Offset;Offset;3;0;Create;True;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;-300;-300;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;56;1289.181,-328.8636;Inherit;False;Property;_StencilFail;StencilFail;21;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;44;541.2246,-503.839;Inherit;False;Property;_Cutoff;Alpha Cutoff;13;0;Create;False;0;0;0;True;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;49;496.5614,-382.126;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;63;516.1733,99.44327;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.IntNode;48;1268.18,-473.864;Inherit;False;Property;_StencilComparison;Stencil Comparison;19;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;47;961.8544,-305.1056;Half;False;Property;_WriteMask;WriteMask;17;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;970.0344,-473.672;Half;False;Property;_StencilRef;Stencil ID;16;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;57;453.8947,-288.6607;Inherit;False;Property;_AlphaToCoverage;AlphaToCoverage (override alpha);12;1;[Toggle];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;55;1292.893,-402.2057;Inherit;False;Property;_StencilOp;StencilOp;20;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;41;701.0917,99.31697;Float;False;True;-1;2;ASEMaterialInspector;100;1;.GenesisAria/DistortBasic Transparent;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;True;0;True;57;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;True;255;True;52;255;True;54;255;True;47;7;True;48;1;True;55;1;True;56;1;True;53;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;True;45;True;3;True;46;True;False;0;False;-1;0;False;-1;True;2;RenderType=Opaque=RenderType;Queue=Overlay=Queue=28767;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;100;0;95;0
WireConnection;97;0;100;0
WireConnection;87;0;85;0
WireConnection;87;1;86;0
WireConnection;89;0;87;0
WireConnection;89;1;88;0
WireConnection;98;0;96;0
WireConnection;98;2;97;0
WireConnection;42;2;60;0
WireConnection;42;3;61;0
WireConnection;91;0;89;0
WireConnection;91;1;90;0
WireConnection;73;0;42;0
WireConnection;29;1;98;0
WireConnection;32;0;31;0
WireConnection;32;1;29;0
WireConnection;32;2;91;0
WireConnection;72;0;73;0
WireConnection;93;0;32;0
WireConnection;93;1;72;0
WireConnection;68;0;67;0
WireConnection;68;2;93;0
WireConnection;68;3;32;0
WireConnection;36;0;68;0
WireConnection;39;0;40;0
WireConnection;30;0;39;0
WireConnection;30;1;36;0
WireConnection;8;0;30;0
WireConnection;64;0;8;4
WireConnection;64;1;62;4
WireConnection;63;0;8;1
WireConnection;63;1;8;2
WireConnection;63;2;8;3
WireConnection;63;3;64;0
WireConnection;41;0;63;0
ASEEND*/
//CHKSM=D1A92184DAE5F01542A1A1B0A4E6BE703CE5F2A3