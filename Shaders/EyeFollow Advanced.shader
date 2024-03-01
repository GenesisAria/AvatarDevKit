// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/EyeFollow Transparent Advanced"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling1("Culling (off is doublesided)", Int) = 0
		[ToggleUI]_ZWriteMode1("ZWrite (write to depth buffer)", Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode1("ZTestMode (LEqual)", Float) = 4
		[ToggleUI][Space (5)]_AlphaToCoverage1("AlphaToCoverage (override alpha)", Float) = 0
		_Cutoff("Alpha Cutoff", Float) = 0
		_Emission("Emission", 2D) = "black" {}
		[HDR]_Color("Color", Color) = (1,1,1,1)
		_AlphaMaskRA("Alpha Mask (R, A)", 2D) = "white" {}
		_MaskPower("Mask Power", Float) = 0
		_DistanceFade("Distance Fade", Float) = 0
		_XScale("X Scale", Float) = 1
		_YScale("Y Scale", Float) = 1
		[Toggle(_)]_DistanceScale("Distance Scale", Float) = 0
		_DistanceFalloff("Distance Falloff", Float) = 0.5
		_ZOffset("Depth Offset", Float) = 0
		_XOffset("X Offset", Float) = 0
		_YOffset("Y Offset", Float) = 0
		_Zoffset1("Z Offset", Float) = 0
		[Enum(Y up,0,Z up,1)]_FixMeshAxis("Fix Mesh Axis", Float) = 0
		[Space(10)][Header(.  Advanced  .)]_StencilRef1("Stencil ID", Float) = 0
		_WriteMask1("WriteMask", Float) = 255
		_ReadMask1("ReadMask", Float) = 255
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
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma only_renderers d3d11 glcore gles gles3 ps5 
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

		uniform half _ReadMask1;
		uniform int _StencilComparison;
		uniform half _StencilRef1;
		uniform int _StencilFail;
		uniform int _Culling1;
		uniform int _StencilZFail;
		uniform int _StencilOp;
		uniform half _WriteMask1;
		uniform float _ZWriteMode1;
		uniform float _AlphaToCoverage1;
		uniform float _SrcBlend1;
		uniform float _DstBlend1;
		uniform float _Cutoff;
		uniform float _ZTestMode1;
		uniform float _XOffset;
		uniform float _YOffset;
		uniform float _Zoffset1;
		uniform float _FixMeshAxis;
		uniform float _DistanceScale;
		uniform float _XScale;
		uniform float _DistanceFalloff;
		uniform float _YScale;
		uniform float _ZOffset;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float4 _Color;
		uniform sampler2D _AlphaMaskRA;
		uniform float4 _AlphaMaskRA_ST;
		uniform float _MaskPower;
		uniform float _DistanceFade;


		float3 GetLocalCameraPosition435(  )
		{
			float3 centerEye = _WorldSpaceCameraPos.xyz; 
			#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
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
			#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)
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
			float4 appendResult773 = (float4(_XOffset , _YOffset , _Zoffset1 , 1.0));
			float4 offsets790 = appendResult773;
			float3 localGetLocalCameraPosition435 = GetLocalCameraPosition435();
			float3 target1 = ( float4( localGetLocalCameraPosition435 , 0.0 ) - offsets790 ).xyz;
			float3 up1 = ( _FixMeshAxis == 1.0 ? float3(0,1,0) : float3(0,0,1) );
			float4x4 localGenerateLookMatrix1 = GenerateLookMatrix1( target1 , up1 );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 break815 = ase_vertex3Pos;
			float temp_output_820_0 = ( _XScale * break815.x );
			float4 transform760 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float3 localCenterEye756 = CenterEye756();
			float temp_output_758_0 = pow( distance( transform760 , float4( localCenterEye756 , 0.0 ) ) , _DistanceFalloff );
			float temp_output_724_0 = ( _YScale * break815.y );
			float4 appendResult602 = (float4(( _DistanceScale == 1.0 ? ( temp_output_820_0 * temp_output_758_0 ) : temp_output_820_0 ) , ( _DistanceScale == 1.0 ? ( temp_output_758_0 * temp_output_724_0 ) : temp_output_724_0 ) , ( break815.z + _ZOffset ) , 1.0));
			v.vertex.xyz = ( offsets790 + mul( localGenerateLookMatrix1, appendResult602 ) ).xyz;
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
			float4 temp_output_761_0 = ( tex2D( _Emission, uv_Emission ) * _Color );
			float2 uv_AlphaMaskRA = i.uv_texcoord * _AlphaMaskRA_ST.xy + _AlphaMaskRA_ST.zw;
			float4 tex2DNode821 = tex2D( _AlphaMaskRA, uv_AlphaMaskRA );
			float4 transform797 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			c.rgb = 0;
			c.a = saturate( ( (temp_output_761_0).a * pow( ( tex2DNode821.r * tex2DNode821.a * _MaskPower ) , _MaskPower ) * ( _DistanceFade == 0.0 ? 1.0 : ( 1.0 - pow( ( distance( transform797 , float4( _WorldSpaceCameraPos , 0.0 ) ) / _DistanceFade ) , _DistanceFade ) ) ) ) );
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
			float4 temp_output_761_0 = ( tex2D( _Emission, uv_Emission ) * _Color );
			o.Emission = temp_output_761_0.rgb;
		}

		ENDCG
	}
	Fallback "Sprite"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.RangedFloatNode;771;-2790.206,208.4129;Inherit;False;Property;_YOffset;Y Offset;16;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;770;-2785.161,134.9774;Inherit;False;Property;_XOffset;X Offset;15;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;772;-2790.206,284.4126;Inherit;False;Property;_Zoffset1;Z Offset;17;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;760;-2636.872,-652.8724;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CustomExpressionNode;756;-2558.372,-481.4029;Inherit;False;#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)$float3 leftEye = unity_StereoWorldSpaceCameraPos[0]@$float3 rightEye = unity_StereoWorldSpaceCameraPos[1]@$$float3 centerEye = lerp(leftEye, rightEye, 0.5)@$#else$float3 centerEye = _WorldSpaceCameraPos@$#endif$$return centerEye@;3;Create;0;Center Eye;True;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;757;-2366.731,-632.6172;Inherit;False;Property;_DistanceFalloff;Distance Falloff;13;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;797;-1281.884,-551.4052;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;773;-2571.006,194.3427;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;725;-2378.303,-330.3;Float;False;Property;_YScale;Y Scale;11;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;819;-2378.79,-403.3107;Float;False;Property;_XScale;X Scale;10;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;815;-2370.457,-248.6152;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DistanceOpNode;754;-2394.677,-521.381;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;821;-653.3151,-934.9335;Inherit;True;Property;_AlphaMaskRA;Alpha Mask (R, A);7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;790;-2369.121,190.2023;Inherit;False;offsets;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;825;-515.7939,-748.6414;Inherit;False;Property;_MaskPower;Mask Power;8;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;758;-2222.013,-501.1276;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;798;-1039.689,-427.9138;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;820;-2159.79,-378.3107;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;724;-2054.613,-220.503;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;611;-2244.749,552.938;Float;False;Constant;_Vector2;Vector 2;3;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;752;-1762.677,-626.381;Float;False;Property;_DistanceScale;Distance Scale;12;0;Create;True;0;0;0;False;1;Toggle(_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;733;-2029.708,346.598;Inherit;False;Property;_FixMeshAxis;Fix Mesh Axis;18;1;[Enum];Create;True;0;2;Y up;0;Z up;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;749;-1861.677,-280.3811;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;763;-1135.096,-737.587;Inherit;False;Property;_Color;Color;6;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;551;-1793.873,-6.740901;Float;False;Property;_ZOffset;Depth Offset;14;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;435;-2015.333,157.9268;Float;False;float3 centerEye = _WorldSpaceCameraPos.xyz@ $#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)$int startIndex = unity_StereoEyeIndex@ $unity_StereoEyeIndex = 0@ $float3 leftEye = _WorldSpaceCameraPos@ $unity_StereoEyeIndex = 1@ $float3 rightEye = _WorldSpaceCameraPos@$unity_StereoEyeIndex = startIndex@$centerEye = lerp(leftEye, rightEye, 0.5)@$#endif $float3 cam = mul(unity_WorldToObject, float4(centerEye, 1)).xyz@$return cam@;3;Create;0;Get Local Camera Position;True;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;751;-1957.677,-472.381;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;734;-2243.915,392.9722;Float;False;Constant;_Vector0;Vector 0;3;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;31;-1226.337,-928.7328;Inherit;True;Property;_Emission;Emission;5;0;Create;True;0;0;0;False;0;False;-1;None;98f21026f9162e945b16239f69ac817a;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;822;-343.3151,-865.9335;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;761;-863.0963,-797.587;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;550;-1543.891,-31.05953;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;794;-1727.331,156.0275;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Compare;750;-1537.677,-235.3811;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;753;-1531.677,-409.3809;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;732;-1801.497,407.8753;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;824;-161.7939,-860.6414;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;602;-1292.964,-28.75833;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;823;-299.3151,-554.9335;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;8;-1282.794,256.7755;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;605;-995.8747,1.899151;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;791;-951.4935,-159.2626;Inherit;False;790;offsets;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;801;-360.6104,-381.3846;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;735;600.6039,-994.2354;Inherit;False;670.9946;746.3742;custom properties;9;748;747;746;744;743;742;741;740;738;;1,1,1,1;0;0
Node;AmplifyShaderEditor.NormalizeNode;250;-1035.801,235.4098;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;740;617.5701,-846.1461;Half;False;Property;_ReadMask1;ReadMask;21;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-828.1534,187.0529;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;742;922.8961,-932.3275;Inherit;False;Property;_StencilComparison;Stencil Comparison;22;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;744;623.75,-932.1354;Half;False;Property;_StencilRef1;Stencil ID;19;0;Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;748;943.8961,-787.327;Inherit;False;Property;_StencilFail;StencilFail;24;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;728;1648.881,-611.6592;Inherit;False;Property;_Culling1;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;747;942.8961,-712.327;Inherit;False;Property;_StencilZFail;StencilZFail;25;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;738;947.6089,-859.6691;Inherit;False;Property;_StencilOp;StencilOp;23;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;743;616.5701,-763.569;Half;False;Property;_WriteMask1;WriteMask;20;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;730;1346.863,-692.3272;Float;False;Property;_ZWriteMode1;ZWrite (write to depth buffer);1;1;[ToggleUI];Create;False;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;727;1606.214,-518.194;Inherit;False;Property;_AlphaToCoverage1;AlphaToCoverage (override alpha);3;1;[ToggleUI];Create;False;0;0;0;True;1;Space (5);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;789;-720.7419,-156.0414;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;741;636.0571,-551.0566;Inherit;False;Property;_SrcBlend1;Source Blend (One);26;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;817;-243.0975,-285.6815;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;746;901.242,-556.0778;Inherit;False;Property;_DstBlend1;Destination Blend (Zero);27;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;1673.544,-749.3725;Inherit;False;Property;_Cutoff;Alpha Cutoff;4;0;Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;729;1343.792,-604.2634;Float;False;Property;_ZTestMode1;ZTestMode (LEqual);2;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;762;-747.3502,-633.8409;Inherit;True;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;826;-1327.883,-292.4379;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CustomExpressionNode;796;-1203.384,-387.9357;Inherit;False;#if defined(USING_STEREO_MATRICES) || defined(UNITY_SINGLE_PASS_STEREO)$float3 leftEye = unity_StereoWorldSpaceCameraPos[0]@$float3 rightEye = unity_StereoWorldSpaceCameraPos[1]@$$float3 centerEye = lerp(leftEye, rightEye, 0.5)@$#else$float3 centerEye = _WorldSpaceCameraPos@$#endif$$return centerEye@;3;Create;0;Center Eye;True;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;802;-819.1612,-412.8579;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;803;-665.2944,-390.1242;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;804;-672.6642,-256.6224;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;827;-502.9464,-336.6302;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;799;-1051.012,-313.5178;Inherit;False;Property;_DistanceFade;Distance Fade;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-58.52383,-398.8457;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;.GenesisAria/EyeFollow Transparent Advanced;False;False;False;False;True;True;True;True;True;True;True;True;False;False;True;False;False;False;False;False;False;Off;0;True;_ZWriteMode1;0;True;_ZTestMode1;False;0;False;;0;False;;False;0;Custom;1;True;False;0;True;Custom;;Transparent;All;5;d3d11;glcore;gles;gles3;ps5;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;True;_SrcBlend1;10;True;_DstBlend1;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;Sprite;-1;-1;-1;-1;0;True;0;0;True;_Culling1;-1;0;True;_Cutoff;0;0;0;False;0.1;False;;0;True;_AlphaToCoverage1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CustomExpressionNode;1;-1497.76,198.1413;Float;False;float3 zaxis = normalize(target.xyz)@$float3 xaxis = normalize(cross(up, zaxis))@$float3 yaxis = cross(zaxis, xaxis)@$float4x4 lookMatrix = float4x4(xaxis.x, yaxis.x, zaxis.x, 0,xaxis.y, yaxis.y, zaxis.y, 0, xaxis.z, yaxis.z, zaxis.z, 0, 0, 0, 0, 1)@$return lookMatrix@$;6;Create;2;True;target;FLOAT3;0,0,0;In;;Float;False;True;up;FLOAT3;0,0,0;In;;Float;False;GenerateLookMatrix;True;False;0;;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4x4;0
Node;AmplifyShaderEditor.GetLocalVarNode;792;-1964.254,85.65681;Inherit;False;790;offsets;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode;833;-2596.144,-249.599;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;773;0;770;0
WireConnection;773;1;771;0
WireConnection;773;2;772;0
WireConnection;815;0;833;0
WireConnection;754;0;760;0
WireConnection;754;1;756;0
WireConnection;790;0;773;0
WireConnection;758;0;754;0
WireConnection;758;1;757;0
WireConnection;798;0;797;0
WireConnection;798;1;826;0
WireConnection;820;0;819;0
WireConnection;820;1;815;0
WireConnection;724;0;725;0
WireConnection;724;1;815;1
WireConnection;749;0;758;0
WireConnection;749;1;724;0
WireConnection;751;0;820;0
WireConnection;751;1;758;0
WireConnection;822;0;821;1
WireConnection;822;1;821;4
WireConnection;822;2;825;0
WireConnection;761;0;31;0
WireConnection;761;1;763;0
WireConnection;550;0;815;2
WireConnection;550;1;551;0
WireConnection;794;0;435;0
WireConnection;794;1;792;0
WireConnection;750;0;752;0
WireConnection;750;2;749;0
WireConnection;750;3;724;0
WireConnection;753;0;752;0
WireConnection;753;2;751;0
WireConnection;753;3;820;0
WireConnection;732;0;733;0
WireConnection;732;2;734;0
WireConnection;732;3;611;0
WireConnection;824;0;822;0
WireConnection;824;1;825;0
WireConnection;602;0;753;0
WireConnection;602;1;750;0
WireConnection;602;2;550;0
WireConnection;823;0;824;0
WireConnection;605;0;1;0
WireConnection;605;1;602;0
WireConnection;801;0;762;0
WireConnection;801;1;823;0
WireConnection;801;2;827;0
WireConnection;250;0;8;0
WireConnection;10;0;1;0
WireConnection;10;1;250;0
WireConnection;789;0;791;0
WireConnection;789;1;605;0
WireConnection;817;0;801;0
WireConnection;762;0;761;0
WireConnection;802;0;798;0
WireConnection;802;1;799;0
WireConnection;803;0;802;0
WireConnection;803;1;799;0
WireConnection;804;0;803;0
WireConnection;827;0;799;0
WireConnection;827;3;804;0
WireConnection;0;2;761;0
WireConnection;0;9;817;0
WireConnection;0;11;789;0
WireConnection;0;12;10;0
WireConnection;1;0;794;0
WireConnection;1;1;732;0
ASEEND*/
//CHKSM=C714661BDD567C067B7659766AEB831992B8DCB9
