// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/LightCone"
{
	Properties
	{
		[ToggleUI]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space(10)][Header(.  Advanced  .)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask", Float) = 255
		_ReadMask("ReadMask", Float) = 255
		_DistanceFade("Distance Fade", Float) = 20
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(Debug)]_SrcBlend("Source Blend (One)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (Zero)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendOp)]_BlendOp("BlendOp", Float) = 0
		[Enum(Clip,1,Clamp,0)][Space(5)]_ZClipping("ZClip (clip plane behaviour)", Float) = 1
		_RimPower("RimPower", Float) = 1
		_Intensity("Intensity", Float) = 0
		_Distance("Distance", Float) = 1
		_Color("Colour", Color) = (1,1,1)
		_UVYPow("UV Y Pow", Range( 0.02 , 10)) = 2
		[Header(default required for transparent camera)][Enum(Mirror Fixed,14,Default,15)]_ColorMask("Alpha Render (Colour Mask)", Float) = 15
		_ShaftsSpeed2("Shafts Speed 2", Float) = 0
		_ShaftsSpeed1("Shafts Speed 1", Float) = 0
		_ShaftNoise("Shaft Noise", 2D) = "white" {}
		_ShaftsFade("Shafts Fade", Float) = 0
		_ShaftsStrength("Shafts Strength", Float) = 0
		[Header(Geometric Specular Antialiasing)][Space(5)][Toggle(_CENTROIDNORMAL)] _CentroidAA("Enable Centroid GSAA", Float) = 1

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent-3000" }
	LOD 100
		ZClip [_ZClipping]

		CGINCLUDE
		#pragma target 4.6
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		BlendOp [_BlendOp]
		AlphaToMask Off
		Cull Front
		ColorMask [_ColorMask]
		ZWrite [_ZWriteMode]
		ZTest [_ZTestMode]
		
		
		
		Pass
		{
			Name "Unlit"
			Cull Back
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityStandardBRDF.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _CENTROIDNORMAL


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(_CENTROIDNORMAL)
				centroid float3 worldNormal : TEXCOORD1_centroid;
				#else
				float3 worldNormal : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _ZWriteMode;
			uniform float _ZTestMode;
			uniform int _StencilOp;
			uniform int _StencilComparison;
			uniform int _StencilFail;
			uniform int _StencilZFail;
			uniform half _StencilRef;
			uniform half _ReadMask;
			uniform half _WriteMask;
			uniform float _SrcBlend;
			uniform float _DstBlend;
			uniform float _BlendOp;
			uniform float _ZClipping;
			uniform half _ColorMask;
			uniform float _RimPower;
			uniform float _Intensity;
			UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
			uniform float4 _CameraDepthTexture_TexelSize;
			uniform float _Distance;
			uniform float3 _Color;
			uniform float _DistanceFade;
			uniform float _UVYPow;
			uniform sampler2D _ShaftNoise;
			uniform float _ShaftsSpeed1;
			uniform float4 _ShaftNoise_ST;
			uniform float _ShaftsSpeed2;
			uniform float _ShaftsStrength;
			uniform float _ShaftsFade;
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

				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.worldNormal.xyz = ase_worldNormal;
				
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
			
			fixed4 frag (v2f i , bool ase_vface : SV_IsFrontFace) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float3 normalizedWorldNormal = normalize( i.worldNormal );
				float3 lerpResult92 = lerp( normalizedWorldNormal , -normalizedWorldNormal , ase_vface);
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = Unity_SafeNormalize( ase_worldViewDir );
				float dotResult60 = dot( lerpResult92 , -ase_worldViewDir );
				float saferPower63 = abs( max( dotResult60 , 0.0001 ) );
				float3 objectSpaceViewDir181 = ObjSpaceViewDir( float4( 0,0,0,1 ) );
				float3 normalizeResult182 = normalize( objectSpaceViewDir181 );
				float dotResult184 = dot( normalizeResult182 , float3(0,-1,0) );
				float saferPower191 = abs( dotResult184 );
				float lerpResult178 = lerp( ( _RimPower * ( 1.0 - pow( saferPower191 , 2.0 ) ) ) , _RimPower , ase_vface);
				float4 screenPos = i.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth95 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
				float distanceDepth95 = abs( ( screenDepth95 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _Distance ) );
				float clampDepth148 = Linear01Depth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
				float lerpResult145 = lerp( distanceDepth95 , 1.0 , ( clampDepth148 + -0.25 ));
				float3 localCenterEye1_g7062 = CenterEye1_g7062();
				float temp_output_4_0_g7061 = distance( WorldPosition , ( (float)1 == 0.0 ? localCenterEye1_g7062 : _WorldSpaceCameraPos ) );
				float temp_output_130_0 = temp_output_4_0_g7061;
				float saferPower163 = abs( ( 1.0 - max( i.ase_texcoord3.xy.y , 0.001 ) ) );
				float2 appendResult212 = (float2(_ShaftsSpeed1 , 0.0));
				float2 uv_ShaftNoise = i.ase_texcoord3.xy * _ShaftNoise_ST.xy + _ShaftNoise_ST.zw;
				float2 temp_output_215_0 = ( uv_ShaftNoise * float2( 1,0 ) );
				float2 panner196 = ( 1.0 * _Time.y * appendResult212 + temp_output_215_0);
				float2 appendResult213 = (float2(_ShaftsSpeed2 , 0.0));
				float2 panner200 = ( 1.0 * _Time.y * appendResult213 + temp_output_215_0);
				float3 saferPower209 = abs( ( tex2D( _ShaftNoise, panner196 ).rgb * tex2D( _ShaftNoise, ( panner200 * float2( 1.5,1.5 ) ) ).rgb * _ShaftsStrength ) );
				float3 temp_cast_1 = (_ShaftsStrength).xxx;
				float3 lerpResult207 = lerp( float3( 1,1,1 ) , pow( saferPower209 , temp_cast_1 ) , _ShaftsFade);
				float3 saferPower120 = abs( ( 1.0 - max( ( pow( saferPower63 , lerpResult178 ) * _Intensity * ( 1.0 - max( pow( ( 1.0 - max( lerpResult145 , 0.001 ) ) , 3.0 ) , 0.001 ) ) * _Color * ( 1.0 - saturate( ( ( _DistanceFade * 5.0 ) - temp_output_130_0 ) ) ) * ( 1.0 - max( pow( saferPower163 , _UVYPow ) , 0.001 ) ) * lerpResult207 ) , float3( 0.001,0.001,0.001 ) ) ) );
				float3 temp_output_69_0 = min( ( 1.0 - max( pow( saferPower120 , 3.0 ) , float3( 0.001,0.001,0.001 ) ) ) , float3( 2,2,2 ) );
				float grayscale176 = (temp_output_69_0.r + temp_output_69_0.g + temp_output_69_0.b) / 3;
				float4 appendResult24 = (float4(temp_output_69_0 , grayscale176));
				
				
				finalColor = appendResult24;
				return finalColor;
			}
			ENDCG
		}
		
		
		
		Pass
		{
			Name "Second"
			Cull Front
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityStandardBRDF.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _CENTROIDNORMAL


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(_CENTROIDNORMAL)
				centroid float3 worldNormal : TEXCOORD1_centroid;
				#else
				float3 worldNormal : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _ZWriteMode;
			uniform float _ZTestMode;
			uniform int _StencilOp;
			uniform int _StencilComparison;
			uniform int _StencilFail;
			uniform int _StencilZFail;
			uniform half _StencilRef;
			uniform half _ReadMask;
			uniform half _WriteMask;
			uniform float _SrcBlend;
			uniform float _DstBlend;
			uniform float _BlendOp;
			uniform float _ZClipping;
			uniform half _ColorMask;
			uniform float _RimPower;
			uniform float _Intensity;
			UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
			uniform float4 _CameraDepthTexture_TexelSize;
			uniform float _Distance;
			uniform float3 _Color;
			uniform float _DistanceFade;
			uniform float _UVYPow;
			uniform sampler2D _ShaftNoise;
			uniform float _ShaftsSpeed1;
			uniform float4 _ShaftNoise_ST;
			uniform float _ShaftsSpeed2;
			uniform float _ShaftsStrength;
			uniform float _ShaftsFade;
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

				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.worldNormal.xyz = ase_worldNormal;
				
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
			
			fixed4 frag (v2f i , bool ase_vface : SV_IsFrontFace) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float3 normalizedWorldNormal = normalize( i.worldNormal );
				float3 lerpResult92 = lerp( normalizedWorldNormal , -normalizedWorldNormal , ase_vface);
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = Unity_SafeNormalize( ase_worldViewDir );
				float dotResult60 = dot( lerpResult92 , -ase_worldViewDir );
				float saferPower63 = abs( max( dotResult60 , 0.0001 ) );
				float3 objectSpaceViewDir181 = ObjSpaceViewDir( float4( 0,0,0,1 ) );
				float3 normalizeResult182 = normalize( objectSpaceViewDir181 );
				float dotResult184 = dot( normalizeResult182 , float3(0,-1,0) );
				float saferPower191 = abs( dotResult184 );
				float lerpResult178 = lerp( ( _RimPower * ( 1.0 - pow( saferPower191 , 2.0 ) ) ) , _RimPower , ase_vface);
				float4 screenPos = i.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth95 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
				float distanceDepth95 = abs( ( screenDepth95 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _Distance ) );
				float clampDepth148 = Linear01Depth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
				float lerpResult145 = lerp( distanceDepth95 , 1.0 , ( clampDepth148 + -0.25 ));
				float3 localCenterEye1_g7062 = CenterEye1_g7062();
				float temp_output_4_0_g7061 = distance( WorldPosition , ( (float)1 == 0.0 ? localCenterEye1_g7062 : _WorldSpaceCameraPos ) );
				float temp_output_130_0 = temp_output_4_0_g7061;
				float saferPower163 = abs( ( 1.0 - max( i.ase_texcoord3.xy.y , 0.001 ) ) );
				float2 appendResult212 = (float2(_ShaftsSpeed1 , 0.0));
				float2 uv_ShaftNoise = i.ase_texcoord3.xy * _ShaftNoise_ST.xy + _ShaftNoise_ST.zw;
				float2 temp_output_215_0 = ( uv_ShaftNoise * float2( 1,0 ) );
				float2 panner196 = ( 1.0 * _Time.y * appendResult212 + temp_output_215_0);
				float2 appendResult213 = (float2(_ShaftsSpeed2 , 0.0));
				float2 panner200 = ( 1.0 * _Time.y * appendResult213 + temp_output_215_0);
				float3 saferPower209 = abs( ( tex2D( _ShaftNoise, panner196 ).rgb * tex2D( _ShaftNoise, ( panner200 * float2( 1.5,1.5 ) ) ).rgb * _ShaftsStrength ) );
				float3 temp_cast_1 = (_ShaftsStrength).xxx;
				float3 lerpResult207 = lerp( float3( 1,1,1 ) , pow( saferPower209 , temp_cast_1 ) , _ShaftsFade);
				float3 saferPower120 = abs( ( 1.0 - max( ( pow( saferPower63 , lerpResult178 ) * _Intensity * ( 1.0 - max( pow( ( 1.0 - max( lerpResult145 , 0.001 ) ) , 3.0 ) , 0.001 ) ) * _Color * ( 1.0 - saturate( ( ( _DistanceFade * 5.0 ) - temp_output_130_0 ) ) ) * ( 1.0 - max( pow( saferPower163 , _UVYPow ) , 0.001 ) ) * lerpResult207 ) , float3( 0.001,0.001,0.001 ) ) ) );
				float3 temp_output_69_0 = min( ( 1.0 - max( pow( saferPower120 , 3.0 ) , float3( 0.001,0.001,0.001 ) ) ) , float3( 2,2,2 ) );
				float grayscale176 = (temp_output_69_0.r + temp_output_69_0.g + temp_output_69_0.b) / 3;
				float4 appendResult24 = (float4(temp_output_69_0 , grayscale176));
				
				
				finalColor = appendResult24;
				return finalColor;
			}
			ENDCG
		}
		
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.RangedFloatNode;197;-2422.667,1377.609;Inherit;False;Property;_ShaftsSpeed2;Shafts Speed 2;20;0;Create;True;0;0;0;False;0;False;0;-0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;96;-2481.125,608.1072;Inherit;False;Property;_Distance;Distance;16;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjSpaceViewDirHlpNode;181;-2618.031,347.1263;Inherit;False;1;0;FLOAT4;0,0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;194;-2580.676,1157.948;Inherit;False;0;198;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenDepthNode;148;-2430.308,694.449;Inherit;False;1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;203;-2426.938,1303.942;Inherit;False;Property;_ShaftsSpeed1;Shafts Speed 1;21;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;215;-2336.19,1157.677;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;213;-2220.886,1377.609;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;144;-2239.208,695.2491;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;95;-2305.017,582.9811;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;185;-2350.043,428.2588;Inherit;False;Constant;_Vector0;Vector 0;20;0;Create;True;0;0;0;False;0;False;0,-1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalizeNode;182;-2351.949,349.2431;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;212;-2224.089,1279.387;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;145;-2020.569,582.2836;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;184;-2171.953,351.1508;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;200;-2047.93,1296.469;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;50;-1794.676,-144.2532;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;59;-2297.033,-0.6914185;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TexturePropertyNode;198;-2066.08,976.1807;Inherit;True;Property;_ShaftNoise;Shaft Noise;22;0;Create;True;0;0;0;False;0;False;None;401a1085158217b4d9e8a16432d854a7;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.PannerNode;196;-2040.456,1171.557;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;211;-1857.892,1290.063;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;1.5,1.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;105;-1783.348,582.3199;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.001;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;161;-1541.781,-97.83578;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.001;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;191;-2062.015,343.3339;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;57;-2218.821,209.3142;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;91;-2054.027,55.52612;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FaceVariableNode;90;-2036.648,126.2258;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-1870.454,702.6882;Float;False;Property;_DistanceFade;Distance Fade;5;0;Create;True;0;0;0;False;0;False;20;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;192;-1730.402,943.8517;Inherit;True;Property;_Rays;Rays;20;0;Create;True;0;0;0;False;0;False;-1;None;401a1085158217b4d9e8a16432d854a7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;199;-1720.168,1145.933;Inherit;True;Property;_Rays1;Rays;20;0;Create;True;0;0;0;False;0;False;-1;None;401a1085158217b4d9e8a16432d854a7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;210;-1376.392,1250.561;Inherit;False;Property;_ShaftsStrength;Shafts Strength;24;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;106;-1675.348,582.3199;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;128;-1672.454,705.6882;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;162;-1433.781,-97.83578;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-1601.43,9.517439;Inherit;False;Property;_UVYPow;UV Y Pow;18;0;Create;True;0;0;0;False;0;False;2;0.3;0.02;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;189;-1904.714,336.0739;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;58;-2021.863,210.0203;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;92;-1849.028,10.39467;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;130;-1949.454,810.6882;Inherit;False;View Distance;-1;;7061;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,0,17,0;1;9;INT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-1860.804,261.5141;Inherit;False;Property;_RimPower;RimPower;14;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;205;-1406.286,1038.103;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;107;-1536.984,586.3199;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;127;-1523.454,705.6882;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FaceVariableNode;179;-1594.106,370.1655;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;180;-1655.414,242.9757;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;60;-1709.506,135.4486;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;163;-1296.781,-93.83578;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;208;-1093.471,1255.899;Inherit;False;Property;_ShaftsFade;Shafts Fade;23;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;209;-1155.393,1029.562;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;108;-1393.348,584.3199;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.001;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;132;-1325.454,704.6882;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;164;-1151.781,-95.83578;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.001;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;178;-1483.156,242.1156;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;62;-1477.547,130.3414;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.0001;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;165;-1029.031,-94.58578;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;109;-1270.598,585.5699;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;133;-1152.197,697.8058;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;207;-926.9217,952.6929;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;63;-1314.116,98.37241;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;101;-1423.521,417.6496;Float;False;Property;_Color;Colour;17;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,0.9,0.9176471,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;68;-1173.103,486.3263;Float;False;Property;_Intensity;Intensity;15;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;67;-738.3167,257.9274;Inherit;True;7;7;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;118;-556.7925,17.7563;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.001,0.001,0.001;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;119;-448.7925,17.7563;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;120;-311.7924,21.7563;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;3;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;121;-166.7927,19.7563;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.001,0.001,0.001;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;122;-287.1425,132.8063;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode;69;-124.53,141.1044;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;2;-384.7378,-825.9431;Inherit;False;670.9946;746.3742;custom properties;11;15;13;12;11;10;7;6;5;4;3;167;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCGrayscale;176;-30.74614,253.9898;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;361.5214,-524.0349;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);0;1;[ToggleUI];Create;False;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;358.4503,-435.9711;Float;False;Property;_ZTestMode;ZTestMode (LEqual);1;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;7;-37.73279,-691.3768;Inherit;False;Property;_StencilOp;StencilOp;7;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;4;-62.44556,-764.0352;Inherit;False;Property;_StencilComparison;Stencil Comparison;6;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;12;-41.44556,-619.0347;Inherit;False;Property;_StencilFail;StencilFail;8;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;6;-42.44556,-544.0347;Inherit;False;Property;_StencilZFail;StencilZFail;9;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-361.5917,-763.8431;Half;False;Property;_StencilRef;Stencil ID;2;0;Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-367.7715,-677.8538;Half;False;Property;_ReadMask;ReadMask;4;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-364.7715,-596.2767;Half;False;Property;_WriteMask;WriteMask;3;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-349.2845,-382.7643;Inherit;False;Property;_SrcBlend;Source Blend (One);10;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-84.09967,-387.7855;Inherit;False;Property;_DstBlend;Destination Blend (Zero);11;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-231.8968,-260.1412;Inherit;False;Property;_BlendOp;BlendOp;12;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.BlendOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;335.8403,-343.6368;Float;False;Property;_ZClipping;ZClip (clip plane behaviour);13;1;[Enum];Create;False;0;2;Clip;1;Clamp;0;0;True;1;Space(5);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;167;-15.83338,-256.0078;Half;False;Property;_ColorMask;Alpha Render (Colour Mask);19;2;[Header];[Enum];Create;False;1;default required for transparent camera;2;Mirror Fixed;14;Default;15;0;True;0;False;15;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;129;-1644.454,814.6882;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;24;24.91964,124.1646;Inherit;False;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;216;380.6167,-693.6231;Inherit;False;Property;_CentroidAA;Enable Centroid GSAA;25;0;Create;False;0;0;0;True;2;Header(Geometric Specular Antialiasing);Space(5);False;0;1;0;True;_CENTROIDNORMAL;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;88;245.1699,18.50999;Float;False;True;-1;2;ASEMaterialInspector;100;15;.GenesisAria/LightCone;2428b84746a063643a1a7e4ba658ff7b;True;Unlit;0;0;Unlit;2;True;True;1;0;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;True;_BlendOp;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;1;False;;True;True;True;True;True;True;0;True;_ColorMask;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;True;_ZWriteMode;True;3;True;_ZTestMode;True;False;0;False;;0;False;;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=-3000;True;6;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;638678648815607387;0;2;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;89;249.9,130.7;Float;False;False;-1;2;ASEMaterialInspector;100;15;New Amplify Shader;2428b84746a063643a1a7e4ba658ff7b;True;Second;0;1;Second;2;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;1;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;RenderType=Transparent=RenderType;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;1;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;0;False;0
WireConnection;215;0;194;0
WireConnection;213;0;197;0
WireConnection;144;0;148;0
WireConnection;95;0;96;0
WireConnection;182;0;181;0
WireConnection;212;0;203;0
WireConnection;145;0;95;0
WireConnection;145;2;144;0
WireConnection;184;0;182;0
WireConnection;184;1;185;0
WireConnection;200;0;215;0
WireConnection;200;2;213;0
WireConnection;196;0;215;0
WireConnection;196;2;212;0
WireConnection;211;0;200;0
WireConnection;105;0;145;0
WireConnection;161;0;50;2
WireConnection;191;0;184;0
WireConnection;91;0;59;0
WireConnection;192;0;198;0
WireConnection;192;1;196;0
WireConnection;199;0;198;0
WireConnection;199;1;211;0
WireConnection;106;0;105;0
WireConnection;128;0;131;0
WireConnection;162;0;161;0
WireConnection;189;0;191;0
WireConnection;58;0;57;0
WireConnection;92;0;59;0
WireConnection;92;1;91;0
WireConnection;92;2;90;0
WireConnection;205;0;192;5
WireConnection;205;1;199;5
WireConnection;205;2;210;0
WireConnection;107;0;106;0
WireConnection;127;0;128;0
WireConnection;127;1;130;0
WireConnection;180;0;61;0
WireConnection;180;1;189;0
WireConnection;60;0;92;0
WireConnection;60;1;58;0
WireConnection;163;0;162;0
WireConnection;163;1;125;0
WireConnection;209;0;205;0
WireConnection;209;1;210;0
WireConnection;108;0;107;0
WireConnection;132;0;127;0
WireConnection;164;0;163;0
WireConnection;178;0;180;0
WireConnection;178;1;61;0
WireConnection;178;2;179;0
WireConnection;62;0;60;0
WireConnection;165;0;164;0
WireConnection;109;0;108;0
WireConnection;133;0;132;0
WireConnection;207;1;209;0
WireConnection;207;2;208;0
WireConnection;63;0;62;0
WireConnection;63;1;178;0
WireConnection;67;0;63;0
WireConnection;67;1;68;0
WireConnection;67;2;109;0
WireConnection;67;3;101;0
WireConnection;67;4;133;0
WireConnection;67;5;165;0
WireConnection;67;6;207;0
WireConnection;118;0;67;0
WireConnection;119;0;118;0
WireConnection;120;0;119;0
WireConnection;121;0;120;0
WireConnection;122;0;121;0
WireConnection;69;0;122;0
WireConnection;176;0;69;0
WireConnection;129;0;130;0
WireConnection;24;0;69;0
WireConnection;24;3;176;0
WireConnection;88;0;24;0
WireConnection;89;0;24;0
ASEEND*/
//CHKSM=8851027966F977D857CDA5363791F64CA654F0A9
