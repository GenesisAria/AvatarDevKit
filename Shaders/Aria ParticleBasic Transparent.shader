// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/ParticleBasic Transparent"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[Toggle]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 0
		[Space(5)]_Offset("Offset", Float) = -300
		_DistanceOffset("Distance Offset", Range( -10 , 10)) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Toggle][Space (5)]_AlphaToCoverage("AlphaToCoverage (override alpha)", Float) = 0
		_Cutoff("Alpha Cutoff", Float) = 0
		_Emission("Emission", 2D) = "black" {}
		[HDR]_Colour("Colour", Color) = (1,1,1,1)
		_TexSaturation("Tex Saturation", Range( 0 , 2)) = 1
		[Toggle(_)][Space(10)][Header(. Use Particle Vertex Stream .)][Header(requires vertex stream centre)]_VertexStream("Vertex Stream", Float) = 0
		[Toggle(_)][Space(20)]_DistanceScale("Distance Scale", Float) = 0
		_DistanceFalloff("Distance Falloff", Range( 0 , 1)) = 0.5
		_DistanceValue("Distance Value", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Advanced  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (Zero)", Float) = 10
		[Space(5)][Header(Stencil)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask", Float) = 0
		_ReadMask("ReadMask", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" "Queue"="Transparent" }
	LOD 100

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		AlphaToMask [_AlphaToCoverage]
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
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_VERT_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _StencilRef;
			uniform int _StencilZFail;
			uniform int _StencilFail;
			uniform int _StencilComparison;
			uniform float _ZWriteMode;
			uniform int _StencilOp;
			uniform half _ReadMask;
			uniform float _Cutoff;
			uniform float _AlphaToCoverage;
			uniform int _Culling;
			uniform half _WriteMask;
			uniform float _ZTestMode;
			uniform float _SrcBlend;
			uniform float _DstBlend;
			uniform float _Offset;
			uniform float _VertexStream;
			uniform float _DistanceOffset;
			uniform float _DistanceScale;
			uniform float _DistanceValue;
			uniform float _DistanceFalloff;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;
			uniform float _TexSaturation;
			uniform float4 _Colour;
			float3 CenterEye1_g11(  )
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

				float3 appendResult322 = (float3(v.ase_texcoord.z , v.ase_texcoord.w , v.ase_texcoord1.x));
				float4 appendResult349 = (float4(( v.vertex.xyz - appendResult322 ) , 1.0));
				float4 transform346 = mul(unity_ObjectToWorld,( _VertexStream == 1.0 ? appendResult349 : float4( 0,0,0,1 ) ));
				float3 localCenterEye1_g11 = CenterEye1_g11();
				float clampResult332 = clamp( distance( transform346 , float4( localCenterEye1_g11 , 0.0 ) ) , -999999.0 , 0.5 );
				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				float3 temp_output_4_0_g11 = ( localCenterEye1_g11 - ase_worldPos );
				float3 normalizeResult5_g11 = normalize( temp_output_4_0_g11 );
				float4 appendResult252 = (float4(v.ase_texcoord.z , v.ase_texcoord.w , v.ase_texcoord1.x , 1.0));
				float4 transform86 = mul(unity_ObjectToWorld,( _VertexStream == 1.0 ? appendResult252 : float4( 0,0,0,1 ) ));
				float3 localCenterEye1_g9 = CenterEye1_g9();
				float temp_output_112_0 = ( 1.0 - pow( ( distance( transform86 , float4( localCenterEye1_g9 , 0.0 ) ) / ( _DistanceValue / 10.0 ) ) , _DistanceFalloff ) );
				float3 appendResult73 = (float3(v.ase_texcoord.z , v.ase_texcoord.w , v.ase_texcoord1.x));
				float4 transform83 = mul(unity_ObjectToWorld,float4( ( _DistanceScale == 1.0 ? ( temp_output_112_0 * ( appendResult73 - v.vertex.xyz ) ) : float3( 0,0,0 ) ) , 0.0 ));
				float4 transform131 = mul(unity_ObjectToWorld,float4( ( _DistanceScale == 1.0 ? ( temp_output_112_0 * v.vertex.xyz ) : float3( 0,0,0 ) ) , 0.0 ));
				
				o.ase_texcoord1 = v.ase_texcoord;
				o.ase_color = v.color;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = ( ( clampResult332 * ( transform346 + float4( ( -normalizeResult5_g11 * _DistanceOffset ) , 0.0 ) ) ) + ( _VertexStream == 1.0 ? transform83 : transform131 ) ).xyz;
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
				float2 uv_Emission = i.ase_texcoord1.xy * _Emission_ST.xy + _Emission_ST.zw;
				float4 tex2DNode26 = tex2D( _Emission, uv_Emission );
				float3 desaturateInitialColor49 = tex2DNode26.rgb;
				float desaturateDot49 = dot( desaturateInitialColor49, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar49 = lerp( desaturateInitialColor49, desaturateDot49.xxx, ( 1.0 - _TexSaturation ) );
				float4 appendResult90 = (float4(desaturateVar49 , tex2DNode26.a));
				
				
				finalColor = ( appendResult90 * _Colour * i.ase_color );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18713
189;97;1552;820;1952.19;208.9104;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;110;-1470.242,530.6772;Float;False;Property;_VertexStream;Vertex Stream;10;0;Create;True;0;0;0;False;4;Toggle(_);Space(10);Header(. Use Particle Vertex Stream .);Header(requires vertex stream centre);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;250;-2829.387,407.9785;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;251;-2829.313,576.2036;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;343;-1316.695,611.636;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;252;-2568.196,516.7235;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;344;-2398.3,444.1053;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;257;-2392.733,475.3961;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;340;-2221.31,725.3951;Inherit;False;VR_Center_Eye;-1;;9;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,1;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.TexCoordVertexDataNode;320;-2517.415,120.1065;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;113;-2115.715,840.7001;Inherit;False;Property;_DistanceValue;Distance Value;14;0;Create;True;0;0;0;False;2;;;False;1;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;86;-2225.034,550.7049;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;319;-2517.491,-48.11761;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;322;-2259.299,61.62659;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DistanceOpNode;6;-1960.174,692.3057;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;129;-1863.826,822.9081;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;321;-2290.536,-98.70592;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-1879.702,607.5383;Inherit;False;Property;_DistanceFalloff;Distance Falloff;13;0;Create;True;0;0;0;False;2;;;False;0.5;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;323;-2092.492,41.4826;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;107;-1691.312,745.5351;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;71;-1858.162,1107.403;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;72;-1858.087,1275.627;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;347;-1316.242,505.4537;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;8;-1498.166,761.5735;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;348;-1772.532,172.3329;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;73;-1599.971,1217.147;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;64;-1841.629,951.9661;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;349;-1933.745,48.8844;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;112;-1312.248,807.9111;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;135;-1276.262,1092.279;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;342;-1550.016,195.2635;Inherit;False;VR_Center_Eye;-1;;11;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;0;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.Compare;345;-1751.71,4.469783;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.NegateNode;325;-1007.748,202.522;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;56;-1024.168,1067.955;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;346;-1549.061,12.38536;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;15;-1073.228,707.131;Float;False;Property;_DistanceScale;Distance Scale;12;0;Create;True;0;0;0;False;2;Toggle(_);Space(20);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;-1037.059,820.5901;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-1247.605,-906.1021;Inherit;False;Property;_TexSaturation;Tex Saturation;9;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;331;-1113.385,318.9916;Inherit;False;Property;_DistanceOffset;Distance Offset;3;0;Create;True;0;0;0;False;0;False;0;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;130;-793.3478,749.7662;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;17;-797.0635,1033.88;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;26;-1209.323,-807.8506;Inherit;True;Property;_Emission;Emission;7;0;Create;True;0;0;0;False;0;False;-1;None;0f755f784aa7fa44d996cb6f2cd7faa2;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;51;-965.9497,-898.2785;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;336;-959.1148,-64.88828;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;327;-729.3476,138.1968;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;49;-802.6777,-784.9252;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;329;-575.9276,59.86275;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClampOpNode;332;-611.0515,-66.69702;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;-999999;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;83;-550.3981,1019.517;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;131;-585.1254,655.9921;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;330;-451.2906,-59.08752;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.VertexColorNode;89;-732.5992,-498.1979;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;90;-605.5485,-688.6116;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;24;658.2055,-653.5679;Inherit;False;670.9946;746.3742;custom properties;9;41;40;39;36;35;34;33;32;30;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;47;-930.727,-619.8944;Inherit;False;Property;_Colour;Colour;8;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;109;-220.005,576.504;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;188;-257.1982,-86.5078;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CustomExpressionNode;303;-1910.027,-899.4671;Float;False;float3 zaxis = normalize(target.xyz)@$float3 xaxis = normalize(cross(up, zaxis))@$float3 yaxis = cross(zaxis, xaxis)@$float4x4 lookMatrix = float4x4(xaxis.x, yaxis.x, zaxis.x, 0,xaxis.y, yaxis.y, zaxis.y, 0, xaxis.z, yaxis.z, zaxis.z, 0, 0, 0, 0, 1)@$return lookMatrix@$;6;False;2;True;target;FLOAT3;0,0,0;In;;Float;False;True;up;FLOAT3;0,0,0;In;;Float;False;GenerateLookMatrix;True;False;0;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4x4;0
Node;AmplifyShaderEditor.RangedFloatNode;36;674.1716,-422.9014;Half;False;Property;_WriteMask;WriteMask;18;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;318;-1498.486,-482.1581;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;311;-3261.597,-574.9796;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;28;-96.21051,-492.5261;Float;False;Property;_ZTestMode;ZTestMode (LEqual);4;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;312;-3003.406,-465.2354;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;299;-2236.304,-959.96;Float;False;float3 centerEye = _WorldSpaceCameraPos.xyz@ $#if UNITY_SINGLE_PASS_STEREO $int startIndex = unity_StereoEyeIndex@ $unity_StereoEyeIndex = 0@ $float3 leftEye = _WorldSpaceCameraPos@ $unity_StereoEyeIndex = 1@ $float3 rightEye = _WorldSpaceCameraPos@$unity_StereoEyeIndex = startIndex@$centerEye = lerp(leftEye, rightEye, 0.5)@$#endif $float3 cam = mul(unity_WorldToObject, float4(centerEye, 1)).xyz@$return cam@;3;False;1;True;up;FLOAT3;0,0,0;In;;Float;False;Get Local Camera Position;True;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;30;693.6586,-210.3892;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);15;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Advanced  .);False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;310;-3261.522,-406.7555;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;38;208.8784,-499.9218;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;313;-2121.191,-613.3134;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;40;956.207,-208.8192;Inherit;False;Property;_DstBlend;Destination Blend (Zero);16;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;291;-2376.87,-881.201;Inherit;False;Property;_FixMeshAxis;Fix Mesh Axis;11;1;[Enum];Create;True;0;2;Y up;0;Z up;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-430.1625,-545.957;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-54.65745,-403.2013;Float;False;Property;_Offset;Offset;2;0;Create;True;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;-300;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;295;-2148.659,-817.8072;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;301;-1853.997,-629.2496;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode;283;-3027.175,-655.4373;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;34;681.3515,-591.4679;Half;False;Property;_StencilRef;Stencil ID;17;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;32;1000.498,-371.6595;Inherit;False;Property;_StencilZFail;StencilZFail;23;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;35;1001.498,-446.6595;Inherit;False;Property;_StencilFail;StencilFail;22;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;33;980.4976,-591.66;Inherit;False;Property;_StencilComparison;Stencil Comparison;20;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-93.13947,-580.5897;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);1;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;287;-2406.365,-625.7444;Float;False;Constant;_Vector2;Vector 2;3;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;305;-1581.429,-673.4396;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Vector3Node;293;-2549.229,-971.985;Float;False;Constant;_Vector7;Vector 7;18;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;289;-2405.531,-785.7103;Float;False;Constant;_Vector0;Vector 0;3;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;37;166.2117,-406.4566;Inherit;False;Property;_AlphaToCoverage;AlphaToCoverage (override alpha);5;1;[Toggle];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;675.1716,-505.4785;Half;False;Property;_ReadMask;ReadMask;19;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;233.5417,-637.6351;Inherit;False;Property;_Cutoff;Alpha Cutoff;6;0;Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;309;-2836.597,-485.3794;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;39;1005.21,-519.0016;Inherit;False;Property;_StencilOp;StencilOp;21;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;58.44572,-252.5463;Float;False;True;-1;2;ASEMaterialInspector;100;1;.GenesisAria/ParticleBasic Transparent;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;1;1;True;30;0;True;40;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;True;0;True;37;True;0;True;38;True;True;True;True;True;0;False;-1;False;False;False;True;True;255;True;34;255;True;41;255;True;36;7;True;33;1;True;39;1;True;35;1;True;32;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;29;True;3;True;28;True;True;0;True;91;0;False;-1;True;2;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;7;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;343;0;110;0
WireConnection;252;0;250;3
WireConnection;252;1;250;4
WireConnection;252;2;251;1
WireConnection;344;0;343;0
WireConnection;257;0;344;0
WireConnection;257;2;252;0
WireConnection;86;0;257;0
WireConnection;322;0;319;3
WireConnection;322;1;319;4
WireConnection;322;2;320;1
WireConnection;6;0;86;0
WireConnection;6;1;340;0
WireConnection;129;0;113;0
WireConnection;323;0;321;0
WireConnection;323;1;322;0
WireConnection;107;0;6;0
WireConnection;107;1;129;0
WireConnection;347;0;110;0
WireConnection;8;0;107;0
WireConnection;8;1;5;0
WireConnection;348;0;347;0
WireConnection;73;0;71;3
WireConnection;73;1;71;4
WireConnection;73;2;72;1
WireConnection;349;0;323;0
WireConnection;112;0;8;0
WireConnection;135;0;73;0
WireConnection;135;1;64;0
WireConnection;345;0;348;0
WireConnection;345;2;349;0
WireConnection;325;0;342;2
WireConnection;56;0;112;0
WireConnection;56;1;135;0
WireConnection;346;0;345;0
WireConnection;132;0;112;0
WireConnection;132;1;64;0
WireConnection;130;0;15;0
WireConnection;130;2;132;0
WireConnection;17;0;15;0
WireConnection;17;2;56;0
WireConnection;51;0;50;0
WireConnection;336;0;346;0
WireConnection;336;1;342;0
WireConnection;327;0;325;0
WireConnection;327;1;331;0
WireConnection;49;0;26;0
WireConnection;49;1;51;0
WireConnection;329;0;346;0
WireConnection;329;1;327;0
WireConnection;332;0;336;0
WireConnection;83;0;17;0
WireConnection;131;0;130;0
WireConnection;330;0;332;0
WireConnection;330;1;329;0
WireConnection;90;0;49;0
WireConnection;90;3;26;4
WireConnection;109;0;110;0
WireConnection;109;2;83;0
WireConnection;109;3;131;0
WireConnection;188;0;330;0
WireConnection;188;1;109;0
WireConnection;303;0;299;0
WireConnection;303;1;295;0
WireConnection;318;0;309;0
WireConnection;312;0;311;3
WireConnection;312;1;311;4
WireConnection;312;2;310;1
WireConnection;299;0;293;0
WireConnection;313;0;309;0
WireConnection;48;0;90;0
WireConnection;48;1;47;0
WireConnection;48;2;89;0
WireConnection;295;0;291;0
WireConnection;295;2;289;0
WireConnection;295;3;287;0
WireConnection;301;0;313;0
WireConnection;301;1;313;1
WireConnection;305;0;303;0
WireConnection;305;1;301;0
WireConnection;309;0;283;0
WireConnection;309;1;312;0
WireConnection;0;0;48;0
WireConnection;0;1;188;0
ASEEND*/
//CHKSM=E3BABB23E8AB1E0032E07FD94E3B684A6471DFBE