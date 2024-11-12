// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/litSample"
{
	Properties
	{
		[ToggleUI][Space(10)]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 0
		[Enum(Clip,1,Clamp,0)]_ZClipping("ZClipping", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 1
		[Header(default required for transparent camera)][Enum(NoUpdateAlpha,14,Default,15)]_ColorMask("Alpha Render (Colour Mask)", Float) = 15
		_MainTex("MainTex", 2D) = "white" {}
		_Normal("Normal", 2D) = "white" {}
		_shadowmax("shadow max", Float) = 0
		_shadowmin("shadow min", Float) = 0
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.68
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.55
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.44
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(.  Debug  .)]_SrcBlend("Source Blend (SrcAlpha)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (OneMinusSrcAlpha)", Float) = 10
		[Enum(UnityEngine.Rendering.BlendOp)][Space(5)]_BlendOp("BlendOp", Float) = 1
		[Space(5)][Header(Stencil)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask (non-zero)", Float) = 255
		_ReadMask("ReadMask (non-zero)", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		_Emission("Emission", 2D) = "white" {}
		[HDR]_fogcolbias("Fog Colour Bias", Color) = (1,1,1)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" }
	LOD 100
		ZClip [_ZClipping]

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		BlendOp [_BlendOp]
		AlphaToMask Off
		Cull [_Culling]
		ColorMask [_ColorMask]
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
		
		
		Pass
		{
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }

			ZClip [_ZClipping]
			ZWrite [_ZWriteMode]
			Blend [_SrcBlend] [_DstBlend]

			CGPROGRAM
			#define UNITY_STANDARD_USE_DITHER_MASK 1
			#pragma multi_compile_instancing
			#pragma multi_compile __ LOD_FADE_CROSSFADE
			#define ASE_NEEDS_FRAG_SHADOWCOORDS

			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fog
			#pragma multi_compile_fwdbase
			#ifndef UNITY_PASS_FORWARDBASE
				#define UNITY_PASS_FORWARDBASE
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"

			#include "AutoLight.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if defined(LIGHTMAP_ON) || (!defined(LIGHTMAP_ON) && SHADER_TARGET >= 30)
					float4 lmap : TEXCOORD0;
				#endif
				#if !defined(LIGHTMAP_ON) && UNITY_SHOULD_SAMPLE_SH
					half3 sh : TEXCOORD1;
				#endif
				#if defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS) && UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(2,3)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(2)
					#else
						SHADOW_COORDS(2)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(4)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD8;
				#endif
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform float _DstBlend;
			uniform int _StencilComparison;
			uniform int _StencilZFail;
			uniform int _Culling;
			uniform float _SrcBlend;
			uniform float _ZWriteMode;
			uniform half _ColorMask;
			uniform half _StencilRef;
			uniform float _BlendOp;
			uniform float _ZTestMode;
			uniform float _ZClipping;
			uniform int _StencilFail;
			uniform int _StencilOp;
			uniform half _WriteMask;
			uniform half _ReadMask;
			uniform float3 _fogcolbias;
			uniform float _shadowmin;
			uniform float _shadowmax;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform half _StaticLightX;
			uniform half _StaticLightY;
			uniform half _StaticLightZ;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;

			uniform float _unity_fogCoord;
			uniform float _VRChatMirrorMode;

			//This is a late directive
			
			float3 unity_SHArgb3_g333(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			
			half3 SHArgbambientDir(  )
			{
				return float4(Unity_SafeNormalize(unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz), 1.0);
			}
			
			float checkfog2153_g1865( float linearfalloff, float expfalloff, float exp2falloff )
			{
				#if defined(FOG_EXP)
				return expfalloff;
				#elif defined(FOG_EXP2)
				return exp2falloff;
				#else
				return linearfalloff;
				#endif
			}
			
			float3 CenterEye1_g332(  )
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
			
			float2 checkexp131_g1853( float2 exp2fog, float2 expfog )
			{
				#if defined(FOG_EXP2)
				return exp2fog;
				#else
				return expfog;
				#endif
			}
			
			float3 checkfog90_g1866( float3 finalfogexp, float3 finalcol, float3 finalfog )
			{
				#if defined(FOG_LINEAR)
				return finalfog;
				#elif defined(FOG_EXP) || defined(FOG_EXP2)
				return finalfogexp;
				#else
				return finalcol;
				#endif
			}
			
			float3 checkfog90_g1867( float3 finalfogexp, float3 finalcol, float3 finalfog )
			{
				#if defined(FOG_LINEAR)
				return finalfog;
				#elif defined(FOG_EXP) || defined(FOG_EXP2)
				return finalfogexp;
				#else
				return finalcol;
				#endif
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord9.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
				o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				#ifdef LIGHTMAP_ON
				o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						#ifdef VERTEXLIGHT_ON
						o.sh += Shade4PointLights (
							unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
							unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
							unity_4LightAtten0, worldPos, worldNormal);
						#endif
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(o.pos);
				#endif
				
				//asymptotic farplane squashing thanks to lyuma
				//const float squeeze_fraction = 0.01;
				//if ((o.pos.z / o.pos.w >= 1.0 - squeeze_fraction) && _VRChatMirrorMode == 0) {
				//   o.pos.z = o.pos.w * 0.99999 * (1.0 - (exp(-abs(o.pos.z - o.pos.w))) * squeeze_fraction);
				//   }
				//o.vertex.z = clamp(o.vertex.z, 0, o.vertex.w * 0.9999);
				
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN 
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					half atten = 1;
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				float3 fogcolour146_g1866 = ( float4( _fogcolbias , 0.0 ) * unity_FogColor ).rgb;
				float3 localunity_SHArgb3_g333 = unity_SHArgb3_g333();
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float temp_output_189_0 = ( float4(atten,0,0,0) + 0.0 );
				float3 appendResult191 = (float3(temp_output_189_0 , temp_output_189_0 , temp_output_189_0));
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(worldPos);
				float3 temp_output_117_0 = ( localunity_SHArgb3_g333 + ( ase_lightColor.rgb * ase_lightColor.a * (ase_lightColor).a * appendResult191 ) + ( worldSpaceLightDir * float3( 0,0,0 ) ) );
				float2 uv_Normal = IN.ase_texcoord9.xy * _Normal_ST.xy + _Normal_ST.zw;
				float4 tex2DNode99 = tex2D( _Normal, uv_Normal );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal46 = tex2DNode99.rgb;
				float3 worldNormal46 = normalize( float3(dot(tanToWorld0,tanNormal46), dot(tanToWorld1,tanNormal46), dot(tanToWorld2,tanNormal46)) );
				half3 localSHArgbambientDir6_g325 = SHArgbambientDir();
				float grayscale138 = (ase_lightColor.rgb.r + ase_lightColor.rgb.g + ase_lightColor.rgb.b) / 3;
				float3 appendResult136 = (float3(_StaticLightX , _StaticLightY , _StaticLightZ));
				float3 temp_output_130_0 = ( localSHArgbambientDir6_g325 + ( ( grayscale138 * ase_lightColor.a ) > 0.0 ? worldSpaceLightDir : appendResult136 ) );
				float dotResult48 = dot( worldNormal46 , temp_output_130_0 );
				float lerpResult155 = lerp( _shadowmin , _shadowmax , saturate( dotResult48 ));
				float2 uv_MainTex = IN.ase_texcoord9.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 temp_output_50_0 = ( temp_output_117_0 * lerpResult155 * tex2D( _MainTex, uv_MainTex ).rgb );
				float2 uv_Emission = IN.ase_texcoord9.xy * _Emission_ST.xy + _Emission_ST.zw;
				float temp_output_26_0_g1853 = distance( worldPos , _WorldSpaceCameraPos );
				float temp_output_14_0_g1853 = ( ( ( temp_output_26_0_g1853 * 1.2 ) * unity_FogParams.z ) + unity_FogParams.w );
				float temp_output_7_0_g1853 = ( pow( saturate( ( -temp_output_14_0_g1853 + ( unity_FogParams.w * 0.333 ) ) ) , 0.75 ) * 5.0 );
				float linearfalloff27_g1853 = min( temp_output_7_0_g1853 , 3.0 );
				float temp_output_128_0_g1853 = ( unity_FogParams.y * temp_output_26_0_g1853 );
				float saferPower134_g1853 = abs( ( temp_output_128_0_g1853 * 0.75 ) );
				float expfalloff138_g1853 = pow( saferPower134_g1853 , 0.5 );
				float temp_output_124_0_g1853 = ( unity_FogParams.x * temp_output_26_0_g1853 );
				float saferPower136_g1853 = abs( ( 0.75 * temp_output_124_0_g1853 ) );
				float exp2falloff137_g1853 = pow( saferPower136_g1853 , 0.5 );
				float3 appendResult31_g1853 = (float3(linearfalloff27_g1853 , expfalloff138_g1853 , exp2falloff137_g1853));
				float3 mips1662 = appendResult31_g1853;
				float3 break227_g1865 = mips1662;
				float linearfalloff153_g1865 = break227_g1865.x;
				float expfalloff153_g1865 = break227_g1865.y;
				float exp2falloff153_g1865 = break227_g1865.z;
				float localcheckfog2153_g1865 = checkfog2153_g1865( linearfalloff153_g1865 , expfalloff153_g1865 , exp2falloff153_g1865 );
				float4 tex2DNode196 = tex2Dbias( _Emission, float4( uv_Emission, 0, localcheckfog2153_g1865) );
				float3 tanNormal101 = tex2DNode99.rgb;
				float3 worldNormal101 = normalize( float3(dot(tanToWorld0,tanNormal101), dot(tanToWorld1,tanNormal101), dot(tanToWorld2,tanNormal101)) );
				float3 localCenterEye1_g332 = CenterEye1_g332();
				float3 temp_output_4_0_g332 = ( localCenterEye1_g332 - worldPos );
				float3 normalizeResult5_g332 = normalize( temp_output_4_0_g332 );
				float3 normalizeResult164 = normalize( ( temp_output_130_0 + normalizeResult5_g332 ) );
				float dotResult100 = dot( worldNormal101 , normalizeResult164 );
				float saferPower106 = abs( saturate( dotResult100 ) );
				float temp_output_111_0 = max( pow( saferPower106 , 50.0 ) , 0.0 );
				float3 appendResult108 = (float3(temp_output_111_0 , temp_output_111_0 , temp_output_111_0));
				float3 lightcolour284 = temp_output_117_0;
				float3 temp_output_286_0 = ( appendResult108 * lightcolour284 );
				float3 colour145_g1866 = ( temp_output_50_0 + tex2DNode196.rgb + temp_output_286_0 );
				float temp_output_149_0_g1853 = pow( exp( -temp_output_124_0_g1853 ) , 2.0 );
				float saferPower140_g1853 = abs( temp_output_149_0_g1853 );
				float2 appendResult133_g1853 = (float2(temp_output_149_0_g1853 , pow( saferPower140_g1853 , 0.2 )));
				float2 exp2fog131_g1853 = appendResult133_g1853;
				float temp_output_129_0_g1853 = exp( -temp_output_128_0_g1853 );
				float saferPower139_g1853 = abs( temp_output_129_0_g1853 );
				float2 appendResult132_g1853 = (float2(temp_output_129_0_g1853 , pow( saferPower139_g1853 , 0.2 )));
				float2 expfog131_g1853 = appendResult132_g1853;
				float2 localcheckexp131_g1853 = checkexp131_g1853( exp2fog131_g1853 , expfog131_g1853 );
				float2 expblend1664 = localcheckexp131_g1853;
				float2 break183_g1866 = expblend1664;
				float3 lerpResult178_g1866 = lerp( fogcolour146_g1866 , colour145_g1866 , break183_g1866.x);
				float3 colourbias147_g1866 = tex2DNode196.rgb;
				float3 lerpResult278_g1866 = lerp( colour145_g1866 , ( fogcolour146_g1866 + colourbias147_g1866 ) , ( 1.0 - break183_g1866.x ));
				float3 lerpResult179_g1866 = lerp( lerpResult178_g1866 , lerpResult278_g1866 , break183_g1866.y);
				float3 finalfogexp90_g1866 = lerpResult179_g1866;
				float3 finalcol90_g1866 = colour145_g1866;
				float saferPower115_g1853 = abs( saturate( ( unity_FogParams.w + ( unity_FogParams.z * ( temp_output_26_0_g1853 * 0.5 ) ) ) ) );
				float2 appendResult28_g1853 = (float2(saturate( temp_output_14_0_g1853 ) , max( pow( saferPower115_g1853 , 3.0 ) , 0.05 )));
				float2 linearblend1663 = appendResult28_g1853;
				float2 break181_g1866 = linearblend1663;
				float3 lerpResult58_g1866 = lerp( fogcolour146_g1866 , colour145_g1866 , break181_g1866.x);
				float3 lerpResult249_g1866 = lerp( colour145_g1866 , ( fogcolour146_g1866 + colourbias147_g1866 ) , ( 1.0 - break181_g1866.x ));
				float3 lerpResult128_g1866 = lerp( lerpResult58_g1866 , lerpResult249_g1866 , break181_g1866.y);
				float3 finalfog90_g1866 = lerpResult128_g1866;
				float3 localcheckfog90_g1866 = checkfog90_g1866( finalfogexp90_g1866 , finalcol90_g1866 , finalfog90_g1866 );
				float3 color1792 = IsGammaSpace() ? float3(0,0,0) : float3(0,0,0);
				float3 fogcolour146_g1867 = color1792;
				float3 colour145_g1867 = ( temp_output_50_0 + temp_output_286_0 );
				float2 break183_g1867 = expblend1664;
				float3 lerpResult178_g1867 = lerp( fogcolour146_g1867 , colour145_g1867 , break183_g1867.x);
				float3 colourbias147_g1867 = temp_output_50_0;
				float3 lerpResult278_g1867 = lerp( colour145_g1867 , ( fogcolour146_g1867 + colourbias147_g1867 ) , ( 1.0 - break183_g1867.x ));
				float3 lerpResult179_g1867 = lerp( lerpResult178_g1867 , lerpResult278_g1867 , break183_g1867.y);
				float3 finalfogexp90_g1867 = lerpResult179_g1867;
				float3 finalcol90_g1867 = colour145_g1867;
				float2 break181_g1867 = linearblend1663;
				float3 lerpResult58_g1867 = lerp( fogcolour146_g1867 , colour145_g1867 , break181_g1867.x);
				float3 lerpResult249_g1867 = lerp( colour145_g1867 , ( fogcolour146_g1867 + colourbias147_g1867 ) , ( 1.0 - break181_g1867.x ));
				float3 lerpResult128_g1867 = lerp( lerpResult58_g1867 , lerpResult249_g1867 , break181_g1867.y);
				float3 finalfog90_g1867 = lerpResult128_g1867;
				float3 localcheckfog90_g1867 = checkfog90_g1867( finalfogexp90_g1867 , finalcol90_g1867 , finalfog90_g1867 );
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch154 = localcheckfog90_g1867;
				#else
				float3 staticSwitch154 = localcheckfog90_g1866;
				#endif
				
				o.Albedo = staticSwitch154;
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = half3( 0, 0, 0 );
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = 0;
				#endif
				o.Smoothness = 0;
				o.Occlusion = 1;
				o.Alpha = 1;
				float3 BakedGI = 0;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				fixed4 c = 0;
				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				c.rgb += o.Albedo;


				c.rgb += o.Emission;

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				return c;
			}
			ENDCG
		}
		

		
		Pass
		{
			Name "ForwardAdd"
			Tags { "LightMode"="ForwardAdd" }
			ZClip [_ZClipping]
			ZWrite [_ZWriteMode]
			Blend One One

			CGPROGRAM
			#define UNITY_STANDARD_USE_DITHER_MASK 1
			#pragma multi_compile_instancing
			#pragma multi_compile __ LOD_FADE_CROSSFADE
			#define ASE_NEEDS_FRAG_SHADOWCOORDS

			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fog
			#pragma skip_variants INSTANCING_ON
			#pragma multi_compile_fwdadd_fullshadows
			#ifndef UNITY_PASS_FORWARDADD
				#define UNITY_PASS_FORWARDADD
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(1,2)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(1)
					#else
						SHADOW_COORDS(1)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(3)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD8;
				#endif
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform float _DstBlend;
			uniform int _StencilComparison;
			uniform int _StencilZFail;
			uniform int _Culling;
			uniform float _SrcBlend;
			uniform float _ZWriteMode;
			uniform half _ColorMask;
			uniform half _StencilRef;
			uniform float _BlendOp;
			uniform float _ZTestMode;
			uniform float _ZClipping;
			uniform int _StencilFail;
			uniform int _StencilOp;
			uniform half _WriteMask;
			uniform half _ReadMask;
			uniform float3 _fogcolbias;
			uniform float _shadowmin;
			uniform float _shadowmax;
			uniform sampler2D _Normal;
			uniform float4 _Normal_ST;
			uniform half _StaticLightX;
			uniform half _StaticLightY;
			uniform half _StaticLightZ;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform sampler2D _Emission;
			uniform float4 _Emission_ST;

			uniform float _unity_fogCoord;
			uniform float _VRChatMirrorMode;

			//This is a late directive
			
			float3 unity_SHArgb3_g333(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			
			half3 SHArgbambientDir(  )
			{
				return float4(Unity_SafeNormalize(unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz), 1.0);
			}
			
			float checkfog2153_g1865( float linearfalloff, float expfalloff, float exp2falloff )
			{
				#if defined(FOG_EXP)
				return expfalloff;
				#elif defined(FOG_EXP2)
				return exp2falloff;
				#else
				return linearfalloff;
				#endif
			}
			
			float3 CenterEye1_g332(  )
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
			
			float2 checkexp131_g1853( float2 exp2fog, float2 expfog )
			{
				#if defined(FOG_EXP2)
				return exp2fog;
				#else
				return expfog;
				#endif
			}
			
			float3 checkfog90_g1866( float3 finalfogexp, float3 finalcol, float3 finalfog )
			{
				#if defined(FOG_LINEAR)
				return finalfog;
				#elif defined(FOG_EXP) || defined(FOG_EXP2)
				return finalfogexp;
				#else
				return finalcol;
				#endif
			}
			
			float3 checkfog90_g1867( float3 finalfogexp, float3 finalcol, float3 finalfog )
			{
				#if defined(FOG_LINEAR)
				return finalfog;
				#elif defined(FOG_EXP) || defined(FOG_EXP2)
				return finalfogexp;
				#else
				return finalcol;
				#endif
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord9.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif
				

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(o.pos);
				#endif
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag ( v2f IN 
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					half atten = 1;
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif


				float3 fogcolour146_g1866 = ( float4( _fogcolbias , 0.0 ) * unity_FogColor ).rgb;
				float3 localunity_SHArgb3_g333 = unity_SHArgb3_g333();
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float temp_output_189_0 = ( float4(atten,0,0,0) + 0.0 );
				float3 appendResult191 = (float3(temp_output_189_0 , temp_output_189_0 , temp_output_189_0));
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(worldPos);
				float3 temp_output_117_0 = ( localunity_SHArgb3_g333 + ( ase_lightColor.rgb * ase_lightColor.a * (ase_lightColor).a * appendResult191 ) + ( worldSpaceLightDir * float3( 0,0,0 ) ) );
				float2 uv_Normal = IN.ase_texcoord9.xy * _Normal_ST.xy + _Normal_ST.zw;
				float4 tex2DNode99 = tex2D( _Normal, uv_Normal );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal46 = tex2DNode99.rgb;
				float3 worldNormal46 = normalize( float3(dot(tanToWorld0,tanNormal46), dot(tanToWorld1,tanNormal46), dot(tanToWorld2,tanNormal46)) );
				half3 localSHArgbambientDir6_g325 = SHArgbambientDir();
				float grayscale138 = (ase_lightColor.rgb.r + ase_lightColor.rgb.g + ase_lightColor.rgb.b) / 3;
				float3 appendResult136 = (float3(_StaticLightX , _StaticLightY , _StaticLightZ));
				float3 temp_output_130_0 = ( localSHArgbambientDir6_g325 + ( ( grayscale138 * ase_lightColor.a ) > 0.0 ? worldSpaceLightDir : appendResult136 ) );
				float dotResult48 = dot( worldNormal46 , temp_output_130_0 );
				float lerpResult155 = lerp( _shadowmin , _shadowmax , saturate( dotResult48 ));
				float2 uv_MainTex = IN.ase_texcoord9.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 temp_output_50_0 = ( temp_output_117_0 * lerpResult155 * tex2D( _MainTex, uv_MainTex ).rgb );
				float2 uv_Emission = IN.ase_texcoord9.xy * _Emission_ST.xy + _Emission_ST.zw;
				float temp_output_26_0_g1853 = distance( worldPos , _WorldSpaceCameraPos );
				float temp_output_14_0_g1853 = ( ( ( temp_output_26_0_g1853 * 1.2 ) * unity_FogParams.z ) + unity_FogParams.w );
				float temp_output_7_0_g1853 = ( pow( saturate( ( -temp_output_14_0_g1853 + ( unity_FogParams.w * 0.333 ) ) ) , 0.75 ) * 5.0 );
				float linearfalloff27_g1853 = min( temp_output_7_0_g1853 , 3.0 );
				float temp_output_128_0_g1853 = ( unity_FogParams.y * temp_output_26_0_g1853 );
				float saferPower134_g1853 = abs( ( temp_output_128_0_g1853 * 0.75 ) );
				float expfalloff138_g1853 = pow( saferPower134_g1853 , 0.5 );
				float temp_output_124_0_g1853 = ( unity_FogParams.x * temp_output_26_0_g1853 );
				float saferPower136_g1853 = abs( ( 0.75 * temp_output_124_0_g1853 ) );
				float exp2falloff137_g1853 = pow( saferPower136_g1853 , 0.5 );
				float3 appendResult31_g1853 = (float3(linearfalloff27_g1853 , expfalloff138_g1853 , exp2falloff137_g1853));
				float3 mips1662 = appendResult31_g1853;
				float3 break227_g1865 = mips1662;
				float linearfalloff153_g1865 = break227_g1865.x;
				float expfalloff153_g1865 = break227_g1865.y;
				float exp2falloff153_g1865 = break227_g1865.z;
				float localcheckfog2153_g1865 = checkfog2153_g1865( linearfalloff153_g1865 , expfalloff153_g1865 , exp2falloff153_g1865 );
				float4 tex2DNode196 = tex2Dbias( _Emission, float4( uv_Emission, 0, localcheckfog2153_g1865) );
				float3 tanNormal101 = tex2DNode99.rgb;
				float3 worldNormal101 = normalize( float3(dot(tanToWorld0,tanNormal101), dot(tanToWorld1,tanNormal101), dot(tanToWorld2,tanNormal101)) );
				float3 localCenterEye1_g332 = CenterEye1_g332();
				float3 temp_output_4_0_g332 = ( localCenterEye1_g332 - worldPos );
				float3 normalizeResult5_g332 = normalize( temp_output_4_0_g332 );
				float3 normalizeResult164 = normalize( ( temp_output_130_0 + normalizeResult5_g332 ) );
				float dotResult100 = dot( worldNormal101 , normalizeResult164 );
				float saferPower106 = abs( saturate( dotResult100 ) );
				float temp_output_111_0 = max( pow( saferPower106 , 50.0 ) , 0.0 );
				float3 appendResult108 = (float3(temp_output_111_0 , temp_output_111_0 , temp_output_111_0));
				float3 lightcolour284 = temp_output_117_0;
				float3 temp_output_286_0 = ( appendResult108 * lightcolour284 );
				float3 colour145_g1866 = ( temp_output_50_0 + tex2DNode196.rgb + temp_output_286_0 );
				float temp_output_149_0_g1853 = pow( exp( -temp_output_124_0_g1853 ) , 2.0 );
				float saferPower140_g1853 = abs( temp_output_149_0_g1853 );
				float2 appendResult133_g1853 = (float2(temp_output_149_0_g1853 , pow( saferPower140_g1853 , 0.2 )));
				float2 exp2fog131_g1853 = appendResult133_g1853;
				float temp_output_129_0_g1853 = exp( -temp_output_128_0_g1853 );
				float saferPower139_g1853 = abs( temp_output_129_0_g1853 );
				float2 appendResult132_g1853 = (float2(temp_output_129_0_g1853 , pow( saferPower139_g1853 , 0.2 )));
				float2 expfog131_g1853 = appendResult132_g1853;
				float2 localcheckexp131_g1853 = checkexp131_g1853( exp2fog131_g1853 , expfog131_g1853 );
				float2 expblend1664 = localcheckexp131_g1853;
				float2 break183_g1866 = expblend1664;
				float3 lerpResult178_g1866 = lerp( fogcolour146_g1866 , colour145_g1866 , break183_g1866.x);
				float3 colourbias147_g1866 = tex2DNode196.rgb;
				float3 lerpResult278_g1866 = lerp( colour145_g1866 , ( fogcolour146_g1866 + colourbias147_g1866 ) , ( 1.0 - break183_g1866.x ));
				float3 lerpResult179_g1866 = lerp( lerpResult178_g1866 , lerpResult278_g1866 , break183_g1866.y);
				float3 finalfogexp90_g1866 = lerpResult179_g1866;
				float3 finalcol90_g1866 = colour145_g1866;
				float saferPower115_g1853 = abs( saturate( ( unity_FogParams.w + ( unity_FogParams.z * ( temp_output_26_0_g1853 * 0.5 ) ) ) ) );
				float2 appendResult28_g1853 = (float2(saturate( temp_output_14_0_g1853 ) , max( pow( saferPower115_g1853 , 3.0 ) , 0.05 )));
				float2 linearblend1663 = appendResult28_g1853;
				float2 break181_g1866 = linearblend1663;
				float3 lerpResult58_g1866 = lerp( fogcolour146_g1866 , colour145_g1866 , break181_g1866.x);
				float3 lerpResult249_g1866 = lerp( colour145_g1866 , ( fogcolour146_g1866 + colourbias147_g1866 ) , ( 1.0 - break181_g1866.x ));
				float3 lerpResult128_g1866 = lerp( lerpResult58_g1866 , lerpResult249_g1866 , break181_g1866.y);
				float3 finalfog90_g1866 = lerpResult128_g1866;
				float3 localcheckfog90_g1866 = checkfog90_g1866( finalfogexp90_g1866 , finalcol90_g1866 , finalfog90_g1866 );
				float3 color1792 = IsGammaSpace() ? float3(0,0,0) : float3(0,0,0);
				float3 fogcolour146_g1867 = color1792;
				float3 colour145_g1867 = ( temp_output_50_0 + temp_output_286_0 );
				float2 break183_g1867 = expblend1664;
				float3 lerpResult178_g1867 = lerp( fogcolour146_g1867 , colour145_g1867 , break183_g1867.x);
				float3 colourbias147_g1867 = temp_output_50_0;
				float3 lerpResult278_g1867 = lerp( colour145_g1867 , ( fogcolour146_g1867 + colourbias147_g1867 ) , ( 1.0 - break183_g1867.x ));
				float3 lerpResult179_g1867 = lerp( lerpResult178_g1867 , lerpResult278_g1867 , break183_g1867.y);
				float3 finalfogexp90_g1867 = lerpResult179_g1867;
				float3 finalcol90_g1867 = colour145_g1867;
				float2 break181_g1867 = linearblend1663;
				float3 lerpResult58_g1867 = lerp( fogcolour146_g1867 , colour145_g1867 , break181_g1867.x);
				float3 lerpResult249_g1867 = lerp( colour145_g1867 , ( fogcolour146_g1867 + colourbias147_g1867 ) , ( 1.0 - break181_g1867.x ));
				float3 lerpResult128_g1867 = lerp( lerpResult58_g1867 , lerpResult249_g1867 , break181_g1867.y);
				float3 finalfog90_g1867 = lerpResult128_g1867;
				float3 localcheckfog90_g1867 = checkfog90_g1867( finalfogexp90_g1867 , finalcol90_g1867 , finalfog90_g1867 );
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch154 = localcheckfog90_g1867;
				#else
				float3 staticSwitch154 = localcheckfog90_g1866;
				#endif
				
				o.Albedo = staticSwitch154;
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = half3( 0, 0, 0 );
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = 0;
				#endif
				o.Smoothness = 0;
				o.Occlusion = 1;
				o.Alpha = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;


				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				fixed4 c = 0;
				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				c.rgb += o.Albedo;

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				return c;
			}
			ENDCG
		}
		

		
		Pass
		{
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			ZClip False
			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			CGPROGRAM
			#define UNITY_STANDARD_USE_DITHER_MASK 1
			#pragma multi_compile_instancing
			#pragma multi_compile __ LOD_FADE_CROSSFADE
			#define ASE_NEEDS_FRAG_SHADOWCOORDS

			#pragma vertex vert
			#pragma fragment frag
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma multi_compile_shadowcaster
			#ifndef UNITY_PASS_SHADOWCASTER
				#define UNITY_PASS_SHADOWCASTER
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#define _MAIN_LIGHT_SHADOWS 1
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"

			
			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				V2F_SHADOW_CASTER;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef UNITY_STANDARD_USE_DITHER_MASK
				sampler3D _DitherMaskLOD;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform float _DstBlend;
			uniform int _StencilComparison;
			uniform int _StencilZFail;
			uniform int _Culling;
			uniform float _SrcBlend;
			uniform float _ZWriteMode;
			uniform half _ColorMask;
			uniform half _StencilRef;
			uniform float _BlendOp;
			uniform float _ZTestMode;
			uniform float _ZClipping;
			uniform int _StencilFail;
			uniform int _StencilOp;
			uniform half _WriteMask;
			uniform half _ReadMask;


			
			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;

				TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN 
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				#if !defined( CAN_SKIP_VPOS )
				, UNITY_VPOS_TYPE vpos : VPOS
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif

				
				o.Normal = fixed3( 0, 0, 1 );
				o.Occlusion = 1;
				o.Alpha = 1;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_SHADOW_ON
					if (unity_LightShadowBias.z != 0.0)
						clip(o.Alpha - AlphaClipThresholdShadow);
					#ifdef _ALPHATEST_ON
					#endif
				#endif

				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif

				#ifdef UNITY_STANDARD_USE_DITHER_MASK
					half alphaRef = tex3D(_DitherMaskLOD, float3(vpos.xy*0.25,o.Alpha*0.9375)).a;
					clip(alphaRef - 0.01);
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				SHADOW_CASTER_FRAGMENT(IN)
			}
			ENDCG
		}
		
}
	CustomEditor "ASEMaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.CommentaryNode;167;-2253.405,-494.0516;Inherit;False;1045.86;328.3081;;8;76;116;117;191;284;34;187;1773;light colour;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;168;-2879.993,121.5853;Inherit;False;554.3638;442.1776;fallback light;7;133;134;135;136;137;138;139;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;166;-2052.366,408.1698;Inherit;False;1289.256;545.3298;;12;100;111;101;160;162;163;164;106;165;108;285;303;blinn-phong specular basic;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;169;19.20606,-217.7477;Inherit;False;271;136;add pass filter;1;154;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;170;632.457,-582.6749;Inherit;False;670.9946;746.3742;custom properties;10;180;179;178;177;176;175;174;173;172;171;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LightAttenuation;187;-2243.06,-264.9584;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;189;-2025.135,-265.5972;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;34;-2197.414,-402.1056;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;191;-1889.17,-282.6211;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;1773;-2048.03,-402.2742;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;116;-1755.226,-453.357;Inherit;False;GetBakedLight;-1;;333;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;76;-1721.589,-357.607;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0.1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;137;-2829.993,171.5853;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;133;-2824.802,304.4377;Half;False;Property;_StaticLightX;Static Light X;8;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;0.1833888;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-2823.18,450.763;Half;False;Property;_StaticLightZ;Static Light Z;10;0;Create;True;0;0;0;False;0;False;0.44;0.44;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;135;-2824.895,378.7214;Half;False;Property;_StaticLightY;Static Light Y;9;0;Create;True;0;0;0;False;0;False;0.55;0.55;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;141;-2186.161,99.33569;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;136;-2503.629,311.4287;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;139;-2506.102,202.2394;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;140;-2110.771,179.57;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;129;-2108.556,3.612513;Inherit;False;GetBakedLight;-1;;325;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.SimpleAddOpNode;130;-1804.354,78.54279;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;162;-1997.05,816.4996;Inherit;False;VR_Center_Eye;-1;;332;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.WireNode;165;-1848.165,546.3259;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;99;-3301.322,-105.7679;Inherit;True;Property;_Normal;Normal;5;0;Create;True;0;0;0;False;0;False;-1;None;76eaeb16d4f123b47a34a240ac8ca26f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;0.5;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.WireNode;145;-2916.01,491.8828;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;163;-1750.575,649.6536;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;164;-1640.238,648.3491;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;101;-1733.891,458.1698;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;100;-1505.223,510.9521;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;46;-1839.355,-124.5626;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SaturateNode;303;-1314.663,509.7212;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;48;-1638.556,-15.52572;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;106;-1171.418,511.6525;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;50;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1770;-1964.971,-670.3171;Inherit;False;Custom Fog Falloffs;-1;;1853;4eca9e52d1b3593439bec7b0035da53d;0;0;3;FLOAT2;30;FLOAT2;145;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;131;-1366.726,242.022;Inherit;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;52;-1429.515,48.54716;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;157;-1430.199,-90.89195;Inherit;False;Property;_shadowmin;shadow min;7;0;Create;True;0;0;0;False;0;False;0;0.502;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;156;-1428.909,-25.55775;Inherit;False;Property;_shadowmax;shadow max;6;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;111;-1040.356,500.0255;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1662;-1724.063,-593.4561;Inherit;False;mips;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;155;-1210.966,-66.38963;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-1095.889,130.6538;Inherit;True;Property;_MainTex;MainTex;4;0;Create;True;0;0;0;False;0;False;-1;None;6811e768f025438438197b9cc8dec0ff;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DynamicAppendNode;108;-941.1107,497.7811;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;287;-1380.033,-729.243;Inherit;False;0;196;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;286;-772.1732,503.1622;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;196;-1109.643,-491.8984;Inherit;True;Property;_Emission;Emission;22;0;Create;True;0;0;0;False;0;False;-1;None;f12cc0fceeb07f24aa66a01d2b8852e8;True;0;False;white;Auto;False;Object;-1;MipBias;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;1664;-1722.063,-662.4561;Inherit;False;expblend;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1663;-1721.063,-735.4561;Inherit;False;linearblend;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;171;930.4592,-137.9271;Inherit;False;Property;_DstBlend;Destination Blend (OneMinusSrcAlpha);13;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;173;954.7491,-520.7668;Inherit;False;Property;_StencilComparison;Stencil Comparison;18;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;182;-92.76988,-638.7024;Inherit;False;Property;_Culling;Culling (off is doublesided);2;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;1;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;172;667.911,-139.4971;Inherit;False;Property;_SrcBlend;Source Blend (SrcAlpha);12;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(.  Debug  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;181;180.6124,-671.3701;Float;False;Property;_ZWriteMode;ZWrite (write to depth buffer);0;1;[ToggleUI];Create;False;0;0;0;True;1;Space(10);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;184;271.6029,-474.7061;Half;False;Property;_ColorMask;Alpha Render (Colour Mask);3;2;[Header];[Enum];Create;False;1;default required for transparent camera;2;NoUpdateAlpha;14;Default;15;0;True;0;False;15;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;179;655.603,-520.575;Half;False;Property;_StencilRef;Stencil ID;15;0;Create;False;0;0;0;True;2;Space(5);Header(Stencil);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;178;669.4171,-49.12134;Inherit;False;Property;_BlendOp;BlendOp;14;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.BlendOp;True;1;Space(5);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;183;179.3135,-582.0774;Float;False;Property;_ZTestMode;ZTestMode (LEqual);11;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-50.50861,-505.7003;Inherit;False;Property;_ZClipping;ZClipping;1;1;[Enum];Create;True;0;2;Clip;1;Clamp;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;175;975.7502,-375.7669;Inherit;False;Property;_StencilFail;StencilFail;20;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;176;979.4622,-448.1089;Inherit;False;Property;_StencilOp;StencilOp;19;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;177;648.4232,-351.0089;Half;False;Property;_WriteMask;WriteMask (non-zero);16;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;180;649.4232,-434.5858;Half;False;Property;_ReadMask;ReadMask (non-zero);17;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;160;-2002.366,659.6539;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.IntNode;174;974.7502,-300.767;Inherit;False;Property;_StencilZFail;StencilZFail;21;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;47;-2682.794,-20.14472;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1783;-1662.031,-212.264;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;284;-1415.681,-227.4451;Inherit;False;lightcolour;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;117;-1349.543,-369.8587;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.333,0.333,0.333;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;138;-2686.889,196.0963;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;285;-986.2191,626.0935;Inherit;False;284;lightcolour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;154;25.20606,-180.7476;Inherit;False;Property;_ForwardAdd;ForwardAdd;6;0;Create;True;0;0;0;False;0;False;0;0;0;False;UNITY_PASS_FORWARDADD;Toggle;2;Key0;Key1;Fetch;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;933;-555.9089,-495.8554;Inherit;False;unity_FogColor;0;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;219;-528.403,-641.1068;Inherit;False;Property;_fogcolbias;Fog Colour Bias;23;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;938;-305.0145,-520.5045;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;146;-609.4677,-403.7556;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1798;-1409.782,-601.0931;Inherit;False;Custom Fog;-1;;1865;e871e07024334ec489278aed51708e6d;2,160,1,162,1;6;226;FLOAT3;0,0,0;False;10;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;33;FLOAT3;0,0,0;False;165;FLOAT2;0,0;False;182;FLOAT2;0,0;False;2;FLOAT;0;FLOAT;100
Node;AmplifyShaderEditor.FunctionNode;1799;-27.55889,-400.878;Inherit;False;Custom Fog;-1;;1866;e871e07024334ec489278aed51708e6d;2,160,0,162,0;6;226;FLOAT3;0,0,0;False;10;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;33;FLOAT3;0,0,0;False;165;FLOAT2;0,0;False;182;FLOAT2;0,0;False;2;FLOAT3;0;FLOAT;100
Node;AmplifyShaderEditor.FunctionNode;1800;-0.6655672,-58.08591;Inherit;False;Custom Fog;-1;;1867;e871e07024334ec489278aed51708e6d;2,160,0,162,0;6;226;FLOAT3;0,0,0;False;10;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;33;FLOAT3;0,0,0;False;165;FLOAT2;0,0;False;182;FLOAT2;0,0;False;2;FLOAT3;0;FLOAT;100
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;-843.4188,-28.46516;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1803;-202.8558,162.3151;Inherit;False;1663;linearblend;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1802;-197.3675,230.9181;Inherit;False;1664;expblend;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1764;-235.0012,-230.5717;Inherit;False;1664;expblend;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1665;-234.3798,-294.3561;Inherit;False;1663;linearblend;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;1792;-240.4118,-33.77299;Inherit;False;Constant;_Color0;Color 0;24;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;1794;-374.0792,-88.1043;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;92;307.8708,-8.561799;Float;False;False;-1;2;ASEMaterialInspector;100;18;New Amplify Shader;0721e9cadcde0cf47b2fccdd529f0a88;True;ShadowCaster;0;2;ShadowCaster;1;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;RenderType=Transparent=RenderType;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;89;308.1851,-302.5368;Float;False;True;-1;2;ASEMaterialInspector;100;18;.GenesisAria/litSample;0721e9cadcde0cf47b2fccdd529f0a88;True;ForwardBase;0;0;ForwardBase;10;True;True;1;1;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;True;0;True;_BlendOp;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;True;True;True;True;True;True;0;True;_ColorMask;False;False;False;False;False;False;True;True;True;0;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;0;True;_StencilComparison;0;True;_StencilOp;0;True;_StencilFail;0;True;_StencilZFail;0;False;;0;False;;0;False;;0;False;;True;True;1;True;_ZWriteMode;True;3;True;_ZTestMode;True;False;0;False;;0;False;;True;1;RenderType=Transparent=RenderType;True;7;False;0;True;True;1;1;True;_SrcBlend;0;True;_DstBlend;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;False;False;False;False;True;True;1;True;_ZWriteMode;False;False;True;1;LightMode=ForwardBase;False;False;0;;0;0;Standard;20;  Dither Shadows;1;0;Cast Shadows;1;638669832959788589;  Use Shadow Threshold;0;0;Receive Shadows;1;638669832956345612;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;0;638669400493484909;Ambient Light;1;0;Add Pass;1;638669822283370021;Override Baked GI;0;0;Tessellation;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Disable Batching;0;0;Vertex Position,InvertActionOnDeselection;1;0;0;3;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;90;308.1851,-46.5368;Float;False;False;-1;2;ASEMaterialInspector;100;18;New Amplify Shader;0721e9cadcde0cf47b2fccdd529f0a88;True;ForwardAdd;0;1;ForwardAdd;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;RenderType=Transparent=RenderType;True;2;False;0;False;True;4;1;False;;1;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;False;False;False;False;True;True;1;True;_ZWriteMode;False;False;True;1;LightMode=ForwardAdd;False;False;0;;0;0;Standard;0;False;0
WireConnection;189;0;187;0
WireConnection;191;0;189;0
WireConnection;191;1;189;0
WireConnection;191;2;189;0
WireConnection;1773;0;34;0
WireConnection;76;0;34;1
WireConnection;76;1;34;2
WireConnection;76;2;1773;0
WireConnection;76;3;191;0
WireConnection;141;0;47;0
WireConnection;136;0;133;0
WireConnection;136;1;135;0
WireConnection;136;2;134;0
WireConnection;139;0;138;0
WireConnection;139;1;137;2
WireConnection;140;0;139;0
WireConnection;140;2;141;0
WireConnection;140;3;136;0
WireConnection;130;0;129;7
WireConnection;130;1;140;0
WireConnection;165;0;130;0
WireConnection;145;0;99;0
WireConnection;163;0;165;0
WireConnection;163;1;162;2
WireConnection;164;0;163;0
WireConnection;101;0;145;0
WireConnection;100;0;101;0
WireConnection;100;1;164;0
WireConnection;46;0;99;0
WireConnection;303;0;100;0
WireConnection;48;0;46;0
WireConnection;48;1;130;0
WireConnection;106;0;303;0
WireConnection;52;0;48;0
WireConnection;111;0;106;0
WireConnection;1662;0;1770;0
WireConnection;155;0;157;0
WireConnection;155;1;156;0
WireConnection;155;2;52;0
WireConnection;1;1;131;0
WireConnection;108;0;111;0
WireConnection;108;1;111;0
WireConnection;108;2;111;0
WireConnection;286;0;108;0
WireConnection;286;1;285;0
WireConnection;196;1;287;0
WireConnection;196;2;1798;100
WireConnection;1664;0;1770;145
WireConnection;1663;0;1770;30
WireConnection;1783;0;47;0
WireConnection;284;0;117;0
WireConnection;117;0;116;0
WireConnection;117;1;76;0
WireConnection;117;2;1783;0
WireConnection;138;0;137;1
WireConnection;154;1;1799;0
WireConnection;154;0;1800;0
WireConnection;938;0;219;0
WireConnection;938;1;933;0
WireConnection;146;0;50;0
WireConnection;146;1;196;5
WireConnection;146;2;286;0
WireConnection;1798;226;1662;0
WireConnection;1799;10;146;0
WireConnection;1799;8;938;0
WireConnection;1799;33;196;5
WireConnection;1799;165;1665;0
WireConnection;1799;182;1764;0
WireConnection;1800;10;1794;0
WireConnection;1800;8;1792;0
WireConnection;1800;33;50;0
WireConnection;1800;165;1803;0
WireConnection;1800;182;1802;0
WireConnection;50;0;117;0
WireConnection;50;1;155;0
WireConnection;50;2;1;5
WireConnection;1794;0;50;0
WireConnection;1794;1;286;0
WireConnection;89;0;154;0
ASEEND*/
//CHKSM=90E1F5CC887D7FC1506A71EA22B34990C71109BE