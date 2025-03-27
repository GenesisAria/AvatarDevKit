// Made with Amplify Shader Editor v1.9.7.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/BlackHole Plus"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[ToggleUI]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space(5)]_Offset("Offset", Float) = 0
		[Enum(Clip,1,Clamp,0)][Space(5)]_ZClipping("ZClip (clip plane behaviour)", Float) = 1
		[Toggle(_ALPHATEST_ON)]_VRCFallbackCutout("VRC Fallback Cutout", Float) = 0
		[HideInInspector]_Cutoff("Fallback Cutoff", Float) = 2
		[Space(15)]_DistortionPower("Distortion Power", Float) = 0.66
		_HoleEdgeSmoothness("Hole Edge Smoothness", Range( 0.001 , 1)) = 0.001
		_HoleSize("Hole Size", Range( 0 , 1)) = 0.6
		[Space(15)]_Normal("Normal", 2D) = "bump" {}
		_ScaleNormal("Scale Normal", Float) = 1
		[Header(Geometric Specular Antialiasing)][Space(5)][Toggle(_CENTROIDNORMAL)] _CentroidAA("Enable Centroid GSAA", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Advanced  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (OneMinusSrcAlpha)", Float) = 0
		[Enum(UnityEngine.Rendering.BlendOp)]_BlendOp("BlendOp", Float) = 0
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
		ZClip [_ZClipping]

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		BlendOp [_BlendOp]
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
		
		GrabPass{ "_BlackHoleGrab" }

		Pass
		{
			Name "Unlit"

			CGPROGRAM

			#define ASE_VERSION 19701
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
			#include "UnityStandardUtils.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _CENTROIDNORMAL


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
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
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform int _StencilComparison;
			uniform half _ReadMask;
			uniform half _WriteMask;
			uniform int _StencilZFail;
			uniform float _DstBlend;
			uniform int _StencilFail;
			uniform int _StencilOp;
			uniform half _StencilRef;
			uniform float _ZWriteMode;
			uniform float _ZTestMode;
			uniform half _Cutoff;
			uniform half _VRCFallbackCutout;
			uniform float _Offset;
			uniform float _ZClipping;
			uniform float _SrcBlend;
			uniform float _BlendOp;
			uniform int _Culling;
			uniform float _HoleSize;
			uniform float _HoleEdgeSmoothness;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform float _ScaleNormal;
			ASE_DECLARE_SCREENSPACE_TEXTURE( _BlackHoleGrab )
			uniform float _DistortionPower;
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

				float3 ase_worldTangent = UnityObjectToWorldDir(v.ase_tangent);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
				o.ase_color = v.color;
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
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
				float temp_output_736_0 = (1.0 + (( _HoleSize * i.ase_color.a ) - 0.0) * (0.0 - 1.0) / (1.0 - 0.0));
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 break874 = ase_viewDirWS;
				float3 appendResult875 = (float3(-break874.x , -break874.y , -break874.z));
				float3 lerpResult883 = lerp( appendResult875 , ase_viewDirWS , ase_vface);
				float3 lerpResult778 = lerp( lerpResult883 , ase_viewDirWS , ase_vface);
				float2 uv_Normal = i.ase_texcoord2.xy * _Normal_ST.xy + _Normal_ST.zw;
				float3 ase_worldTangent = i.ase_texcoord3.xyz;
				float3 ase_worldBitangent = i.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, i.worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, i.worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, i.worldNormal.z );
				float3 tanNormal737 = UnpackScaleNormal( tex2D( _Normal, uv_Normal ), _ScaleNormal );
				float3 worldNormal737 = float3(dot(tanToWorld0,tanNormal737), dot(tanToWorld1,tanNormal737), dot(tanToWorld2,tanNormal737));
				float fresnelNdotV734 = dot( normalize( worldNormal737 ), lerpResult778 );
				float fresnelNode734 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV734, 0.15 ) );
				float smoothstepResult733 = smoothstep( ( temp_output_736_0 + _HoleEdgeSmoothness ) , ( temp_output_736_0 - _HoleEdgeSmoothness ) , ( 1.0 - saturate( fresnelNode734 ) ));
				float lerpResult865 = lerp( 0.0 , _DistortionPower , i.ase_color.a);
				float fresnelNdotV741 = dot( normalize( worldNormal737 ), lerpResult778 );
				float fresnelNode741 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV741, lerpResult865 ) );
				float4 screenPos = i.ase_texcoord5;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 temp_output_765_0 = (ase_grabScreenPosNorm).xy;
				float4 screenColor751 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_BlackHoleGrab,( ( pow( ( 1.0 - fresnelNode741 ) , 6.0 ) * (float2( 1,1 ) + (temp_output_765_0 - float2( 0,0 )) * (float2( -1,-1 ) - float2( 1,1 )) / (float2( 1,1 ) - float2( 0,0 ))) ) + temp_output_765_0 ));
				float4 appendResult47 = (float4(( smoothstepResult733 * (screenColor751).rgb ) , 0.0));
				
				
				finalColor = appendResult47;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19701
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;775;-3703.26,-395.5272;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;874;-3512.196,-456.4458;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.NegateNode;886;-3396.921,-493.4695;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;885;-3399.45,-354.3496;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;776;-3400.123,-427.9456;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;743;-3274.406,-581.4118;Inherit;False;Property;_ScaleNormal;Scale Normal;11;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FaceVariableNode;884;-3248.988,-314.8613;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;875;-3253.995,-465.299;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexColorNode;276;-3109.814,-166.8461;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FaceVariableNode;777;-3001.117,-320.7159;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;883;-3059.788,-434.5762;Inherit;False;3;0;FLOAT3;-1,0,0;False;1;FLOAT3;0.15,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;740;-2939.904,-102.713;Inherit;False;Property;_DistortionPower;Distortion Power;7;0;Create;True;0;0;0;False;1;Space(15);False;0.66;0.66;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;742;-3086.481,-628.6362;Inherit;True;Property;_Normal;Normal;10;0;Create;True;0;0;0;False;1;Space(15);False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.WorldNormalVector;737;-2776.184,-625.2274;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;865;-2625.645,-128.5356;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;778;-2889.303,-399.9;Inherit;False;3;0;FLOAT3;-1,0,0;False;1;FLOAT3;0.15,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GrabScreenPosition;764;-1942.32,-118.9687;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;741;-2450.311,-225.1492;Inherit;True;Standard;WorldNormal;ViewDir;True;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.15;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;765;-1728.495,-118.6525;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;745;-2133.566,-223.683;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;790;-1435.935,-46.2271;Inherit;False;5;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,1;False;3;FLOAT2;1,1;False;4;FLOAT2;-1,-1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;746;-1952.403,-224.1544;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;6;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;871;-2498.527,-672.8969;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;870;-2433.8,-594.1067;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexColorNode;866;-2282.286,-564.3849;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;729;-2110.648,-492.6472;Inherit;False;Property;_HoleSize;Hole Size;9;0;Create;True;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;749;-1279.28,-187.0418;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FresnelNode;734;-1482.647,-713.647;Inherit;True;Standard;WorldNormal;ViewDir;True;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.15;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;867;-1839.286,-493.3849;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;753;-1097.038,-153.5521;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;744;-1206.41,-713.7304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;736;-1661.647,-497.6472;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;-1754.648,-325.6478;Inherit;False;Property;_HoleEdgeSmoothness;Hole Edge Smoothness;8;0;Create;True;0;0;0;False;0;False;0.001;0.03;0.001;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;751;-963.5438,-90.37629;Inherit;False;Global;_BlackHoleGrab;BlackHoleGrab;29;0;Create;True;0;0;0;False;0;False;Object;-1;True;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;735;-1068.647,-713.647;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;730;-1299.647,-374.6479;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;732;-1276.647,-472.6471;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;752;-778.1832,-91.37631;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;733;-1018.647,-499.6472;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1;256.2351,-802.1897;Inherit;False;670.9946;746.3742;custom properties;10;17;15;14;13;10;8;7;4;3;509;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;750;-493.1967,-150.3994;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;726;-145.1965,-197.2057;Inherit;False;292;194;If disconnected, requires ZClipOnePass;1;516;;1,1,1,1;0;0
Node;AmplifyShaderEditor.IntNode;13;578.5266,-740.282;Inherit;False;Property;_StencilComparison;Stencil Comparison;19;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;273.201,-654.1007;Half;False;Property;_ReadMask;ReadMask;18;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;272.201,-571.5238;Half;False;Property;_WriteMask;WriteMask;17;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;7;598.5277,-520.2819;Inherit;False;Property;_StencilZFail;StencilZFail;22;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;554.2366,-357.4415;Inherit;False;Property;_DstBlend;Destination Blend (OneMinusSrcAlpha);14;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;10;599.5277,-595.2818;Inherit;False;Property;_StencilFail;StencilFail;21;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;17;603.2396,-668.6238;Inherit;False;Property;_StencilOp;StencilOp;20;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;275.3811,-727.09;Half;False;Property;_StencilRef;Stencil ID;16;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;284.6699,-1123.637;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);1;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;281.599,-1035.574;Float;False;Property;_ZTestMode;ZTestMode (LEqual);2;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;206;666.134,-1165.745;Half;False;Property;_Cutoff;Fallback Cutoff;6;1;[HideInInspector];Create;False;0;0;0;True;0;False;2;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;208;582.9344,-1267.145;Half;False;Property;_VRCFallbackCutout;VRC Fallback Cutout;5;0;Create;True;0;0;0;True;1;Toggle(_ALPHATEST_ON);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;565;281.1365,-1236.484;Float;False;Property;_ZClipping;ZClip (clip plane behaviour);4;1;[Enum];Create;False;0;2;Clip;1;Clamp;0;0;True;1;Space(5);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;291.6882,-359.0115;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);13;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;509;347.2268,-227.6172;Inherit;False;Property;_BlendOp;BlendOp;15;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.BlendOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;47;-326.685,-148.3132;Inherit;False;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;12;586.6876,-1042.969;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;323.1521,-946.2491;Float;False;Property;_Offset;Offset;3;0;Create;True;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;542;600.7156,-956.4943;Inherit;False;Property;_CentroidAA;Enable Centroid GSAA;12;0;Create;False;0;0;0;True;2;Header(Geometric Specular Antialiasing);Space(5);False;0;0;0;True;_CENTROIDNORMAL;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;516;-95.19652,-147.2057;Float;False;True;-1;2;ASEMaterialInspector;100;17;.GenesisAria/BlackHole Plus;2cef7da4105ea3748b02a74ab057e9a3;True;Unlit;0;0;Unlit;2;True;True;1;1;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;True;_BlendOp;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;0;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;0;True;_StencilComparison;0;True;_StencilOp;0;True;_StencilFail;0;True;_StencilZFail;0;False;;0;False;;0;False;;0;False;;True;True;1;True;_ZWriteMode;True;3;True;_ZTestMode;True;True;0;True;_Offset;0;False;;True;2;RenderType=Opaque=RenderType;Queue=Overlay=Queue=28767;True;7;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
WireConnection;874;0;775;0
WireConnection;886;0;874;0
WireConnection;885;0;874;2
WireConnection;776;0;874;1
WireConnection;875;0;886;0
WireConnection;875;1;776;0
WireConnection;875;2;885;0
WireConnection;883;0;875;0
WireConnection;883;1;775;0
WireConnection;883;2;884;0
WireConnection;742;5;743;0
WireConnection;737;0;742;0
WireConnection;865;1;740;0
WireConnection;865;2;276;4
WireConnection;778;0;883;0
WireConnection;778;1;775;0
WireConnection;778;2;777;0
WireConnection;741;0;737;0
WireConnection;741;4;778;0
WireConnection;741;3;865;0
WireConnection;765;0;764;0
WireConnection;745;0;741;0
WireConnection;790;0;765;0
WireConnection;746;0;745;0
WireConnection;871;0;737;0
WireConnection;870;0;778;0
WireConnection;749;0;746;0
WireConnection;749;1;790;0
WireConnection;734;0;871;0
WireConnection;734;4;870;0
WireConnection;867;0;729;0
WireConnection;867;1;866;4
WireConnection;753;0;749;0
WireConnection;753;1;765;0
WireConnection;744;0;734;0
WireConnection;736;0;867;0
WireConnection;751;0;753;0
WireConnection;735;0;744;0
WireConnection;730;0;736;0
WireConnection;730;1;731;0
WireConnection;732;0;736;0
WireConnection;732;1;731;0
WireConnection;752;0;751;0
WireConnection;733;0;735;0
WireConnection;733;1;732;0
WireConnection;733;2;730;0
WireConnection;750;0;733;0
WireConnection;750;1;752;0
WireConnection;47;0;750;0
WireConnection;516;0;47;0
ASEEND*/
//CHKSM=644287F90FE55906EF0C56145553F9336D200A39