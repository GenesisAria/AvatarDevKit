// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "GenesisAria/Laser Additive"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling2("Culling (off is doublesided)", Int) = 2
		[Toggle][Space(5)]_ZWriteMode2("ZWrite (write to depth buffer)", Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)]_ZTestMode2("ZTestMode (LEqual)", Float) = 4
		[Space(5)]_Color("Laser Color", Color) = (1,0,0,0)
		_DistanceFade("Distance Fade", Float) = 0
		_DistanceFalloff("Distance Falloff", Float) = 1
		[Toggle][Space (5)]_AlphaToCoverage2("AlphaToCoverage (override alpha)", Float) = 1
		_Cutoff2("Alpha Cutoff", Float) = 0.5
		_DustDensity("Dust Density", Range( -50 , 0)) = 1
		_DustScale("Dust Scale", Float) = 0
		_DustDrift("Dust Drift", Float) = 1
		_Solid("Solid", Range( 0 , 3)) = 0
		_DustBrightness("Dust Brightness", Float) = 0

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" }
	LOD 0

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend One One
		AlphaToMask [_AlphaToCoverage2]
		Cull [_Culling2]
		ColorMask RGBA
		ZWrite [_ZWriteMode2]
		ZTest [_ZTestMode2]
		
		
		
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform int _Culling2;
			uniform float _Cutoff2;
			uniform float _AlphaToCoverage2;
			uniform float _ZWriteMode2;
			uniform float _ZTestMode2;
			uniform float _DustDrift;
			uniform float _DustScale;
			uniform float _DustDensity;
			uniform float _DustBrightness;
			uniform float4 _Color;
			uniform float _Solid;
			uniform float _DistanceFade;
			uniform float _DistanceFalloff;
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				
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
				float mulTime55 = _Time.y * _DustDrift;
				float3 appendResult56 = (float3(mulTime55 , ( mulTime55 + 1.0 ) , ( mulTime55 + 2.0 )));
				float simplePerlin3D52 = snoise( ( WorldPosition + appendResult56 )*-( ( _DustScale - 2.0 ) * 100.0 ) );
				simplePerlin3D52 = simplePerlin3D52*0.5 + 0.5;
				float4 lerpResult26 = lerp( ( ( ( ( simplePerlin3D52 * pow( simplePerlin3D52 , ( 1.0 - _DustDensity ) ) * _DustBrightness ) + 0.0 ) * _Color ) + ( _Color * _Solid ) ) , float4( 0,0,0,0 ) , pow( ( distance( WorldPosition , _WorldSpaceCameraPos ) / _DistanceFade ) , _DistanceFalloff ));
				
				
				finalColor = lerpResult26;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback "Additive"
}
/*ASEBEGIN
Version=18713
-1660;57;1592;857;2524.878;1068.059;2.082091;True;False
Node;AmplifyShaderEditor.RangedFloatNode;80;-3027.244,-628.3314;Inherit;False;Property;_DustDrift;Dust Drift;10;0;Create;True;0;0;0;False;0;False;1;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;55;-2817.934,-616.2985;Inherit;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-2417.744,-445.2639;Inherit;False;Property;_DustScale;Dust Scale;9;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;96;-2243.387,-439.8918;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;303;-2629.585,-451.5485;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;66;-2621.965,-539.9019;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;56;-2407.934,-618.2985;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;-2063.927,-437.3795;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;301;-2166.81,-738.6224;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;75;-2065.484,-319.3767;Inherit;False;Property;_DustDensity;Dust Density;8;0;Create;True;0;0;0;False;0;False;1;-30;-50;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;95;-1909.028,-435.9792;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;88;-1853.573,-570.6129;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;141;-1669.597,-311.7383;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;52;-1686.835,-527.8987;Inherit;False;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;138;-1490.598,-255.7383;Inherit;False;Property;_DustBrightness;Dust Brightness;12;0;Create;True;0;0;0;False;0;False;0;35.84;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;74;-1426.584,-355.3769;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;15;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;73;-1204.984,-381.8769;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;12;-1282.713,9.690672;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceCameraPos;238;-1314.867,173.859;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;137;-981.5985,-354.7383;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-1229.758,-228.5305;Inherit;False;Property;_Color;Laser Color;3;0;Create;False;0;0;0;False;1;Space(5);False;1,0,0,0;1,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DistanceOpNode;13;-952.6118,89.59068;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-974.2081,242.4835;Inherit;False;Property;_DistanceFade;Distance Fade;4;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;130;-1001.768,-89.31345;Inherit;False;Property;_Solid;Solid;11;0;Create;True;0;0;0;False;0;False;0;0.5;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-565.2449,-242.5698;Inherit;False;2;2;0;FLOAT;1;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-683.4087,303.5835;Inherit;False;Property;_DistanceFalloff;Distance Falloff;5;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;16;-726.6907,82.07311;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;136;-661.4595,-127.9224;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;18;-571.6907,107.0731;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;127;-381.9253,-102.983;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-94.94047,-381.3232;Inherit;False;Property;_AlphaToCoverage2;AlphaToCoverage (override alpha);6;1;[Toggle];Create;False;0;0;0;True;1;Space (5);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-125.0253,-574.6805;Float;False;Property;_ZWriteMode2;ZWrite (write to depth buffer);1;1;[Toggle];Create;False;0;0;0;True;1;Space(5);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;201.6558,-631.726;Inherit;False;Property;_Cutoff2;Alpha Cutoff;7;0;Create;False;0;0;0;True;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;26;-221.1842,-74.62494;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-128.0964,-486.6167;Float;False;Property;_ZTestMode2;ZTestMode (LEqual);2;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;23;176.9925,-494.0126;Inherit;False;Property;_Culling2;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;25.06273,-73.57619;Float;False;True;-1;2;ASEMaterialInspector;0;1;GenesisAria/Laser Additive;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;True;0;True;24;True;0;True;23;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;20;True;3;True;21;True;False;0;False;-1;0;False;-1;True;1;RenderType=Transparent=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;Additive;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;55;0;80;0
WireConnection;96;0;79;0
WireConnection;303;0;55;0
WireConnection;66;0;55;0
WireConnection;56;0;55;0
WireConnection;56;1;66;0
WireConnection;56;2;303;0
WireConnection;94;0;96;0
WireConnection;95;0;94;0
WireConnection;88;0;301;0
WireConnection;88;1;56;0
WireConnection;141;0;75;0
WireConnection;52;0;88;0
WireConnection;52;1;95;0
WireConnection;74;0;52;0
WireConnection;74;1;141;0
WireConnection;73;0;52;0
WireConnection;73;1;74;0
WireConnection;73;2;138;0
WireConnection;137;0;73;0
WireConnection;13;0;12;0
WireConnection;13;1;238;0
WireConnection;32;0;137;0
WireConnection;32;1;8;0
WireConnection;16;0;13;0
WireConnection;16;1;15;0
WireConnection;136;0;8;0
WireConnection;136;1;130;0
WireConnection;18;0;16;0
WireConnection;18;1;17;0
WireConnection;127;0;32;0
WireConnection;127;1;136;0
WireConnection;26;0;127;0
WireConnection;26;2;18;0
WireConnection;0;0;26;0
ASEEND*/
//CHKSM=9E8BF0F760BE5A8DBCE7CB47FF05EE8CEB707CE7