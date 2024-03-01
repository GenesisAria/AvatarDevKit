// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/ParticleDistort Basic Transparent"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling1("Culling (off is doublesided)", Int) = 0
		[ToggleUI]_ZWriteMode1("ZWrite (write to depth buffer)", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode1("ZTestMode (LEqual)", Float) = 4
		_DistanceOffset("Distance Offset", Range( -100 , 100)) = 0
		[Space(5)]_Offset("Offset", Float) = -300
		[Space(10)][Header(. Distortion .)]_Normal("Normal", 2D) = "bump" {}
		_Distortion("Distortion", Range( 0 , 1)) = 0.292
		_DistanceFade1("Distance Fade", Float) = 0
		_DistanceFalloff1("Distance Falloff", Float) = 1
		_RotationSpeed("Rotation Speed", Float) = 0
		_Emission("Emission", 2D) = "black" {}
		[HDR]_Colour("Colour", Color) = (1,1,1,1)
		[Toggle(_)][Header(Edge Fade)]_UseFresnel("Use Fresnel", Float) = 0
		_Scale("Scale", Range( 0 , 2)) = 1
		_TexSaturation("Tex Saturation", Range( 0 , 2)) = 1
		_Power("Power", Range( 0 , 10)) = 1
		[Toggle(_)][Space(10)][Header(. Use Particle Vertex Stream .)][Header(requires vertex stream centre)]_VertexStream("Vertex Stream", Float) = 0
		[Space(15)]_AlphaMask("Alpha Mask", 2D) = "white" {}
		_Alpha("Alpha", Float) = 1
		[ToggleUI]_MasktoDistortion("Mask to Distortion", Float) = 0
		[ToggleUI][Space (5)]_AlphaToCoverage1("AlphaToCoverage (override alpha)", Float) = 0
		[Toggle(_)][Space(20)]_DistanceScale("Distance Scale", Float) = 0
		_DistanceFalloff("Distance Falloff", Range( 0 , 1)) = 0.5
		_DistanceValue("Distance Value", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Advanced  .)]_SrcBlend1("Source Blend (SrcAlpha)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend1("Destination Blend (OneMinusSrcAlpha)", Float) = 10
		[Space(5)][Header(Stencil)]_StencilRef1("Stencil ID", Float) = 0
		_WriteMask1("WriteMask", Float) = 255
		_ReadMask1("ReadMask", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 100

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend1] [_DstBlend1]
		AlphaToMask [_AlphaToCoverage1]
		Cull [_Culling1]
		ColorMask RGBA
		ZWrite [_ZWriteMode1]
		ZTest [_ZTestMode1]
		Offset [_Offset] , 0
		Stencil
		{
			Ref [_StencilRef1]
			ReadMask [_ReadMask1]
			WriteMask [_WriteMask1]
			Comp [_StencilComparison]
			Pass [_StencilOp]
			Fail [_StencilFail]
			ZFail [_StencilZFail]
		}
		
		GrabPass{ "_APDBGrab" }

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
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
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
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _WriteMask1;
			uniform int _StencilOp;
			uniform int _StencilComparison;
			uniform float _AlphaToCoverage1;
			uniform int _StencilFail;
			uniform float _ZWriteMode1;
			uniform float _SrcBlend1;
			uniform half _StencilRef1;
			uniform int _StencilZFail;
			uniform float _Offset;
			uniform float _ZTestMode1;
			uniform float _DstBlend1;
			uniform int _Culling1;
			uniform half _ReadMask1;
			uniform float _DistanceOffset;
			uniform float _VertexStream;
			uniform float _DistanceScale;
			uniform float _DistanceValue;
			uniform float _DistanceFalloff;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;
			uniform float _TexSaturation;
			uniform float4 _Colour;
			ASE_DECLARE_SCREENSPACE_TEXTURE( _APDBGrab )
			uniform float _UseFresnel;
			uniform float _Distortion;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform float _RotationSpeed;
			uniform float _DistanceFade1;
			uniform float _DistanceFalloff1;
			uniform float _MasktoDistortion;
			uniform float _Alpha;
			uniform sampler2D _AlphaMask;
			uniform float4 _AlphaMask_ST;
			uniform float _Scale;
			uniform float _Power;
			float3 CenterEye1_g12(  )
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
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 appendResult124 = (float3(v.ase_texcoord.z , v.ase_texcoord.w , v.ase_texcoord1.x));
				float3 localCenterEye1_g12 = CenterEye1_g12();
				float temp_output_127_0 = distance( appendResult124 , localCenterEye1_g12 );
				float clampResult130 = clamp( ( temp_output_127_0 - _ProjectionParams.y ) , 0.0 , 0.35 );
				float clampResult131 = clamp( temp_output_127_0 , _ProjectionParams.y , 0.05 );
				float4 appendResult52 = (float4(v.ase_texcoord.z , v.ase_texcoord.w , v.ase_texcoord1.x , 1.0));
				float4 transform58 = mul(unity_ObjectToWorld,( _VertexStream == 1.0 ? appendResult52 : float4( 0,0,0,1 ) ));
				float3 localCenterEye1_g9 = CenterEye1_g9();
				float temp_output_75_0 = ( 1.0 - pow( ( distance( transform58 , float4( localCenterEye1_g9 , 0.0 ) ) / ( _DistanceValue / 10.0 ) ) , _DistanceFalloff ) );
				float3 appendResult72 = (float3(v.ase_texcoord.z , v.ase_texcoord.w , v.ase_texcoord1.x));
				float4 transform95 = mul(unity_ObjectToWorld,float4( ( _DistanceScale == 1.0 ? ( temp_output_75_0 * ( appendResult72 - v.vertex.xyz ) ) : float3( 0,0,0 ) ) , 0.0 ));
				float4 transform96 = mul(unity_ObjectToWorld,float4( ( _DistanceScale == 1.0 ? ( temp_output_75_0 * v.vertex.xyz ) : float3( 0,0,0 ) ) , 0.0 ));
				float4 lerpResult121 = lerp( float4( ( -ase_worldViewDir * ( ( clampResult130 * clampResult131 * (0.5 + (temp_output_127_0 - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) ) * _DistanceOffset ) ) , 0.0 ) , ( _VertexStream == 1.0 ? transform95 : transform96 ) , float4( 0.5,0.5,0.5,0.5 ));
				
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord1 = v.ase_texcoord;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = lerpResult121.xyz;
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
				float4 tex2DNode88 = tex2D( _Emission, uv_Emission );
				float3 desaturateInitialColor92 = tex2DNode88.rgb;
				float desaturateDot92 = dot( desaturateInitialColor92, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar92 = lerp( desaturateInitialColor92, desaturateDot92.xxx, ( 1.0 - _TexSaturation ) );
				float4 appendResult99 = (float4(desaturateVar92 , tex2DNode88.a));
				float4 screenPos = i.ase_texcoord2;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 uv_Normal = i.ase_texcoord1.xy * _Normal_ST.xy + _Normal_ST.zw;
				float mulTime22 = _Time.y * ( _RotationSpeed / 4.0 );
				float cos30 = cos( mulTime22 );
				float sin30 = sin( mulTime22 );
				float2 rotator30 = mul( uv_Normal - float2( 0.5,0.5 ) , float2x2( cos30 , -sin30 , sin30 , cos30 )) + float2( 0.5,0.5 );
				float4 transform5_g7061 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 localCenterEye1_g7062 = CenterEye1_g7062();
				float temp_output_4_0_g7061 = distance( transform5_g7061 , float4( ( (float)1 == 0.0 ? localCenterEye1_g7062 : _WorldSpaceCameraPos ) , 0.0 ) );
				float saferPower144 = abs( saturate( ( 1.0 - (0.0 + (temp_output_4_0_g7061 - 0.0) * (1.0 - 0.0) / (_DistanceFade1 - 0.0)) ) ) );
				float temp_output_148_0 = ( _DistanceFade1 == 0.0 ? 1.0 : pow( saferPower144 , _DistanceFalloff1 ) );
				float2 uv_AlphaMask = i.ase_texcoord1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
				float temp_output_155_0 = ( _Alpha * tex2D( _AlphaMask, uv_AlphaMask ).a * i.ase_color.a );
				float3 lerpResult153 = lerp( float3( 0,0,1 ) , ( _Distortion * UnpackNormal( tex2D( _Normal, rotator30 ) ) * temp_output_148_0 ) , ( _MasktoDistortion == 1.0 ? temp_output_155_0 : 1.0 ));
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float fresnelNdotV31 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode31 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV31, _Power ) );
				float4 screenColor45 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_APDBGrab,( (ase_grabScreenPosNorm).xy + (( _UseFresnel == 1.0 ? ( lerpResult153 * ( 1.0 - saturate( fresnelNode31 ) ) ) : lerpResult153 )).xy ));
				float4 appendResult47 = (float4(screenColor45.r , screenColor45.g , screenColor45.b , ( screenColor45.a * temp_output_155_0 )));
				clip( ceil( temp_output_148_0 ) - 0.001);
				
				
				finalColor = ( ( appendResult99 * _Colour * float4( (i.ase_color).rgb , 0.0 ) ) + appendResult47 );
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
Node;AmplifyShaderEditor.RangedFloatNode;18;-3058.029,282.3821;Inherit;False;Property;_RotationSpeed;Rotation Speed;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;48;-2248.833,1162.276;Float;False;Property;_VertexStream;Vertex Stream;16;0;Create;True;0;0;0;False;4;Toggle(_);Space(10);Header(. Use Particle Vertex Stream .);Header(requires vertex stream centre);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;21;-2834.19,286.866;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;51;-2095.286,1243.234;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;50;-3607.905,1207.802;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;49;-3607.979,1039.577;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;23;-2701.784,382.9951;Inherit;False;Property;_Scale;Scale;13;0;Create;True;0;0;0;False;1;;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;53;-3176.892,1075.704;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;52;-3346.788,1148.322;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleTimeNode;22;-2685.826,281.9443;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-2704.284,457.3953;Inherit;False;Property;_Power;Power;15;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;54;-3171.325,1106.994;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RotatorNode;30;-2455.874,127.8282;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FresnelNode;31;-2393.871,320.6081;Inherit;False;Standard;WorldNormal;ViewDir;True;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;58;-3003.626,1182.303;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;55;-2999.902,1356.993;Inherit;False;VR_Center_Eye;-1;;9;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,1;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.RangedFloatNode;57;-2894.307,1472.298;Inherit;False;Property;_DistanceValue;Distance Value;23;0;Create;True;0;0;0;False;2;;;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;33;-2167.001,319.9471;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;123;-3183.344,728.1879;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;122;-3181.269,896.412;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;37;-2023.822,314.673;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;62;-2642.418,1454.506;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;61;-2738.766,1323.904;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-2658.294,1239.137;Inherit;False;Property;_DistanceFalloff;Distance Falloff;22;0;Create;True;0;0;0;False;2;;;False;0.5;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;66;-2469.904,1377.133;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-1506.948,36.73361;Float;False;Property;_UseFresnel;Use Fresnel;12;0;Create;True;0;0;0;False;3;Toggle(_);Header(Edge Fade);;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;124;-2923.152,837.9321;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;125;-2939.869,954.569;Inherit;False;VR_Center_Eye;-1;;12;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.TexCoordVertexDataNode;67;-2636.754,1739.001;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;68;-2636.679,1907.225;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ProjectionParams;126;-2669.878,635.5167;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;70;-2276.758,1393.172;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;73;-2620.221,1583.564;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;40;-1456.36,-179.8246;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DistanceOpNode;127;-2589.159,838.8507;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;72;-2378.563,1848.745;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;41;-1309.952,146.6622;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;84;-1798.068,-845.0771;Inherit;False;Property;_TexSaturation;Tex Saturation;14;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;128;-2334.957,603.3202;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;75;-2090.84,1439.509;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;42;-1145.966,132.9854;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;2;-1203.163,-178.9297;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;76;-2054.853,1723.877;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;83;-1815.65,1452.188;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;129;-2339.84,819.5756;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;88;-1759.785,-746.8259;Inherit;True;Property;_Emission;Emission;10;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;80;-1802.759,1699.553;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;138;-2584.301,991.0614;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;82;-1851.819,1338.729;Float;False;Property;_DistanceScale;Distance Scale;21;0;Create;True;0;0;0;False;2;Toggle(_);Space(20);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;-934.7597,45.18613;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ClampOpNode;131;-2339.943,699.6987;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;89;-1516.413,-837.2537;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;130;-2161.033,603.8381;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.35;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;86;-1571.939,1381.364;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;137;-1815.164,840.3309;Inherit;False;Property;_DistanceOffset;Distance Offset;3;0;Create;True;0;0;0;False;0;False;0;0;-100;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;45;-747.3843,-6.213617;Float;False;Global;_APDBGrab;APDBGrab;-1;0;Create;True;0;0;0;False;0;False;Object;-1;True;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;133;-1696.788,639.6229;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;132;-2374.063,993.7109;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;87;-1575.655,1665.478;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;92;-1353.14,-723.9005;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;96;-1363.717,1287.59;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;135;-2017.421,861.2037;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;99;-1156.011,-627.5868;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;95;-1328.989,1651.115;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;134;-1480.293,757.8265;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1;260.2351,-658.1897;Inherit;False;670.9946;746.3742;custom properties;9;17;15;14;13;10;8;7;4;3;;1,1,1,1;0;0
Node;AmplifyShaderEditor.Compare;101;-998.5963,1208.102;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;111;-980.625,-484.9326;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;136;-1267.355,659.6365;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;14;276.201,-427.5238;Half;False;Property;_WriteMask1;WriteMask;27;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;17;607.2396,-524.6238;Inherit;False;Property;_StencilOp;StencilOp;30;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;13;582.5266,-596.282;Inherit;False;Property;_StencilComparison;Stencil Comparison;29;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-231.7586,-411.079;Inherit;False;Property;_AlphaToCoverage1;AlphaToCoverage (override alpha);20;1;[ToggleUI];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;10;603.5277,-451.2818;Inherit;False;Property;_StencilFail;StencilFail;31;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-491.1099,-585.2118;Float;False;Property;_ZWriteMode1;ZWrite (write to depth buffer);1;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;295.6882,-215.0115;Inherit;False;Property;_SrcBlend1;Source Blend (SrcAlpha);24;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;284.3811,-596.09;Half;False;Property;_StencilRef1;Stencil ID;26;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;7;602.5277,-376.2819;Inherit;False;Property;_StencilZFail;StencilZFail;32;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-452.6278,-407.8238;Float;False;Property;_Offset;Offset;4;0;Create;True;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;-300;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-494.1809,-497.1484;Float;False;Property;_ZTestMode1;ZTestMode (LEqual);2;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;558.2366,-213.4415;Inherit;False;Property;_DstBlend1;Destination Blend (OneMinusSrcAlpha);25;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;12;-189.092,-504.5441;Inherit;False;Property;_Culling1;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.LerpOp;121;-998.5438,566.386;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0.5,0.5,0.5,0.5;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;8;277.201,-510.1007;Half;False;Property;_ReadMask1;ReadMask;28;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;100;5;.GenesisAria/ParticleDistort Basic Transparent;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;1;1;True;_SrcBlend1;0;True;_DstBlend1;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;True;_AlphaToCoverage1;True;True;0;True;_Culling1;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;255;True;_StencilRef1;255;True;_ReadMask1;255;True;_WriteMask1;7;True;_StencilComparison;1;True;_StencilOp;1;True;_StencilFail;1;True;_StencilZFail;7;False;;1;False;;1;False;;1;False;;True;True;1;True;_ZWriteMode1;True;3;True;_ZTestMode1;True;True;0;True;_Offset;0;False;;True;1;RenderType=Opaque=RenderType;True;7;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;26;-2813.432,142.3754;Inherit;False;0;34;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;100;-1481.19,-558.8698;Inherit;False;Property;_Colour;Colour;11;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;34;-2155.417,86.60901;Inherit;True;Property;_Normal;Normal;5;0;Create;True;0;0;0;False;2;Space(10);Header(. Distortion .);False;-1;None;6eb1c824e1b60554f83d884677e27ca1;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-609.3716,228.6025;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-1782.627,142.5038;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;44;-1336.907,362.4279;Inherit;True;Property;_AlphaMask;Alpha Mask;17;0;Create;True;0;0;0;False;1;Space(15);False;-1;None;692664f4d3ff39646a36e0128896bfce;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;140;-2945.177,-11.44952;Inherit;False;Property;_DistanceFalloff1;Distance Falloff;8;0;Create;True;0;0;0;False;0;False;1;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;141;-3450.056,-128.6363;Inherit;False;View Distance;-1;;7061;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,1,17,0;1;9;INT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;142;-2982.941,-182.7885;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;143;-2801.963,-182.4074;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;144;-2534.356,-181.0076;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;20;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;145;-2659.469,-180.0521;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;146;-3256.199,-255.8474;Inherit;False;Property;_DistanceFade1;Distance Fade;7;0;Create;False;0;0;0;False;0;False;0;150;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;147;-2390.676,-214.6257;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;148;-2356.727,-220.7447;Inherit;True;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClipNode;150;-195.331,-1.691803;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0.001;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;120;-319.4362,-8.67116;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;47;-466.2116,8.3299;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CeilOpNode;149;-401.3499,-271.1079;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1960.073,-86.62608;Float;False;Property;_Distortion;Distortion;6;0;Create;True;0;0;0;False;0;False;0.292;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-1449.908,138.8464;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;154;-1052.174,256.8237;Inherit;False;Property;_Alpha;Alpha;18;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;98;-1365.446,-392.2371;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;160;-912.623,-102.8091;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;155;-886.8359,331.6567;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;159;-1201.814,-395.7466;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;152;-1734.325,286.7657;Inherit;False;Property;_MasktoDistortion;Mask to Distortion;19;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;151;-1515.532,285.0066;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;153;-1624.935,123.9041;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
WireConnection;21;0;18;0
WireConnection;51;0;48;0
WireConnection;53;0;51;0
WireConnection;52;0;49;3
WireConnection;52;1;49;4
WireConnection;52;2;50;1
WireConnection;22;0;21;0
WireConnection;54;0;53;0
WireConnection;54;2;52;0
WireConnection;30;0;26;0
WireConnection;30;2;22;0
WireConnection;31;2;23;0
WireConnection;31;3;27;0
WireConnection;58;0;54;0
WireConnection;33;0;31;0
WireConnection;37;0;33;0
WireConnection;62;0;57;0
WireConnection;61;0;58;0
WireConnection;61;1;55;0
WireConnection;66;0;61;0
WireConnection;66;1;62;0
WireConnection;124;0;123;3
WireConnection;124;1;123;4
WireConnection;124;2;122;1
WireConnection;70;0;66;0
WireConnection;70;1;64;0
WireConnection;127;0;124;0
WireConnection;127;1;125;0
WireConnection;72;0;67;3
WireConnection;72;1;67;4
WireConnection;72;2;68;1
WireConnection;41;0;38;0
WireConnection;41;2;39;0
WireConnection;41;3;153;0
WireConnection;128;0;127;0
WireConnection;128;1;126;2
WireConnection;75;0;70;0
WireConnection;42;0;41;0
WireConnection;2;0;40;0
WireConnection;76;0;72;0
WireConnection;76;1;73;0
WireConnection;83;0;75;0
WireConnection;83;1;73;0
WireConnection;129;0;127;0
WireConnection;80;0;75;0
WireConnection;80;1;76;0
WireConnection;43;0;2;0
WireConnection;43;1;42;0
WireConnection;131;0;127;0
WireConnection;131;1;126;2
WireConnection;89;0;84;0
WireConnection;130;0;128;0
WireConnection;86;0;82;0
WireConnection;86;2;83;0
WireConnection;45;0;43;0
WireConnection;133;0;130;0
WireConnection;133;1;131;0
WireConnection;133;2;129;0
WireConnection;132;0;138;0
WireConnection;87;0;82;0
WireConnection;87;2;80;0
WireConnection;92;0;88;0
WireConnection;92;1;89;0
WireConnection;96;0;86;0
WireConnection;135;0;132;0
WireConnection;99;0;92;0
WireConnection;99;3;88;4
WireConnection;95;0;87;0
WireConnection;134;0;133;0
WireConnection;134;1;137;0
WireConnection;101;0;48;0
WireConnection;101;2;95;0
WireConnection;101;3;96;0
WireConnection;111;0;99;0
WireConnection;111;1;100;0
WireConnection;111;2;159;0
WireConnection;136;0;135;0
WireConnection;136;1;134;0
WireConnection;121;0;136;0
WireConnection;121;1;101;0
WireConnection;0;0;150;0
WireConnection;0;1;121;0
WireConnection;34;1;30;0
WireConnection;46;0;45;4
WireConnection;46;1;155;0
WireConnection;36;0;35;0
WireConnection;36;1;34;0
WireConnection;36;2;148;0
WireConnection;142;0;141;0
WireConnection;142;2;146;0
WireConnection;143;0;142;0
WireConnection;144;0;145;0
WireConnection;144;1;140;0
WireConnection;145;0;143;0
WireConnection;147;0;146;0
WireConnection;148;0;147;0
WireConnection;148;3;144;0
WireConnection;150;0;120;0
WireConnection;150;1;149;0
WireConnection;120;0;111;0
WireConnection;120;1;47;0
WireConnection;47;0;45;1
WireConnection;47;1;45;2
WireConnection;47;2;45;3
WireConnection;47;3;46;0
WireConnection;149;0;148;0
WireConnection;39;0;153;0
WireConnection;39;1;37;0
WireConnection;160;0;98;4
WireConnection;155;0;154;0
WireConnection;155;1;44;4
WireConnection;155;2;160;0
WireConnection;159;0;98;0
WireConnection;151;0;152;0
WireConnection;151;2;155;0
WireConnection;153;1;36;0
WireConnection;153;2;151;0
ASEEND*/
//CHKSM=48C061CBDF8BF50DBF9B44919F45039A5ECA9A3F