Shader /*ase_name*/ "Hidden/Templates/ZClipTwoPass" /*end*/
{
	Properties
	{
		/*ase_props*/
	}
	
	SubShader
	{
		/*ase_subshader_options:Name=Additional Options
			Option:Vertex Position,InvertActionOnDeselection:Absolute,Relative:Relative
				Absolute:SetDefine:ASE_ABSOLUTE_VERTEX_POS 1
				Absolute:SetPortName:1,Vertex Position
				Relative:SetPortName:1,Vertex Offset
		*/
		
		Tags { "RenderType"="Transparent" }
		LOD 100
		ZClip [_ZClipping]

		/*ase_all_modules*/
		
		/*ase_pass*/
		Pass
		{
			Name "Unlit"
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
			/*ase_pragma*/

			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 ase_normal : NORMAL;
				/*ase_vdata:p=p;c=c;n=n*/
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
				/*ase_interp(2,):sp=sp.xyzw;wp=tc0;wn=tc1*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			/*ase_globals*/
			
			v2f vert ( appdata v /*ase_vert_input*/)
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				/*ase_vert_code:v=appdata;o=v2f*/
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.worldNormal.xyz = ase_worldNormal;
				
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = /*ase_vert_out:Vertex Offset;Float3*/vertexValue/*end*/;
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
			
			fixed4 frag (v2f i /*ase_frag_input*/) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				/*ase_local_var:wp*/float3 WorldPosition = i.worldPos;
				#endif
				/*ase_frag_code:i=v2f*/
				
				finalColor = /*ase_frag_out:Frag Color;Float4*/fixed4(1,1,1,1)/*end*/;
				return finalColor;
			}
			ENDCG
		}
		/*ase_pass_end*/
		
		/*ase_pass*/
		Pass
		{
			Name "Second"
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
			/*ase_pragma*/

			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 ase_normal : NORMAL;
				/*ase_vdata:p=p;c=c;n=n*/
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
				/*ase_interp(2,):sp=sp.xyzw;wp=tc0;wn=tc1*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			/*ase_globals*/
			
			v2f vert ( appdata v /*ase_vert_input*/)
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				/*ase_vert_code:v=appdata;o=v2f*/
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.worldNormal.xyz = ase_worldNormal;
				
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = /*ase_vert_out:Vertex Offset;Float3*/vertexValue/*end*/;
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
			
			fixed4 frag (v2f i /*ase_frag_input*/) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				/*ase_local_var:wp*/float3 WorldPosition = i.worldPos;
				#endif
				/*ase_frag_code:i=v2f*/
				
				finalColor = /*ase_frag_out:Frag Color;Float4*/fixed4(1,1,1,1)/*end*/;
				return finalColor;
			}
			ENDCG
		}
		/*ase_pass_end*/
	}
	CustomEditor "ASEMaterialInspector"
}
