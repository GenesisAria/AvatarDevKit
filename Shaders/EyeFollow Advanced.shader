// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/EyeFollow Transparent Advanced"
{
	Properties
	{
		[Toggle]_ZWriteMode1("ZWrite (write to depth buffer)", Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode1("ZTestMode (LEqual)", Float) = 4
		[Toggle][Space (5)]_AlphaToCoverage1("AlphaToCoverage (override alpha)", Float) = 0
		_Cutoff1("Alpha Cutoff", Float) = 0
		_Emission("Emission", 2D) = "black" {}
		_DistanceFalloff("Distance Falloff", Float) = 0.5
		[Enum(UnityEngine.Rendering.CullMode)]_Culling1("Culling (off is doublesided)", Int) = 0
		_YScale("Y Scale", Float) = 1
		[Toggle(_)]_DistanceScale("Distance Scale", Float) = 0
		_ZOffset("Z Offset", Float) = 0
		[Enum(Y up,0,Z up,1)]_FixMeshAxis("Fix Mesh Axis", Float) = 0
		[Space(10)][Header(.  Advanced  .)]_StencilRef1("Stencil ID", Float) = 0
		_WriteMask1("WriteMask", Float) = 0
		_ReadMask1("ReadMask", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(Debug)]_SrcBlend1("Source Blend (One)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend1("Destination Blend (Zero)", Float) = 10
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull [_Culling1]
		ZWrite [_ZWriteMode1]
		ZTest [_ZTestMode1]
		Blend [_SrcBlend1] [_DstBlend1]
		
		AlphaToMask [_AlphaToCoverage1]
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#pragma target 3.0
		#pragma only_renderers d3d9 d3d11 glcore gles gles3 
		#pragma surface surf StandardCustomLighting keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform int _StencilZFail;
		uniform int _StencilComparison;
		uniform float _ZTestMode1;
		uniform float _ZWriteMode1;
		uniform float _SrcBlend1;
		uniform float _Cutoff1;
		uniform half _StencilRef1;
		uniform float _AlphaToCoverage1;
		uniform half _WriteMask1;
		uniform int _Culling1;
		uniform int _StencilOp;
		uniform float _DstBlend1;
		uniform half _ReadMask1;
		uniform int _StencilFail;
		uniform float _FixMeshAxis;
		uniform float _DistanceScale;
		uniform float _DistanceFalloff;
		uniform float _YScale;
		uniform float _ZOffset;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;


		float3 GetLocalCameraPosition435( float3 up )
		{
			float3 centerEye = _WorldSpaceCameraPos.xyz; 
			#if UNITY_SINGLE_PASS_STEREO 
			int startIndex = unity_StereoEyeIndex; 
			unity_StereoEyeIndex = 0; 
			float3 leftEye = _WorldSpaceCameraPos; 
			unity_StereoEyeIndex = 1; 
			float3 rightEye = _WorldSpaceCameraPos;
			unity_StereoEyeIndex = startIndex;
			centerEye = lerp(leftEye, rightEye, 0.5);
			#endif 
			float3 cam = mul(unity_WorldToObject, float4(centerEye, 1)).xyz;
			return cam;
		}


		float4x4 GenerateLookMatrix1( float3 target, float3 up )
		{
			float3 zaxis = normalize(target.xyz);
			float3 xaxis = normalize(cross(up, zaxis));
			float3 yaxis = cross(zaxis, xaxis);
			float4x4 lookMatrix = float4x4(xaxis.x, yaxis.x, zaxis.x, 0,xaxis.y, yaxis.y, zaxis.y, 0, xaxis.z, yaxis.z, zaxis.z, 0, 0, 0, 0, 1);
			return lookMatrix;
		}


		float3 CenterEye756(  )
		{
			#if defined(USING_STEREO_MATRICES)
			float3 leftEye = unity_StereoWorldSpaceCameraPos[0];
			float3 rightEye = unity_StereoWorldSpaceCameraPos[1];
			float3 centerEye = lerp(leftEye, rightEye, 0.5);
			#else
			float3 centerEye = _WorldSpaceCameraPos;
			#endif
			return centerEye;
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 up435 = float3(0,0,1);
			float3 localGetLocalCameraPosition435 = GetLocalCameraPosition435( up435 );
			float3 target1 = localGetLocalCameraPosition435;
			float3 up1 = ( _FixMeshAxis == 1.0 ? float3(0,1,0) : float3(0,0,1) );
			float4x4 localGenerateLookMatrix1 = GenerateLookMatrix1( target1 , up1 );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float4 transform760 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float3 localCenterEye756 = CenterEye756();
			float temp_output_758_0 = pow( distance( transform760 , float4( localCenterEye756 , 0.0 ) ) , _DistanceFalloff );
			float temp_output_724_0 = ( _YScale * ase_vertex3Pos.y );
			float4 appendResult602 = (float4(( _DistanceScale == 1.0 ? ( ase_vertex3Pos.x * temp_output_758_0 ) : ase_vertex3Pos.x ) , ( _DistanceScale == 1.0 ? ( temp_output_758_0 * temp_output_724_0 ) : temp_output_724_0 ) , ( ase_vertex3Pos.z + _ZOffset ) , 1.0));
			v.vertex.xyz = mul( localGenerateLookMatrix1, appendResult602 ).xyz;
			v.vertex.w = 1;
			float3 ase_vertexNormal = v.normal.xyz;
			float3 normalizeResult250 = normalize( ase_vertexNormal );
			v.normal = mul( localGenerateLookMatrix1, float4( normalizeResult250 , 0.0 ) ).xyz;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 tex2DNode31 = tex2D( _Emission, uv_Emission );
			c.rgb = 0;
			c.a = tex2DNode31.a;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 tex2DNode31 = tex2D( _Emission, uv_Emission );
			o.Emission = tex2DNode31.rgb;
		}

		ENDCG
	}
	Fallback "Sprite"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18713
338;86;1356;792;1598.045;264.5815;1;True;False
Node;AmplifyShaderEditor.CustomExpressionNode;756;-2121.244,-481.4029;Inherit;False;#if defined(USING_STEREO_MATRICES)$float3 leftEye = unity_StereoWorldSpaceCameraPos[0]@$float3 rightEye = unity_StereoWorldSpaceCameraPos[1]@$$float3 centerEye = lerp(leftEye, rightEye, 0.5)@$#else$float3 centerEye = _WorldSpaceCameraPos@$#endif$$return centerEye@;3;False;0;Center Eye;True;False;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;760;-2199.744,-652.8724;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;725;-1949.175,-326.3;Float;False;Property;_YScale;Y Scale;7;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;7;-2180.43,-251.5156;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;757;-1916.603,-733.6172;Inherit;False;Property;_DistanceFalloff;Distance Falloff;5;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;754;-1957.549,-521.381;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;724;-1666.484,-220.503;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;758;-1784.885,-501.1276;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;611;-1605.971,471.8641;Float;False;Constant;_Vector2;Vector 2;3;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;752;-1374.549,-626.3809;Float;False;Property;_DistanceScale;Distance Scale;8;0;Create;True;0;0;0;False;1;Toggle(_);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;734;-1605.137,311.8982;Float;False;Constant;_Vector0;Vector 0;3;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;551;-1405.744,-6.740902;Float;False;Property;_ZOffset;Z Offset;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;733;-1576.475,216.4074;Inherit;False;Property;_FixMeshAxis;Fix Mesh Axis;10;1;[Enum];Create;True;0;2;Y up;0;Z up;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;751;-1569.549,-472.381;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;472;-1638.296,25.12337;Float;False;Constant;_Vector7;Vector 7;18;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;749;-1490.549,-282.3811;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;732;-1348.264,279.8013;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;750;-1149.549,-235.3811;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;550;-1155.763,-31.05953;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;753;-1143.549,-409.3809;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;435;-1435.909,137.6484;Float;False;float3 centerEye = _WorldSpaceCameraPos.xyz@ $#if UNITY_SINGLE_PASS_STEREO $int startIndex = unity_StereoEyeIndex@ $unity_StereoEyeIndex = 0@ $float3 leftEye = _WorldSpaceCameraPos@ $unity_StereoEyeIndex = 1@ $float3 rightEye = _WorldSpaceCameraPos@$unity_StereoEyeIndex = startIndex@$centerEye = lerp(leftEye, rightEye, 0.5)@$#endif $float3 cam = mul(unity_WorldToObject, float4(centerEye, 1)).xyz@$return cam@;3;False;1;True;up;FLOAT3;0,0,0;In;;Float;False;Get Local Camera Position;True;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;8;-894.6657,256.7755;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;735;-274.8009,-1116.72;Inherit;False;670.9946;746.3742;custom properties;9;748;747;746;744;743;742;741;740;738;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;602;-904.8352,-28.75833;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.NormalizeNode;250;-647.6725,235.4098;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;1;-1109.632,198.1413;Float;False;float3 zaxis = normalize(target.xyz)@$float3 xaxis = normalize(cross(up, zaxis))@$float3 yaxis = cross(zaxis, xaxis)@$float4x4 lookMatrix = float4x4(xaxis.x, yaxis.x, zaxis.x, 0,xaxis.y, yaxis.y, zaxis.y, 0, xaxis.z, yaxis.z, zaxis.z, 0, 0, 0, 0, 1)@$return lookMatrix@$;6;False;2;True;target;FLOAT3;0,0,0;In;;Float;False;True;up;FLOAT3;0,0,0;In;;Float;False;GenerateLookMatrix;True;False;0;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4x4;0
Node;AmplifyShaderEditor.IntNode;748;68.49118,-909.8116;Inherit;False;Property;_StencilFail;StencilFail;16;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-440.0249,187.0529;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;740;-257.8348,-968.6306;Half;False;Property;_ReadMask1;ReadMask;13;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;746;25.83712,-678.5624;Inherit;False;Property;_DstBlend1;Destination Blend (Zero);19;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;738;72.20407,-982.1536;Inherit;False;Property;_StencilOp;StencilOp;15;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;728;-876.2712,-822.634;Inherit;False;Property;_Culling1;Culling (off is doublesided);6;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;743;-258.8348,-886.0535;Half;False;Property;_WriteMask1;WriteMask;12;0;Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;727;-918.938,-729.1688;Inherit;False;Property;_AlphaToCoverage1;AlphaToCoverage (override alpha);2;1;[Toggle];Create;False;0;0;0;True;1;Space (5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;741;-239.3478,-673.5412;Inherit;False;Property;_SrcBlend1;Source Blend (One);18;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;-851.6078,-960.3474;Inherit;False;Property;_Cutoff1;Alpha Cutoff;3;0;Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;730;-1178.289,-903.302;Float;False;Property;_ZWriteMode1;ZWrite (write to depth buffer);0;1;[Toggle];Create;False;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;729;-1181.36,-815.2382;Float;False;Property;_ZTestMode1;ZTestMode (LEqual);1;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;605;-527.7462,-0.1008508;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.IntNode;742;47.49121,-1054.812;Inherit;False;Property;_StencilComparison;Stencil Comparison;14;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;747;67.49118,-834.8116;Inherit;False;Property;_StencilZFail;StencilZFail;17;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SamplerNode;31;-547.8651,-257.7376;Inherit;True;Property;_Emission;Emission;4;0;Create;True;0;0;0;False;0;False;-1;None;0f755f784aa7fa44d996cb6f2cd7faa2;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;744;-251.6549,-1054.62;Half;False;Property;_StencilRef1;Stencil ID;11;0;Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-53.58725,-240.8751;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;.GenesisAria/EyeFollow Transparent Advanced;False;False;False;False;True;True;True;True;True;True;True;True;False;False;True;False;False;False;False;False;False;Off;0;True;730;0;True;729;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;5;d3d9;d3d11;glcore;gles;gles3;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;True;741;10;True;746;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;Sprite;-1;-1;-1;-1;0;True;0;0;True;728;-1;0;True;731;0;0;0;False;0.1;False;-1;0;True;727;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;754;0;760;0
WireConnection;754;1;756;0
WireConnection;724;0;725;0
WireConnection;724;1;7;2
WireConnection;758;0;754;0
WireConnection;758;1;757;0
WireConnection;751;0;7;1
WireConnection;751;1;758;0
WireConnection;749;0;758;0
WireConnection;749;1;724;0
WireConnection;732;0;733;0
WireConnection;732;2;734;0
WireConnection;732;3;611;0
WireConnection;750;0;752;0
WireConnection;750;2;749;0
WireConnection;750;3;724;0
WireConnection;550;0;7;3
WireConnection;550;1;551;0
WireConnection;753;0;752;0
WireConnection;753;2;751;0
WireConnection;753;3;7;1
WireConnection;435;0;472;0
WireConnection;602;0;753;0
WireConnection;602;1;750;0
WireConnection;602;2;550;0
WireConnection;250;0;8;0
WireConnection;1;0;435;0
WireConnection;1;1;732;0
WireConnection;10;0;1;0
WireConnection;10;1;250;0
WireConnection;605;0;1;0
WireConnection;605;1;602;0
WireConnection;0;2;31;0
WireConnection;0;9;31;4
WireConnection;0;11;605;0
WireConnection;0;12;10;0
ASEEND*/
//CHKSM=0F3A7104EB4EC4FFB4C90DEABB0341ECD8FBFE03