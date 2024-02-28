// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Particle Basic Transparent"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 0
		[ToggleUI]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 0
		[Space(5)]_Offset("Offset", Float) = -300
		_DistanceOffset("Distance Offset", Range( -100 , 100)) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space(10)]_AlphaPower("Alpha Power", Float) = 1
		_Cutoff("Alpha Cutoff", Float) = 1
		[Toggle(GREYTOALPHA_ON)] _AlphaGrey("Alpha From Greyscale", Float) = 0
		_Emission("Emission", 2D) = "black" {}
		[HDR]_Colour("Colour", Color) = (1,1,1,1)
		_TexSaturation("Tex Saturation", Range( 0 , 2)) = 1
		_TexMultiply("Tex Multiply", Float) = 1
		_TexPower("Tex Power", Float) = 1
		[Header(Bright Flicker)][Toggle(_AGEVERTEXSTREAM_ON)] _AgeVertexStream("Age Vertex Stream", Float) = 0
		_FlickerRate("Flicker Rate", Float) = 2
		_FlickerMin("Flicker Min", Float) = 2
		_FlickerMax("Flicker Max", Float) = 2
		[Space(10)][Toggle(_USEDISTANCEMOD_ON)] _UseDistanceMod("Use Distance Mod", Float) = 0
		_DistanceMax("Distance Max", Float) = 100
		_DistanceMultiply("Distance Multiply", Float) = 1
		[Space(10)][Header(. Use Particle Vertex Stream .)][Header(requires vertex stream centre zw.x)][Toggle(_VERTEXSTREAM_ON)] _VertexStream("Vertex Stream", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Advanced  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (OneMinusSrcAlpha)", Float) = 10
		[Space(5)][Header(Stencil)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask (non-zero)", Float) = 255
		_ReadMask("ReadMask (non-zero)", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" }
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
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _VERTEXSTREAM_ON
			#pragma shader_feature_local _USEDISTANCEMOD_ON
			#pragma shader_feature_local _AGEVERTEXSTREAM_ON
			#pragma shader_feature_local GREYTOALPHA_ON


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
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _ZWriteMode;
			uniform half _StencilRef;
			uniform int _Culling;
			uniform int _StencilComparison;
			uniform half _WriteMask;
			uniform float _SrcBlend;
			uniform int _StencilZFail;
			uniform int _StencilOp;
			uniform int _StencilFail;
			uniform float _DstBlend;
			uniform float _Offset;
			uniform float _ZTestMode;
			uniform half _ReadMask;
			uniform float _DistanceOffset;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;
			uniform float _TexSaturation;
			uniform float4 _Colour;
			uniform float _FlickerMin;
			uniform float _FlickerMax;
			uniform float _FlickerRate;
			uniform float _TexPower;
			uniform float _TexMultiply;
			uniform float _DistanceMax;
			uniform float _DistanceMultiply;
			uniform float _AlphaPower;
			uniform float _Cutoff;
			float3 CenterEye1_g6490(  )
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
			
			float3 CenterEye1_g6493(  )
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
				float3 appendResult591 = (float3(v.ase_texcoord.z , v.ase_texcoord.w , v.ase_texcoord1.x));
				#ifdef _VERTEXSTREAM_ON
				float3 staticSwitch504 = appendResult591;
				#else
				float3 staticSwitch504 = v.vertex.xyz;
				#endif
				float3 localCenterEye1_g6490 = CenterEye1_g6490();
				float temp_output_593_0 = distance( staticSwitch504 , localCenterEye1_g6490 );
				float clampResult597 = clamp( ( temp_output_593_0 - _ProjectionParams.y ) , 0.0 , 0.35 );
				float clampResult595 = clamp( temp_output_593_0 , _ProjectionParams.y , 0.05 );
				
				o.ase_texcoord1 = v.ase_texcoord;
				o.ase_color = v.color;
				o.ase_texcoord2 = v.ase_texcoord1;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = ( -ase_worldViewDir * ( ( clampResult597 * clampResult595 * (0.5 + (temp_output_593_0 - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) ) * _DistanceOffset ) );
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
				float clampResult40_g6523 = clamp( ( _FlickerRate / 10000.0 ) , 0.0 , 3.0 );
				float mulTime25_g6523 = _Time.y * ( 16666.0 * clampResult40_g6523 );
				float mulTime28_g6523 = _Time.y * ( 5.0 * clampResult40_g6523 );
				float temp_output_27_0_g6523 = i.ase_texcoord2.y;
				float mulTime46_g6523 = _Time.y * ( 7.0 * clampResult40_g6523 );
				float lerpResult4_g6523 = lerp( _FlickerMin , _FlickerMax , ( abs( sin( mulTime25_g6523 ) ) * pow( abs( sin( ( mulTime28_g6523 * temp_output_27_0_g6523 ) ) ) , 0.5 ) * pow( abs( sin( ( mulTime46_g6523 * ( 1.0 - temp_output_27_0_g6523 ) ) ) ) , 0.666 ) ));
				#ifdef _AGEVERTEXSTREAM_ON
				float staticSwitch631 = lerpResult4_g6523;
				#else
				float staticSwitch631 = 1.0;
				#endif
				float4 temp_output_48_0 = ( appendResult90 * _Colour * i.ase_color * staticSwitch631 );
				float3 temp_output_480_0 = (temp_output_48_0).xyz;
				float3 saferPower486 = abs( temp_output_480_0 );
				float3 temp_cast_3 = (_TexPower).xxx;
				float3 temp_output_619_0 = ( pow( saferPower486 , temp_cast_3 ) * _TexMultiply );
				float3 localCenterEye1_g6493 = CenterEye1_g6493();
				float temp_output_4_0_g6492 = distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g6493 : _WorldSpaceCameraPos ) );
				#ifdef _USEDISTANCEMOD_ON
				float3 staticSwitch614 = ( temp_output_619_0 * min( max( temp_output_4_0_g6492 , 1.0 ) , _DistanceMax ) * _DistanceMultiply );
				#else
				float3 staticSwitch614 = temp_output_619_0;
				#endif
				float grayscale489 = (temp_output_480_0.r + temp_output_480_0.g + temp_output_480_0.b) / 3;
				#ifdef GREYTOALPHA_ON
				float staticSwitch498 = grayscale489;
				#else
				float staticSwitch498 = (temp_output_48_0).w;
				#endif
				clip( staticSwitch498 - ( 1.0 - _Cutoff ));
				float4 appendResult481 = (float4(staticSwitch614 , pow( staticSwitch498 , _AlphaPower )));
				
				
				finalColor = appendResult481;
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
Node;AmplifyShaderEditor.RangedFloatNode;50;-1354.605,-888.1021;Inherit;False;Property;_TexSaturation;Tex Saturation;10;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;51;-1072.95,-880.2785;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;26;-1209.323,-807.8506;Inherit;True;Property;_Emission;Emission;8;0;Create;True;0;0;0;False;0;False;-1;None;ad581b49ac3145e438d8700b1965c9a5;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;49;-891.6777,-808.9252;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;90;-713.5485,-753.6116;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;591;-1987.68,117.6695;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;506;-2027.13,-39.96299;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;47;-1203.746,-579.8428;Inherit;False;Property;_Colour;Colour;9;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-664.9857,-603.1058;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;610;-1729.587,232.9949;Inherit;False;VR_Center_Eye;-1;;6490;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.StaticSwitch;504;-1795.158,95.58293;Inherit;False;Property;_VertexStream;Vertex Stream;20;0;Create;True;0;0;0;False;3;Space(10);Header(. Use Particle Vertex Stream .);Header(requires vertex stream centre);False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;492;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;487;-82.9158,-668.2497;Inherit;False;Property;_TexPower;Tex Power;12;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;611;-155.2094,-523.918;Inherit;False;View Distance;-1;;6492;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,0,17,0;1;9;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;593;-1378.556,119.9569;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;480;-526.0339,-604.6619;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ProjectionParams;592;-1709.362,-57.00345;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;486;72.7944,-628.3953;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;594;-1134.643,-116.908;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;620;108.878,-712.8517;Inherit;False;Property;_TexMultiply;Tex Multiply;11;0;Create;True;0;0;0;False;0;False;1;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;489;-503.4199,-402.6243;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;478;-511.0339,-496.6619;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;618;23.51807,-464.7974;Inherit;False;Property;_DistanceMax;Distance Max;18;0;Create;True;0;0;0;False;0;False;100;100;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;616;127.5181,-523.7974;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;476;-165.8205,-304.1198;Inherit;False;Property;_AlphaPower;Alpha Power;5;0;Create;True;0;0;0;True;1;Space(10);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;596;-1157.218,107.766;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;597;-968.4186,-119.0161;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.35;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;617;243.5181,-522.7974;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;50;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-231.3331,-147.7631;Inherit;False;Property;_Cutoff;Alpha Cutoff;6;0;Create;False;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;613;183.2857,-390.1974;Inherit;False;Property;_DistanceMultiply;Distance Multiply;19;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;595;-1129.207,-16.43314;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;598;-1393.354,270.1837;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;619;273.878,-629.8517;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;479;-66.43391,-142.2619;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;601;-1163.458,274.8171;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;600;-788.9415,180.9519;Inherit;False;Property;_DistanceOffset;Distance Offset;3;0;Create;True;0;0;0;False;0;False;0;0;-100;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;475;7.454091,-321.1106;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;612;396.7906,-469.918;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;599;-677.0345,-28.95584;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;24;1106.568,-655.7527;Inherit;False;670.9946;746.3742;custom properties;9;41;40;39;36;35;34;33;32;30;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;602;-506.7736,146.3291;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClipNode;471;518.6696,-297.5925;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0.005;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;603;-806.8174,142.3099;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;604;-326.7047,83.85709;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;29;676.8234,-774.3481;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);1;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;312;-3918.16,-789.9532;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;-1037.059,820.5901;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;34;1129.714,-593.6528;Half;False;Property;_StencilRef;Stencil ID;27;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;112;-1312.248,807.9111;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-1879.702,607.5383;Inherit;False;Property;_DistanceFalloff;Distance Falloff;23;0;Create;True;0;0;0;False;2;;;False;0.5;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;8;-1498.166,761.5735;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;311;-4176.35,-899.6974;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;107;-1691.312,745.5351;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;73;-1599.971,1217.147;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;72;-1858.087,1275.627;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;135;-1276.262,1092.279;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;38;374.8412,-741.6801;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.Compare;295;-3063.413,-1142.525;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;303;-2824.781,-1224.185;Float;False;float3 zaxis = normalize(target.xyz)@$float3 xaxis = normalize(cross(up, zaxis))@$float3 yaxis = cross(zaxis, xaxis)@$float4x4 lookMatrix = float4x4(xaxis.x, yaxis.x, zaxis.x, 0,xaxis.y, yaxis.y, zaxis.y, 0, xaxis.z, yaxis.z, zaxis.z, 0, 0, 0, 0, 1)@$return lookMatrix@$;6;Create;2;True;target;FLOAT3;0,0,0;In;;Float;False;True;up;FLOAT3;0,0,0;In;;Float;False;GenerateLookMatrix;True;False;0;;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4x4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;313;-3035.945,-938.0312;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.Compare;463;-2978.074,-449.0167;Inherit;False;0;4;0;INT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;33;1428.86,-593.8448;Inherit;False;Property;_StencilComparison;Stencil Comparison;30;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;353;-633.9573,1037.185;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;36;1122.534,-424.0863;Half;False;Property;_WriteMask;WriteMask (non-zero);28;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;299;-3151.058,-1284.678;Float;False;float3 centerEye = _WorldSpaceCameraPos.xyz@ $#if UNITY_SINGLE_PASS_STEREO $int startIndex = unity_StereoEyeIndex@ $unity_StereoEyeIndex = 0@ $float3 leftEye = _WorldSpaceCameraPos@ $unity_StereoEyeIndex = 1@ $float3 rightEye = _WorldSpaceCameraPos@$unity_StereoEyeIndex = startIndex@$centerEye = lerp(leftEye, rightEye, 0.5)@$#endif $float3 cam = mul(unity_WorldToObject, float4(centerEye, 1)).xyz@$return cam@;3;Create;1;True;up;FLOAT3;0,0,0;In;;Float;False;Get Local Camera Position;True;False;0;;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;64;-1841.629,951.9661;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;287;-3321.119,-950.4622;Float;False;Constant;_Vector2;Vector 2;3;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;30;1142.022,-212.5741;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);25;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Advanced  .);False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;291;-3291.624,-1205.919;Inherit;False;Property;_FixMeshAxis;Fix Mesh Axis;21;1;[Enum];Create;True;0;2;Y up;0;Z up;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;32;1448.861,-373.8444;Inherit;False;Property;_StencilZFail;StencilZFail;33;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;301;-2768.751,-953.9673;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.IntNode;39;1453.573,-521.1865;Inherit;False;Property;_StencilOp;StencilOp;31;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;35;1449.861,-448.8444;Inherit;False;Property;_StencilFail;StencilFail;32;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;305;-2496.183,-998.1573;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;56;-1024.168,1067.955;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;448;-1804.906,-938.605;Inherit;False;return unity_StereoEyeIndex[0]@;1;Create;0;leftEye;True;False;0;;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;283;-3941.929,-980.1551;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;497;-2638.192,406.0374;Inherit;False;Constant;_Vector4;Vector 4;31;0;Create;True;0;0;0;False;0;False;0,0,0,1;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;460;-2714.258,-485.0693;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.1;False;2;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;318;-2413.24,-806.8759;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;40;1404.57,-211.0041;Inherit;False;Property;_DstBlend;Destination Blend (OneMinusSrcAlpha);26;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;715.3054,-596.9597;Float;False;Property;_Offset;Offset;2;0;Create;True;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;-300;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;673.7523,-686.2844;Float;False;Property;_ZTestMode;ZTestMode (LEqual);4;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;289;-3320.285,-1110.428;Float;False;Constant;_Vector0;Vector 0;3;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;86;-2225.034,550.7049;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;352;38.68003,182.9368;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0.5,0.5,0.5,0.5;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;71;-1858.162,1107.403;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;41;1123.534,-507.6634;Half;False;Property;_ReadMask;ReadMask (non-zero);29;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;113;-2115.715,840.7001;Inherit;False;Property;_DistanceValue;Distance Value;24;0;Create;True;0;0;0;False;2;;;False;1;40;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;465;-3078.074,-444.0167;Inherit;False;return unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f@;0;Create;0;isCamera;True;False;0;;False;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;252;-2604.196,576.7235;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;309;-3751.351,-810.0972;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;500;-851.9797,1037.277;Inherit;False;Property;_DistanceScale;Distance Scale;14;0;Create;True;0;0;0;False;1;Space(20);False;0;0;0;True;DISTSCALE_ON;Toggle;2;Key0;Key1;Reference;499;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;83;-495.3981,1034.517;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;131;-474.1254,652.9921;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DistanceOpNode;6;-1960.174,692.3057;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;385;-2221.31,725.3951;Inherit;False;VR_Center_Eye;-1;;6494;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,1;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.Vector3Node;293;-3463.983,-1296.703;Float;False;Constant;_Vector7;Vector 7;18;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleDivideOpNode;129;-1863.826,822.9081;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;481;756.4673,-317.0497;Inherit;False;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomExpressionNode;449;-1803.571,-873.748;Inherit;False;return unity_StereoEyeIndex[1]@;1;Create;0;rightEye;True;False;0;;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;354;-619.9573,741.1852;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;310;-4176.276,-719.5932;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;607;927.6738,-285.6881;Float;False;True;-1;2;ASEMaterialInspector;100;5;.GenesisAria/Particle Basic Transparent;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;1;1;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;255;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;7;True;_StencilComparison;1;True;_StencilOp;1;True;_StencilFail;1;True;_StencilZFail;7;False;;1;False;;1;False;;1;False;;True;True;1;True;_ZWriteMode;True;3;True;_ZTestMode;True;True;0;True;_Offset;0;False;;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;6;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;589;-2245.797,176.1494;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;588;-2247.873,7.925344;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;250;-2865.387,467.9785;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;251;-2865.313,636.2036;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;498;-204.4714,-444.1469;Inherit;False;Property;_AlphaGrey;Alpha From Greyscale;7;0;Create;False;0;0;0;False;0;False;0;0;1;True;GREYTOALPHA_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;496;-2449.768,535.1649;Inherit;False;Property;_VertexStream;Vertex Stream;14;0;Create;True;0;0;0;False;3;Space(10);Header(. Use Particle Vertex Stream .);Header(requires vertex stream centre);False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;492;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.VertexColorNode;89;-997.404,-503.663;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;499;-863.2346,749.7186;Inherit;False;Property;_DistanceScale;Distance Scale;22;0;Create;True;0;0;0;False;1;Space(20);False;0;0;0;True;DISTSCALE_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;614;534.2857,-499.1974;Inherit;False;Property;_UseDistanceMod;Use Distance Mod;17;0;Create;True;0;0;0;False;1;Space(10);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;631;-901.1672,-327.1487;Inherit;False;Property;_AgeVertexStream;Age Vertex Stream;13;0;Create;True;0;0;0;False;1;Header(Bright Flicker);False;0;0;1;True;GREYTOALPHA_ON;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;492;-256,656;Inherit;False;Property;_VertexStream;Vertex Stream;20;0;Create;True;0;0;0;False;3;Space(10);Header(. Use Particle Vertex Stream .);Header(requires vertex stream centre zw.x);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;638;-1627.593,-278.1421;Inherit;False;Property;_FlickerRate;Flicker Rate;14;0;Create;True;0;0;0;False;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;658;-1624.593,-205.1421;Inherit;False;Property;_FlickerMin;Flicker Min;15;0;Create;True;0;0;0;False;0;False;2;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;659;-1622.593,-135.1421;Inherit;False;Property;_FlickerMax;Flicker Max;16;0;Create;True;0;0;0;False;0;False;2;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;633;-1089.46,-343.7158;Inherit;False;Constant;_Float1;Float 1;34;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;621;-1667.756,-456.6463;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;660;-1301.593,-260.1421;Inherit;False;BasicNoise;-1;;6523;ef92c0a5598ecff4d8c85ab9e80031fd;0;4;35;FLOAT;1;False;27;FLOAT;0;False;5;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;12
WireConnection;51;0;50;0
WireConnection;49;0;26;0
WireConnection;49;1;51;0
WireConnection;90;0;49;0
WireConnection;90;3;26;4
WireConnection;591;0;588;3
WireConnection;591;1;588;4
WireConnection;591;2;589;1
WireConnection;48;0;90;0
WireConnection;48;1;47;0
WireConnection;48;2;89;0
WireConnection;48;3;631;0
WireConnection;504;1;506;0
WireConnection;504;0;591;0
WireConnection;593;0;504;0
WireConnection;593;1;610;0
WireConnection;480;0;48;0
WireConnection;486;0;480;0
WireConnection;486;1;487;0
WireConnection;594;0;593;0
WireConnection;594;1;592;2
WireConnection;489;0;480;0
WireConnection;478;0;48;0
WireConnection;616;0;611;0
WireConnection;596;0;593;0
WireConnection;597;0;594;0
WireConnection;617;0;616;0
WireConnection;617;1;618;0
WireConnection;595;0;593;0
WireConnection;595;1;592;2
WireConnection;619;0;486;0
WireConnection;619;1;620;0
WireConnection;479;0;31;0
WireConnection;601;0;598;0
WireConnection;475;0;498;0
WireConnection;475;1;476;0
WireConnection;612;0;619;0
WireConnection;612;1;617;0
WireConnection;612;2;613;0
WireConnection;599;0;597;0
WireConnection;599;1;595;0
WireConnection;599;2;596;0
WireConnection;602;0;599;0
WireConnection;602;1;600;0
WireConnection;471;0;475;0
WireConnection;471;1;498;0
WireConnection;471;2;479;0
WireConnection;603;0;601;0
WireConnection;604;0;603;0
WireConnection;604;1;602;0
WireConnection;312;0;311;3
WireConnection;312;1;311;4
WireConnection;312;2;310;1
WireConnection;132;0;112;0
WireConnection;132;1;64;0
WireConnection;112;0;8;0
WireConnection;8;0;107;0
WireConnection;8;1;5;0
WireConnection;107;0;6;0
WireConnection;107;1;129;0
WireConnection;73;0;71;3
WireConnection;73;1;71;4
WireConnection;73;2;72;1
WireConnection;135;0;73;0
WireConnection;135;1;64;0
WireConnection;295;0;291;0
WireConnection;295;2;289;0
WireConnection;295;3;287;0
WireConnection;303;0;299;0
WireConnection;303;1;295;0
WireConnection;313;0;309;0
WireConnection;463;0;465;0
WireConnection;353;0;500;0
WireConnection;299;0;293;0
WireConnection;301;0;313;0
WireConnection;301;1;313;1
WireConnection;305;0;303;0
WireConnection;305;1;301;0
WireConnection;56;0;112;0
WireConnection;56;1;135;0
WireConnection;460;2;463;0
WireConnection;318;0;309;0
WireConnection;86;0;496;0
WireConnection;352;1;492;0
WireConnection;252;0;250;3
WireConnection;252;1;250;4
WireConnection;252;2;251;1
WireConnection;309;0;283;0
WireConnection;309;1;312;0
WireConnection;500;0;56;0
WireConnection;83;0;353;0
WireConnection;131;0;354;0
WireConnection;6;0;86;0
WireConnection;6;1;385;0
WireConnection;129;0;113;0
WireConnection;481;0;614;0
WireConnection;481;3;471;0
WireConnection;354;0;499;0
WireConnection;607;0;481;0
WireConnection;607;1;604;0
WireConnection;498;1;478;0
WireConnection;498;0;489;0
WireConnection;496;1;497;0
WireConnection;496;0;252;0
WireConnection;499;0;132;0
WireConnection;614;1;619;0
WireConnection;614;0;612;0
WireConnection;631;1;633;0
WireConnection;631;0;660;12
WireConnection;492;1;131;0
WireConnection;492;0;83;0
WireConnection;660;35;638;0
WireConnection;660;27;621;2
WireConnection;660;5;658;0
WireConnection;660;3;659;0
ASEEND*/
//CHKSM=872B53E872649064FFC18A3B8ADDB9CA779F81BD
