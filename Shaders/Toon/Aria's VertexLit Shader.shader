// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".GenesisAria/Arias VertexLit Shader"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Culling("Culling (off is doublesided)", Int) = 2
		[HideInInspector]_outline_width("_outline_width", Float) = 0
		[Header(Dont clean keywords after selecting)][Toggle(TINTED_OUTLINE)]_VRCFallbackDoublesided("VRC Fallback Doublesided", Float) = 0
		[Toggle(_ALPHATEST_ON)]_VRCFallbackCutout("VRC Fallback Cutout", Float) = 0
		[Enum(LessVisible,0.25,Visible,0.5,MoreVisible,0.75,Invisible,2)][Space(5)]_Cutoff("Fallback Cutoff", Float) = 0.75
		[Header(.  MAIN  .)]_MainTex("Texture (RGB,A)", 2D) = "white" {}
		[Toggle(MAINSS_ON)] _SuperSample("SuperSample (expensive)", Float) = 0
		_TexSSBias("Mip Sample Bias", Float) = 0
		[HDR][Space(5)]_Color("> Color", Color) = (1,1,1,1)
		_Hue("Hue", Range( 0 , 360)) = 0
		_Saturation("Saturation", Range( -2 , 5)) = 1
		_MaintexPower("Power", Float) = 1
		[ToggleUI]_VertCol("Use Vertex Colour", Float) = 0
		[Space(5)]_Alpha("Alpha", Range( 0 , 2)) = 1
		_AlphaCutoff("Alpha Cutoff", Range( 0 , 10)) = 1
		_Opacity("Opacity", Range( 0 , 1)) = 1
		[SingleLineTexture]_AlphaMask("Alpha Mask", 2D) = "white" {}
		[Enum(R,0,G,1,B,2,A,3)]_AlphaMaskEnum("Channel", Int) = 0
		[Toggle(_SOFTMASK_ON)] _SoftMask("Soft Mask", Float) = 0
		[Space (5)][Toggle(COVERAGE_ON)] _AlphaToCoverage("AlphaToCoverage (antialiased override)", Float) = 1
		_A2CSampleBias("A2C Sample Bias", Float) = 1
		[Header(default required for transparent camera)][Enum(Mirror Fixed,14,Default,15)]_ColorMask("Alpha Render (Colour Mask)", Float) = 15
		[Toggle(_DISABLEALPHA_ON)] _DisableAlpha("Disable Alpha", Float) = 0
		[Header(. LIGHTING .)]_LightMulti("Light Multiplier", Float) = 0.75
		_MaxLight("Max Light (x2)", Range( 0 , 1)) = 1
		_MinLight("Min Light", Range( 0 , 1)) = 0.025
		_LightCurvePow("Light Curve Power", Float) = 0.5
		_LightSaturationLimiter("Light Saturation Limiter", Float) = 0.75
		_LightSatFinal("Light Saturation Max", Float) = 1
		_BakedMulti("Baked Multiplier", Float) = 1
		_LightColourBias("LightColour Bias (keep white)", Color) = (1,1,1,0)
		_LightColourSub("LightColour Subtract (keep black, for spotlights)", Color) = (0,0,0,0)
		[Space(5)][Toggle(_DISABLELIGHT_ON)] _DisableLight("Unlit (warning - disables all light)", Float) = 0
		[Space(5)][Header(.  SHADOW  .)][ToggleOff(SHADING_OFF)] _UseShading("Use Shading", Float) = 0
		[Enum(Surface,0,Object2World,1)]_LightMode("Lighting Mode", Float) = 0
		[Space(5)]_ShadowColour("Shadow Colour", Color) = (0.85,0.85,0.85,1)
		_OffsetDot("Offset Dot", Range( -1 , 1)) = 0
		_ShadowSharpness("Shadow Sharpness", Float) = 20
		_ShadowPower("Shadow Power", Range( 0.0001 , 10)) = 1
		[ToggleUI][Space(5)]_StepTwo("Use Second Step", Float) = 0
		_ShadowColour2("Shadow Colour 2", Color) = (0.9,0.9,0.9,1)
		_OffsetDot2("Offset Dot 2", Range( -1 , 1)) = 0.1
		_ShadowSharpness2("Shadow Sharpness 2", Float) = 20
		_ShadowPower2("Shadow Power 2", Range( 0.0001 , 10)) = 1
		[Space(5)]_ShadowDarkness("Shadow Darkness", Float) = 0.15
		_ShadowSaturation("Shadow Saturation", Range( -2 , 2)) = 0.85
		[Header(  Fake Light)]_StaticLightX("Static Light X", Range( -1 , 1)) = 0.68
		_StaticLightY("Static Light Y", Range( -1 , 1)) = 0.55
		_StaticLightZ("Static Light Z", Range( -1 , 1)) = 0.44
		[Space(5)][Header(.  Emission  .)]_Emission("Emission Map (RGB,A)", 2D) = "white" {}
		[Toggle(_EMISSIONASMASK_ON)] _EmissionAsMask("Use as Mask", Float) = 0
		[HDR]_EmissionColor("> Colour", Color) = (0,0,0,0)
		_FullBright("FullBright", Float) = 0
		_EmissionHue("Hue", Range( 0 , 360)) = 0
		_EmissionIntensity("Emission Intensity", Float) = 1
		_EmissionPower("Emission Power", Float) = 1
		_ShadedEmission("Shaded Emission", Range( 0 , 1)) = 0
		_ShadedPower("Shaded Power", Float) = 0
		[HDR]_ShadedColour("Shaded Colour", Color) = (0,0,0,0)
		[ToggleUI]_ShadedOnly("Shaded Only", Float) = 0
		_ScrollX("Scroll X", Float) = 0
		_ScrollY("Scroll Y", Float) = 0
		[KeywordEnum(UV1,UV2)] _EmissionUV("Emission UV", Float) = 0
		[Normal][Space(5)][Header(.  NORMAL  .)]_Normal("Normal (N)", 2D) = "bump" {}
		[Space(5)]_NorDist("Normal Distance Modifier", Float) = 0
		_NormalScale("Scale Normal", Float) = 1
		_NormalPower("Normal Power", Range( 0 , 2)) = 1
		_NormalPowerSpecular("Normal Specular", Range( 0 , 10)) = 2
		_NormalPowerMatCap("Normal MatCap", Range( 0 , 5)) = 1
		_NormalPowerSubSurface("Normal SubSurface", Range( 0 , 2)) = 0.5
		[ToggleUI][Space(10)]_NormalFlipX("Invert X (R)", Float) = 0
		[ToggleUI]_NormalFlipY("Invert Y (G)", Float) = 0
		[ToggleUI]_NormalFlip("Flip Axes", Float) = 0
		[KeywordEnum(UV1,UV2)] _NormUV("Normal UV", Float) = 0
		[Space(5)][KeywordEnum(NormalOnly,Mixed,DetailOnly)] _UseDetailNormal("Use Detail Normal", Float) = 0
		_DetailNormalN("Detail Normal (N)", 2D) = "bump" {}
		[Toggle(NORMSS_ON)] _NormSuperSample("SuperSample (expensive)", Float) = 0
		_NormSSBias("Mip Sample Bias", Float) = 0
		[Space(5)]_DetailNormalScale("Scale DetailNormal", Float) = 1
		[ToggleUI]_DetailNormalMirror("Mirror", Float) = 0
		[ToggleUI][Space(10)]_DetailNormalFlipX("Invert X (R)", Float) = 0
		[ToggleUI]_DetailNormalFlipY("Invert Y (G)", Float) = 0
		[ToggleUI]_DetailNormalFlip("Flip Axes", Float) = 0
		[KeywordEnum(UV1,UV2)] _DetailNormUV("DetailNormal UV", Float) = 0
		[Header(Normal Mask)][SingleLineTexture]_NormalMask("NormalMask, Shademask", 2D) = "white" {}
		[Enum(R,0,G,1,B,2,A,3)]_NormMaskEnum("Channel", Int) = 0
		_NormMaskLevel("Normal Mask Level", Float) = 1
		_NormMaskPow("Normal Mask Power", Float) = 1
		[ToggleUI]_NormalMaskInvert("Normal Mask Invert", Float) = 0
		[KeywordEnum(UV1,UV2)] _MaskUV("Mask UV", Float) = 0
		[ToggleUI]_LightMaskEnable("Use Light Mask", Float) = 0
		[Enum(R,0,G,1,B,2,A,3)]_ShadeMaskEnum("Channel", Int) = 3
		[ToggleUI]_LightMaskOnly("Light Mask Only (for alpha8)", Float) = 0
		_LightMaskLevel("Light Mask Level", Float) = 1
		[Space(5)][Header(.  Soft Shading  .)][ToggleOff(SOFTSHADE_OFF)] _SoftShadeEnable("SoftShade Enable", Float) = 0
		[Enum(FixedColour,0,LightColour,1)]_ShadeColorDynamic("ShadeColor Dynamic", Float) = 1
		_ShadeColour("Shade Colour", Color) = (0,0,0,0)
		_ShadeLevel("Shade Level", Range( 0 , 1)) = 0.5
		_SoftPower("Soft Power", Range( 0.5 , 4)) = 0.75
		_SoftScale("Soft Scale", Range( 0.5 , 2)) = 1
		[Space(5)][Header(. SubSurface Light .)][Toggle(SUBSURFACE_ON)] _UseSubSurface("Use SubSurface/Deflected Light", Float) = 0
		_SSColour("SS Colour", Color) = (1,1,1,1)
		_SSBrightness("Brightness", Float) = 10
		[Space(5)]_OffsetSS("Offset", Range( -1 , 1)) = 0
		_SSStrength("SubSurface Strength", Float) = 1
		_SSIntensity("SubSurface Power", Float) = 5
		[ToggleUI][Space(5)]_SSDouble("Use Second Layer", Float) = 0
		_OffsetSS2("Offset 2", Range( -1 , 1)) = 0
		_SSStrength2("SubSurface Strength 2", Float) = 1
		_SSIntensity2("SubSurface Power 2", Float) = 5
		_SSBrightness2("Layer Fade", Range( 0 , 1)) = 1
		[ToggleUI][Space(5)]_FWDSS("Forward SubSurface", Float) = 0
		_FWDSSMulti("Forward Multiply", Float) = 0.5
		_FWDSSInvPow("Forward InvPower1", Float) = 0.8
		_FWDSSInvPow1("Forward InvPower2", Float) = 0.8
		[Space(10)]_SSDarkMask("Darkness to SS", Range( 0 , 1)) = 0.5
		_ShadeMaskSS("Shade Mask", Range( 0 , 1)) = 0.5
		[ToggleUI]_UseLightMaskSS("Use Light Mask", Float) = 1
		_SSTransmission("Transmission", Range( 0 , 1)) = 0
		[ToggleUI]_Spherize("Spherize SS Normal", Float) = 0
		_SSEdgeAA("SS Edge Alias Fix (dist pow limit)", Vector) = (-2.75,20,0.05,0)
		[Space(5)][Header(.  SPECULAR  .)]_SpecularOpacity("Specular Opacity", Range( 0 , 1)) = 0.5
		_SpecScale("Specular Scale", Range( -0.5 , 0.5)) = 0
		_SpecularSize("Specular Spread", Float) = 1
		_SpecularStrength("Specular Intensity", Float) = 1
		_SpecPower("Specular Power", Range( 0 , 0.99)) = 0.5
		[HDR]_SColor("Specular Colour Bias", Color) = (1,1,1,1)
		[Enum(Additive,0,Multiplied,1,Off,2)]_SpecMode("Specular Mode", Float) = 2
		_SpecRough("Roughness Power (0 off)", Float) = 0
		[ToggleUI]_StereoFixSpec("Stereo Converge (flatten)", Float) = 0
		[Space(5)][Header(. Specular Overlay)][Toggle(SPECMATCAP_ON)] _UseSpecularMatCap("Use Specular MatCap", Float) = 0
		_SpecularMatcap("Specular Matcap (RGB)", 2D) = "black" {}
		[ToggleUI]_StereoFixSpecCap("Stereo Converge (flatten)", Float) = 0
		_SpecMatcapMultiply("SpecMatcap Multiply", Float) = 1
		_SpecMatcapPower("SpecMatcap Power", Float) = 1
		_SpecMatcapSaturation("SpecMatcap Saturation", Float) = 1
		[HDR]_SpecMatCapColor("SpecMatCap Colour", Color) = (1,1,1,1)
		[Enum(Additive,0,Multiplied,1)]_SpecMatCapMode("SpecMatCap Mode", Float) = 0
		_SpecMatcapLightPower("SpecMatcap Light Power", Float) = 0.333
		_SpecMatcapOpacity("SpecMatcap Opacity", Float) = 1
		_SpecMatcapMipBias("MipBias", Float) = 0
		[ToggleUI]_Legacy2("Legacy", Float) = 0
		[Space(10)]_SpecularMask("Specular Mask", 2D) = "white" {}
		[Enum(R,0,G,1,B,2,A,3)]_SpecMaskEnum1("Channel", Int) = 0
		_SpecMaskPower("SpecMask Power", Float) = 1
		_SpecularLevel("Specular Level", Float) = 1
		_SpecBias("Specular Bias", Float) = 0
		[Space(10)]_SpecularMask2("Specular Mask2", 2D) = "white" {}
		[Enum(R,0,G,1,B,2,A,3)]_SpecMaskEnum2("Channel", Int) = 0
		_SpecularLevel2("Specular2 Level", Float) = 1
		[ToggleUI][Space(5)][Header(. Roughness . Glossiness)]_Roughness("Use Roughness", Float) = 0
		_Glossiness("Roughness Map", 2D) = "black" {}
		[Enum(R,0,G,1,B,2,A,3)]_RioughnessEnum("Channel", Int) = 0
		_RoughnessLevel("Roughness Level", Float) = 1
		_RoughnessPower("Roughness Power", Float) = 1
		[ToggleUI]_RoughnessInvert("Roughness Invert", Float) = 1
		[KeywordEnum(UV1,UV2)] _GlossUV("Roughness UV", Float) = 0
		[Toggle(_ROUGHNESSFRESNEL_ON)] _RoughnessFresnel("Roughness Fresnel", Float) = 0
		_GlossFresnel("Fresnel Bias, Scale, Power", Vector) = (0,1,1,1)
		[Space(5)][Header(. Reflection Probe)][Toggle(SPECULARHIGHLIGHTS_ON)] _UseReflection("Use Reflection", Float) = 0
		[HDR]_ReflectionColor("Reflection Colour", Color) = (1,1,1,0)
		[Enum(Additive,0,Multiplied,1,Half,2)]_ReflectionBlend("Reflection Blend", Float) = 0
		[Enum(Reflection Probe,0,Fallback Cubemap,1,Cubemap Only,2)]_ReflectionType("Reflection Type", Float) = 0
		[HDR][SingleLineTexture]_Cubemap("Cubemap", CUBE) = "black" {}
		_CubeSmoothnessOffset("Cube Smoothness Offset", Float) = 0
		_ProbeSmoothness("Probe Smoothness", Float) = 0.75
		_ReflectionOpacity("Reflection Opacity", Float) = 0.5
		_ReflectionIntensity("Reflection Intensity", Float) = 0.5
		_ReflectionPower("Reflection Power", Float) = 1
		_ReflectionSaturation("Reflection Saturation", Float) = 1
		_Aberration("Aberration", Float) = 0
		[Space(10)]_SpecEdgeAA("Spec Edge Alias Fix (dist pow limit)", Vector) = (-2.75,20,0.05,0)
		[Header(Geometric Specular Antialiasing)][Toggle(_ENABLEGEOMETRICSPECULARAA)] _EnableGSAA("Enable GSAA (expensive)", Float) = 0
		_GSAAVariance("ScreenVariance", Float) = 5
		_GSAAPower("Power", Float) = 1
		_GSAAThreshold("Threshold", Float) = 5
		[Space(5)][Header(.  Sparkles  .)][Toggle(SPARKLE_ON)] UseSparkleShimmer("Use Sparkle/Shimmer", Float) = 0
		[HDR]_SparkleColor("Colour", Color) = (1,1,1,0)
		[Enum(Additive,0,Multiply,1)]_SparkleMode("Sparkle Mode", Float) = 1
		_SparkleHDRMax("Sparkle Max HDR Value", Float) = 10
		_SparklePattern("Sparkle Pattern (RGB)", 2D) = "black" {}
		[Toggle(SPARKLESS_ON)] _SparkleSuperSample("SuperSample (expensive)", Float) = 0
		_SparkleSSBias("SuperSample Bias", Float) = 0
		[KeywordEnum(UV1,UV2)] _SparkleUV("SparkleUV", Float) = 0
		_SparkleOffset("Offset", Float) = 0.25
		[Space(5)]_SparkleTexColour1("SparkleTex Power", Float) = 1
		_SparkleTexColour("SparkleTex Saturation", Range( 0 , 2)) = 2
		_DistanceFade("Distance Fade", Float) = 1
		_Threshold("Threshold", Range( 0 , 1)) = 0
		_Range("Range", Range( 0.001 , 2)) = 0.3
		_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.05
		[Enum(Interpolated,0,Flattened,1,None,2)]_StereoCorrect("Stereo Correction", Float) = 0
		_WorldPosContribution("WorldPos Contribution", Range( 0 , 1)) = 0.3
		[Enum(Linear,0,Circular,1)][Space(5)]_MotionType("Motion Type", Float) = 0
		_MotionSpeed("Motion Speed", Float) = 0
		_RotateLinear("Rotate Linear", Range( 0 , 1)) = 0
		_MotionIntensity("Motion Intensity", Float) = 0.01
		[Space(5)]_SparkleMask("Sparkle Mask", 2D) = "white" {}
		[Enum(R,0,G,1,B,2,A,3)]_SparkleMaskEnum("Channel", Int) = 0
		_SparkleMaskPower("Sparkle Mask Power", Float) = 1
		_SparkleMaskMultiply("Sparkle Mask Multiply", Float) = 1
		_SparkleFresnel("Fresnel Bias, Scale, Power", Vector) = (0,11,5,0)
		[Space(5)][Toggle(_USESCALEMAP_ON)] _UseScalemap("Use Scalemap", Float) = 0
		_ScaleMapR("Scale Map (R)", 2D) = "white" {}
		_ScalePower("Scale Power", Float) = 1
		_ScaleValue("Scale Value", Float) = 1
		[Space(5)][Header(.  Rim Fresnel  .)][Toggle(RIMLIGHT_ON)] _UseRim("Use Rim", Float) = 0
		_RimOutlineColour("Rim/Outline Colour", Color) = (0,0,0,0)
		[Enum(Blend_Lerp,0,Multiply,1,AddSubtract,2)]_RimMode("Rim Mode", Float) = 0
		_Amount("Rim Opacity", Float) = 0
		_Power("Rim Power", Float) = 0
		_Scale("Rim Scale", Float) = 0
		_Min("Rim Min", Float) = 0
		_Max("Rim Max", Float) = 0
		[ToggleUI]_RimNormal("Rim Normal", Float) = 0
		_RimNormPow("Rim Normal Power", Range( 0 , 1)) = 0
		[ToggleUI]_MaskFresnel("Emission Alpha Mask", Float) = 0
		[Space(10)][Header(.  MATCAP  .)][Toggle(MATCAP_ON)] _UseMatcap("Use MatCap", Float) = 0
		_Matcap("Matcap (RGB,A)", 2D) = "black" {}
		_MatcapScale("Matcap Scale", Float) = 1
		[ToggleUI]_StereoFix("Stereo Converge (flatten)", Float) = 0
		_MatcapOpacity("Matcap Opacity", Range( 0 , 1)) = 5
		_MatcapPower("Matcap Power", Float) = 1
		_MatcapIntensity("Matcap Intensity", Float) = 0
		_MatcapSaturation("Matcap Saturation", Range( -1 , 5)) = 1
		_MatcapSpin("MatcapSpin", Float) = 0
		[HDR]_MatCapColor("MatCap Colour", Color) = (1,1,1,1)
		[ToggleUI]_Legacy("Legacy", Float) = 0
		[SingleLineTexture][Space(5)]_MatCapMask("MatCap Mask", 2D) = "white" {}
		[Enum(R,0,G,1,B,2,A,3)]_MatcapMaskEnum("Channel", Int) = 0
		_MatcapMaskLevel("Mask Level", Float) = 1
		_MatcapMaskPower("Mask Power", Float) = 1
		[Space(10)][Header(. Decal  .)][Toggle(Decal_ON)] _UseDecal("Use Decal", Float) = 0
		[ToggleUI]_GreytoAlpha("Grey to Alpha", Float) = 0
		_DecalTex("Decal Tex", 2D) = "white" {}
		_DecalColour("DecalColour", Color) = (1,1,1,0)
		_DecalIntensity("Intensity", Float) = 1
		[KeywordEnum(UV1,UV2)] _DecalUV("Decal UV", Float) = 0
		[ToggleUI]_DecalMirrorX("Decal Reflect (X axis)", Float) = 0
		_DecalMirrorOffset("ReflectOffset X", Float) = 0
		_DecalMirrorAdjust("ReflectAdjust Y", Float) = 0
		_DecalRotate("Rotate", Float) = 0
		[Space(10)][Header(.  Parallax  .)][Toggle(PARALLAX_ON)] _UseParallax("Use Parallax", Float) = 0
		[Enum(Normal,0,Planar,1)]_ParallaxType("Parallax Type", Float) = 0
		[HDR]_ParallaxColour("Parallax Colour", Color) = (1,1,1,1)
		_ParallaxTexture("Parallax Texture (RGB,A)", 2D) = "black" {}
		_ParallaxHeight("Parallax Height", Float) = 0.5
		_ParallaxScale("Parallax Scale", Float) = 1
		_ParallaxMask("Parallax Mask", 2D) = "white" {}
		[Enum(R,0,G,1,B,2,A,3)]_ParallaxMaskEnum("Channel", Int) = 0
		_ParallaxMaskPower("Parallax Mask Power", Float) = 1
		[ToggleUI][Space(20)][Header(VRC Friends Only)]_FriendsOnly("Friends Only Visibility", Float) = 0
		[SingleLineTexture]_FriendsOnlyRT("FriendsOnly RenderTexture (clear to white)", 2D) = "black" {}
		[SingleLineTexture][Space(5)]_FriendsOnlyMask("FriendsOnly Mask", 2D) = "white" {}
		[Enum(R,0,G,1,B,2,A,3)]_FriendMaskEnum("Channel", Int) = 0
		_MaskOffset("Mask Offset", Float) = 0
		[Header(enable without cam for override)][ToggleUI]_InvertFriendsOnly("Invert Friends Only", Float) = 0
		[ToggleUI]_FriendsOnlyDecal("Friends Only Decal", Float) = 0
		[ToggleUI]_FriendsOnlyAlphaMask("Friends Only Alpha Mask", Float) = 0
		[Space(10)][Toggle(FRIENDTEX_ON)] _FriendsOnlyTexture("Friends Only Texture", Float) = 0
		_MainTexFriends("FriendsOnly Texture (RGB,A)", 2D) = "white" {}
		[Toggle(FRIENDSS_ON)] _FriendsSuperSample("SuperSample (expensive)", Float) = 0
		_FriendTexSSBias("Mip Sample Bias", Float) = 0
		[ToggleUI][Space(10)][Header(Mirror)]_MirrorSystem("Use Mirror System", Float) = 0
		[IntRange]_IsInMirror("In Mirror", Range( 0 , 1)) = 1
		[IntRange]_IsNotMirror("Not Mirror", Range( 0 , 1)) = 1
		[ToggleUI][Space(10)][Header(.  Advanced  .)]_ZWriteMode("ZWrite (write to depth buffer)", Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)][Space(5)]_ZTestMode("ZTestMode (LEqual)", Float) = 4
		[Space(5)]_StencilRef("Stencil ID", Float) = 0
		_WriteMask("WriteMask (non-zero)", Float) = 255
		_ReadMask("ReadMask (non-zero)", Float) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComp("Stencil Comp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilOp("StencilOp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFail("StencilFail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail("StencilZFail", Int) = 0
		[Enum(UnityEngine.Rendering.BlendMode)][Space(10)][Header(Debug)]_SrcBlend("Source Blend (One)", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend (Zero)", Float) = 10
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		LOD 0

		
		
		Tags { "RenderType"="Opaque" }

		CGINCLUDE
		#pragma target 5.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
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
			Comp [_StencilComp]
			Pass [_StencilOp]
			Fail [_StencilFail]
			ZFail [_StencilZFail]
		}
		
		
		Pass
		{
			Name "VertexLit"
			Tags { "LightMode"="ForwardBase" "Queue"="Geometry" }
			CGPROGRAM

			#define ASE_USING_SAMPLING_MACROS 1


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma target 5.0
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#include "UnityStandardUtils.cginc"
			#include "Lighting.cginc"
			#include "UnityStandardBRDF.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local MATCAP_ON
			#pragma shader_feature_local _EMISSIONASMASK_ON
			#pragma shader_feature_local RIMLIGHT_ON
			#pragma shader_feature_local Decal_ON
			#pragma shader_feature_local FRIENDTEX_ON
			#pragma shader_feature_local MAINSS_ON
			#pragma shader_feature_local FRIENDSS_ON
			#pragma shader_feature_local _DECALUV_UV1 _DECALUV_UV2
			#pragma shader_feature_local _MASKUV_UV1 _MASKUV_UV2
			#pragma shader_feature_local SHADING_OFF
			#pragma shader_feature_local _USEDETAILNORMAL_NORMALONLY _USEDETAILNORMAL_MIXED _USEDETAILNORMAL_DETAILONLY
			#pragma shader_feature_local _NORMUV_UV1 _NORMUV_UV2
			#pragma shader_feature_local NORMSS_ON
			#pragma shader_feature_local _DETAILNORMUV_UV1 _DETAILNORMUV_UV2
			#pragma multi_compile __ VERTEXLIGHT_ON
			#pragma shader_feature_local _DISABLELIGHT_ON
			#pragma shader_feature_local SUBSURFACE_ON
			#pragma shader_feature_local SOFTSHADE_OFF
			#pragma shader_feature_local _EMISSIONUV_UV1 _EMISSIONUV_UV2
			#pragma shader_feature_local _GLOSSUV_UV1 _GLOSSUV_UV2
			#pragma shader_feature_local _ROUGHNESSFRESNEL_ON
			#pragma shader_feature_local SPECMATCAP_ON
			#pragma multi_compile __ _ENABLEGEOMETRICSPECULARAA
			#pragma shader_feature_local SPECULARHIGHLIGHTS_ON
			#pragma shader_feature_local SPARKLE_ON
			#pragma shader_feature_local SPARKLESS_ON
			#pragma shader_feature_local _USESCALEMAP_ON
			#pragma shader_feature_local _SPARKLEUV_UV1 _SPARKLEUV_UV2
			#pragma shader_feature_local PARALLAX_ON
			#pragma shader_feature_local COVERAGE_ON
			#pragma shader_feature_local _DISABLEALPHA_ON
			#pragma shader_feature_local _SOFTMASK_ON
			#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
			#define SAMPLE_TEXTURECUBE_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#else//ASE Sampling Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
			#define SAMPLE_TEXTURECUBE_LOD(tex,samplertex,coord,lod) texCUBElod (tex,half4(coord,lod))
			#endif//ASE Sampling Macros
			


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _ZWriteMode;
			uniform half _WriteMask;
			uniform half _VRCFallbackCutout;
			uniform int _Culling;
			uniform int _StencilOp;
			uniform half _StencilRef;
			uniform half _ReadMask;
			uniform half _ZTestMode;
			uniform int _StencilFail;
			uniform half _outline_width;
			uniform int _StencilComp;
			uniform half _Cutoff;
			uniform int _StencilZFail;
			uniform half _VRCFallbackDoublesided;
			uniform half _DstBlend;
			uniform half _SrcBlend;
			uniform half _ColorMask;
			uniform half _GSAAPower;
			uniform half _GSAAVariance;
			uniform half _GSAAThreshold;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
			uniform float4 _MainTex_ST;
			SamplerState sampler_MainTex;
			uniform half _TexSSBias;
			uniform half _InvertFriendsOnly;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_FriendsOnlyRT);
			uniform float4 _FriendsOnlyRT_ST;
			SamplerState sampler_FriendsOnlyRT;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTexFriends);
			SamplerState sampler_MainTexFriends;
			uniform half _FriendTexSSBias;
			uniform half4 _Color;
			uniform float _VertCol;
			uniform half _MaintexPower;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_DecalTex);
			uniform float _DecalMirrorX;
			uniform float4 _DecalTex_ST;
			uniform float _DecalMirrorOffset;
			uniform float _DecalMirrorAdjust;
			uniform float _DecalRotate;
			SamplerState sampler_DecalTex;
			uniform float4 _DecalColour;
			uniform float _DecalIntensity;
			uniform half _GreytoAlpha;
			uniform half _FriendsOnlyDecal;
			uniform float _Hue;
			uniform half _Saturation;
			uniform half _LightMaskEnable;
			uniform int _ShadeMaskEnum;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_NormalMask);
			uniform float4 _NormalMask_ST;
			SamplerState sampler_NormalMask;
			uniform half _LightMaskLevel;
			uniform half _StepTwo;
			uniform float4 _ShadowColour;
			uniform float _ShadowSharpness;
			uniform float _NormalFlip;
			uniform float _NormalFlipX;
			uniform float _NormalFlipY;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_Normal);
			uniform float4 _Normal_ST;
			SamplerState sampler_Normal;
			uniform float _NormalScale;
			uniform float _NorDist;
			uniform float _DetailNormalFlip;
			uniform float _DetailNormalFlipX;
			uniform float _DetailNormalFlipY;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailNormalN);
			uniform float _DetailNormalMirror;
			uniform float4 _DetailNormalN_ST;
			SamplerState sampler_DetailNormalN;
			uniform float _DetailNormalScale;
			uniform half _NormSSBias;
			uniform half _LightMaskOnly;
			uniform half _NormalMaskInvert;
			uniform int _NormMaskEnum;
			uniform half _NormMaskPow;
			uniform half _NormMaskLevel;
			uniform float _NormalPower;
			uniform half _StaticLightX;
			uniform half _StaticLightY;
			uniform half _StaticLightZ;
			uniform half _LightMode;
			uniform half _OffsetDot;
			uniform float _ShadowPower;
			uniform half4 _ShadowColour2;
			uniform float _ShadowSharpness2;
			uniform half _OffsetDot2;
			uniform float _ShadowPower2;
			uniform half _ShadowSaturation;
			uniform float4 _SSColour;
			uniform half _ShadeMaskSS;
			uniform half _SSDouble;
			uniform half _SSStrength;
			uniform half _Spherize;
			uniform float _NormalPowerSubSurface;
			uniform half _OffsetSS;
			uniform half _SSIntensity;
			uniform half _SSBrightness2;
			uniform half _OffsetSS2;
			uniform half _SSStrength2;
			uniform half _SSIntensity2;
			uniform float _SSTransmission;
			uniform half _FWDSS;
			uniform half _FWDSSInvPow;
			uniform half _FWDSSInvPow1;
			uniform half _FWDSSMulti;
			uniform half4 _LightColourSub;
			uniform half _BakedMulti;
			uniform half4 _LightColourBias;
			uniform half _LightMulti;
			uniform half _LightCurvePow;
			uniform float _MinLight;
			uniform half _MaxLight;
			uniform float _LightSaturationLimiter;
			uniform half _LightSatFinal;
			uniform half _SSBrightness;
			uniform half _UseLightMaskSS;
			uniform float3 _SSEdgeAA;
			uniform float _ShadowDarkness;
			uniform half _SSDarkMask;
			uniform half _ShadeColorDynamic;
			uniform half4 _ShadeColour;
			uniform float _SoftScale;
			uniform float _SoftPower;
			uniform half _ShadeLevel;
			uniform half _RimMode;
			uniform float4 _RimOutlineColour;
			uniform float _Min;
			uniform float _Max;
			uniform half _RimNormal;
			uniform float _RimNormPow;
			uniform float _Scale;
			uniform float _Power;
			uniform half _Amount;
			uniform half _MaskFresnel;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_Emission);
			uniform float4 _Emission_ST;
			uniform half _ScrollX;
			uniform half _ScrollY;
			SamplerState sampler_Emission;
			uniform half _ShadedOnly;
			uniform float _EmissionPower;
			uniform half4 _ShadedColour;
			uniform float _ShadedEmission;
			uniform float _ShadedPower;
			uniform half4 _EmissionColor;
			uniform float _EmissionIntensity;
			uniform float _EmissionHue;
			uniform half _FullBright;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_Matcap);
			uniform half _Legacy;
			uniform half _StereoFix;
			uniform float _NormalPowerMatCap;
			uniform float _MatcapSpin;
			uniform half _MatcapScale;
			SamplerState sampler_Matcap;
			uniform half _MatcapSaturation;
			uniform half4 _MatCapColor;
			uniform float _MatcapPower;
			uniform float _MatcapIntensity;
			uniform half _MatcapOpacity;
			uniform int _MatcapMaskEnum;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MatCapMask);
			uniform float4 _MatCapMask_ST;
			uniform half _MatcapMaskPower;
			uniform half _MatcapMaskLevel;
			uniform half _SpecMode;
			uniform float4 _SColor;
			uniform half _SpecScale;
			uniform half _StereoFixSpec;
			uniform float _NormalPowerSpecular;
			uniform half _SpecularSize;
			uniform half _Roughness;
			uniform half _RoughnessInvert;
			uniform int _RioughnessEnum;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_Glossiness);
			uniform float4 _Glossiness_ST;
			SamplerState sampler_Glossiness;
			uniform half _RoughnessLevel;
			uniform half _RoughnessPower;
			uniform float4 _GlossFresnel;
			uniform half _SpecRough;
			uniform half _SpecPower;
			uniform half _SpecularStrength;
			uniform half _SpecularOpacity;
			uniform half _SpecMatCapMode;
			uniform half _SpecMatcapMultiply;
			uniform half4 _SpecMatCapColor;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SpecularMatcap);
			uniform half _Legacy2;
			uniform half _StereoFixSpecCap;
			uniform half _SpecMatcapMipBias;
			SamplerState sampler_SpecularMatcap;
			uniform half _SpecMatcapSaturation;
			uniform half _SpecMatcapPower;
			uniform half _SpecMatcapLightPower;
			uniform half _SpecMatcapOpacity;
			uniform half _ReflectionBlend;
			uniform float _ReflectionIntensity;
			uniform half _ReflectionType;
			uniform float _Aberration;
			UNITY_DECLARE_TEXCUBE_NOSAMPLER(_Cubemap);
			uniform half _CubeSmoothnessOffset;
			uniform half _ProbeSmoothness;
			SamplerState sampler_Cubemap;
			uniform half _ReflectionOpacity;
			uniform float _ReflectionPower;
			uniform float _ReflectionSaturation;
			uniform float4 _ReflectionColor;
			uniform half _SpecularLevel;
			uniform int _SpecMaskEnum1;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SpecularMask);
			uniform float4 _SpecularMask_ST;
			uniform int _SpecMaskEnum2;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SpecularMask2);
			uniform float4 _SpecularMask2_ST;
			uniform half _SpecularLevel2;
			uniform half _SpecBias;
			uniform half _SpecMaskPower;
			uniform float3 _SpecEdgeAA;
			uniform half _SparkleMode;
			uniform half _SparkleMaskMultiply;
			uniform int _SparkleMaskEnum;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SparkleMask);
			uniform float4 _SparkleMask_ST;
			SamplerState sampler_SparkleMask;
			uniform half _SparkleMaskPower;
			uniform float _Threshold;
			uniform float _DistanceFade;
			uniform float _Range;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SparklePattern);
			uniform float4 _SparklePattern_ST;
			uniform float _ScaleValue;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ScaleMapR);
			uniform float4 _ScaleMapR_ST;
			SamplerState sampler_ScaleMapR;
			uniform float _ScalePower;
			SamplerState sampler_SparklePattern;
			uniform half _SparkleSSBias;
			uniform half _SparkleTexColour;
			uniform half _StereoCorrect;
			uniform half _ScreenContribution;
			uniform half _SparkleOffset;
			uniform half _MotionIntensity;
			uniform half _MotionType;
			uniform float _MotionSpeed;
			uniform half _RotateLinear;
			uniform half _WorldPosContribution;
			uniform half _SparkleTexColour1;
			uniform half4 _SparkleColor;
			uniform float3 _SparkleFresnel;
			uniform half _SparkleHDRMax;
			uniform int _ParallaxMaskEnum;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ParallaxMask);
			uniform float4 _ParallaxMask_ST;
			SamplerState sampler_ParallaxMask;
			uniform half _ParallaxMaskPower;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ParallaxTexture);
			uniform half _ParallaxType;
			uniform float4 _ParallaxTexture_ST;
			uniform float _ParallaxHeight;
			uniform float _ParallaxScale;
			SamplerState sampler_ParallaxTexture;
			uniform half4 _ParallaxColour;
			uniform float _Opacity;
			uniform int _AlphaMaskEnum;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_AlphaMask);
			uniform float4 _AlphaMask_ST;
			SamplerState sampler_AlphaMask;
			uniform half _FriendsOnlyAlphaMask;
			uniform float _Alpha;
			uniform float _A2CSampleBias;
			uniform float _AlphaCutoff;
			uniform half _MirrorSystem;
			uniform half _IsInMirror;
			uniform half _IsNotMirror;
			uniform half _FriendsOnly;
			uniform int _FriendMaskEnum;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_FriendsOnlyMask);
			uniform float4 _FriendsOnlyMask_ST;
			SamplerState sampler_FriendsOnlyMask;
			uniform float _MaskOffset;
			half4 SuperSample2x2SS50_g7340( UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue), float2 uvin, float2 dx, float2 dy, float bias, SamplerState samplerState )
			{
				half4 col = 0;
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx - dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx - dy), bias);
				col *= 0.25;
				return col;
			}
			
			half4 SuperSample2x2SS50_g6898( UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue), float2 uvin, float2 dx, float2 dy, float bias, SamplerState samplerState )
			{
				half4 col = 0;
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx - dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx - dy), bias);
				col *= 0.25;
				return col;
			}
			
			float3 HueShifter1_g7215( float3 aColor, float aHue )
			{
				    float angle = radians(aHue);
				    float3 k = float3(0.57735, 0.57735, 0.57735);
				    float cosAngle = cos(angle);
				    //Rodrigues' rotation formula
				    return aColor * cosAngle + cross(k, aColor) * sin(angle) + k * dot(k, aColor) * (1 - cosAngle);
			}
			
			float selectorsys7_g7366( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			
			float3 CenterEye1_g7208(  )
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
			
			half4 SuperSample2x2SS51_g7238( UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue), float2 uvin, float2 dx, float2 dy, float bias, SamplerState samplerState )
			{
				half4 col = 0;
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx - dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx - dy), bias);
				col *= 0.25;
				return col;
			}
			
			float selectorsys7_g7365( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			
			float3 CenterEye1_g7209(  )
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
			
			half3 SHArgbambientDir(  )
			{
				return float4(Unity_SafeNormalize(unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz), 1.0);
			}
			
			float4 VertexLightPosX3_g6875(  )
			{
				return unity_4LightPosX0;
			}
			
			float4 VertexLightPosY2_g6875(  )
			{
				return unity_4LightPosY0;
			}
			
			float4 VertexLightPosZ1_g6875(  )
			{
				return unity_4LightPosZ0;
			}
			
			float4 VertexLightAttenuation86_g6875(  )
			{
				return unity_4LightAtten0;
			}
			
			float4 VertexLightCol114_g6875(  )
			{
				return unity_LightColor[0];
			}
			
			float4 VertexLightCol215_g6875(  )
			{
				return unity_LightColor[1];
			}
			
			float4 VertexLightCol319_g6875(  )
			{
				return unity_LightColor[2];
			}
			
			float4 VertexLightCol421_g6875(  )
			{
				return unity_LightColor[3];
			}
			
			float3 unity_SHArgb3_g7205(  )
			{
				return float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
			}
			
			float3 CenterEye1_g7277(  )
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
			
			float3 HueShifter1_g7216( float3 aColor, float aHue )
			{
				    float angle = radians(aHue);
				    float3 k = float3(0.57735, 0.57735, 0.57735);
				    float cosAngle = cos(angle);
				    //Rodrigues' rotation formula
				    return aColor * cosAngle + cross(k, aColor) * sin(angle) + k * dot(k, aColor) * (1 - cosAngle);
			}
			
			float3 HueShifter1_g7235( float3 aColor, float aHue )
			{
				    float angle = radians(aHue);
				    float3 k = float3(0.57735, 0.57735, 0.57735);
				    float cosAngle = cos(angle);
				    //Rodrigues' rotation formula
				    return aColor * cosAngle + cross(k, aColor) * sin(angle) + k * dot(k, aColor) * (1 - cosAngle);
			}
			
			float3 CenterEye1_g7213(  )
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
			
			float3 CenterEye1_g7211(  )
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
			
			float selectorsys7_g7364( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			
			float selectorsys7_g7368( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			
			float3 CenterEye1_g7329(  )
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
			
			float3 CenterEye1_g7250(  )
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
			
			half CubePos5211(  )
			{
				return (abs(unity_SpecCube0_ProbePosition));
			}
			
			float selectorsys7_g7367( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			
			float selectorsys7_g7363( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			
			float selectorsys7_g7392( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			
			float3 CenterEye1_g7390(  )
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
			
			half4 SuperSample2x2SS50_g7384( UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue), float2 uvin, float2 dx, float2 dy, float bias, SamplerState samplerState )
			{
				half4 col = 0;
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx - dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx - dy), bias);
				col *= 0.25;
				return col;
			}
			
			float3 CenterEye1_g7388(  )
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
			
			float3 CenterEye1_g7386(  )
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
			
			half4 SuperSample2x2SS50_g7383( UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue), float2 uvin, float2 dx, float2 dy, float bias, SamplerState samplerState )
			{
				half4 col = 0;
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx + dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy + dx - dy), bias);
				col += SAMPLE_TEXTURE2D_BIAS(texvalue, samplerState,float2(uvin.xy - dx - dy), bias);
				col *= 0.25;
				return col;
			}
			
			float3 CenterEye1_g7391(  )
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
			
			float selectorsys7_g7394( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			
			float selectorsys7_g7381( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			
			half4 StereoScreenUV1_g7341( half4 screenuv )
			{
				                #if UNITY_SINGLE_PASS_STEREO
				                    screenuv.xy *= half2(_ScreenParams.x * 2, _ScreenParams.y);
				                #else
				                    screenuv.xy *= _ScreenParams.xy;
				                #endif
				    
				                return screenuv;
			}
			
			half Dither8x8Bayer( int x, int y )
			{
				const half dither[64] = {
				1, 49, 13, 61, 4, 52, 16, 64,
				33, 17, 45, 29, 36, 20, 48, 32,
				9, 57, 5, 53, 12, 60, 8, 56,
				41, 25, 37, 21, 44, 28, 40, 24,
				3, 51, 15, 63, 2, 50, 14, 62,
				35, 19, 47, 31, 34, 18, 46, 30,
				11, 59, 7, 55, 10, 58, 6, 54,
				43, 27, 39, 23, 42, 26, 38, 22
				                };
				int r = y * 8 + x;
				return dither[r] / 65; // Use 65 instead of 64 to get better centering
			}
			
			int RenderSampleCount(  )
			{
				uint samplecount = GetRenderTargetSampleCount();
				return samplecount;
			}
			
			int isCamera1_g7059(  )
			{
				return unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f;
			}
			
			float selectorsys7_g7380( fixed selectRGB, float Red, float Green, float Blue, float Alpha )
			{
				float4 rgbselvalue = 0;
				if (selectRGB == 0)
				   {
				       rgbselvalue =  Red;
				   }
				if (selectRGB == 1)
				   {
				       rgbselvalue = Green;
				   }
				if (selectRGB == 2)
				   {
				       rgbselvalue = Blue;
				   }
				if (selectRGB == 3)
				   {
				       rgbselvalue =Alpha;
				   }
				return rgbselvalue;
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldTangent = UnityObjectToWorldDir(v.ase_tangent);
				o.ase_texcoord2.xyz = ase_worldTangent;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord6 = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				o.ase_texcoord1.zw = v.ase_texcoord1.xy;
				o.ase_texcoord5 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
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
			
			fixed4 frag (v2f i , out uint cov : SV_Coverage) : SV_Target
			{
				UNITY_INITIALIZE_OUTPUT(uint,cov)
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue50_g7340) = _MainTex;
				float2 temp_output_4_0_g7340 = uv_MainTex;
				half2 uvin50_g7340 = temp_output_4_0_g7340;
				half2 dx50_g7340 = ( ddx( temp_output_4_0_g7340 ) * float2( 0.25,0.25 ) );
				half2 dy50_g7340 = ( ddy( temp_output_4_0_g7340 ) * float2( 0.25,0.25 ) );
				half bias50_g7340 = _TexSSBias;
				SamplerState samplerState50_g7340 = sampler_MainTex;
				half4 localSuperSample2x2SS50_g7340 = SuperSample2x2SS50_g7340( texvalue50_g7340 , uvin50_g7340 , dx50_g7340 , dy50_g7340 , bias50_g7340 , samplerState50_g7340 );
				#ifdef MAINSS_ON
				float4 staticSwitch4923 = localSuperSample2x2SS50_g7340;
				#else
				float4 staticSwitch4923 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, uv_MainTex );
				#endif
				float2 uv_FriendsOnlyRT = i.ase_texcoord1.xy * _FriendsOnlyRT_ST.xy + _FriendsOnlyRT_ST.zw;
				float4 tex2DNode349 = SAMPLE_TEXTURE2D( _FriendsOnlyRT, sampler_FriendsOnlyRT, uv_FriendsOnlyRT );
				float temp_output_351_0 = ceil( saturate( ( tex2DNode349.r + tex2DNode349.g + tex2DNode349.b ) ) );
				float ifLocalVar3506 = 0;
				if( _InvertFriendsOnly == 1.0 )
				ifLocalVar3506 = ( 1.0 - temp_output_351_0 );
				else if( _InvertFriendsOnly < 1.0 )
				ifLocalVar3506 = temp_output_351_0;
				half FriendsOnlyInvert3333 = ifLocalVar3506;
				UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue50_g6898) = _MainTexFriends;
				float2 temp_output_4_0_g6898 = uv_FriendsOnlyRT;
				half2 uvin50_g6898 = temp_output_4_0_g6898;
				half2 dx50_g6898 = ( ddx( temp_output_4_0_g6898 ) * float2( 0.25,0.25 ) );
				half2 dy50_g6898 = ( ddy( temp_output_4_0_g6898 ) * float2( 0.25,0.25 ) );
				half bias50_g6898 = _FriendTexSSBias;
				SamplerState samplerState50_g6898 = sampler_MainTexFriends;
				half4 localSuperSample2x2SS50_g6898 = SuperSample2x2SS50_g6898( texvalue50_g6898 , uvin50_g6898 , dx50_g6898 , dy50_g6898 , bias50_g6898 , samplerState50_g6898 );
				#ifdef FRIENDSS_ON
				float4 staticSwitch4922 = localSuperSample2x2SS50_g6898;
				#else
				float4 staticSwitch4922 = SAMPLE_TEXTURE2D( _MainTexFriends, sampler_MainTexFriends, uv_FriendsOnlyRT );
				#endif
				#ifdef FRIENDTEX_ON
				float4 staticSwitch4936 = ( FriendsOnlyInvert3333 >= 1.0 ? staticSwitch4922 : staticSwitch4923 );
				#else
				float4 staticSwitch4936 = staticSwitch4923;
				#endif
				float3 temp_output_813_0 = (_Color).rgb;
				float3 gammaToLinear5187 = GammaToLinearSpace( i.ase_color.rgb );
				float3 saferPower4850 = abs( ( (staticSwitch4936).rgb * temp_output_813_0 * ( _VertCol >= 1.0 ? gammaToLinear5187 : float3( 1,1,1 ) ) ) );
				float3 temp_cast_4 = (_MaintexPower).xxx;
				float3 temp_output_4850_0 = pow( saferPower4850 , temp_cast_4 );
				float2 localdecaluvsettting5704 = ( float2( 0,0 ) );
				float2 texCoord5712 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord5713 = i.ase_texcoord1.zw * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DECALUV_UV1)
				float2 staticSwitch5696 = texCoord5712;
				#elif defined(_DECALUV_UV2)
				float2 staticSwitch5696 = texCoord5713;
				#else
				float2 staticSwitch5696 = texCoord5712;
				#endif
				float2 decaluvmod5704 = staticSwitch5696;
				float2 uv2_DecalTex = i.ase_texcoord1.zw * _DecalTex_ST.xy + _DecalTex_ST.zw;
				float2 placeholder5704 = uv2_DecalTex;
				{
				decaluvmod5704.x = ((decaluvmod5704.x - 0.5) * _DecalTex_ST.x) + _DecalTex_ST.z;
				decaluvmod5704.y = ((decaluvmod5704.y - 0.5 + _DecalTex_ST.w) * _DecalTex_ST.y) + 0.5;
				decaluvmod5704 = decaluvmod5704.xy;
				}
				float2 break5722 = decaluvmod5704;
				float2 appendResult5724 = (float2(( _DecalMirrorX == 0.0 ? break5722.x : ( abs( break5722.x ) - _DecalMirrorOffset ) ) , ( break5722.x >= _DecalMirrorOffset ? ( break5722.y + _DecalMirrorAdjust ) : ( break5722.y - _DecalMirrorAdjust ) )));
				float cos5776 = cos( _DecalRotate );
				float sin5776 = sin( _DecalRotate );
				float2 rotator5776 = mul( appendResult5724 - float2( 0.5,0.5 ) , float2x2( cos5776 , -sin5776 , sin5776 , cos5776 )) + float2( 0.5,0.5 );
				float4 tex2DNode5709 = SAMPLE_TEXTURE2D( _DecalTex, sampler_DecalTex, rotator5776 );
				float3 temp_output_5736_0 = ( (tex2DNode5709).rgb * (_DecalColour).rgb * _DecalIntensity );
				float grayscale5711 = (temp_output_5736_0.r + temp_output_5736_0.g + temp_output_5736_0.b) / 3;
				float temp_output_5692_0 = ( _GreytoAlpha == 1.0 ? grayscale5711 : tex2DNode5709.a );
				float lerpResult5784 = lerp( ( 1.0 - temp_output_5692_0 ) , ( 1.0 - ( temp_output_5692_0 * FriendsOnlyInvert3333 ) ) , _FriendsOnlyDecal);
				float3 lerpResult5710 = lerp( temp_output_5736_0 , temp_output_4850_0 , lerpResult5784);
				#ifdef Decal_ON
				float3 staticSwitch5672 = lerpResult5710;
				#else
				float3 staticSwitch5672 = temp_output_4850_0;
				#endif
				float3 aColor1_g7215 = staticSwitch5672;
				float aHue1_g7215 = _Hue;
				float3 localHueShifter1_g7215 = HueShifter1_g7215( aColor1_g7215 , aHue1_g7215 );
				float3 desaturateInitialColor2917 = localHueShifter1_g7215;
				float desaturateDot2917 = dot( desaturateInitialColor2917, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2917 = lerp( desaturateInitialColor2917, desaturateDot2917.xxx, ( 1.0 - _Saturation ) );
				fixed selectRGB7_g7366 =(fixed)_ShadeMaskEnum;
				float2 uv_NormalMask = i.ase_texcoord1.xy * _NormalMask_ST.xy + _NormalMask_ST.zw;
				float2 uv2_NormalMask = i.ase_texcoord1.zw * _NormalMask_ST.xy + _NormalMask_ST.zw;
				#if defined(_MASKUV_UV1)
				float2 staticSwitch5866 = uv_NormalMask;
				#elif defined(_MASKUV_UV2)
				float2 staticSwitch5866 = uv2_NormalMask;
				#else
				float2 staticSwitch5866 = uv_NormalMask;
				#endif
				float4 tex2DNode3059 = SAMPLE_TEXTURE2D( _NormalMask, sampler_NormalMask, staticSwitch5866 );
				float4 break12_g7366 = tex2DNode3059;
				float Red7_g7366 = break12_g7366.r;
				float Green7_g7366 = break12_g7366.g;
				float Blue7_g7366 = break12_g7366.b;
				float Alpha7_g7366 = break12_g7366.a;
				float localselectorsys7_g7366 = selectorsys7_g7366( selectRGB7_g7366 , Red7_g7366 , Green7_g7366 , Blue7_g7366 , Alpha7_g7366 );
				float lerpResult3262 = lerp( 1.0 , localselectorsys7_g7366 , _LightMaskLevel);
				float ifLocalVar4801 = 0;
				UNITY_BRANCH 
				if( _LightMaskEnable == 1.0 )
				ifLocalVar4801 = lerpResult3262;
				else if( _LightMaskEnable < 1.0 )
				ifLocalVar4801 = 1.0;
				half LightMaskValue4804 = ifLocalVar4801;
				float2 uv_Normal = i.ase_texcoord1.xy * _Normal_ST.xy + _Normal_ST.zw;
				float2 uv2_Normal = i.ase_texcoord1.zw * _Normal_ST.xy + _Normal_ST.zw;
				#if defined(_NORMUV_UV1)
				float2 staticSwitch5191 = uv_Normal;
				#elif defined(_NORMUV_UV2)
				float2 staticSwitch5191 = uv2_Normal;
				#else
				float2 staticSwitch5191 = uv_Normal;
				#endif
				float3 localCenterEye1_g7208 = CenterEye1_g7208();
				float temp_output_4_0_g7207 = distance( WorldPosition , ( (float)1 == 0.0 ? localCenterEye1_g7208 : _WorldSpaceCameraPos ) );
				float temp_output_3838_0 = temp_output_4_0_g7207;
				float clampResult4354 = clamp( ( temp_output_3838_0 * 2.0 * _NorDist ) , 0.05 , 3.0 );
				float ifLocalVar3495 = 0;
				if( _NorDist >= 0.001 )
				ifLocalVar3495 = clampResult4354;
				else
				ifLocalVar3495 = 1.0;
				half NormalDist3459 = ifLocalVar3495;
				float3 tex2DNode5253 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _Normal, sampler_Normal, staticSwitch5191 ), ( _NormalScale * NormalDist3459 ) );
				float3 break5317 = tex2DNode5253;
				float temp_output_5336_0 = ( _NormalFlipY == 1.0 ? -break5317.y : break5317.y );
				float temp_output_5331_0 = ( _NormalFlipX == 1.0 ? -break5317.x : break5317.x );
				float2 appendResult5328 = (float2(temp_output_5336_0 , temp_output_5331_0));
				float2 appendResult5333 = (float2(temp_output_5331_0 , temp_output_5336_0));
				float3 appendResult5319 = (float3(( _NormalFlip == 1.0 ? appendResult5328 : appendResult5333 ) , break5317.z));
				float3 ifLocalVar5359 = 0;
				UNITY_BRANCH 
				if( ( _NormalFlip + _NormalFlipX + _NormalFlipY ) > 0.0 )
				ifLocalVar5359 = appendResult5319;
				else if( ( _NormalFlip + _NormalFlipX + _NormalFlipY ) == 0.0 )
				ifLocalVar5359 = tex2DNode5253;
				float2 uv_DetailNormalN = i.ase_texcoord1.xy * _DetailNormalN_ST.xy + _DetailNormalN_ST.zw;
				float2 uv2_DetailNormalN = i.ase_texcoord1.zw * _DetailNormalN_ST.xy + _DetailNormalN_ST.zw;
				#if defined(_DETAILNORMUV_UV1)
				float2 staticSwitch5256 = uv_DetailNormalN;
				#elif defined(_DETAILNORMUV_UV2)
				float2 staticSwitch5256 = uv2_DetailNormalN;
				#else
				float2 staticSwitch5256 = uv_DetailNormalN;
				#endif
				float temp_output_5259_0 = ( _DetailNormalScale * NormalDist3459 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue51_g7238) = _DetailNormalN;
				float2 temp_output_4_0_g7238 = staticSwitch5256;
				half2 uvin51_g7238 = temp_output_4_0_g7238;
				half2 dx51_g7238 = ( ddx( temp_output_4_0_g7238 ) * float2( 0.25,0.25 ) );
				half2 dy51_g7238 = ( ddy( temp_output_4_0_g7238 ) * float2( 0.25,0.25 ) );
				half bias51_g7238 = ( _NormSSBias * saturate( NormalDist3459 ) );
				SamplerState samplerState51_g7238 = sampler_DetailNormalN;
				half4 localSuperSample2x2SS51_g7238 = SuperSample2x2SS51_g7238( texvalue51_g7238 , uvin51_g7238 , dx51_g7238 , dy51_g7238 , bias51_g7238 , samplerState51_g7238 );
				float3 localUnpackNormal47_g7238 = UnpackScaleNormal( localSuperSample2x2SS51_g7238, temp_output_5259_0 );
				#ifdef NORMSS_ON
				float3 staticSwitch4930 = localUnpackNormal47_g7238;
				#else
				float3 staticSwitch4930 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _DetailNormalN, sampler_DetailNormalN, ( _DetailNormalMirror == 0.0 ? staticSwitch5256 : ( 1.0 - staticSwitch5256 ) ) ), temp_output_5259_0 );
				#endif
				float3 break5316 = staticSwitch4930;
				float temp_output_5345_0 = ( _DetailNormalFlipY == 1.0 ? -break5316.y : break5316.y );
				float temp_output_5344_0 = ( _DetailNormalFlipX == 1.0 ? -break5316.x : break5316.x );
				float2 appendResult5327 = (float2(temp_output_5345_0 , temp_output_5344_0));
				float2 appendResult5337 = (float2(temp_output_5344_0 , temp_output_5345_0));
				float3 appendResult5318 = (float3(( _DetailNormalFlip == 1.0 ? appendResult5327 : appendResult5337 ) , break5316.z));
				float3 ifLocalVar5357 = 0;
				UNITY_BRANCH 
				if( ( _DetailNormalFlip + _DetailNormalFlipX + _DetailNormalFlipY ) > 0.0 )
				ifLocalVar5357 = appendResult5318;
				else if( ( _DetailNormalFlip + _DetailNormalFlipX + _DetailNormalFlipY ) == 0.0 )
				ifLocalVar5357 = staticSwitch4930;
				#if defined(_USEDETAILNORMAL_NORMALONLY)
				float3 staticSwitch5251 = ifLocalVar5359;
				#elif defined(_USEDETAILNORMAL_MIXED)
				float3 staticSwitch5251 = BlendNormals( ifLocalVar5357 , ifLocalVar5359 );
				#elif defined(_USEDETAILNORMAL_DETAILONLY)
				float3 staticSwitch5251 = ifLocalVar5357;
				#else
				float3 staticSwitch5251 = ifLocalVar5359;
				#endif
				fixed selectRGB7_g7365 =(fixed)_NormMaskEnum;
				float4 break12_g7365 = tex2DNode3059;
				float Red7_g7365 = break12_g7365.r;
				float Green7_g7365 = break12_g7365.g;
				float Blue7_g7365 = break12_g7365.b;
				float Alpha7_g7365 = break12_g7365.a;
				float localselectorsys7_g7365 = selectorsys7_g7365( selectRGB7_g7365 , Red7_g7365 , Green7_g7365 , Blue7_g7365 , Alpha7_g7365 );
				float temp_output_6310_0 = localselectorsys7_g7365;
				float lerpResult5375 = lerp( ( 1.0 - _LightMaskOnly ) , pow( ( _NormalMaskInvert == 0.0 ? temp_output_6310_0 : ( 1.0 - temp_output_6310_0 ) ) , _NormMaskPow ) , _NormMaskLevel);
				float temp_output_4203_0 = ( lerpResult5375 + _LightMaskOnly );
				float3 lerpResult430 = lerp( float3( 0,0,1 ) , staticSwitch5251 , ( temp_output_4203_0 * _NormalPower ));
				float3 ase_worldTangent = i.ase_texcoord2.xyz;
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float3 ase_worldBitangent = i.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal1235 = lerpResult430;
				float3 worldNormal1235 = float3(dot(tanToWorld0,tanNormal1235), dot(tanToWorld1,tanNormal1235), dot(tanToWorld2,tanNormal1235));
				float3 NormalShade962 = worldNormal1235;
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float grayscale5451 = (ase_lightColor.rgb.r + ase_lightColor.rgb.g + ase_lightColor.rgb.b) / 3;
				float4 transform2147 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 normalizeResult1233 = normalize( ( _WorldSpaceLightPos0.xyz - ( _WorldSpaceLightPos0.w * (transform2147).xyz ) ) );
				float3 appendResult248 = (float3(_StaticLightX , _StaticLightY , _StaticLightZ));
				float3 localCenterEye1_g7209 = CenterEye1_g7209();
				float3 temp_output_4_0_g7209 = ( localCenterEye1_g7209 - WorldPosition );
				float3 normalizeResult5_g7209 = normalize( temp_output_4_0_g7209 );
				float3 temp_output_3511_2 = normalizeResult5_g7209;
				float3 lerpResult2635 = lerp( appendResult248 , temp_output_3511_2 , float3( 0.3333,0.3333,0.3333 ));
				half3 Dir_LightDir2215 = ( ( grayscale5451 * ase_lightColor.a ) > 0.0 ? normalizeResult1233 : lerpResult2635 );
				half3 localSHArgbambientDir6_g6877 = SHArgbambientDir();
				float3 temp_output_3817_0 = ( Dir_LightDir2215 + localSHArgbambientDir6_g6877 );
				float dotResult5 = dot( NormalShade962 , temp_output_3817_0 );
				float NdotL1296 = dotResult5;
				float4 localVertexLightPosX3_g6875 = VertexLightPosX3_g6875();
				float4 break4_g6875 = localVertexLightPosX3_g6875;
				float4 localVertexLightPosY2_g6875 = VertexLightPosY2_g6875();
				float4 break5_g6875 = localVertexLightPosY2_g6875;
				float4 localVertexLightPosZ1_g6875 = VertexLightPosZ1_g6875();
				float4 break6_g6875 = localVertexLightPosZ1_g6875;
				float3 appendResult7_g6875 = (float3(break4_g6875.x , break5_g6875.x , break6_g6875.x));
				half3 VertLightPos12017 = appendResult7_g6875;
				float4 transform2153 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 ifLocalVar3496 = 0;
				UNITY_BRANCH 
				if( _LightMode == 1.0 )
				ifLocalVar3496 = (transform2153).xyz;
				else if( _LightMode < 1.0 )
				ifLocalVar3496 = WorldPosition;
				half3 Lightmode2159 = ifLocalVar3496;
				float3 normalizeResult1382 = normalize( ( VertLightPos12017 - Lightmode2159 ) );
				float dotResult1381 = dot( NormalShade962 , normalizeResult1382 );
				float Vert_NdotL1389 = dotResult1381;
				float3 pos188_g6875 = appendResult7_g6875;
				float3 temp_output_157_0_g6875 = float3( 0,0,0 );
				float3 objToWorld139_g6875 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g6875, 1 ) ).xyz;
				float temp_output_155_0_g6875 = pow( distance( pos188_g6875 , objToWorld139_g6875 ) , 2.0 );
				float4 localVertexLightAttenuation86_g6875 = VertexLightAttenuation86_g6875();
				float4 break87_g6875 = localVertexLightAttenuation86_g6875;
				float attenx96_g6875 = break87_g6875.x;
				float temp_output_60_0_g6875 = saturate( ( 1.0 - ( ( temp_output_155_0_g6875 * attenx96_g6875 ) / 25.0 ) ) );
				float temp_output_3408_23 = min( ( 1.0 + ( ( 1.0 / temp_output_155_0_g6875 ) * attenx96_g6875 ) ) , ( temp_output_60_0_g6875 * temp_output_60_0_g6875 ) );
				float3 appendResult8_g6875 = (float3(break4_g6875.y , break5_g6875.y , break6_g6875.y));
				float3 pos290_g6875 = appendResult8_g6875;
				float3 objToWorld140_g6875 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g6875, 1 ) ).xyz;
				float temp_output_75_0_g6875 = pow( distance( pos290_g6875 , objToWorld140_g6875 ) , 2.0 );
				float atteny97_g6875 = break87_g6875.y;
				float temp_output_107_0_g6875 = saturate( ( 1.0 - ( ( temp_output_75_0_g6875 * atteny97_g6875 ) / 25.0 ) ) );
				float temp_output_3408_29 = min( ( 1.0 + ( ( 1.0 / temp_output_75_0_g6875 ) * atteny97_g6875 ) ) , ( temp_output_107_0_g6875 * temp_output_107_0_g6875 ) );
				float3 appendResult9_g6875 = (float3(break4_g6875.z , break5_g6875.z , break6_g6875.z));
				float3 pos389_g6875 = appendResult9_g6875;
				float3 objToWorld141_g6875 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g6875, 1 ) ).xyz;
				float temp_output_79_0_g6875 = pow( distance( pos389_g6875 , objToWorld141_g6875 ) , 2.0 );
				float attenz98_g6875 = break87_g6875.z;
				float temp_output_125_0_g6875 = saturate( ( 1.0 - ( ( temp_output_79_0_g6875 * attenz98_g6875 ) / 25.0 ) ) );
				float temp_output_3408_30 = min( ( 1.0 + ( ( 1.0 / temp_output_79_0_g6875 ) * attenz98_g6875 ) ) , ( temp_output_125_0_g6875 * temp_output_125_0_g6875 ) );
				float3 appendResult10_g6875 = (float3(break4_g6875.w , break5_g6875.w , break6_g6875.w));
				float3 pos491_g6875 = appendResult10_g6875;
				float3 objToWorld138_g6875 = mul( unity_ObjectToWorld, float4( temp_output_157_0_g6875, 1 ) ).xyz;
				float temp_output_83_0_g6875 = pow( distance( pos491_g6875 , objToWorld138_g6875 ) , 2.0 );
				float attenw99_g6875 = break87_g6875.w;
				float temp_output_116_0_g6875 = saturate( ( 1.0 - ( ( temp_output_83_0_g6875 * attenw99_g6875 ) / 25.0 ) ) );
				float temp_output_3408_31 = min( ( 1.0 + ( ( 1.0 / temp_output_83_0_g6875 ) * attenw99_g6875 ) ) , ( temp_output_116_0_g6875 * temp_output_116_0_g6875 ) );
				half VertAtten2014 = ( temp_output_3408_23 + temp_output_3408_29 + temp_output_3408_30 + temp_output_3408_31 );
				float4 localVertexLightCol114_g6875 = VertexLightCol114_g6875();
				float4 temp_output_3408_16 = localVertexLightCol114_g6875;
				float4 localVertexLightCol215_g6875 = VertexLightCol215_g6875();
				float4 temp_output_3408_17 = localVertexLightCol215_g6875;
				float4 localVertexLightCol319_g6875 = VertexLightCol319_g6875();
				float4 temp_output_3408_18 = localVertexLightCol319_g6875;
				float4 localVertexLightCol421_g6875 = VertexLightCol421_g6875();
				float4 temp_output_3408_20 = localVertexLightCol421_g6875;
				float4 break1551 = ( temp_output_3408_16 + temp_output_3408_17 + temp_output_3408_18 + temp_output_3408_20 );
				#ifdef VERTEXLIGHT_ON
				float staticSwitch1905 = ( VertAtten2014 * saturate( ( break1551.x + break1551.y + break1551.z ) ) * break1551.w );
				#else
				float staticSwitch1905 = 0.0;
				#endif
				half VertTotal1665 = staticSwitch1905;
				float lerpResult2140 = lerp( VertTotal1665 , VertAtten2014 , VertTotal1665);
				float temp_output_2033_0 = ( 1.0 - saturate( ( 1.0 / pow( ( lerpResult2140 * 10.0 ) , 2.0 ) ) ) );
				float lerpResult1994 = lerp( NdotL1296 , Vert_NdotL1389 , temp_output_2033_0);
				#ifdef SHADING_OFF
				float staticSwitch4929 = 1.0;
				#else
				float staticSwitch4929 = lerpResult1994;
				#endif
				half OffsetDot4139 = _OffsetDot;
				float temp_output_1106_0 = ( staticSwitch4929 - OffsetDot4139 );
				float saferPower4103 = abs( saturate( ( _ShadowSharpness * temp_output_1106_0 ) ) );
				float temp_output_1254_0 = saturate( pow( saferPower4103 , _ShadowPower ) );
				float3 lerpResult1016 = lerp( (_ShadowColour).rgb , float3( 1,1,1 ) , temp_output_1254_0);
				float3 lerpResult4371 = lerp( (_ShadowColour2).rgb , float3( 1,1,1 ) , pow( saturate( ( _ShadowSharpness2 * ( temp_output_1106_0 - _OffsetDot2 ) ) ) , _ShadowPower2 ));
				float saferPower4392 = abs( temp_output_1254_0 );
				float3 lerpResult4383 = lerp( float3( 1,1,1 ) , lerpResult4371 , pow( saferPower4392 , 0.75 ));
				float3 RampShade979 = ( LightMaskValue4804 * ( _StepTwo == 1.0 ? ( lerpResult1016 * lerpResult4383 ) : lerpResult1016 ) );
				float3 desaturateInitialColor581 = desaturateVar2917;
				float desaturateDot581 = dot( desaturateInitialColor581, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar581 = lerp( desaturateInitialColor581, desaturateDot581.xxx, ( ( 1.0 - RampShade979 ) * ( 1.0 - _ShadowSaturation ) ).x );
				float3 MaintexRGB3074 = desaturateVar581;
				float FinalDot4125 = staticSwitch4929;
				float lerpResult4129 = lerp( 0.0 , ( ( FinalDot4125 * 2.0 ) - OffsetDot4139 ) , _ShadeMaskSS);
				float3 VR_Viewdir5877 = temp_output_3511_2;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 lerpResult5905 = lerp( VR_Viewdir5877 , ase_worldViewDir , float3( 0.333,0.333,0.333 ));
				float3 Env_LightDir5494 = temp_output_3817_0;
				half3 Vert_LightDir1491 = normalizeResult1382;
				float3 lerpResult2213 = lerp( Env_LightDir5494 , Vert_LightDir1491 , temp_output_2033_0);
				half3 FinalLightDir2218 = lerpResult2213;
				float SphereizeVar3735 = _Spherize;
				float3 objToWorldDir3646 = mul( unity_ObjectToWorld, float4( i.ase_texcoord5.xyz, 0 ) ).xyz;
				float3 lerpResult3593 = lerp( float3( 0,0,1 ) , staticSwitch5251 , ( temp_output_4203_0 * _NormalPowerSubSurface ));
				float3 tanNormal3594 = lerpResult3593;
				float3 worldNormal3594 = float3(dot(tanToWorld0,tanNormal3594), dot(tanToWorld1,tanNormal3594), dot(tanToWorld2,tanNormal3594));
				float3 ifLocalVar3644 = 0;
				UNITY_BRANCH 
				if( SphereizeVar3735 == 1.0 )
				ifLocalVar3644 = objToWorldDir3646;
				else if( SphereizeVar3735 < 1.0 )
				ifLocalVar3644 = worldNormal3594;
				float3 NormalSubSurface3596 = ifLocalVar3644;
				float dotResult3589 = dot( lerpResult5905 , -( FinalLightDir2218 + NormalSubSurface3596 ) );
				float temp_output_3797_0 = ( dotResult3589 - _OffsetSS );
				float viewdist5880 = temp_output_3838_0;
				float temp_output_3720_0 = pow( (0.0 + (viewdist5880 - 0.0) * (1.0 - 0.0) / (0.5 - 0.0)) , 0.25 );
				float temp_output_3608_0 = pow( ( _SSStrength * temp_output_3797_0 * temp_output_3720_0 ) , _SSIntensity );
				float temp_output_5501_0 = max( temp_output_3608_0 , 1E-05 );
				float temp_output_5508_0 = max( pow( ( ( temp_output_3797_0 - _OffsetSS2 ) * temp_output_3720_0 * _SSStrength2 ) , _SSIntensity2 ) , 1E-05 );
				float lerpResult5873 = lerp( 0.0 , ( lerpResult4129 + 1.0 ) , ( _SSDouble == 1.0 ? ( temp_output_5501_0 + ( _SSBrightness2 * temp_output_5508_0 ) ) : temp_output_5501_0 ));
				float temp_output_3657_0 = saturate( lerpResult5873 );
				float temp_output_5514_0 = max( temp_output_3657_0 , 0.0 );
				float saferPower5512 = abs( ( temp_output_5514_0 * 0.75 ) );
				float lerpResult5529 = lerp( min( ( pow( saferPower5512 , 0.25 ) + ( temp_output_5514_0 * -0.25 ) ) , 1.0 ) , 1.0 , ( 1.0 - _SSColour.a ));
				float3 desaturateInitialColor5496 = (_SSColour).rgb;
				float desaturateDot5496 = dot( desaturateInitialColor5496, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar5496 = lerp( desaturateInitialColor5496, desaturateDot5496.xxx, lerpResult5529 );
				float3 objToWorldDir3737 = mul( unity_ObjectToWorld, float4( i.ase_texcoord5.xyz, 0 ) ).xyz;
				float dotResult3687 = dot( -( FinalLightDir2218 + ( SphereizeVar3735 == 1.0 ? objToWorldDir3737 : ase_worldNormal ) ) , lerpResult5905 );
				float3 saferPower5565 = abs( ( FinalDot4125 + float3( 0,0,0 ) + -( lerpResult5905 * float3( 0.005,0.005,0.005 ) ) ) );
				float3 temp_cast_7 = (( ( 2.0 - _FWDSSInvPow ) * 0.6 )).xxx;
				float3 saferPower5566 = abs( ( ( 1.0 - FinalDot4125 ) + float3( -1,-1,-1 ) + -( lerpResult5905 * float3( 0.005,0.005,0.005 ) ) ) );
				float3 temp_cast_8 = (( ( 2.0 - _FWDSSInvPow1 ) * 0.6 )).xxx;
				float grayscale5617 = (( pow( saferPower5565 , temp_cast_7 ) * float3( 0.25,0.25,0.25 ) * pow( saferPower5566 , temp_cast_8 ) ).r + ( pow( saferPower5565 , temp_cast_7 ) * float3( 0.25,0.25,0.25 ) * pow( saferPower5566 , temp_cast_8 ) ).g + ( pow( saferPower5565 , temp_cast_7 ) * float3( 0.25,0.25,0.25 ) * pow( saferPower5566 , temp_cast_8 ) ).b) / 3;
				float temp_output_2082_0 = ( 1.0 - _WorldSpaceLightPos0.w );
				#ifdef VERTEXLIGHT_ON
				float4 staticSwitch1908 = ( ( temp_output_3408_16 * temp_output_3408_23 ) + ( temp_output_3408_17 * temp_output_3408_29 ) + ( temp_output_3408_18 * temp_output_3408_30 ) + ( temp_output_3408_20 * temp_output_3408_31 ) );
				#else
				float4 staticSwitch1908 = half4(0,0,0,0);
				#endif
				float4 VertLight1406 = staticSwitch1908;
				float3 localunity_SHArgb3_g7205 = unity_SHArgb3_g7205();
				float3 temp_output_1489_0 = ( ( ase_lightColor.rgb * float3( 1,0.9,0.925 ) * temp_output_2082_0 ) + ( ( (VertLight1406).xyz - (_LightColourSub).rgb ) * float3( 0.35,0.333,0.35 ) * temp_output_2082_0 ) + ( localunity_SHArgb3_g7205 * float3( 2,1.85,1.9 ) * _BakedMulti ) );
				float3 saferPower5490 = abs( ( float3( 1,1,1 ) / temp_output_1489_0 ) );
				float3 saferPower4200 = abs( ( temp_output_1489_0 * min( pow( saferPower5490 , 0.75 ) , float3( 1,1,1 ) ) * (_LightColourBias).rgb * _LightMulti ) );
				float3 temp_output_4200_0 = pow( saferPower4200 , 0.8 );
				float3 temp_cast_9 = (_LightCurvePow).xxx;
				float3 temp_cast_10 = (_MinLight).xxx;
				float3 clampResult3331 = clamp( ( pow( saturate( temp_output_4200_0 ) , temp_cast_9 ) * temp_output_4200_0 ) , temp_cast_10 , float3( 2,2,2 ) );
				float3 break5_g6881 = clampResult3331;
				float3 clampResult1914 = clamp( clampResult3331 , float3( 0,0,0 ) , ( ( _MaxLight * 2.0 * max( max( break5_g6881.x , break5_g6881.y ) , max( break5_g6881.y , break5_g6881.z ) ) ) / clampResult3331 ) );
				float3 break5_g7062 = clampResult1914;
				float3 break5_g7061 = clampResult1914;
				float LSat_Limit6058 = _LightSaturationLimiter;
				float LSat_Max6059 = _LightSatFinal;
				float clampResult3551 = clamp( ( ( max( max( break5_g7062.x , break5_g7062.y ) , max( break5_g7062.y , break5_g7062.z ) ) - min( min( break5_g7061.x , break5_g7061.y ) , min( break5_g7061.y , break5_g7061.z ) ) ) * ( 1.0 - LSat_Limit6058 ) ) , ( 1.0 - LSat_Max6059 ) , 1.0 );
				float3 desaturateInitialColor1777 = clampResult1914;
				float desaturateDot1777 = dot( desaturateInitialColor1777, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1777 = lerp( desaturateInitialColor1777, desaturateDot1777.xxx, clampResult3551 );
				float3 AllLight3270 = desaturateVar1777;
				float grayscale5643 = Luminance(AllLight3270);
				float forwardSS5586 = ( _FWDSS == 1.0 ? ( ( max( ( 0.1 - grayscale5617 ) , 0.0 ) * 0.6666 * _FWDSSMulti ) / ( ( grayscale5643 + 1.0 ) * 0.75 ) ) : 0.0 );
				float3 lerpResult5885 = lerp( float3( 0,0,0 ) , max( ( desaturateVar5496 * ( saturate( ( dotResult3687 * 0.5 * _SSTransmission ) ) + forwardSS5586 + temp_output_3657_0 ) * _SSBrightness ) , float3( 0,0,0 ) ) , ( _UseLightMaskSS == 1.0 ? LightMaskValue4804 : 1.0 ));
				float dotResult3702 = dot( lerpResult5905 , NormalSubSurface3596 );
				float saferPower3694 = abs( ( ( ( dotResult3702 - _OffsetSS ) - _SSEdgeAA.x ) * 0.3 ) );
				float smoothstepResult3721 = smoothstep( 0.0 , _SSEdgeAA.z , pow( saferPower3694 , _SSEdgeAA.y ));
				float3 lerpResult4980 = lerp( float3( 0,0,0 ) , lerpResult5885 , saturate( ( ( smoothstepResult3721 * 0.75 ) - 0.2 ) ));
				#ifdef SUBSURFACE_ON
				float3 staticSwitch4934 = lerpResult4980;
				#else
				float3 staticSwitch4934 = float3( 0,0,0 );
				#endif
				float3 SubSurface3603 = staticSwitch4934;
				float3 temp_cast_11 = (_ShadowDarkness).xxx;
				float3 lerpResult5011 = lerp( ( _ShadowDarkness * ( 1.0 - saturate( SubSurface3603 ) ) ) , temp_cast_11 , _SSDarkMask);
				float3 clampResult30 = clamp( ( RampShade979 - ( ( 1.0 - temp_output_1106_0 ) * lerpResult5011 ) ) , float3( 0,0,0 ) , float3( 0.8,0.8,0.8 ) );
				float3 ifLocalVar3502 = 0;
				if( _ShadeColorDynamic == 1.0 )
				ifLocalVar3502 = (float3( 0.5,0.5,0.5 ) + ((AllLight3270).xyz - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.5,0.5,0.5 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				else if( _ShadeColorDynamic < 1.0 )
				ifLocalVar3502 = (float3( 0.5,0.5,0.5 ) + ((_ShadeColour).rgb - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0.5,0.5,0.5 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float dotResult4424 = dot( NormalShade962 , ase_worldViewDir );
				float clampResult4423 = clamp( dotResult4424 , 1E-05 , 1.99999 );
				float3 ifLocalVar4422 = 0;
				if( clampResult4423 > 0.0 )
				ifLocalVar4422 = NormalShade962;
				else if( clampResult4423 < 0.0 )
				ifLocalVar4422 = -NormalShade962;
				float fresnelNdotV645 = dot( normalize( ifLocalVar4422 ), FinalLightDir2218 );
				float fresnelNode645 = ( 0.0 + _SoftScale * pow( max( 1.0 - fresnelNdotV645 , 0.0001 ), _SoftPower ) );
				float fresnelNdotV662 = dot( normalize( ifLocalVar4422 ), ase_worldViewDir );
				float fresnelNode662 = ( 0.0 + _SoftScale * pow( max( 1.0 - fresnelNdotV662 , 0.0001 ), _SoftPower ) );
				float lerpResult669 = lerp( 1.0 , ( 1.0 - ( saturate( fresnelNode645 ) * 0.5 * ( saturate( fresnelNode662 ) * 0.5 ) ) ) , _ShadeLevel);
				float3 lerpResult3285 = lerp( ( ifLocalVar3502 * float3( 0.1,0.1,0.1 ) ) , float3( 1,1,1 ) , lerpResult669);
				#ifdef SOFTSHADE_OFF
				float3 staticSwitch4926 = half3(1,1,1);
				#else
				float3 staticSwitch4926 = lerpResult3285;
				#endif
				float3 LightShaded2289 = ( clampResult30 * staticSwitch4926 );
				float3 LightColour968 = ( desaturateVar1777 * LightShaded2289 );
				float3 saferPower3799 = abs( LightColour968 );
				float3 temp_cast_12 = (1.0).xxx;
				#ifdef _DISABLELIGHT_ON
				float3 staticSwitch4927 = temp_cast_12;
				#else
				float3 staticSwitch4927 = ( ( SubSurface3603 * pow( saferPower3799 , 2.0 ) ) + LightColour968 );
				#endif
				float3 PostDesaturation1276 = ( ( MaintexRGB3074 * staticSwitch4927 ) + float3( 0.0001,0.0001,0.0001 ) );
				float3 lerpResult1536 = lerp( ase_worldNormal , NormalShade962 , _RimNormPow);
				float3 ifLocalVar3505 = 0;
				if( _RimNormal == 1.0 )
				ifLocalVar3505 = lerpResult1536;
				else if( _RimNormal < 1.0 )
				ifLocalVar3505 = ase_worldNormal;
				float fresnelNdotV360 = dot( ifLocalVar3505, ase_worldViewDir );
				float fresnelNode360 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV360, _Power ) );
				float smoothstepResult379 = smoothstep( _Min , _Max , fresnelNode360);
				float3 temp_output_382_0 = ( (_RimOutlineColour).rgb * smoothstepResult379 );
				float4 transform5_g7276 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
				float3 localCenterEye1_g7277 = CenterEye1_g7277();
				float temp_output_4_0_g7276 = distance( transform5_g7276 , float4( ( (float)0 == 0.0 ? localCenterEye1_g7277 : _WorldSpaceCameraPos ) , 0.0 ) );
				float dotResult17_g7275 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_23_0_g7275 = ( ( 1.0 - ( temp_output_4_0_g7276 * 0.25 ) ) * 8.0 * dotResult17_g7275 );
				float temp_output_19_0_g7275 = saturate( temp_output_23_0_g7275 );
				float temp_output_3773_0 = ( ( temp_output_19_0_g7275 + 0.25 ) * _Amount );
				float3 lerpResult388 = lerp( PostDesaturation1276 , ( temp_output_382_0 + PostDesaturation1276 ) , temp_output_3773_0);
				float temp_output_383_0 = ( smoothstepResult379 * temp_output_3773_0 );
				float3 lerpResult390 = lerp( PostDesaturation1276 , temp_output_382_0 , temp_output_383_0);
				float3 lerpResult372 = lerp( PostDesaturation1276 , temp_output_382_0 , temp_output_383_0);
				float3 ifLocalVar1284 = 0;
				if( _RimMode > 1.0 )
				ifLocalVar1284 = lerpResult388;
				else if( _RimMode == 1.0 )
				ifLocalVar1284 = lerpResult390;
				else if( _RimMode < 1.0 )
				ifLocalVar1284 = lerpResult372;
				float2 uv_Emission = i.ase_texcoord1.xy * _Emission_ST.xy + _Emission_ST.zw;
				float2 uv2_Emission = i.ase_texcoord1.zw * _Emission_ST.xy + _Emission_ST.zw;
				#if defined(_EMISSIONUV_UV1)
				float2 staticSwitch5554 = uv_Emission;
				#elif defined(_EMISSIONUV_UV2)
				float2 staticSwitch5554 = uv2_Emission;
				#else
				float2 staticSwitch5554 = uv_Emission;
				#endif
				float2 break5557 = staticSwitch5554;
				float mulTime4888 = _Time.y * _ScrollX;
				float mulTime4893 = _Time.y * _ScrollY;
				float2 appendResult4890 = (float2(( break5557.x + mulTime4888 ) , ( break5557.y + mulTime4893 )));
				float4 tex2DNode328 = SAMPLE_TEXTURE2D( _Emission, sampler_Emission, appendResult4890 );
				float EmissionMask4679 = tex2DNode328.a;
				#ifdef RIMLIGHT_ON
				float3 staticSwitch4919 = ( ifLocalVar1284 * ( _MaskFresnel == 1.0 ? EmissionMask4679 : 1.0 ) );
				#else
				float3 staticSwitch4919 = PostDesaturation1276;
				#endif
				float3 saferPower6272 = abs( (tex2DNode328).rgb );
				float3 temp_cast_15 = (_EmissionPower).xxx;
				float3 temp_output_6272_0 = pow( saferPower6272 , temp_cast_15 );
				float3 lerpResult450 = lerp( temp_output_6272_0 , ( ( temp_output_6272_0 * saturate( LightColour968 ) ) + ( temp_output_6272_0 * (_ShadedColour).rgb * ( 1.0 - saturate( LightColour968 ) ) ) ) , _ShadedEmission);
				float grayscale4853 = (LightColour968.r + LightColour968.g + LightColour968.b) / 3;
				float3 lerpResult4317 = lerp( lerpResult450 , float3( 0,0,0 ) , pow( ( saturate( grayscale4853 ) * _ShadedPower ) , _ShadedPower ));
				float3 temp_output_805_0 = (_EmissionColor).rgb;
				float3 aColor1_g7216 = ( ( _ShadedOnly == 1.0 ? lerpResult4317 : lerpResult450 ) * EmissionMask4679 * temp_output_805_0 * _EmissionIntensity );
				float aHue1_g7216 = _EmissionHue;
				float3 localHueShifter1_g7216 = HueShifter1_g7216( aColor1_g7216 , aHue1_g7216 );
				float3 temp_cast_16 = (3.0).xxx;
				float3 clampResult331 = clamp( localHueShifter1_g7216 , float3( 0,0,0 ) , temp_cast_16 );
				float3 Emission1285 = clampResult331;
				float luminance4320 = Luminance(Emission1285);
				float lerpResult4852 = lerp( luminance4320 , _FullBright , _FullBright);
				float3 lerpResult4234 = lerp( staticSwitch4919 , Emission1285 , lerpResult4852);
				float3 aColor1_g7235 = ( temp_output_805_0 * MaintexRGB3074 );
				float aHue1_g7235 = _EmissionHue;
				float3 localHueShifter1_g7235 = HueShifter1_g7235( aColor1_g7235 , aHue1_g7235 );
				float grayscale5971 = (MaintexRGB3074.r + MaintexRGB3074.g + MaintexRGB3074.b) / 3;
				float3 lerpResult5973 = lerp( ( localHueShifter1_g7235 * _EmissionIntensity * grayscale5971 ) , MaintexRGB3074 , grayscale5971);
				float3 lerpResult5194 = lerp( staticSwitch4919 , lerpResult5973 , saturate( lerpResult4852 ));
				#ifdef _EMISSIONASMASK_ON
				float3 staticSwitch5193 = lerpResult5194;
				#else
				float3 staticSwitch5193 = lerpResult4234;
				#endif
				float3 PostRimLight1292 = staticSwitch5193;
				float3 localCenterEye1_g7213 = CenterEye1_g7213();
				float3 ifLocalVar50_g7212 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar50_g7212 = localCenterEye1_g7213;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar50_g7212 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g7212 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g7212 - WorldPosition ), 0 ) ).xyz );
				float3 lerpResult3086 = lerp( float3( 0,0,1 ) , staticSwitch5251 , ( _NormalPowerMatCap * temp_output_4203_0 ));
				float3 tanNormal3090 = lerpResult3086;
				float3 worldNormal3090 = float3(dot(tanToWorld0,tanNormal3090), dot(tanToWorld1,tanNormal3090), dot(tanToWorld2,tanNormal3090));
				float3 NormalMatCap3089 = worldNormal3090;
				float3 worldToViewDir13_g7212 = normalize( mul( UNITY_MATRIX_V, float4( NormalMatCap3089, 0 ) ).xyz );
				float mulTime2208 = _Time.y * _MatcapSpin;
				float cos2210 = cos( mulTime2208 );
				float sin2210 = sin( mulTime2208 );
				float2 rotator2210 = mul( (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g7212 ) , worldToViewDir13_g7212 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 ))) - float2( 0.5,0.5 ) , float2x2( cos2210 , -sin2210 , sin2210 , cos2210 )) + float2( 0.5,0.5 );
				float3 localCenterEye1_g7211 = CenterEye1_g7211();
				float3 ifLocalVar32_g7210 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFix == 1.0 )
				ifLocalVar32_g7210 = localCenterEye1_g7211;
				else if( (int)_StereoFix < 1.0 )
				ifLocalVar32_g7210 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g7210 = normalize( ( ifLocalVar32_g7210 - WorldPosition ) );
				half3 _worldUp = half3(0,1,0);
				float3 normalizeResult8_g7210 = normalize( cross( normalizeResult19_g7210 , _worldUp ) );
				float3 temp_output_21_0_g7210 = NormalMatCap3089;
				float dotResult10_g7210 = dot( normalizeResult8_g7210 , temp_output_21_0_g7210 );
				float dotResult2_g7210 = dot( _worldUp , normalizeResult19_g7210 );
				float3 normalizeResult7_g7210 = normalize( ( _worldUp - ( dotResult2_g7210 * normalizeResult19_g7210 ) ) );
				float dotResult9_g7210 = dot( normalizeResult7_g7210 , temp_output_21_0_g7210 );
				float2 appendResult11_g7210 = (float2(dotResult10_g7210 , dotResult9_g7210));
				float cos2207 = cos( mulTime2208 );
				float sin2207 = sin( mulTime2208 );
				float2 rotator2207 = mul( ( ( appendResult11_g7210 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) ) - float2( 0.5,0.5 ) , float2x2( cos2207 , -sin2207 , sin2207 , cos2207 )) + float2( 0.5,0.5 );
				float2 ifLocalVar3528 = 0;
				UNITY_BRANCH 
				if( _Legacy == 1.0 )
				ifLocalVar3528 = rotator2210;
				else if( _Legacy < 1.0 )
				ifLocalVar3528 = rotator2207;
				float4 tex2DNode2175 = SAMPLE_TEXTURE2D( _Matcap, sampler_Matcap, ( ( ( ifLocalVar3528 + float2( -0.5,-0.5 ) ) * _MatcapScale ) + float2( 0.5,0.5 ) ) );
				float3 desaturateInitialColor1516 = (tex2DNode2175).rgb;
				float desaturateDot1516 = dot( desaturateInitialColor1516, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1516 = lerp( desaturateInitialColor1516, desaturateDot1516.xxx, ( 1.0 - _MatcapSaturation ) );
				float3 temp_cast_19 = (_MatcapPower).xxx;
				fixed selectRGB7_g7364 =(fixed)_MatcapMaskEnum;
				float2 uv_MatCapMask = i.ase_texcoord1.xy * _MatCapMask_ST.xy + _MatCapMask_ST.zw;
				float4 break12_g7364 = SAMPLE_TEXTURE2D( _MatCapMask, sampler_Emission, uv_MatCapMask );
				float Red7_g7364 = break12_g7364.r;
				float Green7_g7364 = break12_g7364.g;
				float Blue7_g7364 = break12_g7364.b;
				float Alpha7_g7364 = break12_g7364.a;
				float localselectorsys7_g7364 = selectorsys7_g7364( selectRGB7_g7364 , Red7_g7364 , Green7_g7364 , Blue7_g7364 , Alpha7_g7364 );
				float lerpResult3268 = lerp( 1.0 , pow( localselectorsys7_g7364 , _MatcapMaskPower ) , _MatcapMaskLevel);
				float3 lerpResult405 = lerp( PostRimLight1292 , ( PostRimLight1292 * pow( ( desaturateVar1516 * (_MatCapColor).rgb ) , temp_cast_19 ) * _MatcapIntensity ) , ( _MatCapColor.a * pow( tex2DNode2175.a , _MatcapPower ) * _MatcapOpacity * saturate( lerpResult3268 ) ));
				float3 PostMatcap1274 = lerpResult405;
				#ifdef MATCAP_ON
				float3 staticSwitch4916 = PostMatcap1274;
				#else
				float3 staticSwitch4916 = PostRimLight1292;
				#endif
				float3 desaturateInitialColor2291 = LightColour968;
				float desaturateDot2291 = dot( desaturateInitialColor2291, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar2291 = lerp( desaturateInitialColor2291, desaturateDot2291.xxx, 1.0 );
				float3 temp_output_2287_0 = (desaturateVar2291).xyz;
				float3 temp_output_3068_0 = (_SColor).rgb;
				float3 ifLocalVar3493 = 0;
				if( _StereoFixSpec == 1.0 )
				ifLocalVar3493 = VR_Viewdir5877;
				else if( _StereoFixSpec < 1.0 )
				ifLocalVar3493 = ase_worldViewDir;
				float3 normalizeResult1783 = normalize( ( ifLocalVar3493 + FinalLightDir2218 ) );
				float3 lerpResult602 = lerp( float3( 0,0,1 ) , staticSwitch5251 , ( temp_output_4203_0 * _NormalPowerSpecular ));
				float3 tanNormal1234 = lerpResult602;
				float3 worldNormal1234 = float3(dot(tanToWorld0,tanNormal1234), dot(tanToWorld1,tanNormal1234), dot(tanToWorld2,tanNormal1234));
				float3 NormalSpecular965 = worldNormal1234;
				float dotResult551 = dot( normalizeResult1783 , NormalSpecular965 );
				float temp_output_5082_0 = saturate( ( _SpecScale + dotResult551 ) );
				float saferPower545 = abs( temp_output_5082_0 );
				fixed selectRGB7_g7368 =(fixed)_RioughnessEnum;
				float2 uv_Glossiness = i.ase_texcoord1.xy * _Glossiness_ST.xy + _Glossiness_ST.zw;
				float2 uv2_Glossiness = i.ase_texcoord1.zw * _Glossiness_ST.xy + _Glossiness_ST.zw;
				#if defined(_GLOSSUV_UV1)
				float2 staticSwitch5366 = uv_Glossiness;
				#elif defined(_GLOSSUV_UV2)
				float2 staticSwitch5366 = uv2_Glossiness;
				#else
				float2 staticSwitch5366 = uv_Glossiness;
				#endif
				float4 break12_g7368 = SAMPLE_TEXTURE2D( _Glossiness, sampler_Glossiness, staticSwitch5366 );
				float Red7_g7368 = break12_g7368.r;
				float Green7_g7368 = break12_g7368.g;
				float Blue7_g7368 = break12_g7368.b;
				float Alpha7_g7368 = break12_g7368.a;
				float localselectorsys7_g7368 = selectorsys7_g7368( selectRGB7_g7368 , Red7_g7368 , Green7_g7368 , Blue7_g7368 , Alpha7_g7368 );
				float temp_output_4149_0 = ( localselectorsys7_g7368 * _RoughnessLevel );
				float saferPower4154 = abs( ( _RoughnessInvert == 1.0 ? ( 1.0 - temp_output_4149_0 ) : temp_output_4149_0 ) );
				float fresnelNdotV5985 = dot( NormalSpecular965, ase_worldViewDir );
				float fresnelNode5985 = ( _GlossFresnel.x + _GlossFresnel.y * pow( max( 1.0 - fresnelNdotV5985 , 0.0001 ), _GlossFresnel.z ) );
				#ifdef _ROUGHNESSFRESNEL_ON
				float staticSwitch5988 = ( 1.0 - fresnelNode5985 );
				#else
				float staticSwitch5988 = 1.0;
				#endif
				float ifLocalVar4181 = 0;
				UNITY_BRANCH 
				if( _Roughness == 1.0 )
				ifLocalVar4181 = ( saturate( pow( saferPower4154 , _RoughnessPower ) ) * staticSwitch5988 );
				else if( _Roughness < 1.0 )
				ifLocalVar4181 = 0.0;
				float temp_output_4188_0 = ( 1.0 - _Roughness );
				float RoughnessSpec4785 = ( ifLocalVar4181 + temp_output_4188_0 );
				float temp_output_5910_0 = pow( RoughnessSpec4785 , _SpecRough );
				float temp_output_5912_0 = ( saturate( temp_output_5910_0 ) * _SpecRough );
				float temp_output_5921_0 = ( _SpecularSize * saturate( ( 1.0 - temp_output_5912_0 ) ) );
				float temp_output_6263_0 = ( pow( saferPower545 , exp( ( 10.0 - temp_output_5921_0 ) ) ) * 0.5 );
				float temp_output_5933_0 = pow( temp_output_6263_0 , ( 1.0 - _SpecPower ) );
				float saferPower6266 = abs( temp_output_5082_0 );
				float lerpResult5928 = lerp( temp_output_5933_0 , ( temp_output_5933_0 + ( temp_output_6263_0 * 1.5 * pow( saferPower6266 , exp( ( 10.0 - ( temp_output_5921_0 * 0.42 * temp_output_5912_0 ) ) ) ) ) ) , temp_output_5912_0);
				float clampResult2294 = clamp( ( lerpResult5928 * 0.3333 * pow( 10.0 , ( _SpecularStrength * ( _SpecRough == 0.0 ? 1.0 : temp_output_5912_0 ) ) ) ) , 0.0001 , 10.0 );
				float saferPower3056 = abs( _SpecularOpacity );
				float lerpResult816 = lerp( 0.0 , clampResult2294 , max( pow( saferPower3056 , 2.0 ) , 0.0 ));
				float3 appendResult2234 = (float3(lerpResult816 , lerpResult816 , lerpResult816));
				float3 clampResult6102 = clamp( LightColour968 , float3( -1,-1,-1 ) , float3( 1,1,1 ) );
				float clampResult6060 = clamp( ( 1.0 - LSat_Limit6058 ) , ( 1.0 - LSat_Max6059 ) , 1.0 );
				float3 desaturateInitialColor6062 = clampResult6102;
				float desaturateDot6062 = dot( desaturateInitialColor6062, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar6062 = lerp( desaturateInitialColor6062, desaturateDot6062.xxx, clampResult6060 );
				float3 ifLocalVar3482 = 0;
				UNITY_BRANCH 
				if( _SpecMode == 1.0 )
				ifLocalVar3482 = ( ( ( temp_output_3068_0 * appendResult2234 ) * float3( 3,3,3 ) * PostDesaturation1276 ) + ( appendResult2234 * float3( 3,3,3 ) * PostDesaturation1276 ) );
				else if( _SpecMode < 1.0 )
				ifLocalVar3482 = ( appendResult2234 * ( ( temp_output_3068_0 * desaturateVar6062 ) + desaturateVar6062 ) );
				float grayscale6104 = (ifLocalVar3482.r + ifLocalVar3482.g + ifLocalVar3482.b) / 3;
				float saferPower6110 = abs( grayscale6104 );
				float3 desaturateInitialColor6103 = ifLocalVar3482;
				float desaturateDot6103 = dot( desaturateInitialColor6103, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar6103 = lerp( desaturateInitialColor6103, desaturateDot6103.xxx, saturate( ( pow( saferPower6110 , 0.01 ) - 0.85 ) ) );
				float3 localCenterEye1_g7329 = CenterEye1_g7329();
				float3 ifLocalVar50_g7328 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar50_g7328 = localCenterEye1_g7329;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar50_g7328 = _WorldSpaceCameraPos;
				float3 worldToViewDir27_g7328 = normalize( mul( UNITY_MATRIX_V, float4( ( ifLocalVar50_g7328 - WorldPosition ), 0 ) ).xyz );
				float3 worldToViewDir13_g7328 = normalize( mul( UNITY_MATRIX_V, float4( NormalSpecular965, 0 ) ).xyz );
				float3 localCenterEye1_g7250 = CenterEye1_g7250();
				float3 ifLocalVar32_g7249 = 0;
				UNITY_BRANCH 
				if( (int)_StereoFixSpecCap == 1.0 )
				ifLocalVar32_g7249 = localCenterEye1_g7250;
				else if( (int)_StereoFixSpecCap < 1.0 )
				ifLocalVar32_g7249 = _WorldSpaceCameraPos;
				float3 normalizeResult19_g7249 = normalize( ( ifLocalVar32_g7249 - WorldPosition ) );
				float3 normalizeResult8_g7249 = normalize( cross( normalizeResult19_g7249 , _worldUp ) );
				float3 temp_output_21_0_g7249 = NormalSpecular965;
				float dotResult10_g7249 = dot( normalizeResult8_g7249 , temp_output_21_0_g7249 );
				float dotResult2_g7249 = dot( _worldUp , normalizeResult19_g7249 );
				float3 normalizeResult7_g7249 = normalize( ( _worldUp - ( dotResult2_g7249 * normalizeResult19_g7249 ) ) );
				float dotResult9_g7249 = dot( normalizeResult7_g7249 , temp_output_21_0_g7249 );
				float2 appendResult11_g7249 = (float2(dotResult10_g7249 , dotResult9_g7249));
				float2 ifLocalVar3491 = 0;
				UNITY_BRANCH 
				if( _Legacy2 == 1.0 )
				ifLocalVar3491 = (float2( 0,0 ) + ((BlendNormals( ( float3( -1,-1,1 ) * worldToViewDir27_g7328 ) , worldToViewDir13_g7328 )).xy - float2( -1,-1 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,1 ) - float2( -1,-1 )));
				else if( _Legacy2 < 1.0 )
				ifLocalVar3491 = ( ( appendResult11_g7249 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) );
				float saferPower4196 = abs( ( ( 1.0 - RoughnessSpec4785 ) * 3.0 ) );
				float temp_output_5458_0 = ( pow( saferPower4196 , 2.0 ) + -0.25 + _SpecMatcapMipBias );
				float3 temp_output_2_0_g7274 = NormalSpecular965;
				float3 normalizeResult25_g7274 = normalize( temp_output_2_0_g7274 );
				float3 temp_output_3_0_g7274 = ddx( normalizeResult25_g7274 );
				float dotResult5_g7274 = dot( temp_output_3_0_g7274 , temp_output_3_0_g7274 );
				float3 temp_output_4_0_g7274 = ddy( normalizeResult25_g7274 );
				float dotResult6_g7274 = dot( temp_output_4_0_g7274 , temp_output_4_0_g7274 );
				float temp_output_17_0_g7274 = saturate( max( dotResult5_g7274 , dotResult6_g7274 ) );
				float saferPower16_g7274 = abs( temp_output_17_0_g7274 );
				float RoughnesslGSAA6200 = min( ( _GSAAVariance * pow( saferPower16_g7274 , _GSAAPower ) ) , _GSAAThreshold );
				#ifdef _ENABLEGEOMETRICSPECULARAA
				float staticSwitch6213 = ( temp_output_5458_0 + RoughnesslGSAA6200 );
				#else
				float staticSwitch6213 = temp_output_5458_0;
				#endif
				float3 desaturateInitialColor1920 = (SAMPLE_TEXTURE2D_LOD( _SpecularMatcap, sampler_SpecularMatcap, ifLocalVar3491, staticSwitch6213 )).rgb;
				float desaturateDot1920 = dot( desaturateInitialColor1920, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1920 = lerp( desaturateInitialColor1920, desaturateDot1920.xxx, ( 1.0 - _SpecMatcapSaturation ) );
				float3 saferPower4728 = abs( desaturateVar1920 );
				float3 temp_cast_22 = (_SpecMatcapPower).xxx;
				float3 temp_cast_23 = (_SpecMatcapLightPower).xxx;
				float3 temp_output_690_0 = ( _SpecMatcapMultiply * (_SpecMatCapColor).rgb * pow( saferPower4728 , temp_cast_22 ) * pow( AllLight3270 , temp_cast_23 ) );
				float3 ifLocalVar3489 = 0;
				UNITY_BRANCH 
				if( _SpecMatCapMode == 1.0 )
				ifLocalVar3489 = ( temp_output_690_0 * MaintexRGB3074 );
				else if( _SpecMatCapMode < 1.0 )
				ifLocalVar3489 = temp_output_690_0;
				float3 lerpResult4340 = lerp( float3( 0,0,0 ) , ifLocalVar3489 , _SpecMatcapOpacity);
				#ifdef SPECMATCAP_ON
				float3 staticSwitch4932 = lerpResult4340;
				#else
				float3 staticSwitch4932 = float3( 0,0,0 );
				#endif
				float Refl_Aberrate6018 = _Aberration;
				float3 temp_output_5235_0 = reflect( -ase_worldViewDir , NormalSpecular965 );
				float temp_output_4159_0 = ( _ProbeSmoothness * ( temp_output_4188_0 + ( ifLocalVar4181 * 2.0 ) ) );
				float saferPower5456 = abs( ( ( 1.0 - ( _CubeSmoothnessOffset + -0.25 + temp_output_4159_0 ) ) * 3.0 ) );
				float temp_output_5456_0 = pow( saferPower5456 , 2.0 );
				#ifdef _ENABLEGEOMETRICSPECULARAA
				float staticSwitch6164 = ( temp_output_5456_0 + RoughnesslGSAA6200 );
				#else
				float staticSwitch6164 = temp_output_5456_0;
				#endif
				float4 texCUBENode5203 = SAMPLE_TEXTURECUBE_LOD( _Cubemap, sampler_Cubemap, ( temp_output_5235_0 + ( Vert_LightDir1491 * float3( 0.025,0.025,0.025 ) * Refl_Aberrate6018 ) ), staticSwitch6164 );
				float4 texCUBENode6004 = SAMPLE_TEXTURECUBE_LOD( _Cubemap, sampler_Cubemap, ( temp_output_5235_0 + ( Vert_LightDir1491 * float3( -0.025,-0.025,-0.025 ) * Refl_Aberrate6018 ) ), staticSwitch6164 );
				float3 appendResult6007 = (float3(texCUBENode5203.r , ( ( texCUBENode5203.g * 0.5 ) + ( texCUBENode6004.g * 0.5 ) ) , texCUBENode6004.b));
				float4 temp_output_6050_0 = (texCUBENode5203).rgba;
				float4 ifLocalVar6049 = 0;
				UNITY_BRANCH 
				if( Refl_Aberrate6018 <= 0.0 )
				ifLocalVar6049 = temp_output_6050_0;
				else
				ifLocalVar6049 = float4( appendResult6007 , 0.0 );
				float temp_output_4350_0 = ( 0.5 * _ReflectionOpacity );
				float4 lerpResult5212 = lerp( float4( 0,0,0,0 ) , ( float4( pow( ( AllLight3270 + float3( 1,1,1 ) ) , 1.5 ) , 0.0 ) * ifLocalVar6049 ) , temp_output_4350_0);
				half localCubePos5211 = CubePos5211();
				#ifdef _ENABLEGEOMETRICSPECULARAA
				float staticSwitch6194 = ( temp_output_4159_0 - RoughnesslGSAA6200 );
				#else
				float staticSwitch6194 = temp_output_4159_0;
				#endif
				UnityGIInput data;
				UNITY_INITIALIZE_OUTPUT( UnityGIInput, data );
				data.worldPos = WorldPosition;
				data.worldViewDir = ase_worldViewDir;
				data.probeHDR[0] = unity_SpecCube0_HDR;
				data.probeHDR[1] = unity_SpecCube1_HDR;
				#if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION //specdataif0
				data.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif //specdataif0
				#if UNITY_SPECCUBE_BOX_PROJECTION //specdataif1
				data.boxMax[0] = unity_SpecCube0_BoxMax;
				data.probePosition[0] = unity_SpecCube0_ProbePosition;
				data.boxMax[1] = unity_SpecCube1_BoxMax;
				data.boxMin[1] = unity_SpecCube1_BoxMin;
				data.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif //specdataif1
				Unity_GlossyEnvironmentData g3174 = UnityGlossyEnvironmentSetup( staticSwitch6194, ase_worldViewDir, ( NormalSpecular965 + ( Vert_LightDir1491 * float3( 0.025,0.025,0.025 ) * Refl_Aberrate6018 ) ), float3(0,0,0));
				float3 indirectSpecular3174 = UnityGI_IndirectSpecular( data, temp_output_4350_0, ( NormalSpecular965 + ( Vert_LightDir1491 * float3( 0.025,0.025,0.025 ) * Refl_Aberrate6018 ) ), g3174 );
				float3 break6031 = indirectSpecular3174;
				Unity_GlossyEnvironmentData g6030 = UnityGlossyEnvironmentSetup( staticSwitch6194, ase_worldViewDir, ( NormalSpecular965 + ( Vert_LightDir1491 * float3( -0.025,-0.025,-0.025 ) * Refl_Aberrate6018 ) ), float3(0,0,0));
				float3 indirectSpecular6030 = UnityGI_IndirectSpecular( data, temp_output_4350_0, ( NormalSpecular965 + ( Vert_LightDir1491 * float3( -0.025,-0.025,-0.025 ) * Refl_Aberrate6018 ) ), g6030 );
				float3 break6032 = indirectSpecular6030;
				float3 appendResult6026 = (float3(break6031.x , ( ( break6031.y * 0.5 ) + ( break6032.y * 0.5 ) ) , break6032.z));
				float3 ifLocalVar6044 = 0;
				UNITY_BRANCH 
				if( Refl_Aberrate6018 <= 0.0 )
				ifLocalVar6044 = indirectSpecular3174;
				else
				ifLocalVar6044 = appendResult6026;
				float4 ifLocalVar5210 = 0;
				UNITY_BRANCH 
				if( _ReflectionType > 1.0 )
				ifLocalVar5210 = lerpResult5212;
				else if( _ReflectionType == 1.0 )
				ifLocalVar5210 = ( localCubePos5211 > 0.0 ? float4( ifLocalVar6044 , 0.0 ) : lerpResult5212 );
				else if( _ReflectionType < 1.0 )
				ifLocalVar5210 = float4( ifLocalVar6044 , 0.0 );
				float4 temp_cast_28 = (_ReflectionPower).xxxx;
				float3 desaturateInitialColor4747 = pow( ( _ReflectionIntensity * ifLocalVar5210 ) , temp_cast_28 ).rgb;
				float desaturateDot4747 = dot( desaturateInitialColor4747, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar4747 = lerp( desaturateInitialColor4747, desaturateDot4747.xxx, ( 1.0 - _ReflectionSaturation ) );
				float3 temp_output_5242_0 = ( max( desaturateVar4747 , float3( 0.0001,0.0001,0.0001 ) ) * (_ReflectionColor).rgb );
				float3 ifLocalVar5906 = 0;
				UNITY_BRANCH 
				if( _ReflectionBlend > 1.0 )
				ifLocalVar5906 = ( temp_output_5242_0 * pow( MaintexRGB3074 , 0.5 ) );
				else if( _ReflectionBlend == 1.0 )
				ifLocalVar5906 = ( temp_output_5242_0 * MaintexRGB3074 );
				else if( _ReflectionBlend < 1.0 )
				ifLocalVar5906 = temp_output_5242_0;
				#ifdef SPECULARHIGHLIGHTS_ON
				float3 staticSwitch4931 = ifLocalVar5906;
				#else
				float3 staticSwitch4931 = float3( 0,0,0 );
				#endif
				fixed selectRGB7_g7367 =(fixed)_SpecMaskEnum1;
				float2 uv_SpecularMask = i.ase_texcoord1.xy * _SpecularMask_ST.xy + _SpecularMask_ST.zw;
				float4 break12_g7367 = SAMPLE_TEXTURE2D( _SpecularMask, sampler_Emission, uv_SpecularMask );
				float Red7_g7367 = break12_g7367.r;
				float Green7_g7367 = break12_g7367.g;
				float Blue7_g7367 = break12_g7367.b;
				float Alpha7_g7367 = break12_g7367.a;
				float localselectorsys7_g7367 = selectorsys7_g7367( selectRGB7_g7367 , Red7_g7367 , Green7_g7367 , Blue7_g7367 , Alpha7_g7367 );
				fixed selectRGB7_g7363 =(fixed)_SpecMaskEnum2;
				float2 uv_SpecularMask2 = i.ase_texcoord1.xy * _SpecularMask2_ST.xy + _SpecularMask2_ST.zw;
				float4 break12_g7363 = SAMPLE_TEXTURE2D( _SpecularMask2, sampler_Emission, uv_SpecularMask2 );
				float Red7_g7363 = break12_g7363.r;
				float Green7_g7363 = break12_g7363.g;
				float Blue7_g7363 = break12_g7363.b;
				float Alpha7_g7363 = break12_g7363.a;
				float localselectorsys7_g7363 = selectorsys7_g7363( selectRGB7_g7363 , Red7_g7363 , Green7_g7363 , Blue7_g7363 , Alpha7_g7363 );
				float temp_output_5297_0 = ( localselectorsys7_g7363 * _SpecularLevel2 );
				float temp_output_696_0 = ( _SpecularLevel * localselectorsys7_g7367 * ( temp_output_5297_0 + ( 1.0 - _SpecularLevel2 ) ) );
				float dotResult6229 = dot( ase_worldViewDir , NormalSpecular965 );
				float saferPower6224 = abs( ( ( ( dotResult6229 - 0.0 ) - _SpecEdgeAA.x ) * 0.3 ) );
				float smoothstepResult6228 = smoothstep( 0.0 , _SpecEdgeAA.z , pow( saferPower6224 , _SpecEdgeAA.y ));
				float3 lerpResult560 = lerp( float3( 0,0,0 ) , ( desaturateVar6103 + ( staticSwitch4932 + staticSwitch4931 ) ) , ( max( pow( ( temp_output_696_0 + _SpecBias ) , _SpecMaskPower ) , 1E-05 ) * saturate( ( ( smoothstepResult6228 * 0.75 ) - 0.2 ) ) ));
				float3 SpecularOut983 = lerpResult560;
				fixed selectRGB7_g7392 =(fixed)_SparkleMaskEnum;
				float2 uv_SparkleMask = i.ase_texcoord1.xy * _SparkleMask_ST.xy + _SparkleMask_ST.zw;
				float4 break12_g7392 = SAMPLE_TEXTURE2D( _SparkleMask, sampler_SparkleMask, uv_SparkleMask );
				float Red7_g7392 = break12_g7392.r;
				float Green7_g7392 = break12_g7392.g;
				float Blue7_g7392 = break12_g7392.b;
				float Alpha7_g7392 = break12_g7392.a;
				float localselectorsys7_g7392 = selectorsys7_g7392( selectRGB7_g7392 , Red7_g7392 , Green7_g7392 , Blue7_g7392 , Alpha7_g7392 );
				float temp_output_259_0_g7382 = localselectorsys7_g7392;
				float3 temp_cast_30 = (_Threshold).xxx;
				float3 localCenterEye1_g7390 = CenterEye1_g7390();
				float temp_output_4_0_g7389 = distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g7390 : _WorldSpaceCameraPos ) );
				float temp_output_102_0_g7382 = temp_output_4_0_g7389;
				float ifLocalVar245_g7382 = 0;
				UNITY_BRANCH 
				if( _DistanceFade > 0.0 )
				ifLocalVar245_g7382 = pow( _Range , ( 1.0 - (0.0 + (temp_output_102_0_g7382 - 0.0) * (0.1 - 0.0) / (1.0 - 0.0)) ) );
				else if( _DistanceFade == 0.0 )
				ifLocalVar245_g7382 = _Range;
				else if( _DistanceFade < 0.0 )
				ifLocalVar245_g7382 = _Range;
				float temp_output_215_0_g7382 = min( ifLocalVar245_g7382 , 2.0 );
				float lerpResult209_g7382 = lerp( ( _DistanceFade == 0.0 ? temp_output_215_0_g7382 : 0.0 ) , temp_output_215_0_g7382 , _DistanceFade);
				float3 temp_cast_32 = (max( ( _Threshold + lerpResult209_g7382 ) , 0.0001 )).xxx;
				float2 uv_SparklePattern = i.ase_texcoord1.xy * _SparklePattern_ST.xy + _SparklePattern_ST.zw;
				float2 uv2_SparklePattern = i.ase_texcoord1.zw * _SparklePattern_ST.xy + _SparklePattern_ST.zw;
				#if defined(_SPARKLEUV_UV1)
				float2 staticSwitch210_g7382 = uv_SparklePattern;
				#elif defined(_SPARKLEUV_UV2)
				float2 staticSwitch210_g7382 = uv2_SparklePattern;
				#else
				float2 staticSwitch210_g7382 = uv_SparklePattern;
				#endif
				float2 uv_ScaleMapR = i.ase_texcoord1.xy * _ScaleMapR_ST.xy + _ScaleMapR_ST.zw;
				float temp_output_232_0_g7382 = pow( ( _ScaleValue * SAMPLE_TEXTURE2D( _ScaleMapR, sampler_ScaleMapR, uv_ScaleMapR ).r ) , _ScalePower );
				#ifdef _USESCALEMAP_ON
				float2 staticSwitch237_g7382 = ( temp_output_232_0_g7382 * staticSwitch210_g7382 );
				#else
				float2 staticSwitch237_g7382 = staticSwitch210_g7382;
				#endif
				UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue50_g7384) = _SparklePattern;
				float2 temp_output_4_0_g7384 = staticSwitch237_g7382;
				half2 uvin50_g7384 = temp_output_4_0_g7384;
				half2 dx50_g7384 = ( ddx( temp_output_4_0_g7384 ) * float2( 0.25,0.25 ) );
				half2 dy50_g7384 = ( ddy( temp_output_4_0_g7384 ) * float2( 0.25,0.25 ) );
				half bias50_g7384 = _SparkleSSBias;
				SamplerState samplerState50_g7384 = sampler_SparklePattern;
				half4 localSuperSample2x2SS50_g7384 = SuperSample2x2SS50_g7384( texvalue50_g7384 , uvin50_g7384 , dx50_g7384 , dy50_g7384 , bias50_g7384 , samplerState50_g7384 );
				#ifdef SPARKLESS_ON
				float4 staticSwitch195_g7382 = localSuperSample2x2SS50_g7384;
				#else
				float4 staticSwitch195_g7382 = SAMPLE_TEXTURE2D( _SparklePattern, sampler_SparklePattern, staticSwitch237_g7382 );
				#endif
				float grayscale107_g7382 = dot(staticSwitch195_g7382.rgb, float3(0.299,0.587,0.114));
				float3 appendResult113_g7382 = (float3(grayscale107_g7382 , grayscale107_g7382 , grayscale107_g7382));
				float3 lerpResult109_g7382 = lerp( appendResult113_g7382 , (staticSwitch195_g7382).rgb , _SparkleTexColour);
				#if defined(_SPARKLEUV_UV1)
				float2 staticSwitch213_g7382 = uv_SparklePattern;
				#elif defined(_SPARKLEUV_UV2)
				float2 staticSwitch213_g7382 = uv2_SparklePattern;
				#else
				float2 staticSwitch213_g7382 = uv_SparklePattern;
				#endif
				float2 break22_g7382 = staticSwitch213_g7382;
				float2 appendResult39_g7382 = (float2(-break22_g7382.x , break22_g7382.y));
				float4 screenPos = i.ase_texcoord6;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 temp_output_18_0_g7382 = (ase_screenPosNorm).xy;
				float3 localCenterEye1_g7388 = CenterEye1_g7388();
				float4 appendResult76_g7387 = (float4(( WorldPosition - localCenterEye1_g7388 ) , 0.0));
				float4 temp_output_77_0_g7387 = mul( UNITY_MATRIX_V, appendResult76_g7387 );
				float2 break83_g7387 = ( (temp_output_77_0_g7387).xy / (temp_output_77_0_g7387).z );
				float2 appendResult86_g7387 = (float2(( ( _ScreenParams.z / _ScreenParams.w ) * break83_g7387.x ) , ( break83_g7387.y * 2.0 )));
				float2 appendResult101_g7387 = (float2(1.0 , 1.0));
				float2 appendResult102_g7387 = (float2(0.0 , 0.0));
				float2 temp_output_16_0_g7382 = ( ( ( ( -appendResult86_g7387 * float2( 1,0.5 ) ) + float2( 0.5,0.5 ) ) * appendResult101_g7387 ) + appendResult102_g7387 );
				float3 localCenterEye1_g7386 = CenterEye1_g7386();
				float temp_output_4_0_g7385 = distance( WorldPosition , ( (float)0 == 0.0 ? localCenterEye1_g7386 : _WorldSpaceCameraPos ) );
				float saferPower189_g7382 = abs( temp_output_4_0_g7385 );
				float2 lerpResult183_g7382 = lerp( temp_output_18_0_g7382 , temp_output_16_0_g7382 , ( saturate( ( 1.0 / pow( saferPower189_g7382 , 2.0 ) ) ) + 0.1 ));
				float2 ifLocalVar27_g7382 = 0;
				UNITY_BRANCH 
				if( _StereoCorrect > 1.0 )
				ifLocalVar27_g7382 = temp_output_18_0_g7382;
				else if( _StereoCorrect == 1.0 )
				ifLocalVar27_g7382 = temp_output_16_0_g7382;
				else if( _StereoCorrect < 1.0 )
				ifLocalVar27_g7382 = lerpResult183_g7382;
				float mulTime7_g7382 = _Time.y * _MotionSpeed;
				float2 appendResult24_g7382 = (float2(mulTime7_g7382 , 0.0));
				float cos25_g7382 = cos( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float sin25_g7382 = sin( (0.0 + (_RotateLinear - 0.0) * (6.27 - 0.0) / (1.0 - 0.0)) );
				float2 rotator25_g7382 = mul( appendResult24_g7382 - float2( 0.5,0.5 ) , float2x2( cos25_g7382 , -sin25_g7382 , sin25_g7382 , cos25_g7382 )) + float2( 0.5,0.5 );
				float2 appendResult28_g7382 = (float2(sin( mulTime7_g7382 ) , cos( mulTime7_g7382 )));
				float2 ifLocalVar40_g7382 = 0;
				UNITY_BRANCH 
				if( _MotionType == 0.0 )
				ifLocalVar40_g7382 = rotator25_g7382;
				else if( _MotionType < 0.0 )
				ifLocalVar40_g7382 = appendResult28_g7382;
				float temp_output_26_0_g7382 = ( ( WorldPosition.x + WorldPosition.y + WorldPosition.z ) * ( _WorldPosContribution / 10.0 ) );
				float2 appendResult46_g7382 = (float2(-temp_output_26_0_g7382 , temp_output_26_0_g7382));
				float2 temp_output_50_0_g7382 = ( ( appendResult39_g7382 + ( ifLocalVar27_g7382 * _ScreenContribution ) ) + _SparkleOffset + ( _MotionIntensity * ifLocalVar40_g7382 ) + appendResult46_g7382 );
				#ifdef _USESCALEMAP_ON
				float2 staticSwitch238_g7382 = ( temp_output_232_0_g7382 * temp_output_50_0_g7382 );
				#else
				float2 staticSwitch238_g7382 = temp_output_50_0_g7382;
				#endif
				UNITY_DECLARE_TEX2D_NOSAMPLER(texvalue50_g7383) = _SparklePattern;
				float2 temp_output_4_0_g7383 = staticSwitch238_g7382;
				half2 uvin50_g7383 = temp_output_4_0_g7383;
				half2 dx50_g7383 = ( ddx( temp_output_4_0_g7383 ) * float2( 0.25,0.25 ) );
				half2 dy50_g7383 = ( ddy( temp_output_4_0_g7383 ) * float2( 0.25,0.25 ) );
				half bias50_g7383 = _SparkleSSBias;
				SamplerState samplerState50_g7383 = sampler_SparklePattern;
				half4 localSuperSample2x2SS50_g7383 = SuperSample2x2SS50_g7383( texvalue50_g7383 , uvin50_g7383 , dx50_g7383 , dy50_g7383 , bias50_g7383 , samplerState50_g7383 );
				#ifdef SPARKLESS_ON
				float4 staticSwitch196_g7382 = localSuperSample2x2SS50_g7383;
				#else
				float4 staticSwitch196_g7382 = SAMPLE_TEXTURE2D( _SparklePattern, sampler_SparklePattern, staticSwitch238_g7382 );
				#endif
				float grayscale108_g7382 = dot(staticSwitch196_g7382.rgb, float3(0.299,0.587,0.114));
				float3 appendResult114_g7382 = (float3(grayscale108_g7382 , grayscale108_g7382 , grayscale108_g7382));
				float3 lerpResult110_g7382 = lerp( appendResult114_g7382 , (staticSwitch196_g7382).rgb , _SparkleTexColour);
				float3 localCenterEye1_g7391 = CenterEye1_g7391();
				float3 temp_cast_38 = (( _SparkleTexColour1 * ( 1.0 + ( temp_output_102_0_g7382 * 0.05 ) ) )).xxx;
				float3 smoothstepResult93_g7382 = smoothstep( temp_cast_30 , temp_cast_32 , pow( ( lerpResult109_g7382 * lerpResult110_g7382 * ( 1.0 - pow( ( distance( WorldPosition , localCenterEye1_g7391 ) / 10000.0 ) , 0.5 ) ) ) , temp_cast_38 ));
				float3 clampResult151_g7382 = clamp( smoothstepResult93_g7382 , float3( 0,0,0 ) , float3( 3,3,3 ) );
				float clampResult139_g7382 = clamp( (1.0 + (temp_output_102_0_g7382 - 0.0) * (100.0 - 1.0) / (2.0 - 0.0)) , 0.0 , 100.0 );
				float saferPower143_g7382 = abs( clampResult139_g7382 );
				float lerpResult208_g7382 = lerp( 1.0 , ( ( saturate( ( 1.0 / temp_output_102_0_g7382 ) ) * 2.0 ) * pow( saferPower143_g7382 , 1.85 ) ) , _DistanceFade);
				float3 normalizeResult64_g7382 = normalize( ase_worldViewDir );
				float3 temp_output_97_0_g7382 = NormalSpecular965;
				float dotResult176_g7382 = dot( temp_output_97_0_g7382 , ase_worldViewDir );
				float clampResult177_g7382 = clamp( dotResult176_g7382 , 1E-05 , 1.99999 );
				float3 ifLocalVar178_g7382 = 0;
				if( clampResult177_g7382 <= 0.25 )
				ifLocalVar178_g7382 = -temp_output_97_0_g7382;
				else
				ifLocalVar178_g7382 = temp_output_97_0_g7382;
				float3 break66_g7382 = (float3( 0,0,0 ) + (_SparkleFresnel - float3( 0,0,0 )) * (float3( 0.1,0.1,0.1 ) - float3( 0,0,0 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float fresnelNdotV73_g7382 = dot( ifLocalVar178_g7382, normalizeResult64_g7382 );
				float fresnelNode73_g7382 = ( break66_g7382.x + break66_g7382.y * pow( max( 1.0 - fresnelNdotV73_g7382 , 0.0001 ), break66_g7382.z ) );
				float3 temp_output_95_0_g7382 = ( pow( ( _SparkleMaskMultiply >= 0.0 ? ( temp_output_259_0_g7382 * _SparkleMaskMultiply ) : ( ( 1.0 - _SparkleMaskMultiply ) * ( 1.0 - temp_output_259_0_g7382 ) ) ) , _SparkleMaskPower ) * clampResult151_g7382 * ( (_SparkleColor).rgb * lerpResult208_g7382 ) * ( 1.0 - saturate( fresnelNode73_g7382 ) ) );
				float3 temp_cast_39 = (_SparkleHDRMax).xxx;
				float3 clampResult193_g7382 = clamp( ( _SparkleMode == 1.0 ? ( MaintexRGB3074 * temp_output_95_0_g7382 ) : temp_output_95_0_g7382 ) , float3( 1E-05,1E-05,1E-05 ) , temp_cast_39 );
				#ifdef SPARKLE_ON
				float3 staticSwitch4933 = clampResult193_g7382;
				#else
				float3 staticSwitch4933 = float3( 0,0,0 );
				#endif
				float3 SparkleOut971 = staticSwitch4933;
				fixed selectRGB7_g7394 =(fixed)_ParallaxMaskEnum;
				float2 uv_ParallaxMask = i.ase_texcoord1.xy * _ParallaxMask_ST.xy + _ParallaxMask_ST.zw;
				float4 break12_g7394 = SAMPLE_TEXTURE2D( _ParallaxMask, sampler_ParallaxMask, uv_ParallaxMask );
				float Red7_g7394 = break12_g7394.r;
				float Green7_g7394 = break12_g7394.g;
				float Blue7_g7394 = break12_g7394.b;
				float Alpha7_g7394 = break12_g7394.a;
				float localselectorsys7_g7394 = selectorsys7_g7394( selectRGB7_g7394 , Red7_g7394 , Green7_g7394 , Blue7_g7394 , Alpha7_g7394 );
				float2 uv_ParallaxTexture = i.ase_texcoord1.xy * _ParallaxTexture_ST.xy + _ParallaxTexture_ST.zw;
				float temp_output_61_0_g7393 = ( _ParallaxHeight + 1.0 );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = Unity_SafeNormalize( ase_tanViewDir );
				float2 Offset29_g7393 = ( ( temp_output_61_0_g7393 - 1 ) * ase_tanViewDir.xy * _ParallaxScale ) + uv_ParallaxTexture;
				float2 Offset57_g7393 = ( ( temp_output_61_0_g7393 - 1 ) * ( ase_tanViewDir.xy / ase_tanViewDir.z ) * _ParallaxScale ) + uv_ParallaxTexture;
				float2 temp_output_59_0_g7393 = ( (float)(int)_ParallaxType == 0.0 ? Offset29_g7393 : Offset57_g7393 );
				float4 tex2DNode41_g7393 = SAMPLE_TEXTURE2D( _ParallaxTexture, sampler_ParallaxTexture, temp_output_59_0_g7393 );
				#ifdef PARALLAX_ON
				float3 staticSwitch4920 = ( pow( localselectorsys7_g7394 , _ParallaxMaskPower ) * (( tex2DNode41_g7393 * _ParallaxColour * tex2DNode41_g7393.a * _ParallaxColour.a )).rgb );
				#else
				float3 staticSwitch4920 = float3( 0,0,0 );
				#endif
				float localbits18_g7341 = ( 0.0 );
				float temp_output_2993_0 = (staticSwitch4936).a;
				float Alpha1262 = saturate( ( saturate( ( 1.0 - pow( max( temp_output_2993_0 , 0.999 ) , 4.0 ) ) ) + temp_output_2993_0 ) );
				float temp_output_333_0 = ( _Opacity * Alpha1262 );
				fixed selectRGB7_g7381 =(fixed)_AlphaMaskEnum;
				float2 uv_AlphaMask = i.ase_texcoord1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
				float4 break12_g7381 = SAMPLE_TEXTURE2D( _AlphaMask, sampler_AlphaMask, uv_AlphaMask );
				float Red7_g7381 = break12_g7381.r;
				float Green7_g7381 = break12_g7381.g;
				float Blue7_g7381 = break12_g7381.b;
				float Alpha7_g7381 = break12_g7381.a;
				float localselectorsys7_g7381 = selectorsys7_g7381( selectRGB7_g7381 , Red7_g7381 , Green7_g7381 , Blue7_g7381 , Alpha7_g7381 );
				float temp_output_6316_0 = localselectorsys7_g7381;
				float lerpResult5893 = lerp( temp_output_6316_0 , ( FriendsOnlyInvert3333 + temp_output_6316_0 ) , _FriendsOnlyAlphaMask);
				float temp_output_5844_0 = ( temp_output_333_0 * lerpResult5893 );
				#ifdef _SOFTMASK_ON
				float staticSwitch5842 = temp_output_5844_0;
				#else
				float staticSwitch5842 = temp_output_333_0;
				#endif
				float lerpResult5314 = lerp( 1.0 , staticSwitch5842 , _Alpha);
				#ifdef _DISABLEALPHA_ON
				float staticSwitch6280 = (float)1;
				#else
				float staticSwitch6280 = lerpResult5314;
				#endif
				float temp_output_3_0_g7341 = staticSwitch6280;
				half4 screenuv1_g7341 = ( screenPos / screenPos.w );
				half4 localStereoScreenUV1_g7341 = StereoScreenUV1_g7341( screenuv1_g7341 );
				float4 break8_g7341 = localStereoScreenUV1_g7341;
				int x11_g7341 = (int)fmod( break8_g7341.x , 8.0 );
				int y11_g7341 = (int)fmod( break8_g7341.y , 8.0 );
				half localDither8x8Bayer11_g7341 = Dither8x8Bayer( x11_g7341 , y11_g7341 );
				int localRenderSampleCount4_g7341 = RenderSampleCount();
				#ifdef COVERAGE_ON
				float staticSwitch65_g7341 = ( ( temp_output_3_0_g7341 + ( ( 1.0 - localDither8x8Bayer11_g7341 ) / ( localRenderSampleCount4_g7341 / _A2CSampleBias ) ) ) * localRenderSampleCount4_g7341 );
				#else
				float staticSwitch65_g7341 = 0.0;
				#endif
				float covtoggle18_g7341 = ceil( saturate( staticSwitch65_g7341 ) );
				float finalAlpha18_g7341 = staticSwitch65_g7341;
				float preFinalAlpha18_g7341 = temp_output_3_0_g7341;
				{
				// Shift and subtract to get the needed amount of positive bits
				  if (covtoggle18_g7341 == 1)
				{
				cov = (1u << (uint)(finalAlpha18_g7341)) - 1u;
				finalAlpha18_g7341 = 1;
				}
				  if (covtoggle18_g7341 == 0)
				{
				cov = 0xFF;
				finalAlpha18_g7341 = preFinalAlpha18_g7341;
				}
				}
				float4 appendResult1923 = (float4(( staticSwitch4916 + ( ( float3( 0.05,0.05,0.05 ) + temp_output_2287_0 ) * SpecularOut983 ) + ( ( temp_output_2287_0 + float3( 0.1,0.1,0.1 ) ) * float3( 2,2,2 ) * SparkleOut971 ) + ( ( temp_output_2287_0 + float3( 0.03,0.03,0.03 ) ) * staticSwitch4920 ) ) , finalAlpha18_g7341));
				float smoothstepResult5551 = smoothstep( 0.0 , ( _AlphaCutoff * 3.0 ) , temp_output_5844_0);
				#ifdef _DISABLEALPHA_ON
				float staticSwitch6282 = (float)1;
				#else
				float staticSwitch6282 = smoothstepResult5551;
				#endif
				int localisCamera1_g7059 = isCamera1_g7059();
				int Cam17_g7059 = localisCamera1_g7059;
				int temp_output_5_0_g7059 = (int)_IsInMirror;
				int temp_output_6_0_g7059 = (int)_IsNotMirror;
				float ifLocalVar3478 = 0;
				UNITY_BRANCH 
				if( _MirrorSystem == 1.0 )
				ifLocalVar3478 = (float)( (float)Cam17_g7059 == 1.0 ? ( (float)temp_output_5_0_g7059 == 1.0 ? ( Cam17_g7059 + temp_output_5_0_g7059 ) : ( Cam17_g7059 * temp_output_5_0_g7059 ) ) : ( (float)temp_output_6_0_g7059 == 0.0 ? ( Cam17_g7059 * temp_output_6_0_g7059 ) : ( Cam17_g7059 + temp_output_6_0_g7059 ) ) );
				else
				ifLocalVar3478 = 1.0;
				half FriendsOnlyToggle3353 = _FriendsOnly;
				fixed selectRGB7_g7380 =(fixed)_FriendMaskEnum;
				float2 uv_FriendsOnlyMask = i.ase_texcoord1.xy * _FriendsOnlyMask_ST.xy + _FriendsOnlyMask_ST.zw;
				float4 break12_g7380 = SAMPLE_TEXTURE2D( _FriendsOnlyMask, sampler_FriendsOnlyMask, uv_FriendsOnlyMask );
				float Red7_g7380 = break12_g7380.r;
				float Green7_g7380 = break12_g7380.g;
				float Blue7_g7380 = break12_g7380.b;
				float Alpha7_g7380 = break12_g7380.a;
				float localselectorsys7_g7380 = selectorsys7_g7380( selectRGB7_g7380 , Red7_g7380 , Green7_g7380 , Blue7_g7380 , Alpha7_g7380 );
				float ifLocalVar4144 = 0;
				if( FriendsOnlyToggle3353 == 1.0 )
				ifLocalVar4144 = ( FriendsOnlyInvert3333 * 2.0 * ( localselectorsys7_g7380 + _MaskOffset ) );
				else if( FriendsOnlyToggle3353 < 1.0 )
				ifLocalVar4144 = 1.0;
				clip( ( staticSwitch6282 * ifLocalVar3478 * ifLocalVar4144 ) - ( _AlphaCutoff == 0.0 ? 0.0 : 0.005 ));
				
				
				finalColor = appendResult1923;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback "Legacy Shaders/Transparent/Cutout/VertexLit"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.CommentaryNode;3818;-2875.247,-1953.755;Inherit;False;1976.64;1150.999;;32;2993;19;813;812;18;2984;3338;3345;4167;3343;3430;4078;3431;4850;4851;4922;4923;4936;5183;5185;5186;5187;5315;5466;5198;5199;5810;5814;5816;5821;5824;5827;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;5827;-1560.169,-1518.252;Inherit;False;604;149;stupid alpha artefact fix;6;5826;5825;5811;5817;5823;5819;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;5714;-3122.662,-768.1074;Inherit;False;2166.435;600.1852;;39;5784;5690;5692;5739;5711;5693;5780;5779;5783;5737;5736;5777;5776;5724;5728;5741;5726;5740;5722;5770;5773;5774;5769;5775;5684;5704;5713;5712;5709;5691;5707;5734;5735;5696;5785;5786;5787;5788;5790;Decal;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1237;-8886.154,-540.3135;Inherit;False;3335.086;1924.526;;131;4930;5318;5319;5321;5322;5240;5320;5323;5316;5317;1861;1856;3089;3091;3090;3086;3087;3647;3088;3648;3576;965;3055;1234;602;3451;603;962;3596;3595;1235;430;3644;3061;3646;3735;3594;4797;3645;3593;428;3650;5251;3598;3597;4203;3059;4302;5253;5191;4352;5197;2958;5252;3432;5189;5259;4356;4351;3599;5256;2957;5258;5257;4079;5255;5254;4360;4357;3459;3495;3527;4354;3458;3838;3464;5327;5328;5331;5333;5334;5335;5336;5337;5338;5339;5340;5342;5343;5344;5345;5346;5347;5348;5349;5350;5353;5357;5358;5359;5360;5361;5362;5363;5364;5365;5373;5375;5662;5664;5665;5666;5668;5866;5880;5939;5941;5940;5945;5944;5947;5948;6138;6291;6292;6293;6294;6297;6295;6311;6310;Normal;0,0.766,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;3464;-6713.078,-496.6083;Float;False;Property;_NorDist;Normal Distance Modifier;65;0;Create;False;0;0;0;False;1;Space(5);False;0;0.001;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3458;-6379.837,-438.2522;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3527;-6376.406,-316.2013;Half;False;Constant;_Dist_Null;Dist_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;4354;-6210.413,-433.6178;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.05;False;2;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3495;-6006.938,-487.4892;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0.001;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3459;-5816.017,-491.8634;Half;False;NormalDist;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5257;-8406.352,547.7036;Float;False;Property;_DetailNormalScale;Scale DetailNormal;79;0;Create;False;0;0;0;False;1;Space(5);False;1;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4357;-8779.003,88.37113;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;5258;-8393.627,650.7017;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4079;-8698.612,19.94983;Half;False;Property;_NormSSBias;Mip Sample Bias;78;0;Create;False;0;0;0;False;0;False;0;-10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5662;-8620.62,460.9217;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;4360;-8586.007,94.37113;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5668;-8629.897,357.5016;Float;False;Property;_DetailNormalMirror;Mirror;80;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5259;-8214.503,554.452;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3599;-8548.077,1086.593;Inherit;False;3459;NormalDist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1378;-5470.776,-1542.995;Inherit;False;2099.93;995.9517;;33;2150;1491;1406;1908;1910;1682;1631;1630;1629;1684;1381;1382;1380;1383;2017;1665;1905;1911;1879;1891;1890;2014;1589;1886;1551;1878;2152;2153;2154;2159;3408;3496;1389;Vertex Lighting;1,0.628,0,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5189;-8777.58,1015.58;Inherit;False;1;2957;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;3432;-8777.596,889.938;Inherit;False;0;2957;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4351;-8530.895,1015.996;Float;False;Property;_NormalScale;Scale Normal;66;0;Create;False;0;0;0;False;0;False;1;1.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5664;-8270.521,500.5019;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4356;-8404.187,86.97553;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5665;-8276.521,499.5019;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5666;-8452.521,346.5019;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;5191;-8520.033,915.3184;Inherit;False;Property;_NormUV;Normal UV;74;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;UV1;UV2;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4352;-8362.243,1027.093;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3408;-5452.098,-1113.571;Inherit;False;VertexLightData;-1;;6875;d6cc1c00f5d200e45903717e6fa3d55c;4,158,0,159,0,160,0,161,0;1;157;FLOAT3;0,0,0;False;12;FLOAT3;0;FLOAT3;11;FLOAT3;12;FLOAT3;13;FLOAT4;16;FLOAT4;17;FLOAT4;18;FLOAT4;20;FLOAT;23;FLOAT;29;FLOAT;30;FLOAT;31
Node;AmplifyShaderEditor.SamplerNode;2958;-8266.002,323.0708;Inherit;True;Property;_TextureSample1;Texture Sample 1;100;0;Create;True;0;0;0;False;0;False;2957;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;1878;-4858.046,-688.5619;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch;4930;-7988.973,191.9492;Inherit;False;Property;_NormSuperSample;SuperSample (expensive);77;0;Create;False;0;0;0;False;0;False;0;0;1;True;NORMSS_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1551;-4729.315,-686.6694;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;5317;-7895.787,818.5738;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;5316;-7905.787,404.1266;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;5343;-7723.495,355.3059;Float;False;Property;_DetailNormalFlipY;Invert Y (G);82;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5342;-7716.096,194.606;Float;False;Property;_DetailNormalFlipX;Invert X (R);81;1;[ToggleUI];Create;False;0;0;0;False;1;Space(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5335;-7756.912,769.1663;Float;False;Property;_NormalFlipY;Invert Y (G);72;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;5339;-7762.212,678.1663;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;5346;-7708.745,275.0561;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5334;-7768.212,601.1663;Float;False;Property;_NormalFlipX;Invert X (R);71;1;[ToggleUI];Create;False;0;0;0;False;1;Space(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;5347;-7718.945,429.956;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5340;-7796.096,725.706;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1886;-4989.162,-749.3232;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5350;-7768.041,322.4624;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;5338;-7754.212,842.1663;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1589;-4573.709,-681.1406;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5344;-7571.945,207.956;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2014;-4658.913,-763.0379;Half;False;VertAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5331;-7607.212,620.1663;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;281;-7727.429,-1488.688;Inherit;False;1883.061;637.1891;Uses directional light or uses the static light direction;24;3817;2215;1296;5;1165;1076;1876;2635;1233;248;1247;633;3511;252;251;1246;249;2148;1232;2147;4796;5451;5494;5877;Light Setup;1,0.546,0,1;0;0
Node;AmplifyShaderEditor.SaturateNode;1890;-4444.542,-682.0359;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5345;-7570.845,362.056;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1891;-4427.027,-593.6627;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5336;-7602.212,765.1663;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;5328;-7313.212,684.1663;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2147;-7717.332,-1314.462;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5320;-7363.361,229.997;Float;False;Property;_DetailNormalFlip;Flip Axes;83;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5321;-7321.663,597.4968;Float;False;Property;_NormalFlip;Flip Axes;73;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;5327;-7352.211,312.1663;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;5337;-7345.211,403.1663;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;5333;-7311.212,778.1663;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1879;-4243.309,-724.0883;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1911;-4313.964,-813.201;Half;False;Constant;_VTotal_Fallback;VTotal_Fallback;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5322;-7139.689,653.8311;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;5365;-7763.634,386.1585;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1631;-4828.565,-917.2657;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1630;-4828.483,-1008.795;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1629;-4824.539,-1098.841;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1684;-4828.009,-827.705;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Compare;5323;-7208.688,250.031;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1232;-7719.888,-1424.848;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.StaticSwitch;1905;-4064.213,-758.4907;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2148;-7517.332,-1273.462;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5358;-7186.977,73.60265;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4202;-8676.225,-616.6619;Half;False;Property;_LightMaskOnly;Light Mask Only (for alpha8);93;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;5318;-7206.394,424.8;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1682;-4549.161,-990.8787;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;5361;-7926.133,917.8585;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;2153;-5444.693,-1473.717;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;1910;-4344.37,-1135.226;Half;False;Constant;_VLight_Fallback;VLight_Fallback;85;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;5360;-7286.834,927.0583;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3820;-5498.206,15.06701;Inherit;False;1832.555;536.1137;LightDir Threshold;15;2218;2213;2217;2216;1994;1480;2033;1297;2025;2035;2026;2034;2140;1490;2121;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;5319;-7145.531,810.0444;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5364;-7745.437,518.7585;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-7704.227,-1128.136;Half;False;Property;_StaticLightX;Static Light X;47;0;Create;True;0;0;0;False;1;Header(  Fake Light);False;0.68;0.68;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1665;-3805.671,-756.8867;Half;False;VertTotal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-7702.605,-981.8108;Half;False;Property;_StaticLightZ;Static Light Z;49;0;Create;True;0;0;0;False;0;False;0.44;0.44;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;633;-7391.807,-1177.175;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;251;-7704.32,-1053.852;Half;False;Property;_StaticLightY;Static Light Y;48;0;Create;True;0;0;0;False;0;False;0.55;0.55;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-7297.19,-1303.903;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;248;-7370.771,-1066.555;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2154;-5228.796,-1400.215;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2152;-5202.665,-1502.879;Half;False;Property;_LightMode;Lighting Mode;35;1;[Enum];Create;False;0;2;Surface;0;Object2World;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2150;-5367.876,-1288.946;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1247;-7151.503,-1347.665;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1908;-4141.791,-1019.448;Inherit;False;Property;_VERTEXLIGHT_ON;VERTEXLIGHT_ON;0;0;Create;True;0;0;0;False;0;False;1;0;0;False;VERTEXLIGHT_ON;Toggle;2;Key0;Key1;Create;False;False;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCGrayscale;5451;-7250.257,-1157.322;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1490;-5209.191,304.4393;Inherit;False;2014;VertAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2121;-5430.906,358.4309;Inherit;False;1665;VertTotal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;5359;-6922.733,762.5583;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;5357;-7058.177,410.9026;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3819;-3259.348,-54.00408;Inherit;False;2071.6;536.6441;;34;5164;5165;5166;1914;3332;3301;1915;5171;3331;4200;1916;2867;4394;2870;5489;4393;5490;5488;1489;1486;4204;3803;5670;2082;4795;1484;2081;3314;1408;5861;5862;5863;5864;5870;Light Colour;1,1,1,1;0;0
Node;AmplifyShaderEditor.ConditionalIfNode;3496;-4999.127,-1397.673;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1233;-7058.847,-1222.26;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1876;-7064.812,-1151.179;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1406;-3896.618,-1018.988;Float;False;VertLight;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;2635;-7076.641,-1049.892;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.3333,0.3333,0.3333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2140;-4993.46,342.2583;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2034;-4810.39,339.7534;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5353;-6869.743,470.6625;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1076;-6887.841,-1137;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2017;-4894.916,-1220.842;Half;False;VertLightPos1;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3597;-7663.356,-71.67403;Float;False;Property;_NormalPowerSubSurface;Normal SubSurface;70;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5363;-6939.436,626.6584;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2159;-4837.238,-1400.862;Half;False;Lightmode;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;5251;-6844.803,359.8696;Inherit;False;Property;_UseDetailNormal;Use Detail Normal;75;0;Create;True;0;0;0;False;1;Space(5);False;0;0;2;True;;KeywordEnum;3;NormalOnly;Mixed;DetailOnly;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;2026;-4647.018,337.0211;Inherit;False;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1383;-4657.188,-1232.291;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3598;-7384.339,-84.04669;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2215;-6739.414,-1136.314;Half;False;Dir_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;4796;-6738.559,-1065.653;Inherit;False;GetBakedLight;-1;;6877;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.RangedFloatNode;428;-8165.805,982.3168;Float;False;Property;_NormalPower;Normal Power;67;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1382;-4525.547,-1230.729;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3593;-6598.423,220.7052;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5362;-7335.935,1066.058;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2035;-4483.39,309.7534;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;3645;-6638.365,79.06295;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;4797;-7936.417,1065.263;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3650;-6663.688,-0.520067;Half;False;Property;_Spherize;Spherize SS Normal;120;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3817;-6530.182,-1132.418;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3061;-6905.231,937.7995;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;3646;-6443.365,74.06295;Inherit;False;Object;World;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;3735;-6423.647,-1.613451;Inherit;False;SphereizeVar;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;5494;-6494.393,-1010.341;Inherit;False;Env_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;2025;-4356.278,309.4951;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3594;-6404.448,217.9523;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1491;-4113.357,-1210.121;Half;False;Vert_LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2033;-4216.39,309.7534;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;430;-6702.103,826.3912;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3644;-6128.333,88.90162;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2217;-4254.786,413.6643;Inherit;False;5494;Env_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2216;-4257.403,476.6841;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;2213;-4020.388,417.9181;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;3595;-5962.148,89.51568;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3596;-5792.493,85.46589;Float;False;NormalSubSurface;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3585;-3959.897,-3951.01;Inherit;False;2733.323;1863.961;;103;4687;4686;4685;3603;4934;4980;5403;5497;3684;3610;4137;5496;4138;5529;4136;5492;3683;3682;5523;5527;3681;5524;3687;5491;5542;5512;3686;3741;5518;5514;3740;3685;3657;3737;3736;3733;3739;4857;4688;4130;4693;4129;3801;5515;5544;4123;4132;5501;4140;5508;5543;3608;4133;4126;3611;3717;4695;4696;4694;4976;4691;4977;3720;3797;4692;3719;3798;3589;3588;4786;3587;3601;5558;5562;5565;5566;5567;5586;5588;5592;5595;5596;5597;5610;5612;5614;5615;5616;5617;5620;5638;5639;5642;5643;5645;5647;5651;5652;5654;5873;5882;5885;5905;SubSurface;1,1,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2218;-3866.227,413.1346;Half;False;FinalLightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-4543.707,-1324.866;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3587;-3939.411,-3349.985;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3601;-3951.39,-3267.43;Inherit;False;3596;NormalSubSurface;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4786;-3769.207,-3363.134;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1381;-4264.826,-1285.479;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;5;-6274.125,-1203.03;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1296;-6072.649,-1209.666;Float;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1916;-2089.66,391.1853;Float;False;Property;_MinLight;Min Light;26;0;Create;True;0;0;0;False;0;False;0.025;0.02;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1389;-4116.64,-1288.897;Float;False;Vert_NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;3588;-3733.599,-3271.88;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-4239.378,130.2954;Inherit;False;1296;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1297;-4253.493,222.8561;Inherit;False;1389;Vert_NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;3589;-3602.372,-3447.778;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3798;-3554.466,-3520.68;Half;False;Property;_OffsetSS;Offset;104;0;Create;False;0;0;0;False;1;Space(5);False;0;-0.1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;5171;-1659.427,237.6825;Inherit;False;Float3 Max;-1;;6881;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3797;-3286.34,-3442.208;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4692;-3523.013,-3236.184;Half;False;Property;_OffsetSS2;Offset 2;108;0;Create;False;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1994;-3938.24,236.6205;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1915;-1718.211,160.4358;Half;False;Property;_MaxLight;Max Light (x2);25;0;Create;False;0;0;0;False;0;False;1;0.75;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;3719;-3583.572,-3141.607;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4691;-3176.32,-3232.715;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3720;-3422.23,-3140.459;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4977;-3176.923,-3108.958;Half;False;Property;_SSStrength2;SubSurface Strength 2;109;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3301;-1438.753,186.4043;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4696;-2966.042,-3105.06;Half;False;Property;_SSIntensity2;SubSurface Power 2;110;0;Create;False;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;3332;-1479.105,379.7416;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4694;-3049.459,-3232.833;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4976;-3421.223,-3598.15;Half;False;Property;_SSStrength;SubSurface Strength;105;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3567;-1147.805,406.2159;Inherit;False;1017.16;379.99;Light Saturation Bias;11;5182;3253;3551;3558;5160;3120;3553;5172;5173;6058;6059;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;1914;-1321.887,331.5438;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3717;-3082.684,-3443.122;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4695;-2925.624,-3232.285;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3611;-3193.342,-3518.253;Half;False;Property;_SSIntensity;SubSurface Power;106;0;Create;False;0;0;0;False;0;False;5;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3608;-2925.849,-3437.575;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4140;-3167.826,-3593.706;Inherit;False;4139;OffsetDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;5508;-2791.06,-3233.862;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1E-05;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5614;-3711.975,-2282.786;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.005,0.005,0.005;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;5501;-2782.06,-3434.862;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1E-05;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4132;-2968.42,-3519.67;Half;False;Property;_ShadeMaskSS;Shade Mask;117;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5544;-2685.313,-3331.858;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;5558;-3895.553,-2517.052;Inherit;True;4125;FinalDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;5620;-3372.998,-2535.481;Inherit;False;149;309;offsets;2;5563;5564;;1,1,1,1;0;0
Node;AmplifyShaderEditor.NegateNode;5612;-3568.76,-2290.992;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;5562;-3619.914,-2418.168;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4129;-2663.42,-3621.67;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4693;-2666.862,-3477.653;Half;False;Property;_SSDouble;Use Second Layer;107;1;[ToggleUI];Create;False;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;5566;-3179.02,-2343.202;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.75;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3801;-3942.989,-2927.916;Inherit;False;2063.683;322.9766;Edge Correction;14;4983;4982;3724;3721;4855;4858;5884;3694;3705;5883;4979;4856;3696;3702;;1,1,1,1;0;0
Node;AmplifyShaderEditor.PowerNode;5565;-3183.32,-2499.415;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.6666;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;5639;-2946.846,-2204.372;Inherit;False;3270;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;5617;-2854.063,-2451.674;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;5514;-2233.779,-3731.405;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4857;-3262.231,-3297.507;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;3739;-3946.814,-3825.451;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;3733;-3950.663,-3682.471;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5518;-2160.945,-3825.727;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3736;-3695.069,-3642.18;Inherit;False;3735;SphereizeVar;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;5643;-2785.33,-2205.033;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;5592;-2676.309,-2488.03;Inherit;False;2;0;FLOAT;0.1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;3737;-3714.062,-3831.753;Inherit;False;Object;World;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;5512;-2029.779,-3825.405;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;4171;-7646.457,-784.782;Inherit;False;880.3169;218.002;LightMask;6;4801;4802;4803;3263;3262;4804;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;5595;-2553.46,-2489.572;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3685;-3946.586,-3908.117;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5647;-2587.956,-2207.116;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5542;-2059.215,-3730.648;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5615;-2693.92,-2381.806;Half;False;Property;_FWDSSMulti;Forward Multiply;113;0;Create;False;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;3740;-3457.365,-3823.157;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5524;-1883.215,-3812.648;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3741;-3294.645,-3884.587;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;5491;-2375.852,-3899.115;Inherit;False;Property;_SSColour;SS Colour;102;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5642;-2432.725,-2207.279;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5616;-2423.973,-2486.181;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.6666;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;5645;-2276.01,-2482.918;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5597;-2336.732,-2579.183;Half;False;Property;_FWDSS;Forward SubSurface;112;1;[ToggleUI];Create;False;0;0;0;False;1;Space(5);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;3686;-3177.088,-3881.715;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode;5523;-1776.593,-3813.213;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5527;-1895.215,-3715.648;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;3687;-3045.001,-3885.28;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3681;-2838.09,-3773.764;Inherit;False;Property;_SSTransmission;Transmission;119;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5529;-1655.215,-3808.648;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;5492;-2169.852,-3900.115;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;5596;-2120.006,-2537.203;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3682;-2550.337,-3851.373;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;4362;-3454.998,1376.305;Inherit;False;1045.672;436.533;;9;4373;4371;4370;4369;4365;4364;4363;4392;4366;Light Ramp2;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;5588;-2324.037,-3568.825;Inherit;False;5586;forwardSS;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3683;-2216.596,-3635.606;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5638;-1331.185,-3725.219;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4136;-2277.612,-3209.551;Inherit;False;4804;LightMaskValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4138;-2264.958,-3288.683;Half;False;Property;_UseLightMaskSS;Use Light Mask;118;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;573;-3155.663,886.7236;Inherit;False;1217.672;436.533;;13;4170;4105;1016;1010;1254;4134;4103;1008;1118;4104;4379;4380;4385;Light Ramp;0.6102941,0.6102941,0.6102941,1;0;0
Node;AmplifyShaderEditor.Compare;4137;-2059.698,-3290.987;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5610;-1865.001,-3446.587;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;793;-1642.86,946.416;Inherit;False;2134.762;909.7648;;29;1123;3289;4422;1492;641;3285;954;3283;669;3502;3287;684;1035;680;679;3290;3273;811;3291;3281;3282;645;646;3271;662;642;4428;4430;4926;Soft Shading;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;569;-8226.363,-4766.131;Inherit;False;4007.194;2959.248;;284;1919;1921;817;2900;3177;4196;5865;6205;6204;5458;4176;4174;4192;6206;5990;5985;5993;5989;5991;5368;4197;5366;1928;2898;3521;967;3520;5909;6015;6201;6193;6194;6145;5912;5910;5920;5927;5926;5921;546;1051;6195;6197;6196;4159;4151;6022;6098;6019;6020;6028;6021;4785;2905;3491;2899;6099;555;6164;6166;6163;5456;6017;6018;5235;5206;5236;6016;6014;6013;6012;5237;5202;5988;5247;5457;5454;5246;5248;6150;6144;5230;5239;5306;6007;6049;6050;5294;4189;4177;5274;4155;5986;4181;4195;4187;4191;4185;4154;4156;4854;4152;4150;4149;4148;6110;6096;6105;6108;6104;6109;6107;6103;6062;3079;6102;3075;3069;6078;3482;561;6097;4932;6092;6071;3056;6079;6077;6073;6072;6070;6076;6074;6075;6052;5084;3064;3072;6063;6061;6065;6064;6060;2234;816;2294;4163;556;554;5400;5393;5928;3068;3174;6051;5229;5212;6044;5227;6047;6046;6024;6023;6025;6026;5215;4336;5210;6042;5907;5241;5243;5211;5214;6032;6031;6030;5216;6035;6034;4350;3179;5309;4745;4337;4744;4749;4748;3182;4728;3101;690;4340;824;3489;3104;3103;691;1920;4727;838;837;6008;6009;6011;4346;5203;6004;5932;5934;5933;545;5395;4160;2219;5398;2236;5906;5833;5831;4931;701;5908;5830;5878;983;5298;5291;4808;5242;5299;560;3251;5459;4809;4807;4345;5292;4344;696;695;5304;5303;5297;4746;5296;4747;5295;5082;551;1783;3493;2225;1909;4188;4178;3529;6207;6209;6210;6211;6213;6218;6219;6236;6248;6249;6250;6251;6252;6253;6257;6259;6260;6261;6262;6263;6266;6268;6271;6283;6284;6287;6299;Specular Shine;1,0.503,0.6431538,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;4428;-1411.75,1464.915;Inherit;False;298;157;instead of VFACE;2;4424;4423;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;5403;-1733.359,-3419.917;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;4430;-1590.505,1438.687;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1123;-1619.275,1577.359;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4980;-1513.153,-3327.216;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;571;2177.812,311.4184;Inherit;False;1594.473;502.6128;;19;1998;4144;1999;3353;3352;3499;3333;3506;627;351;1425;3335;3336;1424;349;5857;5859;5860;6304;VRChat Friends-Only;1,1,1,1;0;0
Node;AmplifyShaderEditor.DotProductOpNode;4424;-1402.75,1514.915;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;4423;-1243.75,1514.915;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1E-05;False;2;FLOAT;1.99999;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4934;-1554.911,-3100.47;Inherit;False;Property;_UseSubSurface;Use SubSurface/Deflected Light;101;0;Create;False;0;0;0;False;2;Space(5);Header(. SubSurface Light .);False;0;0;1;True;SUBSURFACE_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;3289;-1111.005,1642.329;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;642;-1101.673,1726.919;Float;False;Property;_SoftPower;Soft Power;99;0;Create;True;0;0;0;False;0;False;0.75;0.75;0.5;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;4422;-989.4501,1544.215;Inherit;True;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3603;-1437.238,-2967.288;Float;False;SubSurface;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;641;-1093.941,1462.783;Float;False;Property;_SoftScale;Soft Scale;100;0;Create;True;0;0;0;False;0;False;1;1;0.5;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1424;2487.822,638.8231;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3336;2583.442,625.3341;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1492;-1031.505,1384.075;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FresnelNode;662;-630.9115,1630.624;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;645;-631.8545,1454.263;Inherit;False;Standard;WorldNormal;LightDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;646;-1258.644,1242.367;Half;False;Property;_ShadeColour;Shade Colour;97;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;3282;-359.1861,1632.645;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3271;-1262.157,1058.597;Inherit;False;3270;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3335;2273.578,574.4047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;811;-1056.165,1241.783;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3291;-224.4023,1629.329;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1425;2302.188,528.9548;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3281;-352.863,1454.69;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3273;-1085.648,1058.568;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3290;-115.0057,1417.329;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1035;-410.2329,1163.722;Half;False;Property;_ShadeColorDynamic;ShadeColor Dynamic;96;1;[Enum];Create;True;0;2;FixedColour;0;LightColour;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;679;-630.6565,1251.428;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CeilOpNode;351;2438.834,530.2476;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;680;-617.7404,1037.144;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;0.5,0.5,0.5;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;684;-70.85945,1538.038;Half;False;Property;_ShadeLevel;Shade Level;98;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;627;2651.175,516.637;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3287;18.67233,1417.496;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3502;-181.6468,1165.368;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;3343;-2778.169,-1846.585;Inherit;True;Property;_MainTexFriends;FriendsOnly Texture (RGB,A);267;0;Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3283;-15.32754,1266.496;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4167;-2733.833,-1225.446;Half;False;Property;_TexSSBias;Mip Sample Bias;7;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3506;2868.115,456.9816;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1295;1235.858,-2190.196;Inherit;False;2185.261;746.0269;;54;4245;4240;4239;970;4241;1285;331;329;326;805;4259;327;4258;4256;4317;4257;450;461;4246;462;808;328;4679;4680;4815;4816;4847;4848;4849;4853;4888;4890;4891;4892;4893;4897;4898;4899;4900;5557;5554;4329;330;5955;5961;6111;6112;6132;6272;6273;6274;6275;6277;6279;Emission;0,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;669;214.2497,1453.005;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0.618;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4078;-2667.714,-1501.549;Half;False;Property;_FriendTexSSBias;Mip Sample Bias;269;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4897;1235.926,-1872.894;Half;False;Property;_ScrollX;Scroll X;61;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3333;3031.998,456.1588;Half;False;FriendsOnlyInvert;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;5554;1280.904,-2154.922;Inherit;False;Property;_EmissionUV;Emission UV;63;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;UV1;UV2;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;4898;1236.926,-1801.894;Half;False;Property;_ScrollY;Scroll Y;62;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;954;33.12944,1108.552;Half;False;Constant;_Shade_Null;Shade_Null;65;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;5199;-2378.739,-1490.204;Inherit;False;TextureSuperSample;-1;;6898;23a6a6e8fbe28134cac41513630794b1;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;48;SAMPLERSTATE;0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.SamplerNode;3345;-2406.317,-1676.435;Inherit;True;Property;_TextureSample4;Texture Sample 4;101;0;Create;True;0;0;0;False;0;False;5810;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;3285;206.6724,1268.496;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4922;-2074.485,-1506.411;Inherit;False;Property;_FriendsSuperSample;SuperSample (expensive);268;0;Create;False;0;0;0;False;0;False;0;0;0;True;FRIENDSS_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;4926;280.4877,1004.305;Inherit;False;Property;_SoftShadeEnable;SoftShade Enable;95;0;Create;True;0;0;0;False;2;Space(5);Header(.  Soft Shading  .);False;0;0;0;True;SOFTSHADE_OFF;ToggleOff;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;5557;1380.2,-1966.628;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleTimeNode;4888;1354.106,-1866.6;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;4893;1355.926,-1799.894;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4899;1556.926,-1919.894;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-8406.532,19.21212;Float;False;Property;_NormalPowerSpecular;Normal Specular;68;0;Create;False;0;0;0;False;0;False;2;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4900;1554.926,-1831.894;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;18;-2069.296,-1156.351;Half;False;Property;_Color;> Color;8;1;[HDR];Create;True;0;0;0;False;1;Space(5);False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;5183;-1818.868,-987.6223;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;5315;-1810.731,-1553.527;Inherit;False;3;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;4890;1696.926,-1917.894;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;5185;-1609.868,-915.6223;Inherit;False;Property;_VertCol;Use Vertex Colour;12;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;5187;-1607.775,-987.9092;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;813;-1824.758,-1155.797;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3451;-8006.326,28.01421;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5348;-7675.745,152.1624;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5186;-1372.606,-1039.778;Inherit;False;3;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;812;-1424.503,-1179.792;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4892;1812.926,-1946.894;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;5349;-6843.743,278.2625;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4851;-1211.442,-1050.482;Half;False;Property;_MaintexPower;Power;11;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4891;1485.926,-1963.894;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;1347;-806.6664,-394.5628;Inherit;False;1534.475;525.8724;hue & saturation;10;585;1330;581;2917;2918;325;2910;3241;3244;3249;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2910;-605.6979,-336.1084;Float;False;Property;_Hue;Hue;9;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1330;-727.834,-101.1934;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-762.3419,-14.1453;Half;False;Property;_ShadowSaturation;Shadow Saturation;46;0;Create;True;0;0;0;False;0;False;0.85;0.9;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;3055;-6177.866,515.8373;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;3799;1054.92,404.4882;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;3244;-432.9173,-97.32837;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;3249;-437.5211,-8.6247;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3607;1001.601,332.3544;Inherit;False;3603;SubSurface;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2918;-467.3714,-200.6659;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;3529;-7500.673,-4691.05;Inherit;False;199;135;blinn-phong;1;2237;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DesaturateOpNode;2917;268.0812,-162.0312;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3241;-175.9168,-47.32834;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;393;-249.2973,-1286.792;Inherit;False;1847.51;780.355;;30;1537;1284;1281;388;390;372;383;370;1291;382;384;1290;379;376;360;2299;2300;3505;368;369;1536;1533;1530;1534;3773;3940;4682;4681;4683;4743;Rim/Outline;1,0.141,0.141,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3617;1211.368,346.4321;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1530;-234.8218,-1243.55;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3643;1351.192,347.2688;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;581;551.941,16.45414;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1534;-233.7685,-1158.188;Float;False;Property;_RimNormPow;Rim Normal Power;218;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1537;-216.4528,-985.8127;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;4928;1549.428,434.9441;Half;False;Constant;_Light_Null;Light_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4927;1686.435,318.6245;Inherit;False;Property;_DisableLight;Unlit (warning - disables all light);33;0;Create;False;0;0;0;False;1;Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3074;1086.244,126.0905;Float;False;MaintexRGB;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1536;89.8206,-1219.545;Inherit;False;3;0;FLOAT3;0.5,0.5,1;False;1;FLOAT3;0,0,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3088;-6983.516,-234.9572;Float;False;Property;_NormalPowerMatCap;Normal MatCap;69;0;Create;False;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3648;-6848.766,-31.11045;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;3576;-7013.509,-162.2782;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1533;-213.9822,-1078.708;Half;False;Property;_RimNormal;Rim Normal;217;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3505;51.23543,-1073.101;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3087;-6672.956,-170.1118;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3077;1886.551,166.584;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;369;-29.45917,-912.2149;Float;False;Property;_Scale;Rim Scale;214;0;Create;False;0;0;0;False;0;False;0;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;368;-36.0433,-838.2465;Float;False;Property;_Power;Rim Power;213;0;Create;False;0;0;0;False;0;False;0;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;3647;-6576.113,-89.49232;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;376;258.5829,-1246.025;Float;False;Property;_RimOutlineColour;Rim/Outline Colour;210;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.6544117,0.356074,0.448663,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2300;291.2249,-822.2711;Float;False;Property;_Max;Rim Max;216;0;Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3796;2108.85,169.412;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.0001,0.0001,0.0001;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2299;264.225,-903.2711;Float;False;Property;_Min;Rim Min;215;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3086;-6457.389,-175.3638;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FresnelNode;360;235.6319,-1073.383;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3090;-6306.413,-174.117;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SmoothstepOpNode;379;459.2831,-1073.074;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;384;341.9415,-662.4603;Half;False;Property;_Amount;Rim Opacity;212;0;Create;False;0;0;0;False;0;False;0;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;3940;501.0678,-1246.686;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;645.6138,-664.4472;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;735.8066,-1096.133;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;3091;-6120.263,-171.6671;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3773;608.8083,-764.6856;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;370;897.4287,-818.2839;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1291;738.1032,-1226.505;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;383;737.9038,-986.7241;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3089;-5950.61,-175.7171;Float;False;NormalMatCap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;437;892.2847,1064.665;Inherit;False;2518.223;840.2;Comment;46;3264;3109;1274;405;414;807;1278;1279;406;1516;1517;407;408;2920;1518;810;2919;2175;2166;2210;2181;2207;2208;2209;963;1930;2873;3268;3528;3524;3523;5404;5405;5406;5949;5950;5951;5954;5952;5953;5998;5999;6001;6002;6003;6289;Matcap > Alpha Supported;0.8221117,0.184,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;390;1129.204,-949.8493;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4682;1045.983,-701.6169;Half;False;Property;_MaskFresnel;Emission Alpha Mask;219;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;372;1127.13,-1124.279;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4681;1066.112,-630.5405;Inherit;False;4679;EmissionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1281;1330.427,-1088.367;Half;False;Property;_RimMode;Rim Mode;211;1;[Enum];Create;True;0;3;Blend_Lerp;0;Multiply;1;AddSubtract;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;388;1131.605,-824.6456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;1284;1334.598,-1008.555;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;4683;1357.661,-701.0093;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4684;1526.918,-854.7245;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2181;952.0762,1125.57;Inherit;True;Property;_Matcap;Matcap (RGB,A);221;0;Create;False;0;0;0;False;0;False;None;f6d2c79bf96c3124f9d3206594756327;False;black;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode;2919;2144.814,1376.165;Half;False;Property;_MatCapColor;MatCap Colour;229;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3264;2667.387,1791.409;Half;False;Property;_MatcapMaskLevel;Mask Level;233;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;5406;2647.237,1671.048;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;810;2211.938,1128.838;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;870;-4001.064,-4759.558;Inherit;False;904.2734;277.1521;;4;3582;971;3943;4933;Sparkle/Shimmer Effect;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;3268;2793.792,1646.618;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;5404;2944.378,1646.215;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1279;2457.407,1118.502;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2264;1605.616,-686.7376;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;3137;2485.022,-231.2012;Inherit;False;832.0293;300.472;MirrorSystem;6;3159;3142;3140;3429;3478;3498;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DesaturateOpNode;2291;1788.852,-681.9444;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;807;3067.739,1475.301;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4207;1374.245,-476.3918;Half;False;Property;_ParallaxType;Parallax Type;249;1;[Enum];Create;True;0;2;Normal;0;Planar;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3140;2514.843,-140.3769;Half;False;Property;_IsInMirror;In Mirror;271;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2287;1967.472,-687.7989;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3352;3265.358,462.7127;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5548;2979.491,-534.9288;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3142;2512.518,-58.54065;Half;False;Property;_IsNotMirror;Not Mirror;272;1;[IntRange];Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3159;2905.996,-183.0988;Half;False;Property;_MirrorSystem;Use Mirror System;270;1;[ToggleUI];Create;False;0;0;0;False;2;Space(10);Header(Mirror);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4116;2089.564,-494.9536;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4920;1813.737,-500.5085;Inherit;False;Property;_UseParallax;Use Parallax;247;0;Create;True;0;0;0;False;2;Space(10);Header(.  Parallax  .);False;0;0;0;True;PARALLAX_ON;Toggle;2;Off;Additive;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5552;3183.288,-296.9125;Inherit;False;2;2;0;FLOAT;30;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3429;2793.888,-104.2387;Inherit;False;VRCMirrorToggle;-1;;7059;906fee1dc8310a745a0658d5f2fa3fb4;0;2;5;INT;1;False;6;INT;1;False;1;INT;7
Node;AmplifyShaderEditor.RangedFloatNode;3498;2926.394,-4.762839;Half;False;Constant;_Camera_Null;Camera_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3478;3139.753,-151.9204;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;INT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1702;2219.109,-497.3882;Inherit;False;971;SparkleOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1701;1955.717,-597.9395;Inherit;False;983;SpecularOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4117;2094.63,-468.6078;Inherit;False;2;2;0;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0.03,0.03,0.03;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3252;2194.56,-706.762;Inherit;False;2;2;0;FLOAT3;0.05,0.05,0.05;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3956;2265.263,-587.0474;Inherit;False;2;2;0;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0.1,0.1,0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5686;1984.756,-408.032;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4084;2217.935,-420.0885;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3955;2415.263,-542.0474;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2284;2333.472,-672.7989;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;470;2775.803,-584.4274;Inherit;False;4;4;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1346;3627.636,-1369.097;Inherit;False;670.9946;746.3742;custom properties;13;5829;1432;1343;1431;1340;1342;1344;1338;1337;1341;1335;1339;1345;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;5166;-1398.852,33.81676;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1856;-6360.543,427.3455;Inherit;False;NormalSpecularPrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5165;-1531.852,36.81676;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4685;-3115.844,-3328.346;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4686;-2590.503,-3140.976;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4687;-2423.371,-3166.966;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;5164;-1669.541,17.08934;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.StaticSwitch;5672;-623.9091,-705.6937;Inherit;False;Property;_UseDecal;Use Decal;235;0;Create;True;0;0;0;False;2;Space(10);Header(. Decal  .);False;0;0;0;True;Decal_ON;Toggle;2;Off;Additive;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4105;-3143.366,929.064;Float;False;Property;_ShadowSharpness;Shadow Sharpness;38;0;Create;True;0;0;0;False;0;False;20;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4361;-3230.486,941.5208;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;4134;-2831.485,943.7338;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4365;-3436.879,1651.672;Half;False;Property;_ShadowColour2;Shadow Colour 2;41;0;Create;True;0;0;0;False;0;False;0.9,0.9,0.9,1;0.9,0.9,0.9,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;4103;-2743.267,1048.664;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1008;-3099.543,1161.091;Float;False;Property;_ShadowColour;Shadow Colour;36;0;Create;True;0;0;0;False;1;Space(5);False;0.85,0.85,0.85,1;0.8196079,0.8196079,0.8196079,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;4370;-3080.986,1657.341;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;1010;-2781.651,1167.76;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4380;-2248.142,1211.723;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4805;-1977.235,1046.711;Inherit;False;2;2;0;FLOAT;1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;979;-1847.186,1042.207;Float;False;RampShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3500;-3796.292,336.2961;Half;False;Constant;_Shading_Null;Shading_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4125;-3652.322,167.1427;Float;False;FinalDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;30;-1360.031,787.2817;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.8,0.8,0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1500;339.7715,785.0989;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2289;461.6172,779.8322;Float;False;LightShaded;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1922;710.0759,762.4108;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;968;854.4756,756.279;Float;False;LightColour;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;5173;-1124.675,534.64;Inherit;False;Float3 Min;-1;;7061;61474a8b2b91ea8409c96a71133ac9bc;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;5172;-1125.824,466.0915;Inherit;False;Float3 Max;-1;;7062;004b4afc582650744b6632102dc74ec7;0;1;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3553;-807.5467,468.3534;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3558;-672.1653,467.406;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1777;-65.33663,344.062;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;5011;-2454.504,656.0451;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;344;-2266.088,627.1027;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-2064.912,597.8662;Inherit;False;2;0;FLOAT3;1,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1470;-2573.663,552.7685;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1273;-2379.306,544.475;Inherit;False;979;RampShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5012;-3115.559,574.1354;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1107;-3801.796,678.7107;Half;False;Property;_OffsetDot;Offset Dot;37;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4139;-3518.864,678.6249;Half;False;OffsetDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;5671;-3485.178,60.90797;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;5735;-1378.923,-614.7906;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;5734;-1411.923,-647.7906;Inherit;False;Property;_DecalColour;DecalColour;238;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;325;-784.0668,-251.0823;Half;False;Property;_Saturation;Saturation;10;0;Create;True;0;0;0;False;0;False;1;1;-2;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;5691;-1440.738,-721.5163;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;5709;-1722.161,-722.1882;Inherit;True;Property;_TextureSample8;Texture Sample 8;201;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;3353;3076.334,369.1404;Half;False;FriendsOnlyToggle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1999;2582.737,445.6081;Half;False;Property;_InvertFriendsOnly;Invert Friends Only;263;2;[Header];[ToggleUI];Create;True;1;enable without cam for override;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5736;-1169.923,-636.7906;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;5737;-1217.923,-729.7906;Inherit;False;Property;_DecalIntensity;Intensity;239;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5783;-1228.675,-498.6153;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;5693;-1571.157,-478.2222;Half;False;Property;_GreytoAlpha;Grey to Alpha;236;1;[ToggleUI];Create;True;0;2;Normal;0;Planar;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;5711;-1565.189,-404.009;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5739;-1624.845,-485.773;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;5692;-1366.682,-467.4211;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3338;-2044.519,-1584.979;Inherit;False;3333;FriendsOnlyInvert;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;4144;3428.671,419.9903;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5690;-1214.817,-476.4448;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5787;-1419.098,-336.0884;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5788;-1242.098,-338.0884;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5785;-1394.753,-309.5392;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5786;-1191.098,-406.0884;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5790;-1209.098,-360.0884;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5313;2715.522,-427.5344;Float;False;Property;_Opacity;Opacity;15;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1433;2917.575,-302.6735;Float;False;Property;_AlphaCutoff;Alpha Cutoff;14;0;Create;False;0;0;0;True;0;False;1;5;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4936;-1777.233,-1330.168;Inherit;False;Property;_FriendsOnlyTexture;Friends Only Texture;266;0;Create;True;0;0;0;False;1;Space(10);False;0;0;0;True;FRIENDTEX_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;2993;-1556.8,-1335.751;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;5816;-1262.406,-1695.999;Inherit;False;Property;_Vector9;Vector 9;248;0;Create;True;0;0;0;False;0;False;0,0;1,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SaturateNode;5819;-1114.169,-1490.252;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;5823;-1514.169,-1484.252;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.999;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5817;-1260.406,-1483.999;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;5811;-1399.789,-1483.347;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5814;-1305.406,-1351.999;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;5821;-1181.169,-1350.252;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5825;-1014.169,-1431.252;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5824;-1309.169,-1394.252;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5826;-1530.169,-1408.252;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;2733.321,-352.5449;Inherit;False;1262;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5314;3425.222,-511.3344;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;2991.638,-433.8068;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;5842;3232.95,-481.8069;Inherit;False;Property;_SoftMask;Soft Mask;18;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5844;3109.95,-435.8069;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1262;-1047.115,-1355.258;Float;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3430;-2759.899,-1135.564;Inherit;False;0;5810;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;3431;-2805.393,-1640.172;Inherit;False;0;349;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;349;2184.863,609.2041;Inherit;True;Property;_FriendsOnlyRT;FriendsOnly RenderTexture (clear to white);259;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1998;2830.131,367.513;Half;False;Property;_FriendsOnly;Friends Only Visibility;258;1;[ToggleUI];Create;False;0;0;0;False;2;Space(20);Header(VRC Friends Only);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3499;3452.906,613.4489;Half;False;Constant;_FriendsOnly_Null;FriendsOnly_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5860;3131.458,540.019;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5859;3106.169,698.3402;Inherit;False;Property;_MaskOffset;Mask Offset;262;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3331;-1795.837,235.9318;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;5490;-2486.084,366.3445;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.75;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode;5489;-2360.656,271.2014;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2867;-2245.667,247.1914;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4200;-2126.81,247.2507;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5863;-1921.245,236.7971;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;5864;-1945.245,145.7971;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;5669;-3581.983,-105.552;Half;False;Property;_LightColourSub;LightColour Subtract (keep black, for spotlights);32;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;5256;-8640.943,182.3057;Inherit;False;Property;_DetailNormUV;DetailNormal UV;84;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;UV1;UV2;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5867;-9188.61,-297.8871;Inherit;False;0;4302;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;5866;-8884.896,-287.5316;Inherit;False;Property;_MaskUV;Mask UV;90;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;UV1;UV2;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5868;-9184.745,-179.0952;Inherit;False;1;4302;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;1489;-2681.564,165.698;Inherit;True;3;3;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;4393;-2629.764,-5.616561;Half;False;Property;_LightColourBias;LightColour Bias (keep white);31;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;4394;-2376.764,-4.616561;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;5862;-2119.595,179.2042;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;5488;-2485.881,271.7593;Inherit;False;2;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;4795;-3246.572,329.2102;Inherit;False;GetBakedLight;-1;;7205;21172024305c3c548bab845762bbc5b2;1,4,0;1;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;7
Node;AmplifyShaderEditor.RangedFloatNode;5861;-2147.417,103.7958;Half;False;Property;_LightCurvePow;Light Curve Power;27;0;Create;False;1;;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3803;-2799.775,188.3876;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.35,0.333,0.35;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-2805.428,62.30325;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;1,0.9,0.925;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;5870;-3043.287,390.4969;Half;False;Property;_BakedMulti;Baked Multiplier;30;0;Create;False;1;;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;2081;-3247.394,-18.69247;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.OneMinusNode;2082;-3031.333,8.02974;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;1484;-3247.453,68.13483;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;1408;-3255.029,183.4622;Inherit;False;1406;VertLight;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;3314;-3105.085,184.0297;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;5670;-2929.449,188.2787;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5748;-3293.945,227.6121;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4204;-2804.811,311.8262;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;2,1.85,1.9;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5872;3165.207,-319.7537;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3610;-2184.211,-3378.583;Half;False;Property;_SSBrightness;Brightness;103;0;Create;False;0;0;0;False;0;False;10;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3684;-1988.867,-3566.237;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;5586;-1950.697,-2535.748;Inherit;False;forwardSS;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5497;-1848.536,-3424.682;Inherit;False;3;3;0;FLOAT3;1,1,1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;5496;-1478.543,-3808.653;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4130;-2494.42,-3622.67;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5543;-2948.313,-3337.858;Half;False;Property;_SSBrightness2;Layer Fade;111;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4133;-2970.08,-3658.843;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4123;-2836.314,-3628.436;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;3657;-2120.003,-3502.759;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5515;-2573.809,-3360.501;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;4688;-2468.707,-3462.201;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5873;-2306.165,-3494.983;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4126;-3172.12,-3676.471;Inherit;False;4125;FinalDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3838;-6872.679,-427.2333;Inherit;False;View Distance;-1;;7207;2a6ef75a50a2bd147a81c448d8de0d4d;2,8,0,17,0;1;9;INT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;5880;-6814.552,-356.8799;Inherit;False;viewdist;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;5882;-3909.765,-3031.244;Inherit;False;5880;viewdist;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5876;-3700.64,-2955.308;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3696;-3898.949,-2879.596;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;5885;-1710.566,-3315.791;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5010;-2624.721,640.1841;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;2,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;5015;-2820.228,660.8192;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;5014;-2947.528,660.8192;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;5009;-3114.087,655.7063;Inherit;False;3603;SubSurface;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-2929.19,731.5115;Float;False;Property;_ShadowDarkness;Shadow Darkness;45;0;Create;True;0;0;0;False;1;Space(5);False;0.15;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5007;-2737.927,794.2385;Half;False;Property;_SSDarkMask;Darkness to SS;116;0;Create;False;1;;0;0;False;1;Space(10);False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5567;-2978.984,-2446.969;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.25,0.25,0.25;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;5651;-3685.915,-2171.074;Half;False;Property;_FWDSSInvPow;Forward InvPower1;114;0;Create;False;0;0;0;False;0;False;0.8;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;5654;-3485.915,-2190.074;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5652;-3355.915,-2192.074;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.6;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5886;-3687.327,-2087.562;Half;False;Property;_FWDSSInvPow1;Forward InvPower2;115;0;Create;False;0;0;0;False;0;False;0.8;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;5887;-3486.327,-2098.562;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5888;-3356.327,-2100.562;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.6;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;5779;-1747.874,-304.4073;Inherit;False;3333;FriendsOnlyInvert;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5780;-1191.675,-272.6153;Half;False;Property;_FriendsOnlyDecal;Friends Only Decal;264;1;[ToggleUI];Create;True;1;enable without cam for override;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5784;-1023.635,-466.8852;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;5877;-7133.751,-925.5132;Inherit;False;VR_Viewdir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3511;-7384.249,-956.1778;Inherit;False;VR_Center_Eye;-1;;7209;c8866f5c3b9339443aaf9087a76ba9d4;2,13,1,14,0;1;19;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;2
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;3586;-4119.753,-3415.249;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;5879;-4118.273,-3507.075;Inherit;False;5877;VR_Viewdir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;5905;-3889.799,-3500.705;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.333,0.333,0.333;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5564;-3349.33,-2499.645;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5563;-3338.885,-2345.399;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;-1,-1,-1;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1219.475,-1175.759;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;5466;-1621.134,-1142.219;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;-1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1016;-2460.421,1178.128;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4385;-2332.436,1062;Half;False;Property;_StepTwo;Use Second Step;40;1;[ToggleUI];Create;False;1;;0;0;False;1;Space(5);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;4379;-2118.142,1063.723;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4170;-2332.455,944.7266;Inherit;False;4804;LightMaskValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1118;-2949.917,943.499;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1106;-3285.127,670.304;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4377;-3600,1456;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4392;-2599.77,1411.009;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1254;-2599.645,1052.494;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4384;-3864.143,1474.724;Half;False;Property;_OffsetDot2;Offset Dot 2;42;0;Create;True;1;;0;0;False;0;False;0.1;0.1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4383;-2379.143,1357.724;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4371;-2647.756,1564.708;Inherit;False;3;0;FLOAT3;1,1,1;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4104;-3147.366,1073.764;Float;False;Property;_ShadowPower;Shadow Power;39;0;Create;True;0;0;0;False;0;False;1;1;0.0001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4373;-3442.702,1418.646;Float;False;Property;_ShadowSharpness2;Shadow Sharpness 2;43;0;Create;True;0;0;0;False;0;False;20;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4363;-3447.722,1569.468;Float;False;Property;_ShadowPower2;Shadow Power 2;44;0;Create;True;0;0;0;False;0;False;1;0.1;0.0001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4364;-3208.74,1436.999;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;4369;-3071.947,1436.226;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4366;-2903.595,1532.305;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5374;-8412.683,-612.7307;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1518;2193.495,1296.255;Half;False;Property;_MatcapSaturation;Matcap Saturation;227;0;Create;True;0;0;0;False;0;False;1;0.25;-1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1517;2279.899,1221.693;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1274;3211.849,1145.099;Float;False;PostMatcap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;405;3061.8,1148.914;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1278;2875.659,1104.732;Inherit;False;1292;PostRimLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2873;926.6436,1563.75;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;2210;1422.992,1569.542;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;3528;1645.482,1531.244;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;2207;1454.244,1712.086;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1930;902.7886,1643.51;Half;False;Property;_StereoFix;Stereo Converge (flatten);223;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;963;937.0739,1713.267;Inherit;False;3089;NormalMatCap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;2208;1260.732,1819.777;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2209;1086.506,1811.61;Float;False;Property;_MatcapSpin;MatcapSpin;228;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2175;1835.501,1240.226;Inherit;True;Property;_TextureSample0;Texture Sample 0;90;0;Create;True;0;0;0;False;0;False;695;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;5952;1456.013,1355.349;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-0.5,-0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5954;1571.513,1356.104;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5953;1704.513,1353.104;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2166;1478.186,1488.637;Half;False;Property;_Legacy;Legacy;230;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3523;1175.654,1711.006;Inherit;False;VR MatCap;-1;;7210;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;3524;1169.739,1567.441;Inherit;False;Matcap (legacy);-1;;7212;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;5951;1234.665,1375.057;Half;False;Property;_MatcapScale;Matcap Scale;222;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4259;2676.906,-1813.108;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4329;2626.615,-1531.021;Inherit;False;Property;_EmissionHue;Hue;54;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5710;-811.2621,-597.3736;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;5960;-258.9307,-348.532;Inherit;True;Hue;-1;;7215;f67b9beab09edcf45b951dcecf2a24fd;0;2;3;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;5961;2850.88,-1770.079;Inherit;False;Hue;-1;;7216;f67b9beab09edcf45b951dcecf2a24fd;0;2;3;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;2684.119,-1781.991;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;3225.666,-1764.119;Float;False;Emission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;330;2888.758,-1644.54;Half;False;Constant;_MaxHDRValue;Max HDR Value;18;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4850;-1051.442,-1173.482;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1345;3650.611,-1028.556;Half;False;Property;_ZWriteMode;ZWrite (write to depth buffer);273;1;[ToggleUI];Create;False;0;0;0;True;2;Space(10);Header(.  Advanced  .);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1339;3643.602,-1138.431;Half;False;Property;_WriteMask;WriteMask (non-zero);276;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4121;4390.132,-1076.565;Half;False;Property;_VRCFallbackCutout;VRC Fallback Cutout;3;0;Create;True;0;0;0;True;1;Toggle(_ALPHATEST_ON);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1335;3984.178,-945.1693;Inherit;False;Property;_Culling;Culling (off is doublesided);0;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;2;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1341;3974.641,-1234.531;Inherit;False;Property;_StencilOp;StencilOp;279;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1337;3650.782,-1306.997;Half;False;Property;_StencilRef;Stencil ID;275;0;Create;False;0;0;0;True;1;Space(5);False;0;162;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1338;3644.602,-1221.008;Half;False;Property;_ReadMask;ReadMask (non-zero);277;0;Create;False;0;0;0;True;0;False;255;255;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1344;3650.54,-940.4924;Half;False;Property;_ZTestMode;ZTestMode (LEqual);274;1;[Enum];Create;False;0;7;Less;0;Greater;1;LEqual;2;GEqual;3;Equal;4;NotEqual;5;Always;6;1;UnityEngine.Rendering.CompareFunction;True;1;Space(5);False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1342;3970.928,-1162.189;Inherit;False;Property;_StencilFail;StencilFail;280;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;3099;4390.132,-996.5652;Half;False;Property;_outline_width;_outline_width;1;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1340;3949.928,-1307.189;Inherit;False;Property;_StencilComp;Stencil Comp;278;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;3269;4390.132,-916.5652;Half;False;Property;_Cutoff;Fallback Cutoff;4;0;Create;False;0;0;0;True;2;Enum(LessVisible,0.25,Visible,0.5,MoreVisible,0.75,Invisible,2);Space(5);False;0.75;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1343;3969.928,-1087.189;Inherit;False;Property;_StencilZFail;StencilZFail;281;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;3098;4390.132,-1156.565;Half;False;Property;_VRCFallbackDoublesided;VRC Fallback Doublesided;2;0;Create;True;0;0;0;True;2;Header(Dont clean keywords after selecting);Toggle(TINTED_OUTLINE);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1432;3920.068,-851.6152;Half;False;Property;_DstBlend;Destination Blend (Zero);283;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1431;3654.883,-846.5939;Half;False;Property;_SrcBlend;Source Blend (One);282;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;2;Space(10);Header(Debug);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5829;3759.478,-744.5789;Half;False;Property;_ColorMask;Alpha Render (Colour Mask);22;2;[Header];[Enum];Create;False;1;default required for transparent camera;2;Mirror Fixed;14;Default;15;0;True;0;False;15;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5550;3490.114,-619.6182;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5892;3180.484,-1173.704;Half;False;Property;_FriendsOnlyAlphaMask;Friends Only Alpha Mask;265;1;[ToggleUI];Create;True;1;enable without cam for override;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5893;3459.936,-1150.523;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;5889;3175.623,-1091.186;Inherit;False;3333;FriendsOnlyInvert;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5902;3426.398,-1002.949;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5195;3007.729,-859.4658;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5196;2826.729,-831.4658;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1292;2883.049,-927.1724;Float;False;PostRimLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;5193;2650.991,-926.6043;Inherit;False;Property;_EmissionAsMask;Use as Mask;51;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4234;2494.483,-986.1649;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2163;2667.104,-788.3023;Inherit;False;1274;PostMatcap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1515;1645.733,-914.7559;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4387;1616.235,-1025.796;Half;False;Property;_FullBright;FullBright;53;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4852;1800.908,-1047.252;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LuminanceNode;4320;1797.095,-1128.431;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4919;1843.394,-913.9363;Inherit;False;Property;_UseRim;Use Rim;209;0;Create;False;0;0;0;False;2;Space(5);Header(.  Rim Fresnel  .);False;0;0;0;True;RIMLIGHT_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4233;1786.774,-1206.336;Inherit;False;1285;Emission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5975;2220.893,-954.5231;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5977;2228.137,-948.4871;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5978;2281.253,-1163.365;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;5971;1845.82,-770.986;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5981;2406.898,-866.2405;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5980;2403.898,-897.2405;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;5950;2779.73,1217.151;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;5949;2615.73,1293.151;Float;False;Property;_MatcapPower;Matcap Power;225;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;408;2840.803,1358.997;Float;False;Property;_MatcapIntensity;Matcap Intensity;226;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1516;2441.149,1195.198;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;2621.767,1195.171;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;2926.342,1189.257;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6003;2135.427,1550.658;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6002;2094.427,1495.658;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;406;2732.131,1572.698;Half;False;Property;_MatcapOpacity;Matcap Opacity;224;0;Create;True;0;0;0;False;0;False;5;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2920;2340.102,1376.667;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5999;2711.427,1539.658;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;5998;2547.427,1540.658;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6001;2501.427,1534.658;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3253;-1071.657,712.4147;Half;False;Property;_LightSatFinal;Light Saturation Max;29;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3120;-1127.049,629.1291;Float;False;Property;_LightSaturationLimiter;Light Saturation Limiter;28;0;Create;True;0;0;0;False;0;False;0.75;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;6058;-907.4878,628.2766;Inherit;False;LSat_Limit;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;6059;-871.4878,711.2766;Inherit;False;LSat_Max;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;3551;-440.7879,464.7922;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5182;-647.1523,705.6088;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5160;-810.6367,557.4409;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4258;3341.071,-1972.35;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;4239;1247.64,-1636.388;Half;False;Property;_ShadedColour;Shaded Colour;59;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;4240;1452.64,-1637.388;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4815;1458.891,-1555.334;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;4848;1626.716,-1551.109;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;4257;3082.866,-2154.193;Half;False;Property;_ShadedOnly;Shaded Only;60;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;4847;1615.387,-1725.967;Inherit;False;1;0;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;970;1429.871,-1729.281;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;4241;1803.641,-1552.499;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5955;1853.576,-1652.791;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;5973;2254.614,-834.22;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;331;3089.456,-1759.592;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;5967;1969.951,-984.7068;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5194;2511.565,-861.1148;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;6126;2028.717,-1514.405;Inherit;False;Property;_Vector1;Vector 1;246;0;Create;True;0;0;0;False;0;False;0,0,0;0.001,100,100;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;5979;2274.845,-1253.715;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6134;2186.894,-1248.545;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6135;2874.595,-1295.346;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;5962;2207.891,-1334.357;Inherit;False;Hue;-1;;7235;f67b9beab09edcf45b951dcecf2a24fd;0;2;3;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;5192;1671.446,-804.5114;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;4256;3230.996,-2136.205;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5972;2084.591,-848.4257;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6133;2213.294,-1426.245;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1165;-6733.274,-1207.774;Inherit;False;962;NormalShade;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-6003.448,656.5467;Float;False;NormalShade;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1861;-6372.291,822.2673;Float;False;NormalShadePrecalc;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;6138;-6032.738,898.7186;Inherit;False;PerturbNormal;-1;;7236;c8b64dd82fb09f542943a895dffb6c06;1,26,0;1;6;FLOAT3;0,0,0;False;4;FLOAT3;9;FLOAT;28;FLOAT;29;FLOAT;30
Node;AmplifyShaderEditor.FunctionNode;5197;-8266.065,133.8129;Inherit;False;NormalTextureSuperSample;-1;;7238;c5e7d95f0a9b898419b29857c25ecde5;0;5;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;50;SAMPLERSTATE;0;False;28;FLOAT;0;False;49;FLOAT;1;False;4;FLOAT3;0;FLOAT;39;FLOAT;40;FLOAT;41
Node;AmplifyShaderEditor.RegisterLocalVarNode;965;-6028.105,513.2174;Float;False;NormalSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;6200;-8565.023,-2633.038;Inherit;False;RoughnesslGSAA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1909;-7919.344,-4597.219;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;2225;-7926.344,-4677.218;Half;False;Property;_StereoFixSpec;Stereo Converge (flatten);130;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;5878;-7928.528,-4445.183;Inherit;False;5877;VR_Viewdir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2219;-7932.344,-4358.22;Inherit;False;2218;FinalLightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;3068;-5296.062,-4278.575;Inherit;False;True;True;True;False;1;0;COLOR;1,1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;554;-6261.544,-4300.961;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.3333;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;556;-6440.157,-4266.539;Inherit;False;False;2;0;FLOAT;10;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4163;-6622.892,-4216.363;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.3333;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;816;-5891.947,-4315.993;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2234;-5746.201,-4312.314;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;6060;-5743.878,-4064.896;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;6064;-6085.06,-4084.489;Inherit;False;6058;LSat_Limit;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;6065;-5915.06,-4079.489;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;6061;-5919.243,-4015.079;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;6063;-6082.06,-4015.489;Inherit;False;6059;LSat_Max;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3072;-5097.375,-4221.876;Half;False;Property;_SpecMode;Specular Mode;128;1;[Enum];Create;False;0;3;Additive;0;Multiplied;1;Off;2;0;False;0;False;2;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3064;-5270.301,-4196.703;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;5084;-5512.477,-4279.359;Float;False;Property;_SColor;Specular Colour Bias;127;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6052;-5037.537,-4132.083;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;20,20,20;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6075;-5209.404,-4207.85;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6074;-5302.404,-4197.85;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6076;-5306.404,-4081.85;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6070;-5165.404,-4090.85;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6072;-5278.404,-4089.85;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6073;-5074.404,-4114.851;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6077;-5322.404,-4125.851;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;6079;-6067.678,-4169.215;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3056;-6226.159,-4171.154;Inherit;False;True;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;6071;-5553.404,-4142.851;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6092;-5141.678,-4013.215;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3482;-4826.124,-4171.781;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6078;-5068.678,-3999.215;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3069;-5204.809,-4000.68;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;3,3,3;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3075;-5510.635,-3949.625;Inherit;False;1276;PostDesaturation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;6102;-5743.871,-4173.521;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;-1,-1,-1;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3079;-5909.884,-4179.81;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;6062;-5562.06,-4066.489;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;6103;-4643.363,-4027.646;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6107;-4756.004,-3997.188;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;6109;-4762.004,-3908.188;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;6104;-4948.168,-3910.646;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6108;-4973.004,-3929.188;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;6105;-4760.349,-3842.489;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.85;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6096;-5200.678,-3892.215;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;3,3,3;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;6110;-4913.769,-3840.207;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5926;-7434.818,-4405.837;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;5927;-7297.818,-4408.837;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5909;-7989.167,-4210.105;Half;False;Property;_SpecRough;Roughness Power (0 off);129;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6206;-7738.208,-2768.105;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;3582;-3983.076,-4645.081;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3943;-3982.218,-4573.54;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4933;-3524.472,-4652.835;Inherit;False;Property;UseSparkleShimmer;Use Sparkle/Shimmer;178;0;Create;False;0;0;0;False;2;Space(5);Header(.  Sparkles  .);False;0;0;0;True;SPARKLE_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;971;-3303.849,-4649.823;Float;False;SparkleOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5295;-6204.524,-2308.773;Inherit;False;0;5296;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;6004;-6653.72,-2269.832;Inherit;True;Property;_TextureSample9;Texture Sample 2;167;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;MipLevel;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5203;-6648.58,-2477.86;Inherit;True;Property;_TextureSample2;Texture Sample 2;167;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;MipLevel;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4346;-5952.445,-2613.306;Half;False;Property;_SpecularLevel;Specular Level;146;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6011;-6346.979,-2217.17;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6009;-6351.979,-2423.171;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6008;-6561.979,-2587.171;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5294;-6198.801,-2437.477;Inherit;False;0;695;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;6050;-6267.143,-2550.511;Inherit;False;True;True;True;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;6049;-6093.367,-2685.884;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;6007;-6414.231,-2597.116;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;5306;-6266.004,-2699.535;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5239;-6408.273,-2693.277;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;5230;-6578.62,-2677.084;Inherit;False;3270;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;5248;-7324.067,-2638.068;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5246;-7314.067,-2619.068;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;-0.25;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5454;-7057.159,-2651.841;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5457;-7205.196,-2629.917;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;5202;-7063.596,-2456.747;Inherit;True;Property;_Cubemap;Cubemap;164;2;[HDR];[SingleLineTexture];Create;True;0;0;0;False;0;False;None;None;False;black;LockedToCube;Cube;-1;0;2;SAMPLERCUBE;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.NegateNode;5237;-7208.173,-2328.42;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6012;-6873.979,-2267.271;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0.01,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6013;-6865.979,-2161.27;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,-0.01,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;6014;-7271.374,-2167.381;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6016;-7041.374,-2165.381;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.025,0.025,0.025;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;5236;-7438.56,-2265.343;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;5206;-7261.709,-2240.77;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ReflectOpNode;5235;-7055.086,-2260.345;Inherit;False;2;0;FLOAT3;0.1,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;6018;-7321.49,-2049.758;Inherit;False;Refl_Aberrate;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;5456;-6936.844,-2653.121;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6163;-7212.462,-2408.767;Inherit;False;Property;_Float2;Float 2;245;0;Create;True;0;0;0;False;0;False;0;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6166;-7125.37,-2551.725;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6015;-7035.82,-2029.012;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;-0.025,-0.025,-0.025;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;5247;-7584.72,-2621.292;Half;False;Property;_CubeSmoothnessOffset;Cube Smoothness Offset;165;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6017;-7483.656,-2063.691;Float;False;Property;_Aberration;Aberration;171;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4808;-4398.101,-3176.468;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;-4527.675,-3303.607;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4931;-4875.791,-3291.144;Inherit;False;Property;_UseReflection;Use Reflection;160;0;Create;True;0;0;0;False;2;Space(5);Header(. Reflection Probe);False;0;0;0;True;SPECULARHIGHLIGHTS_ON;Toggle;2;Off;Additive;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;4747;-5387.617,-3161.285;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;4746;-5364.938,-3249.81;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.0001,0.0001,0.0001;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5242;-5244.305,-3256.47;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;5830;-5362.681,-2969.804;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5908;-5102.259,-3031.69;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5831;-5186.979,-3166.804;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;5833;-5287.38,-3337.504;Half;False;Property;_ReflectionBlend;Reflection Blend;162;1;[Enum];Create;True;0;3;Additive;0;Multiplied;1;Half;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;5906;-5059.259,-3259.69;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;5243;-5484.124,-3053.115;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;5907;-5190.771,-2905.579;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;5241;-5694.889,-3038.033;Inherit;False;Property;_ReflectionColor;Reflection Colour;161;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;5309;-6027.483,-3086.357;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;5214;-5957.39,-3074.865;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomExpressionNode;5211;-6164.036,-3065.806;Half;False;return (abs(unity_SpecCube0_ProbePosition))@;1;Create;0;Cube Pos;True;False;0;;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5227;-6058.504,-3083.46;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;5212;-6136.315,-2982.539;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5229;-5939.465,-2877.852;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;6051;-6313.711,-2896.518;Inherit;False;6018;Refl_Aberrate;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4178;-7162.874,-3149.781;Half;False;Property;_Roughness;Use Roughness;151;1;[ToggleUI];Create;False;1;. Roughness . Glossiness;0;0;False;2;Space(5);Header(. Roughness . Glossiness);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4188;-6970.36,-3146.448;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3182;-6844.051,-3201.902;Half;False;Property;_ReflectionOpacity;Reflection Opacity;167;0;Create;True;0;0;0;False;0;False;0.5;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3179;-6750.484,-3124.901;Half;False;Property;_ProbeSmoothness;Probe Smoothness;166;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4191;-6686.258,-3066.923;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5274;-6901.131,-3079.509;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4159;-6531.08,-3111.345;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6197;-6947.624,-3234.427;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4748;-5730.472,-3561.038;Float;False;Property;_ReflectionSaturation;Reflection Saturation;170;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4749;-5517.154,-3562.161;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4744;-5585.766,-3479.749;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4337;-5712.429,-3487.892;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4350;-6594.053,-3223.839;Inherit;False;2;2;0;FLOAT;0.5;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5216;-6287.916,-3164.117;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IndirectSpecularLight;6030;-6587.549,-3351.135;Inherit;False;World;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;6031;-6379.12,-3463.662;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;6032;-6371.818,-3350.986;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ConditionalIfNode;5210;-5859.022,-3462.243;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;4336;-5933.804,-3548.889;Float;False;Property;_ReflectionIntensity;Reflection Intensity;168;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5215;-6102.2,-3558.524;Half;False;Property;_ReflectionType;Reflection Type;163;1;[Enum];Create;True;0;3;Reflection Probe;0;Fallback Cubemap;1;Cubemap Only;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;6026;-6016.222,-3323.579;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6025;-6124.531,-3305.625;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6023;-6251.222,-3306.579;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6024;-6245.222,-3402.579;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6046;-5919.157,-3185.215;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6047;-5898.355,-3417.915;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;6044;-6050.793,-3485.75;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IndirectSpecularLight;3174;-6593.317,-3462.368;Inherit;False;World;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6196;-6417.528,-3222.499;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4745;-5738.489,-3389.662;Float;False;Property;_ReflectionPower;Reflection Power;169;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;4181;-7137.676,-3059.912;Inherit;True;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4177;-6876.927,-3060.583;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4189;-6877.136,-2972.735;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4785;-6659.068,-2968.277;Inherit;False;RoughnessSpec;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6042;-6403.931,-2895.17;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4195;-7167.335,-2870.77;Half;False;Constant;_Rough_Null;Rough_Null;128;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5986;-7299.574,-2937.486;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;4155;-7459.534,-2898.535;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4154;-7612.212,-2903.21;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4854;-7801.99,-2969.34;Half;False;Property;_RoughnessLevel;Roughness Level;154;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4156;-7823.459,-2884.957;Half;False;Property;_RoughnessPower;Roughness Power;155;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5991;-7990.973,-2907.945;Inherit;False;Constant;_Float1;Float 1;228;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;5988;-7855.595,-2806.785;Inherit;False;Property;_RoughnessFresnel;Roughness Fresnel;158;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5990;-8013.51,-2781.778;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;5989;-8150.914,-2699.137;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector4Node;5993;-8183.227,-2620.573;Inherit;False;Property;_GlossFresnel;Fresnel Bias, Scale, Power;159;0;Create;False;0;0;0;False;0;False;0,1,1,1;0,1,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;5985;-7941.727,-2637.452;Inherit;False;Standard;WorldNormal;ViewDir;False;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4150;-7431.872,-2972.486;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4149;-7477.779,-3123.272;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;4152;-7329.084,-3149.625;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6150;-7481.189,-2997.549;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4185;-7633.633,-2917.204;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4187;-7202.48,-3083.994;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6144;-7214.293,-3020.564;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;837;-6762.816,-4001.763;Half;False;Property;_SpecMatCapColor;SpecMatCap Colour;137;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;838;-6532.202,-3997.089;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2899;-7342.968,-4051.312;Inherit;True;Property;_SpecularMatcap;Specular Matcap (RGB);132;0;Create;False;0;0;0;False;0;False;None;2fd71d1172fbfbd4a8351aec0cc94921;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ConditionalIfNode;3491;-7234.786,-3859.415;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2905;-7483.617,-3953.696;Half;False;Property;_Legacy2;Legacy;142;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3520;-7814.214,-3835.446;Inherit;False;VR MatCap;-1;;7249;70ea9bc890dab6b42ba77ce7cb65ac19;0;2;21;FLOAT3;0,0,0;False;27;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;967;-8028.678,-3793.048;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2898;-8069.478,-3951.846;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1928;-8097.93,-3877.229;Half;False;Property;_StereoFixSpecCap;Stereo Converge (flatten);133;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4192;-8190.783,-3708.41;Inherit;False;4785;RoughnessSpec;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4174;-7867.283,-3700.774;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4176;-8007.32,-3702.624;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5458;-7664.45,-3678.327;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;-0.25;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6204;-7524.739,-3568.15;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5865;-7875.997,-3601.227;Half;False;Property;_SpecMatcapMipBias;MipBias;141;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4196;-8026.937,-3632.052;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2900;-7039.027,-3827.567;Inherit;True;Property;_TextureSample3;Texture Sample 3;90;0;Create;True;0;0;0;False;0;False;3109;None;None;True;0;False;white;Auto;False;Instance;-1;MipLevel;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;817;-6741.496,-3828.18;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;4728;-6373.138,-3807.617;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-6205.135,-3857.164;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;4932;-5442.574,-3742.407;Inherit;False;Property;_UseSpecularMatCap;Use Specular MatCap;131;0;Create;True;0;0;0;False;2;Space(5);Header(. Specular Overlay);False;0;0;0;True;SPECMATCAP_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4340;-5641.004,-3742.838;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;824;-5679.931,-3836.328;Half;False;Property;_SpecMatcapOpacity;SpecMatcap Opacity;140;0;Create;False;0;0;0;False;0;False;1;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6207;-5666.071,-3760.986;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1921;-6692.238,-3753.162;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-6888.486,-3629.302;Half;False;Property;_SpecMatcapSaturation;SpecMatcap Saturation;136;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6021;-7066.462,-3517.955;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0.01,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;6028;-7492.598,-3433.661;Inherit;False;1491;Vert_LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6020;-7238.528,-3457.696;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.025,0.025,0.025;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6019;-7233.208,-3373.355;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;-0.025,-0.025,-0.025;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;6098;-7492.951,-3358.493;Inherit;False;6018;Refl_Aberrate;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6022;-7061.304,-3418.82;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,-0.01,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3177;-7282.593,-3531.512;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;6201;-7298.413,-3242.289;Inherit;False;6200;RoughnesslGSAA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;6194;-6949.972,-3329.061;Inherit;False;Property;_EnableGSAA2;Enable GSAA;173;0;Create;True;0;0;0;True;1;Header(Geometric Specular Antialiasing);False;1;0;0;True;_ENABLEGEOMETRICSPECULARAA;Toggle;2;Key0;Key1;Reference;6164;False;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6209;-6633.159,-3342.644;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6035;-6624.45,-3213.456;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6034;-6621.65,-3217.457;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6210;-6719.243,-3246.678;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6195;-6416.398,-3224.369;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6211;-6718.243,-3244.678;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;6213;-7401.617,-3671.478;Inherit;False;Property;_Keyword0;Keyword 0;173;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;6164;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;5810;-2768.818,-1412.392;Inherit;True;Property;_MainTex;Texture (RGB,A);5;0;Create;False;0;0;0;False;1;Header(.  MAIN  .);False;None;8cd76956e413ee547b103b18dc5bf64b;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.StaticSwitch;4929;-3651.113,243.5188;Inherit;False;Property;_UseShading;Use Shading;34;0;Create;True;0;0;0;False;2;Space(5);Header(.  SHADOW  .);False;0;0;1;True;SHADING_OFF;ToggleOff;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2870;-2306.683,408.3681;Half;False;Property;_LightMulti;Light Multiplier;24;0;Create;False;1;;0;0;False;1;Header(. LIGHTING .);False;0.75;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;4916;2846.801,-811.9987;Inherit;False;Property;_UseMatcap;Use MatCap;220;0;Create;False;0;0;0;False;2;Space(10);Header(.  MATCAP  .);False;0;0;0;True;MATCAP_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;6164;-7012.383,-2554.133;Inherit;False;Property;_EnableGSAA;Enable GSAA (expensive);173;0;Create;False;0;0;0;True;1;Header(Geometric Specular Antialiasing);False;1;0;0;True;_ENABLEGEOMETRICSPECULARAA;Toggle;2;Key0;Key1;Create;False;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;6214;-8743.928,-2629.558;Inherit;False;SimpleGSAA;174;;7274;8d31c1ee5c5156643adf8e699ab0ec7f;1,34,1;1;2;FLOAT3;0,0,0;False;1;FLOAT;63
Node;AmplifyShaderEditor.GetLocalVarNode;6205;-7983.415,-3529.762;Inherit;False;6200;RoughnesslGSAA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;5252;-8775.915,-190.4813;Inherit;True;Property;_DetailNormalN;Detail Normal (N);76;0;Create;True;0;0;0;False;0;False;None;f6248c7fe241407459bb517153287d93;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TextureCoordinatesNode;5255;-8857.557,171.9502;Inherit;False;0;5252;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;5254;-8855.789,299.8421;Inherit;False;1;5252;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;6145;-7337.37,-2507.725;Inherit;False;6200;RoughnesslGSAA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;6218;-7072.331,-3253.61;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6193;-7073.088,-3324.311;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;4743;275.8679,-738.7574;Inherit;False;Fresnel Edge Pixel Fix;-1;;7275;e37ec5be3c94a1b4e99e2c04f776c418;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4856;-3200,-2880;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4979;-3072,-2880;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5883;-3088,-2800;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3705;-2928,-2880;Inherit;False;2;2;0;FLOAT;1;False;1;FLOAT;0.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3694;-2800,-2880;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3724;-2352,-2880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;4982;-2208,-2880;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;4983;-2064,-2880;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;3721;-2608,-2880;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.075;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;3702;-3568,-2880;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5884;-2816,-2784;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;4855;-3360,-2768;Inherit;False;Property;_SSEdgeAA;SS Edge Alias Fix (dist pow limit);121;0;Create;False;0;0;0;False;0;False;-2.75,20,0.05;-2.75,20,0.05;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;4858;-3904,-2768;Inherit;False;3596;NormalSubSurface;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;6232;-6266.316,-2108.843;Inherit;False;2066.094;298.8688;Edge Correction;14;6220;6231;6230;6229;6228;6227;6226;6225;6224;6223;6222;6221;6234;6235;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;6221;-5395.327,-2060.927;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6222;-5411.327,-1980.927;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6223;-5251.327,-2060.927;Inherit;False;2;2;0;FLOAT;1;False;1;FLOAT;0.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;6224;-5123.327,-2060.927;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6225;-4675.327,-2060.927;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;6228;-4931.327,-2060.927;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.075;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;6229;-5891.327,-2060.927;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6230;-5139.327,-1964.927;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;6220;-5523.327,-2060.927;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5298;-6166.076,-2175.948;Half;False;Property;_SpecularLevel2;Specular2 Level;150;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;6234;-6087.517,-1964.887;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;6235;-6237.813,-2059.863;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;6226;-4531.327,-2060.927;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;6227;-4387.327,-2060.927;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;6231;-5690.327,-1965.927;Inherit;False;Property;_SpecEdgeAA;Spec Edge Alias Fix (dist pow limit);172;0;Create;False;0;0;0;False;1;Space(10);False;-2.75,20,0.05;-2.75,20,0.05;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1276;2484.325,165.691;Float;False;PostDesaturation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;1920;-6548.244,-3807.229;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3270;163.43,346.5349;Float;False;AllLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;6097;-6239.549,-3494.704;Inherit;False;6018;Refl_Aberrate;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4727;-6542.954,-3714.415;Half;False;Property;_SpecMatcapPower;SpecMatcap Power;135;0;Create;True;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6250;-6481.957,-3575.614;Half;False;Property;_SpecMatcapLightPower;SpecMatcap Light Power;139;0;Create;True;0;0;0;False;0;False;0.333;0.333;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;6249;-6318.678,-3711.469;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.25;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;6248;-6497.678,-3645.469;Inherit;False;3270;AllLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3103;-6151.587,-3641.881;Inherit;False;3074;MaintexRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3104;-6065.111,-3740.935;Inherit;False;2;2;0;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;5,5,5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;3489;-5852.043,-3811.646;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;3101;-6069.542,-3885.725;Half;False;Property;_SpecMatCapMode;SpecMatCap Mode;138;1;[Enum];Create;True;0;2;Additive;0;Multiplied;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-6529.201,-3896.413;Half;False;Property;_SpecMatcapMultiply;SpecMatcap Multiply;134;0;Create;True;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-6857.235,-4223.278;Half;False;Property;_SpecularStrength;Specular Intensity;125;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-6493.284,-4176.489;Half;False;Property;_SpecularOpacity;Specular Opacity;122;0;Create;True;0;0;0;False;2;Space(5);Header(.  SPECULAR  .);False;0.5;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;2294;-6118.222,-4286.547;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.0001;False;2;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;3493;-7677.622,-4650;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2237;-7467.543,-4649.417;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6252;-7014.05,-4664.135;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4160;-7962.993,-4282.534;Inherit;False;4785;RoughnessSpec;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5912;-7452.027,-4276.548;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;6253;-7587.05,-4275.135;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;5920;-7628.225,-4374.871;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6251;-7275.686,-4725.26;Half;False;Property;_SpecScale;Specular Scale;123;0;Create;False;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3521;-7817.677,-3931.046;Inherit;False;Matcap (legacy);-1;;7328;0c9402088b71ec54f9209482380424ee;1,37,1;2;9;FLOAT3;0,0,0;False;45;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DotProductOpNode;551;-7123.482,-4645.805;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6259;-6286.616,-4319.714;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5932;-6230.731,-4698.617;Half;False;Property;_SpecPower;Specular Power;126;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;0.99;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;5933;-6096.731,-4610.617;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5393;-5928.817,-4615.005;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5934;-6252.731,-4582.617;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6257;-5995.747,-4498.956;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5928;-5896.53,-4511.958;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6260;-5770.747,-4406.956;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6261;-5921.747,-4525.956;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6262;-5827.747,-4539.956;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ExpOpNode;6271;-6803.634,-4394.832;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;327;2026.391,-1702.643;Half;False;Property;_EmissionColor;> Colour;52;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;805;2230.555,-1615.904;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;4816;2160.21,-1787.155;Inherit;False;968;LightColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;4853;2158.467,-1855.16;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;4680;2491.45,-1758.8;Inherit;False;4679;EmissionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;6112;2643.414,-1905.249;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6132;2483.499,-1881.672;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;4849;2338.802,-1859.94;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;2017.427,-1960.398;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4245;2016.585,-1868.439;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4246;2164.985,-1959.439;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;6111;2262.281,-1711.277;Inherit;False;Property;_ShadedPower;Shaded Power;58;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;326;2435.302,-1560.689;Float;False;Property;_EmissionIntensity;Emission Intensity;55;0;Create;True;0;0;0;False;0;False;1;8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6274;1993.432,-1983.489;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6275;2020.432,-1998.489;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;808;1749.846,-2142.406;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4679;1766.507,-2047.954;Inherit;False;EmissionMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;450;2758.205,-2068.126;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;4317;2944.199,-2007.448;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;461;2479.435,-2150.063;Inherit;False;Property;_ShadedEmission;Shaded Emission;57;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6279;2439.432,-2007.489;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6277;2442.432,-2007.489;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;328;1476.872,-2143.573;Inherit;True;Property;_Emission;Emission Map (RGB,A);50;0;Create;False;0;0;0;False;2;Space(5);Header(.  Emission  .);False;328;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;3433;1005.484,-2163.45;Inherit;False;0;328;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;5556;1008.2,-2042.628;Inherit;False;1;328;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;6273;2066.432,-2151.489;Float;False;Property;_EmissionPower;Emission Power;56;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;6272;2272.4,-2082.578;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;2957;-8565.2,720.9944;Inherit;True;Property;_Normal;Normal (N);64;1;[Normal];Create;False;0;0;0;False;2;Space(5);Header(.  NORMAL  .);False;None;f6248c7fe241407459bb517153287d93;True;bump;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;5253;-8213.669,720.323;Inherit;True;Property;_TextureSample5;Texture Sample 5;172;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;5696;-2894.276,-728.3723;Inherit;False;Property;_DecalUV;Decal UV;240;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;UV1;UV2;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;5198;-2412.242,-1121.077;Inherit;False;TextureSuperSample;-1;;7340;23a6a6e8fbe28134cac41513630794b1;0;4;4;FLOAT2;0,0;False;1;SAMPLER2D;0,0,0,0;False;48;SAMPLERSTATE;0;False;28;FLOAT;0;False;5;FLOAT4;0;FLOAT;39;FLOAT;40;FLOAT;41;FLOAT;42
Node;AmplifyShaderEditor.RangedFloatNode;5777;-1993.911,-389.5173;Float;False;Property;_DecalRotate;Rotate;244;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5712;-3114.444,-723.4211;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;5713;-3113.444,-606.4211;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;5770;-2483.939,-287.0149;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5769;-2170.539,-332.5148;Inherit;False;3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5728;-2450.441,-716.402;Inherit;False;Property;_DecalMirrorX;Decal Reflect (X axis);241;1;[ToggleUI];Create;False;0;3;None;0;X negative;1;X positive;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;5724;-2004.779,-525.5432;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;5776;-1852.511,-524.5173;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;5722;-2622.097,-581.3552;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.AbsOpNode;5773;-2445.239,-619.4149;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;5774;-2317.638,-615.215;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5726;-2466.327,-482.3917;Float;False;Property;_DecalMirrorOffset;ReflectOffset X;242;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;5707;-1944.299,-721.7449;Inherit;True;Property;_DecalTex;Decal Tex;237;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.Compare;5775;-2142.338,-628.4147;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5740;-2752.001,-316.3707;Float;False;Property;_DecalMirrorAdjust;ReflectAdjust Y;243;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5741;-2472.424,-387.0786;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5684;-3100.504,-477.4163;Inherit;False;1;5707;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CustomExpressionNode;5704;-2890.645,-604.3495;Float;False;decaluvmod.x = ((decaluvmod.x - 0.5) * _DecalTex_ST.x) + _DecalTex_ST.z@$decaluvmod.y = ((decaluvmod.y - 0.5 + _DecalTex_ST.w) * _DecalTex_ST.y) + 0.5@$decaluvmod = decaluvmod.xy@;7;Call;2;True;decaluvmod;FLOAT2;0,0;InOut;;Half;True;True;placeholder;FLOAT2;0,0;In;;Half;False;decal uv settting;False;False;0;;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;2
Node;AmplifyShaderEditor.RangedFloatNode;334;2905.537,-512.5922;Float;False;Property;_Alpha;Alpha;13;0;Create;True;0;0;0;False;1;Space(5);False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;5799;3779.245,-504.8704;Inherit;False;Custom A2C;19;;7341;445f8ff28d1a9f44092743e0eb84a83d;0;3;19;FLOAT;1;False;3;FLOAT;1;False;16;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4436;4610.785,-575.4036;Float;False;True;-1;2;ASEMaterialInspector;0;19;.GenesisAria/Arias VertexLit Shader;9367a06897b8873449e3ea0a525cc048;True;Unlit;0;0;VertexLit;2;True;True;1;0;True;_SrcBlend;0;True;_DstBlend;0;5;False;;10;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Culling;True;True;True;True;True;True;0;True;_ColorMask;False;False;False;False;False;False;True;True;True;255;True;_StencilRef;255;True;_ReadMask;255;True;_WriteMask;7;True;_StencilComp;1;True;_StencilOp;1;True;_StencilFail;1;True;_StencilZFail;7;False;;1;False;;1;False;;1;False;;True;True;1;True;_ZWriteMode;True;3;True;_ZTestMode;True;False;0;False;;0;False;;True;1;RenderType=Opaque=RenderType;True;7;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;LightMode=ForwardBase;Queue=Geometry=Queue=0;True;7;False;0;Legacy Shaders/Transparent/Cutout/VertexLit;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;True;0
Node;AmplifyShaderEditor.ClipNode;1430;4342.252,-569.2742;Inherit;True;3;0;COLOR;1,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0.005;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;1923;4056.785,-571.0798;Inherit;True;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;4666;3753.554,-406.4632;Inherit;False;Property;_A2CSampleBias;A2C Sample Bias;21;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;6280;3571.62,-509.5901;Inherit;False;Property;_DisableAlpha;Disable Alpha;23;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;5551;3334.288,-297.9125;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;6281;3417.909,-394.2648;Inherit;False;Constant;_Int0;Int 0;236;0;Create;True;0;0;0;False;0;False;1;0;False;0;1;INT;0
Node;AmplifyShaderEditor.StaticSwitch;6282;3552.909,-301.2648;Inherit;False;Property;_DisableAlpha1;Disable Alpha;23;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;6280;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3144;3777.542,-204.4297;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5871;4171.664,-355.6564;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0.005;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1783;-7296.246,-4649.518;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;6283;-6602.599,-4270.399;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;6099;-7122.808,-4199.044;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5400;-6274.377,-4463.278;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;1.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-7335.865,-4488.282;Half;False;Property;_SpecularSize;Specular Spread;124;0;Create;False;0;0;0;False;0;False;1;7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;5398;-6987.641,-4392.628;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5395;-7138.392,-4369.066;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.42;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ExpOpNode;6268;-6858.057,-4532.159;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5921;-7161.818,-4482.437;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2236;-7010.931,-4520.866;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-7364.17,-4574.662;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1235;-6338.883,665.0669;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;602;-6580,492.511;Inherit;True;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;5240;-6856.887,518.5084;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1234;-6346.733,517.0275;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6263;-6378.51,-4687.489;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;6266;-6622.905,-4471.847;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;545;-6637.004,-4692.35;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;5910;-7722.848,-4275.305;Inherit;False;False;2;0;FLOAT;1;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;5082;-6907.625,-4664.503;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5297;-5275.356,-2319.164;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5304;-5119.356,-2320.164;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;-5248.855,-2514.369;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4344;-4723.114,-2347.922;Half;False;Property;_SpecMaskPower;SpecMask Power;145;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5292;-4941.833,-2466.614;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4345;-4748.813,-2461.721;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;4807;-4770.402,-2626.843;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;4809;-4803.972,-2626.645;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;5459;-4591.814,-2451.49;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1E-05;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3251;-4782.807,-2558.896;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;560;-4635.639,-2582.001;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;5299;-5091.356,-2471.164;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5291;-5105.833,-2554.615;Half;False;Property;_SpecBias;Specular Bias;147;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;983;-4457.299,-2586.15;Float;False;SpecularOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;6219;-4849.307,-2212.365;Inherit;False;Fresnel Edge Pixel Fix;-1;;7342;e37ec5be3c94a1b4e99e2c04f776c418;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5303;-5241.454,-2182.556;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6236;-4417.378,-2451.554;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2984;-2434.564,-1296.4;Inherit;True;Property;_TextureSample7;Texture Sample 7;101;0;Create;True;0;0;0;False;0;False;328;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;4923;-2109.101,-1280.762;Inherit;False;Property;_SuperSample;SuperSample (expensive);6;0;Create;False;0;0;0;False;0;False;0;0;0;True;MAINSS_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;6287;-5675.719,-2395.512;Inherit;False;Property;_SpecMaskEnum2;Channel;149;1;[Enum];Create;False;0;4;R;0;G;1;B;2;A;3;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;5405;2496.237,1763.048;Half;False;Property;_MatcapMaskPower;Mask Power;234;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3263;-7640.54,-654.1367;Half;False;Property;_LightMaskLevel;Light Mask Level;94;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4803;-7277.577,-638.3425;Half;False;Constant;_LMask_Null;LMask_Null;125;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4802;-7310.412,-752.3834;Half;False;Property;_LightMaskEnable;Use Light Mask;91;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3262;-7425.357,-696.1332;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;4801;-7122.757,-734.9653;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;4804;-6967.31,-738.8314;Half;False;LightMaskValue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6291;-7790.583,11.98379;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4203;-7320.271,-418.1248;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;5941;-7900.656,-296.8983;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;5940;-8056.656,-224.8983;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5375;-7508.673,-404.372;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5373;-7548.252,-282.886;Half;False;Property;_NormMaskLevel;Normal Mask Level;87;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;5947;-7717.011,-296.2474;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5948;-7733.011,-182.2474;Half;False;Property;_NormMaskPow;Normal Mask Power;88;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5939;-7897.656,-373.8983;Half;False;Property;_NormalMaskInvert;Normal Mask Invert;89;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6293;-8029.473,4.526352;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6294;-7225.125,-342.7197;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;6292;-7334.981,-239.1772;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;6289;2274.296,1615.008;Inherit;False;Property;_MatcapMaskEnum;Channel;232;1;[Enum];Create;False;0;4;R;0;G;1;B;2;A;3;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.WireNode;5945;-7590.011,-525.2474;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;5944;-7532.655,-490.8983;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;695;-5977.483,-2530.278;Inherit;True;Property;_SpecularMask;Specular Mask;143;0;Create;False;0;0;0;False;1;Space(10);False;328;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5296;-5981.385,-2332.754;Inherit;True;Property;_SpecularMask2;Specular Mask2;148;0;Create;False;0;0;0;False;1;Space(10);False;328;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3109;2118.934,1690.183;Inherit;True;Property;_MatCapMask;MatCap Mask;231;1;[SingleLineTexture];Create;False;0;0;0;False;1;Space(5);False;328;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;6295;-8417.347,-289.8979;Inherit;False;Property;_NormMaskEnum;Normal Mask Channel;86;1;[Enum];Create;False;0;4;R;0;G;1;B;2;A;3;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TexturePropertyNode;4302;-8878.345,-481.3;Inherit;True;Property;_NormalMask;NormalMask, Shademask;85;2;[Header];[SingleLineTexture];Create;False;1;Normal Mask;0;0;False;0;False;None;None;False;white;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;3059;-8605.298,-480.3526;Inherit;True;Property;_NormalMask1;Normal Mask (RG,A);45;2;[Header];[SingleLineTexture];Create;False;1;G Heightmap . A LightMask;0;0;False;0;False;4302;None;None;True;0;False;white;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;6284;-5746.719,-2634.512;Inherit;False;Property;_SpecMaskEnum1;Channel;144;1;[Enum];Create;False;0;4;R;0;G;1;B;2;A;3;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.StaticSwitch;5366;-7950.167,-3340.784;Inherit;False;Property;_GlossUV;Roughness UV;157;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;UV1;UV2;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4197;-8231.631,-3403.185;Inherit;False;0;4148;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;5368;-8231.17,-3282.732;Inherit;False;1;4148;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4151;-7493.008,-3254.746;Half;False;Property;_RoughnessInvert;Roughness Invert;156;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;4148;-8006.739,-3162.085;Inherit;True;Property;_Glossiness;Roughness Map;152;0;Create;False;1;;0;0;False;0;False;-1;None;None;True;0;False;black;LockedToTexture2D;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;6299;-7699.367,-3203.367;Inherit;False;Property;_RioughnessEnum;Channel;153;1;[Enum];Create;False;0;4;R;0;G;1;B;2;A;3;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.GetLocalVarNode;6199;-8935.928,-2633.558;Inherit;False;965;NormalSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;5857;2622.716,618.2791;Inherit;True;Property;_FriendsOnlyMask;FriendsOnly Mask;260;1;[SingleLineTexture];Create;True;0;0;0;False;1;Space(5);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;6304;2918.797,719.6018;Inherit;False;Property;_FriendMaskEnum;Channel;261;1;[Enum];Create;False;0;4;R;0;G;1;B;2;A;3;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;6306;3313.732,-709.4639;Inherit;False;Property;_AlphaMaskEnum;Channel;17;1;[Enum];Create;False;0;4;R;0;G;1;B;2;A;3;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SamplerNode;5545;3025.623,-787.494;Inherit;True;Property;_AlphaMask1;;16;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;5810;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;5845;3129.082,-1011.372;Inherit;True;Property;_AlphaMask;Alpha Mask;16;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;None;1a892fe412b1b994daf521888d141ca8;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode;6308;-5638.719,-2318.512;Inherit;False;RGBA_Selector;-1;;7363;aedc8880bfba83a41aa49bf0f234dcbe;0;2;5;INT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;6309;2423.296,1671.008;Inherit;False;RGBA_Selector;-1;;7364;aedc8880bfba83a41aa49bf0f234dcbe;0;2;5;INT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;6310;-8253.347,-363.8979;Inherit;False;RGBA_Selector;-1;;7365;aedc8880bfba83a41aa49bf0f234dcbe;0;2;5;INT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;6311;-8149.231,-496.7122;Inherit;False;RGBA_Selector;-1;;7366;aedc8880bfba83a41aa49bf0f234dcbe;0;2;5;INT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;6312;-5637.719,-2504.512;Inherit;False;RGBA_Selector;-1;;7367;aedc8880bfba83a41aa49bf0f234dcbe;0;2;5;INT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;6313;-7699.367,-3124.367;Inherit;False;RGBA_Selector;-1;;7368;aedc8880bfba83a41aa49bf0f234dcbe;0;2;5;INT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;6315;2914.797,618.6018;Inherit;False;RGBA_Selector;-1;;7380;aedc8880bfba83a41aa49bf0f234dcbe;0;2;5;INT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;6316;3307.732,-804.4639;Inherit;False;RGBA_Selector;-1;;7381;aedc8880bfba83a41aa49bf0f234dcbe;0;2;5;INT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;6314;-3761.899,-4622.791;Inherit;False;Aria Sparkles Include;179;;7382;fe78986b6250d1d46955dfaed2c4e629;0;2;97;FLOAT3;0,0,0;False;156;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;6318;1583.033,-472.2645;Inherit;False;Aria Parallax Include;250;;7393;972a5d25f3151a4479be2dcc9b9e75fa;2,56,0,55,0;1;60;INT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;6297;-8349.231,-534.7122;Inherit;False;Property;_ShadeMaskEnum;Shade Mask Channel;92;1;[Enum];Create;False;0;4;R;0;G;1;B;2;A;3;0;False;0;False;3;3;False;0;1;INT;0
WireConnection;3458;0;3838;0
WireConnection;3458;2;3464;0
WireConnection;4354;0;3458;0
WireConnection;3495;0;3464;0
WireConnection;3495;2;4354;0
WireConnection;3495;3;4354;0
WireConnection;3495;4;3527;0
WireConnection;3459;0;3495;0
WireConnection;5662;0;5256;0
WireConnection;4360;0;4357;0
WireConnection;5259;0;5257;0
WireConnection;5259;1;5258;0
WireConnection;5189;2;2957;0
WireConnection;3432;2;2957;0
WireConnection;5664;0;5259;0
WireConnection;4356;0;4079;0
WireConnection;4356;1;4360;0
WireConnection;5665;0;5259;0
WireConnection;5666;0;5668;0
WireConnection;5666;2;5256;0
WireConnection;5666;3;5662;0
WireConnection;5191;1;3432;0
WireConnection;5191;0;5189;0
WireConnection;4352;0;4351;0
WireConnection;4352;1;3599;0
WireConnection;2958;0;5252;0
WireConnection;2958;1;5666;0
WireConnection;2958;5;5664;0
WireConnection;2958;7;5252;1
WireConnection;1878;0;3408;16
WireConnection;1878;1;3408;17
WireConnection;1878;2;3408;18
WireConnection;1878;3;3408;20
WireConnection;4930;1;2958;0
WireConnection;4930;0;5197;0
WireConnection;1551;0;1878;0
WireConnection;5317;0;5253;0
WireConnection;5316;0;4930;0
WireConnection;5339;0;5317;0
WireConnection;5346;0;5316;0
WireConnection;5347;0;5316;1
WireConnection;5340;0;5317;0
WireConnection;1886;0;3408;23
WireConnection;1886;1;3408;29
WireConnection;1886;2;3408;30
WireConnection;1886;3;3408;31
WireConnection;5350;0;5316;0
WireConnection;5338;0;5317;1
WireConnection;1589;0;1551;0
WireConnection;1589;1;1551;1
WireConnection;1589;2;1551;2
WireConnection;5344;0;5342;0
WireConnection;5344;2;5346;0
WireConnection;5344;3;5350;0
WireConnection;2014;0;1886;0
WireConnection;5331;0;5334;0
WireConnection;5331;2;5339;0
WireConnection;5331;3;5340;0
WireConnection;1890;0;1589;0
WireConnection;5345;0;5343;0
WireConnection;5345;2;5347;0
WireConnection;5345;3;5316;1
WireConnection;1891;0;1551;3
WireConnection;5336;0;5335;0
WireConnection;5336;2;5338;0
WireConnection;5336;3;5317;1
WireConnection;5328;0;5336;0
WireConnection;5328;1;5331;0
WireConnection;5327;0;5345;0
WireConnection;5327;1;5344;0
WireConnection;5337;0;5344;0
WireConnection;5337;1;5345;0
WireConnection;5333;0;5331;0
WireConnection;5333;1;5336;0
WireConnection;1879;0;2014;0
WireConnection;1879;1;1890;0
WireConnection;1879;2;1891;0
WireConnection;5322;0;5321;0
WireConnection;5322;2;5328;0
WireConnection;5322;3;5333;0
WireConnection;5365;0;4930;0
WireConnection;1631;0;3408;18
WireConnection;1631;1;3408;30
WireConnection;1630;0;3408;17
WireConnection;1630;1;3408;29
WireConnection;1629;0;3408;16
WireConnection;1629;1;3408;23
WireConnection;1684;0;3408;20
WireConnection;1684;1;3408;31
WireConnection;5323;0;5320;0
WireConnection;5323;2;5327;0
WireConnection;5323;3;5337;0
WireConnection;1905;1;1911;0
WireConnection;1905;0;1879;0
WireConnection;2148;0;2147;0
WireConnection;5358;0;5320;0
WireConnection;5358;1;5342;0
WireConnection;5358;2;5343;0
WireConnection;5318;0;5323;0
WireConnection;5318;2;5316;2
WireConnection;1682;0;1629;0
WireConnection;1682;1;1630;0
WireConnection;1682;2;1631;0
WireConnection;1682;3;1684;0
WireConnection;5361;0;5253;0
WireConnection;5360;0;5321;0
WireConnection;5360;1;5334;0
WireConnection;5360;2;5335;0
WireConnection;5319;0;5322;0
WireConnection;5319;2;5317;2
WireConnection;5364;0;5365;0
WireConnection;1665;0;1905;0
WireConnection;1246;0;1232;2
WireConnection;1246;1;2148;0
WireConnection;248;0;249;0
WireConnection;248;1;251;0
WireConnection;248;2;252;0
WireConnection;2154;0;2153;0
WireConnection;1247;0;1232;1
WireConnection;1247;1;1246;0
WireConnection;1908;1;1910;0
WireConnection;1908;0;1682;0
WireConnection;5451;0;633;1
WireConnection;5359;0;5360;0
WireConnection;5359;2;5319;0
WireConnection;5359;3;5361;0
WireConnection;5357;0;5358;0
WireConnection;5357;2;5318;0
WireConnection;5357;3;5364;0
WireConnection;3496;0;2152;0
WireConnection;3496;3;2154;0
WireConnection;3496;4;2150;0
WireConnection;1233;0;1247;0
WireConnection;1876;0;5451;0
WireConnection;1876;1;633;2
WireConnection;1406;0;1908;0
WireConnection;2635;0;248;0
WireConnection;2635;1;3511;2
WireConnection;2140;0;2121;0
WireConnection;2140;1;1490;0
WireConnection;2140;2;2121;0
WireConnection;2034;0;2140;0
WireConnection;5353;0;5240;0
WireConnection;1076;0;1876;0
WireConnection;1076;2;1233;0
WireConnection;1076;3;2635;0
WireConnection;2017;0;3408;0
WireConnection;5363;0;5359;0
WireConnection;2159;0;3496;0
WireConnection;5251;1;5363;0
WireConnection;5251;0;5353;0
WireConnection;5251;2;5357;0
WireConnection;2026;0;2034;0
WireConnection;1383;0;2017;0
WireConnection;1383;1;2159;0
WireConnection;3598;0;4203;0
WireConnection;3598;1;3597;0
WireConnection;2215;0;1076;0
WireConnection;1382;0;1383;0
WireConnection;3593;1;5251;0
WireConnection;3593;2;3598;0
WireConnection;5362;0;428;0
WireConnection;2035;1;2026;0
WireConnection;4797;0;6291;0
WireConnection;3817;0;2215;0
WireConnection;3817;1;4796;7
WireConnection;3061;0;4797;0
WireConnection;3061;1;5362;0
WireConnection;3646;0;3645;0
WireConnection;3735;0;3650;0
WireConnection;5494;0;3817;0
WireConnection;2025;0;2035;0
WireConnection;3594;0;3593;0
WireConnection;1491;0;1382;0
WireConnection;2033;0;2025;0
WireConnection;430;1;5251;0
WireConnection;430;2;3061;0
WireConnection;3644;0;3735;0
WireConnection;3644;3;3646;0
WireConnection;3644;4;3594;0
WireConnection;2213;0;2217;0
WireConnection;2213;1;2216;0
WireConnection;2213;2;2033;0
WireConnection;3595;0;3644;0
WireConnection;3596;0;3644;0
WireConnection;2218;0;2213;0
WireConnection;4786;0;3587;0
WireConnection;4786;1;3601;0
WireConnection;1381;0;1380;0
WireConnection;1381;1;1382;0
WireConnection;5;0;1165;0
WireConnection;5;1;3817;0
WireConnection;1296;0;5;0
WireConnection;1389;0;1381;0
WireConnection;3588;0;4786;0
WireConnection;3589;0;5905;0
WireConnection;3589;1;3588;0
WireConnection;5171;7;3331;0
WireConnection;3797;0;3589;0
WireConnection;3797;1;3798;0
WireConnection;1994;0;1480;0
WireConnection;1994;1;1297;0
WireConnection;1994;2;2033;0
WireConnection;3719;0;5882;0
WireConnection;4691;0;3797;0
WireConnection;4691;1;4692;0
WireConnection;3720;0;3719;0
WireConnection;3301;0;1915;0
WireConnection;3301;2;5171;0
WireConnection;3332;0;3301;0
WireConnection;3332;1;3331;0
WireConnection;4694;0;4691;0
WireConnection;4694;1;3720;0
WireConnection;4694;2;4977;0
WireConnection;1914;0;3331;0
WireConnection;1914;2;3332;0
WireConnection;3717;0;4976;0
WireConnection;3717;1;3797;0
WireConnection;3717;2;3720;0
WireConnection;4695;0;4694;0
WireConnection;4695;1;4696;0
WireConnection;3608;0;3717;0
WireConnection;3608;1;3611;0
WireConnection;5508;0;4695;0
WireConnection;5614;0;5905;0
WireConnection;5501;0;3608;0
WireConnection;5544;0;5543;0
WireConnection;5544;1;5508;0
WireConnection;5612;0;5614;0
WireConnection;5562;0;5558;0
WireConnection;4129;1;4123;0
WireConnection;4129;2;4132;0
WireConnection;5566;0;5563;0
WireConnection;5566;1;5888;0
WireConnection;5565;0;5564;0
WireConnection;5565;1;5652;0
WireConnection;5617;0;5567;0
WireConnection;5514;0;3657;0
WireConnection;4857;0;3798;0
WireConnection;5518;0;5514;0
WireConnection;5643;0;5639;0
WireConnection;5592;1;5617;0
WireConnection;3737;0;3739;0
WireConnection;5512;0;5518;0
WireConnection;5595;0;5592;0
WireConnection;5647;0;5643;0
WireConnection;5542;0;5514;0
WireConnection;3740;0;3736;0
WireConnection;3740;2;3737;0
WireConnection;3740;3;3733;0
WireConnection;5524;0;5512;0
WireConnection;5524;1;5542;0
WireConnection;3741;0;3685;0
WireConnection;3741;1;3740;0
WireConnection;5642;0;5647;0
WireConnection;5616;0;5595;0
WireConnection;5616;2;5615;0
WireConnection;5645;0;5616;0
WireConnection;5645;1;5642;0
WireConnection;3686;0;3741;0
WireConnection;5523;0;5524;0
WireConnection;5527;0;5491;4
WireConnection;3687;0;3686;0
WireConnection;3687;1;5905;0
WireConnection;5529;0;5523;0
WireConnection;5529;2;5527;0
WireConnection;5492;0;5491;0
WireConnection;5596;0;5597;0
WireConnection;5596;2;5645;0
WireConnection;3682;0;3687;0
WireConnection;3682;2;3681;0
WireConnection;3683;0;3682;0
WireConnection;5638;0;5496;0
WireConnection;4137;0;4138;0
WireConnection;4137;2;4136;0
WireConnection;5610;0;5638;0
WireConnection;5403;0;5497;0
WireConnection;4980;1;5885;0
WireConnection;4980;2;4983;0
WireConnection;4424;0;1123;0
WireConnection;4424;1;4430;0
WireConnection;4423;0;4424;0
WireConnection;4934;0;4980;0
WireConnection;3289;0;1123;0
WireConnection;4422;0;4423;0
WireConnection;4422;2;1123;0
WireConnection;4422;4;3289;0
WireConnection;3603;0;4934;0
WireConnection;1424;0;349;1
WireConnection;1424;1;349;2
WireConnection;1424;2;349;3
WireConnection;3336;0;1424;0
WireConnection;662;0;4422;0
WireConnection;662;2;641;0
WireConnection;662;3;642;0
WireConnection;645;0;4422;0
WireConnection;645;4;1492;0
WireConnection;645;2;641;0
WireConnection;645;3;642;0
WireConnection;3282;0;662;0
WireConnection;3335;0;3336;0
WireConnection;811;0;646;0
WireConnection;3291;0;3282;0
WireConnection;1425;0;3335;0
WireConnection;3281;0;645;0
WireConnection;3273;0;3271;0
WireConnection;3290;0;3281;0
WireConnection;3290;2;3291;0
WireConnection;679;0;811;0
WireConnection;351;0;1425;0
WireConnection;680;0;3273;0
WireConnection;627;0;351;0
WireConnection;3287;0;3290;0
WireConnection;3502;0;1035;0
WireConnection;3502;3;680;0
WireConnection;3502;4;679;0
WireConnection;3283;0;3502;0
WireConnection;3506;0;1999;0
WireConnection;3506;3;627;0
WireConnection;3506;4;351;0
WireConnection;669;1;3287;0
WireConnection;669;2;684;0
WireConnection;3333;0;3506;0
WireConnection;5554;1;3433;0
WireConnection;5554;0;5556;0
WireConnection;5199;4;3431;0
WireConnection;5199;1;3343;0
WireConnection;5199;48;3343;1
WireConnection;5199;28;4078;0
WireConnection;3345;0;3343;0
WireConnection;3345;1;3431;0
WireConnection;3345;7;3343;1
WireConnection;3285;0;3283;0
WireConnection;3285;2;669;0
WireConnection;4922;1;3345;0
WireConnection;4922;0;5199;0
WireConnection;4926;1;3285;0
WireConnection;4926;0;954;0
WireConnection;5557;0;5554;0
WireConnection;4888;0;4897;0
WireConnection;4893;0;4898;0
WireConnection;4899;0;5557;0
WireConnection;4899;1;4888;0
WireConnection;4900;0;5557;1
WireConnection;4900;1;4893;0
WireConnection;5315;0;3338;0
WireConnection;5315;2;4922;0
WireConnection;5315;3;4923;0
WireConnection;4890;0;4899;0
WireConnection;4890;1;4900;0
WireConnection;5187;0;5183;0
WireConnection;813;0;18;0
WireConnection;3451;0;6293;0
WireConnection;3451;1;603;0
WireConnection;5348;0;3451;0
WireConnection;5186;0;5185;0
WireConnection;5186;2;5187;0
WireConnection;812;0;4936;0
WireConnection;4892;0;4890;0
WireConnection;5349;0;5348;0
WireConnection;4891;0;4892;0
WireConnection;3055;0;1234;0
WireConnection;3799;0;968;0
WireConnection;3244;0;1330;0
WireConnection;3249;0;585;0
WireConnection;2918;0;325;0
WireConnection;2917;0;5960;0
WireConnection;2917;1;2918;0
WireConnection;3241;0;3244;0
WireConnection;3241;1;3249;0
WireConnection;3617;0;3607;0
WireConnection;3617;1;3799;0
WireConnection;3643;0;3617;0
WireConnection;3643;1;968;0
WireConnection;581;0;2917;0
WireConnection;581;1;3241;0
WireConnection;4927;1;3643;0
WireConnection;4927;0;4928;0
WireConnection;3074;0;581;0
WireConnection;1536;0;1537;0
WireConnection;1536;1;1530;0
WireConnection;1536;2;1534;0
WireConnection;3648;0;5251;0
WireConnection;3576;0;4203;0
WireConnection;3505;0;1533;0
WireConnection;3505;3;1536;0
WireConnection;3505;4;1537;0
WireConnection;3087;0;3088;0
WireConnection;3087;1;3576;0
WireConnection;3077;0;3074;0
WireConnection;3077;1;4927;0
WireConnection;3647;0;3648;0
WireConnection;3796;0;3077;0
WireConnection;3086;1;3647;0
WireConnection;3086;2;3087;0
WireConnection;360;0;3505;0
WireConnection;360;2;369;0
WireConnection;360;3;368;0
WireConnection;3090;0;3086;0
WireConnection;379;0;360;0
WireConnection;379;1;2299;0
WireConnection;379;2;2300;0
WireConnection;3940;0;376;0
WireConnection;382;0;3940;0
WireConnection;382;1;379;0
WireConnection;3091;0;3090;0
WireConnection;3773;0;4743;0
WireConnection;3773;1;384;0
WireConnection;370;0;382;0
WireConnection;370;1;1290;0
WireConnection;383;0;379;0
WireConnection;383;1;3773;0
WireConnection;3089;0;3090;0
WireConnection;390;0;1291;0
WireConnection;390;1;382;0
WireConnection;390;2;383;0
WireConnection;372;0;1291;0
WireConnection;372;1;382;0
WireConnection;372;2;383;0
WireConnection;388;0;1290;0
WireConnection;388;1;370;0
WireConnection;388;2;3773;0
WireConnection;1284;0;1281;0
WireConnection;1284;2;388;0
WireConnection;1284;3;390;0
WireConnection;1284;4;372;0
WireConnection;4683;0;4682;0
WireConnection;4683;2;4681;0
WireConnection;4684;0;1284;0
WireConnection;4684;1;4683;0
WireConnection;5406;0;6309;0
WireConnection;5406;1;5405;0
WireConnection;810;0;2175;0
WireConnection;3268;1;5406;0
WireConnection;3268;2;3264;0
WireConnection;5404;0;3268;0
WireConnection;2291;0;2264;0
WireConnection;807;0;2919;4
WireConnection;807;1;5999;0
WireConnection;807;2;406;0
WireConnection;807;3;5404;0
WireConnection;2287;0;2291;0
WireConnection;3352;0;3333;0
WireConnection;3352;2;5860;0
WireConnection;5548;0;5550;0
WireConnection;4116;0;2287;0
WireConnection;4920;0;6318;0
WireConnection;5552;0;1433;0
WireConnection;3429;5;3140;0
WireConnection;3429;6;3142;0
WireConnection;3478;0;3159;0
WireConnection;3478;2;3498;0
WireConnection;3478;3;3429;7
WireConnection;3478;4;3498;0
WireConnection;4117;0;4116;0
WireConnection;3252;1;2287;0
WireConnection;3956;0;2287;0
WireConnection;5686;0;4920;0
WireConnection;4084;0;4117;0
WireConnection;4084;1;5686;0
WireConnection;3955;0;3956;0
WireConnection;3955;2;1702;0
WireConnection;2284;0;3252;0
WireConnection;2284;1;1701;0
WireConnection;470;0;4916;0
WireConnection;470;1;2284;0
WireConnection;470;2;3955;0
WireConnection;470;3;4084;0
WireConnection;5166;0;5165;0
WireConnection;1856;0;602;0
WireConnection;5165;0;5164;0
WireConnection;5165;1;5164;1
WireConnection;5165;2;5164;2
WireConnection;4685;0;3797;0
WireConnection;4686;1;5508;0
WireConnection;4686;2;4685;0
WireConnection;4687;0;3608;0
WireConnection;4687;1;4686;0
WireConnection;5164;0;3331;0
WireConnection;5672;1;4850;0
WireConnection;5672;0;5710;0
WireConnection;4361;0;1106;0
WireConnection;4134;0;1118;0
WireConnection;4103;0;4134;0
WireConnection;4103;1;4104;0
WireConnection;4370;0;4365;0
WireConnection;1010;0;1008;0
WireConnection;4380;0;1016;0
WireConnection;4380;1;4383;0
WireConnection;4805;0;4170;0
WireConnection;4805;1;4379;0
WireConnection;979;0;4805;0
WireConnection;4125;0;4929;0
WireConnection;30;0;346;0
WireConnection;1500;0;30;0
WireConnection;1500;1;4926;0
WireConnection;2289;0;1500;0
WireConnection;1922;0;1777;0
WireConnection;1922;1;2289;0
WireConnection;968;0;1922;0
WireConnection;5173;7;1914;0
WireConnection;5172;7;1914;0
WireConnection;3553;0;5172;0
WireConnection;3553;1;5173;0
WireConnection;3558;0;3553;0
WireConnection;3558;1;5160;0
WireConnection;1777;0;1914;0
WireConnection;1777;1;3551;0
WireConnection;5011;0;5010;0
WireConnection;5011;1;335;0
WireConnection;5011;2;5007;0
WireConnection;344;0;1470;0
WireConnection;344;1;5011;0
WireConnection;346;0;1273;0
WireConnection;346;1;344;0
WireConnection;1470;0;5012;0
WireConnection;5012;0;1106;0
WireConnection;4139;0;1107;0
WireConnection;5671;0;5669;0
WireConnection;5735;0;5734;0
WireConnection;5691;0;5709;0
WireConnection;5709;0;5707;0
WireConnection;5709;1;5776;0
WireConnection;5709;7;5707;1
WireConnection;3353;0;1998;0
WireConnection;5736;0;5691;0
WireConnection;5736;1;5735;0
WireConnection;5736;2;5737;0
WireConnection;5783;0;5736;0
WireConnection;5711;0;5739;0
WireConnection;5739;0;5783;0
WireConnection;5692;0;5693;0
WireConnection;5692;2;5711;0
WireConnection;5692;3;5709;4
WireConnection;4144;0;3353;0
WireConnection;4144;3;3352;0
WireConnection;4144;4;3499;0
WireConnection;5690;0;5692;0
WireConnection;5787;0;5788;0
WireConnection;5788;0;5692;0
WireConnection;5785;0;5787;0
WireConnection;5785;1;5779;0
WireConnection;5786;0;5790;0
WireConnection;5790;0;5785;0
WireConnection;4936;1;4923;0
WireConnection;4936;0;5315;0
WireConnection;2993;0;4936;0
WireConnection;5819;0;5817;0
WireConnection;5823;0;5826;0
WireConnection;5817;0;5811;0
WireConnection;5811;0;5823;0
WireConnection;5814;0;5824;0
WireConnection;5814;1;2993;0
WireConnection;5821;0;5814;0
WireConnection;5825;0;5819;0
WireConnection;5824;0;5825;0
WireConnection;5826;0;2993;0
WireConnection;5314;1;5842;0
WireConnection;5314;2;334;0
WireConnection;333;0;5313;0
WireConnection;333;1;1265;0
WireConnection;5842;1;333;0
WireConnection;5842;0;5844;0
WireConnection;5844;0;333;0
WireConnection;5844;1;5548;0
WireConnection;1262;0;5821;0
WireConnection;5860;0;6315;0
WireConnection;5860;1;5859;0
WireConnection;3331;0;5863;0
WireConnection;3331;1;1916;0
WireConnection;5490;0;5488;0
WireConnection;5489;0;5490;0
WireConnection;2867;0;1489;0
WireConnection;2867;1;5489;0
WireConnection;2867;2;4394;0
WireConnection;2867;3;2870;0
WireConnection;4200;0;2867;0
WireConnection;5863;0;5864;0
WireConnection;5863;1;4200;0
WireConnection;5864;0;5862;0
WireConnection;5864;1;5861;0
WireConnection;5256;1;5255;0
WireConnection;5256;0;5254;0
WireConnection;5866;1;5867;0
WireConnection;5866;0;5868;0
WireConnection;1489;0;1486;0
WireConnection;1489;1;3803;0
WireConnection;1489;2;4204;0
WireConnection;4394;0;4393;0
WireConnection;5862;0;4200;0
WireConnection;5488;1;1489;0
WireConnection;3803;0;5670;0
WireConnection;3803;2;2082;0
WireConnection;1486;0;1484;1
WireConnection;1486;2;2082;0
WireConnection;2082;0;2081;2
WireConnection;3314;0;1408;0
WireConnection;5670;0;3314;0
WireConnection;5670;1;5748;0
WireConnection;5748;0;5671;0
WireConnection;4204;0;4795;0
WireConnection;4204;2;5870;0
WireConnection;5872;0;1433;0
WireConnection;3684;0;3683;0
WireConnection;3684;1;5588;0
WireConnection;3684;2;3657;0
WireConnection;5586;0;5596;0
WireConnection;5497;0;5610;0
WireConnection;5497;1;3684;0
WireConnection;5497;2;3610;0
WireConnection;5496;0;5492;0
WireConnection;5496;1;5529;0
WireConnection;4130;0;4129;0
WireConnection;4133;0;4126;0
WireConnection;4123;0;4133;0
WireConnection;4123;1;4140;0
WireConnection;3657;0;5873;0
WireConnection;5515;0;5501;0
WireConnection;5515;1;5544;0
WireConnection;4688;0;4693;0
WireConnection;4688;2;5515;0
WireConnection;4688;3;5501;0
WireConnection;5873;1;4130;0
WireConnection;5873;2;4688;0
WireConnection;5880;0;3838;0
WireConnection;5876;0;5905;0
WireConnection;5885;1;5403;0
WireConnection;5885;2;4137;0
WireConnection;5010;0;335;0
WireConnection;5010;1;5015;0
WireConnection;5015;0;5014;0
WireConnection;5014;0;5009;0
WireConnection;5567;0;5565;0
WireConnection;5567;2;5566;0
WireConnection;5654;1;5651;0
WireConnection;5652;0;5654;0
WireConnection;5887;1;5886;0
WireConnection;5888;0;5887;0
WireConnection;5784;0;5690;0
WireConnection;5784;1;5786;0
WireConnection;5784;2;5780;0
WireConnection;5877;0;3511;2
WireConnection;5905;0;5879;0
WireConnection;5905;1;3586;0
WireConnection;5564;0;5558;0
WireConnection;5564;2;5612;0
WireConnection;5563;0;5562;0
WireConnection;5563;2;5612;0
WireConnection;19;0;812;0
WireConnection;19;1;813;0
WireConnection;19;2;5186;0
WireConnection;5466;0;813;0
WireConnection;1016;0;1010;0
WireConnection;1016;2;1254;0
WireConnection;4379;0;4385;0
WireConnection;4379;2;4380;0
WireConnection;4379;3;1016;0
WireConnection;1118;0;4105;0
WireConnection;1118;1;4361;0
WireConnection;1106;0;4929;0
WireConnection;1106;1;4139;0
WireConnection;4377;0;1106;0
WireConnection;4377;1;4384;0
WireConnection;4392;0;1254;0
WireConnection;1254;0;4103;0
WireConnection;4383;1;4371;0
WireConnection;4383;2;4392;0
WireConnection;4371;0;4370;0
WireConnection;4371;2;4366;0
WireConnection;4364;0;4373;0
WireConnection;4364;1;4377;0
WireConnection;4369;0;4364;0
WireConnection;4366;0;4369;0
WireConnection;4366;1;4363;0
WireConnection;5374;0;4202;0
WireConnection;1517;0;1518;0
WireConnection;1274;0;405;0
WireConnection;405;0;1278;0
WireConnection;405;1;414;0
WireConnection;405;2;807;0
WireConnection;2210;0;3524;0
WireConnection;2210;2;2208;0
WireConnection;3528;0;2166;0
WireConnection;3528;3;2210;0
WireConnection;3528;4;2207;0
WireConnection;2207;0;3523;0
WireConnection;2207;2;2208;0
WireConnection;2208;0;2209;0
WireConnection;2175;0;2181;0
WireConnection;2175;1;5953;0
WireConnection;2175;7;2181;1
WireConnection;5952;0;3528;0
WireConnection;5954;0;5952;0
WireConnection;5954;1;5951;0
WireConnection;5953;0;5954;0
WireConnection;3523;21;963;0
WireConnection;3523;27;1930;0
WireConnection;3524;9;2873;0
WireConnection;3524;45;1930;0
WireConnection;4259;0;4258;0
WireConnection;5710;0;5736;0
WireConnection;5710;1;4850;0
WireConnection;5710;2;5784;0
WireConnection;5960;3;5672;0
WireConnection;5960;2;2910;0
WireConnection;5961;3;329;0
WireConnection;5961;2;4329;0
WireConnection;329;0;4259;0
WireConnection;329;1;4680;0
WireConnection;329;2;805;0
WireConnection;329;3;326;0
WireConnection;1285;0;331;0
WireConnection;4850;0;19;0
WireConnection;4850;1;4851;0
WireConnection;5550;0;5893;0
WireConnection;5893;0;6316;0
WireConnection;5893;1;5902;0
WireConnection;5893;2;5892;0
WireConnection;5902;0;5889;0
WireConnection;5902;1;6316;0
WireConnection;5195;0;1292;0
WireConnection;5196;0;5195;0
WireConnection;1292;0;5193;0
WireConnection;5193;1;4234;0
WireConnection;5193;0;5194;0
WireConnection;4234;0;5980;0
WireConnection;4234;1;4233;0
WireConnection;4234;2;5975;0
WireConnection;4852;0;4320;0
WireConnection;4852;1;4387;0
WireConnection;4852;2;4387;0
WireConnection;4320;0;4233;0
WireConnection;4919;1;1515;0
WireConnection;4919;0;4684;0
WireConnection;5975;0;4852;0
WireConnection;5977;0;5967;0
WireConnection;5978;0;326;0
WireConnection;5971;0;5192;0
WireConnection;5981;0;4919;0
WireConnection;5980;0;4919;0
WireConnection;5950;0;407;0
WireConnection;5950;1;5949;0
WireConnection;1516;0;810;0
WireConnection;1516;1;1517;0
WireConnection;407;0;1516;0
WireConnection;407;1;2920;0
WireConnection;414;0;1279;0
WireConnection;414;1;5950;0
WireConnection;414;2;408;0
WireConnection;6003;0;6002;0
WireConnection;6002;0;2175;4
WireConnection;2920;0;2919;0
WireConnection;5999;0;5998;0
WireConnection;5998;0;6003;0
WireConnection;5998;1;6001;0
WireConnection;6001;0;5949;0
WireConnection;6058;0;3120;0
WireConnection;6059;0;3253;0
WireConnection;3551;0;3558;0
WireConnection;3551;1;5182;0
WireConnection;5182;0;6059;0
WireConnection;5160;0;6058;0
WireConnection;4258;0;4256;0
WireConnection;4240;0;4239;0
WireConnection;4848;0;4815;0
WireConnection;4847;0;970;0
WireConnection;4241;0;4848;0
WireConnection;5955;0;4240;0
WireConnection;5973;0;5972;0
WireConnection;5973;1;5192;0
WireConnection;5973;2;5971;0
WireConnection;331;0;5961;0
WireConnection;331;2;330;0
WireConnection;5967;0;4852;0
WireConnection;5194;0;5981;0
WireConnection;5194;1;5973;0
WireConnection;5194;2;5977;0
WireConnection;5979;0;5962;0
WireConnection;6134;0;6135;0
WireConnection;6135;0;4329;0
WireConnection;5962;3;6133;0
WireConnection;5962;2;6134;0
WireConnection;4256;0;4257;0
WireConnection;4256;2;4317;0
WireConnection;4256;3;450;0
WireConnection;5972;0;5979;0
WireConnection;5972;1;5978;0
WireConnection;5972;2;5971;0
WireConnection;6133;0;805;0
WireConnection;6133;1;5192;0
WireConnection;962;0;1235;0
WireConnection;1861;0;430;0
WireConnection;6138;6;430;0
WireConnection;5197;4;5256;0
WireConnection;5197;1;5252;0
WireConnection;5197;50;5252;1
WireConnection;5197;28;4356;0
WireConnection;5197;49;5665;0
WireConnection;965;0;1234;0
WireConnection;6200;0;6214;63
WireConnection;3068;0;5084;0
WireConnection;554;0;6259;0
WireConnection;554;2;556;0
WireConnection;556;1;4163;0
WireConnection;4163;0;555;0
WireConnection;4163;1;6099;0
WireConnection;816;1;2294;0
WireConnection;816;2;6079;0
WireConnection;2234;0;816;0
WireConnection;2234;1;816;0
WireConnection;2234;2;816;0
WireConnection;6060;0;6065;0
WireConnection;6060;1;6061;0
WireConnection;6065;0;6064;0
WireConnection;6061;0;6063;0
WireConnection;3064;0;3068;0
WireConnection;3064;1;6077;0
WireConnection;6052;0;6073;0
WireConnection;6052;1;6070;0
WireConnection;6075;0;3068;0
WireConnection;6074;0;6075;0
WireConnection;6076;0;6074;0
WireConnection;6070;0;6072;0
WireConnection;6070;1;6062;0
WireConnection;6072;0;6076;0
WireConnection;6072;1;6062;0
WireConnection;6073;0;6071;0
WireConnection;6077;0;6071;0
WireConnection;6079;0;3056;0
WireConnection;3056;0;561;0
WireConnection;6071;0;2234;0
WireConnection;6092;0;3064;0
WireConnection;3482;0;3072;0
WireConnection;3482;3;6078;0
WireConnection;3482;4;6052;0
WireConnection;6078;0;3069;0
WireConnection;6078;1;6096;0
WireConnection;3069;0;6092;0
WireConnection;3069;2;3075;0
WireConnection;6102;0;3079;0
WireConnection;6062;0;6102;0
WireConnection;6062;1;6060;0
WireConnection;6103;0;3482;0
WireConnection;6103;1;6109;0
WireConnection;6107;0;3482;0
WireConnection;6109;0;6105;0
WireConnection;6104;0;6108;0
WireConnection;6108;0;6107;0
WireConnection;6105;0;6110;0
WireConnection;6096;0;6071;0
WireConnection;6096;2;3075;0
WireConnection;6110;0;6104;0
WireConnection;5926;0;5912;0
WireConnection;5927;0;5926;0
WireConnection;6206;0;5985;0
WireConnection;4933;0;6314;0
WireConnection;971;0;4933;0
WireConnection;6004;0;5202;0
WireConnection;6004;1;6013;0
WireConnection;6004;2;6164;0
WireConnection;6004;7;5202;1
WireConnection;5203;0;5202;0
WireConnection;5203;1;6012;0
WireConnection;5203;2;6164;0
WireConnection;5203;7;5202;1
WireConnection;6011;0;6004;2
WireConnection;6009;0;5203;2
WireConnection;6008;0;6009;0
WireConnection;6008;1;6011;0
WireConnection;6050;0;5203;0
WireConnection;6049;0;6051;0
WireConnection;6049;2;6007;0
WireConnection;6049;3;6050;0
WireConnection;6049;4;6050;0
WireConnection;6007;0;5203;1
WireConnection;6007;1;6008;0
WireConnection;6007;2;6004;3
WireConnection;5306;0;5239;0
WireConnection;5239;0;5230;0
WireConnection;5248;0;6042;0
WireConnection;5246;0;5247;0
WireConnection;5246;2;5248;0
WireConnection;5454;0;5457;0
WireConnection;5457;0;5246;0
WireConnection;5237;0;5236;0
WireConnection;6012;0;5235;0
WireConnection;6012;1;6016;0
WireConnection;6013;0;5235;0
WireConnection;6013;1;6015;0
WireConnection;6016;0;6014;0
WireConnection;6016;2;6018;0
WireConnection;5235;0;5237;0
WireConnection;5235;1;5206;0
WireConnection;6018;0;6017;0
WireConnection;5456;0;5454;0
WireConnection;6166;0;5456;0
WireConnection;6166;1;6145;0
WireConnection;6015;0;6014;0
WireConnection;6015;2;6018;0
WireConnection;4808;0;6103;0
WireConnection;701;0;4932;0
WireConnection;701;1;4931;0
WireConnection;4931;0;5906;0
WireConnection;4747;0;4744;0
WireConnection;4747;1;4749;0
WireConnection;4746;0;4747;0
WireConnection;5242;0;4746;0
WireConnection;5242;1;5243;0
WireConnection;5908;0;5242;0
WireConnection;5908;1;5907;0
WireConnection;5831;0;5242;0
WireConnection;5831;1;5830;0
WireConnection;5906;0;5833;0
WireConnection;5906;2;5908;0
WireConnection;5906;3;5831;0
WireConnection;5906;4;5242;0
WireConnection;5243;0;5241;0
WireConnection;5907;0;5830;0
WireConnection;5309;0;6046;0
WireConnection;5214;0;5211;0
WireConnection;5214;2;5309;0
WireConnection;5214;3;5212;0
WireConnection;5227;0;5212;0
WireConnection;5212;1;5229;0
WireConnection;5212;2;5216;0
WireConnection;5229;0;5306;0
WireConnection;5229;1;6049;0
WireConnection;4188;0;4178;0
WireConnection;4191;0;4188;0
WireConnection;4191;1;4177;0
WireConnection;5274;0;4188;0
WireConnection;4159;0;3179;0
WireConnection;4159;1;4191;0
WireConnection;6197;0;6211;0
WireConnection;4749;0;4748;0
WireConnection;4744;0;4337;0
WireConnection;4744;1;4745;0
WireConnection;4337;0;4336;0
WireConnection;4337;1;5210;0
WireConnection;4350;1;3182;0
WireConnection;5216;0;4350;0
WireConnection;6030;0;6022;0
WireConnection;6030;1;6194;0
WireConnection;6030;2;6035;0
WireConnection;6031;0;3174;0
WireConnection;6032;0;6030;0
WireConnection;5210;0;5215;0
WireConnection;5210;2;5227;0
WireConnection;5210;3;5214;0
WireConnection;5210;4;6044;0
WireConnection;6026;0;6031;0
WireConnection;6026;1;6025;0
WireConnection;6026;2;6032;2
WireConnection;6025;0;6024;0
WireConnection;6025;1;6023;0
WireConnection;6023;0;6032;1
WireConnection;6024;0;6031;1
WireConnection;6046;0;6047;0
WireConnection;6047;0;6044;0
WireConnection;6044;0;6097;0
WireConnection;6044;2;6026;0
WireConnection;6044;3;3174;0
WireConnection;6044;4;3174;0
WireConnection;3174;0;6021;0
WireConnection;3174;1;6194;0
WireConnection;3174;2;6209;0
WireConnection;6196;0;4159;0
WireConnection;4181;0;4178;0
WireConnection;4181;3;5986;0
WireConnection;4181;4;4195;0
WireConnection;4177;0;4181;0
WireConnection;4189;0;4181;0
WireConnection;4189;1;5274;0
WireConnection;4785;0;4189;0
WireConnection;6042;0;4159;0
WireConnection;5986;0;4155;0
WireConnection;5986;1;5988;0
WireConnection;4155;0;4154;0
WireConnection;4154;0;4185;0
WireConnection;4154;1;4156;0
WireConnection;5988;1;5991;0
WireConnection;5988;0;5990;0
WireConnection;5990;0;6206;0
WireConnection;5985;0;5989;0
WireConnection;5985;1;5993;1
WireConnection;5985;2;5993;2
WireConnection;5985;3;5993;3
WireConnection;4150;0;4149;0
WireConnection;4149;0;6313;0
WireConnection;4149;1;4854;0
WireConnection;4152;0;4151;0
WireConnection;4152;2;4150;0
WireConnection;4152;3;4149;0
WireConnection;6150;0;6144;0
WireConnection;4185;0;6150;0
WireConnection;4187;0;4152;0
WireConnection;6144;0;4187;0
WireConnection;838;0;837;0
WireConnection;3491;0;2905;0
WireConnection;3491;3;3521;0
WireConnection;3491;4;3520;0
WireConnection;3520;21;967;0
WireConnection;3520;27;1928;0
WireConnection;4174;0;4176;0
WireConnection;4176;0;4192;0
WireConnection;5458;0;4196;0
WireConnection;5458;2;5865;0
WireConnection;6204;0;5458;0
WireConnection;6204;1;6205;0
WireConnection;4196;0;4174;0
WireConnection;2900;0;2899;0
WireConnection;2900;1;3491;0
WireConnection;2900;2;6213;0
WireConnection;2900;7;2899;1
WireConnection;817;0;2900;0
WireConnection;4728;0;1920;0
WireConnection;4728;1;4727;0
WireConnection;690;0;691;0
WireConnection;690;1;838;0
WireConnection;690;2;4728;0
WireConnection;690;3;6249;0
WireConnection;4932;0;4340;0
WireConnection;4340;1;3489;0
WireConnection;4340;2;6207;0
WireConnection;6207;0;824;0
WireConnection;1921;0;1919;0
WireConnection;6021;0;3177;0
WireConnection;6021;1;6020;0
WireConnection;6020;0;6028;0
WireConnection;6020;2;6098;0
WireConnection;6019;0;6028;0
WireConnection;6019;2;6098;0
WireConnection;6022;0;3177;0
WireConnection;6022;1;6019;0
WireConnection;6194;1;6210;0
WireConnection;6194;0;6218;0
WireConnection;6209;0;6034;0
WireConnection;6035;0;4350;0
WireConnection;6034;0;4350;0
WireConnection;6210;0;6196;0
WireConnection;6195;0;4159;0
WireConnection;6211;0;6195;0
WireConnection;6213;1;5458;0
WireConnection;6213;0;6204;0
WireConnection;4929;1;1994;0
WireConnection;4929;0;3500;0
WireConnection;4916;1;5196;0
WireConnection;4916;0;2163;0
WireConnection;6164;1;5456;0
WireConnection;6164;0;6166;0
WireConnection;6214;2;6199;0
WireConnection;6218;0;6197;0
WireConnection;6218;1;6201;0
WireConnection;6193;1;6201;0
WireConnection;4856;0;3702;0
WireConnection;4856;1;4857;0
WireConnection;4979;0;4856;0
WireConnection;4979;1;5883;0
WireConnection;5883;0;4855;1
WireConnection;3705;0;4979;0
WireConnection;3694;0;3705;0
WireConnection;3694;1;5884;0
WireConnection;3724;0;3721;0
WireConnection;4982;0;3724;0
WireConnection;4983;0;4982;0
WireConnection;3721;0;3694;0
WireConnection;3721;2;4855;3
WireConnection;3702;0;5876;0
WireConnection;3702;1;4858;0
WireConnection;5884;0;4855;2
WireConnection;6221;0;6220;0
WireConnection;6221;1;6222;0
WireConnection;6222;0;6231;1
WireConnection;6223;0;6221;0
WireConnection;6224;0;6223;0
WireConnection;6224;1;6230;0
WireConnection;6225;0;6228;0
WireConnection;6228;0;6224;0
WireConnection;6228;2;6231;3
WireConnection;6229;0;6235;0
WireConnection;6229;1;6234;0
WireConnection;6230;0;6231;2
WireConnection;6220;0;6229;0
WireConnection;6226;0;6225;0
WireConnection;6227;0;6226;0
WireConnection;1276;0;3796;0
WireConnection;1920;0;817;0
WireConnection;1920;1;1921;0
WireConnection;3270;0;1777;0
WireConnection;6249;0;6248;0
WireConnection;6249;1;6250;0
WireConnection;3104;0;690;0
WireConnection;3104;1;3103;0
WireConnection;3489;0;3101;0
WireConnection;3489;3;3104;0
WireConnection;3489;4;690;0
WireConnection;2294;0;554;0
WireConnection;3493;0;2225;0
WireConnection;3493;3;5878;0
WireConnection;3493;4;1909;0
WireConnection;2237;0;3493;0
WireConnection;2237;1;2219;0
WireConnection;6252;0;6251;0
WireConnection;6252;1;551;0
WireConnection;5912;0;6253;0
WireConnection;5912;1;5909;0
WireConnection;6253;0;5910;0
WireConnection;5920;0;5910;0
WireConnection;3521;9;2898;0
WireConnection;3521;45;1928;0
WireConnection;551;0;1783;0
WireConnection;551;1;1051;0
WireConnection;6259;0;6260;0
WireConnection;5933;0;6263;0
WireConnection;5933;1;5934;0
WireConnection;5393;0;5933;0
WireConnection;5393;1;6257;0
WireConnection;5934;0;5932;0
WireConnection;6257;0;5400;0
WireConnection;5928;0;5933;0
WireConnection;5928;1;6261;0
WireConnection;5928;2;6283;0
WireConnection;6260;0;5928;0
WireConnection;6261;0;6262;0
WireConnection;6262;0;5393;0
WireConnection;6271;0;5398;0
WireConnection;805;0;327;0
WireConnection;4853;0;4816;0
WireConnection;6112;0;6132;0
WireConnection;6112;1;6111;0
WireConnection;6132;0;4849;0
WireConnection;6132;1;6111;0
WireConnection;4849;0;4853;0
WireConnection;462;0;6275;0
WireConnection;462;1;4847;0
WireConnection;4245;0;6274;0
WireConnection;4245;1;5955;0
WireConnection;4245;2;4241;0
WireConnection;4246;0;462;0
WireConnection;4246;1;4245;0
WireConnection;6274;0;6277;0
WireConnection;6275;0;6279;0
WireConnection;808;0;328;0
WireConnection;4679;0;328;4
WireConnection;450;0;6272;0
WireConnection;450;1;4246;0
WireConnection;450;2;461;0
WireConnection;4317;0;450;0
WireConnection;4317;2;6112;0
WireConnection;6279;0;6272;0
WireConnection;6277;0;6272;0
WireConnection;328;1;4891;0
WireConnection;6272;0;808;0
WireConnection;6272;1;6273;0
WireConnection;5253;0;2957;0
WireConnection;5253;1;5191;0
WireConnection;5253;5;4352;0
WireConnection;5253;7;2957;1
WireConnection;5696;1;5712;0
WireConnection;5696;0;5713;0
WireConnection;5198;4;3430;0
WireConnection;5198;1;5810;0
WireConnection;5198;48;5810;1
WireConnection;5198;28;4167;0
WireConnection;5770;0;5722;1
WireConnection;5770;1;5740;0
WireConnection;5769;0;5722;0
WireConnection;5769;1;5726;0
WireConnection;5769;2;5741;0
WireConnection;5769;3;5770;0
WireConnection;5724;0;5775;0
WireConnection;5724;1;5769;0
WireConnection;5776;0;5724;0
WireConnection;5776;2;5777;0
WireConnection;5722;0;5704;2
WireConnection;5773;0;5722;0
WireConnection;5774;0;5773;0
WireConnection;5774;1;5726;0
WireConnection;5775;0;5728;0
WireConnection;5775;2;5722;0
WireConnection;5775;3;5774;0
WireConnection;5741;0;5722;1
WireConnection;5741;1;5740;0
WireConnection;5704;1;5696;0
WireConnection;5704;2;5684;0
WireConnection;5799;3;6280;0
WireConnection;5799;16;4666;0
WireConnection;4436;0;1430;0
WireConnection;1430;0;1923;0
WireConnection;1430;1;3144;0
WireConnection;1430;2;5871;0
WireConnection;1923;0;470;0
WireConnection;1923;3;5799;0
WireConnection;6280;1;5314;0
WireConnection;6280;0;6281;0
WireConnection;5551;0;5844;0
WireConnection;5551;2;5552;0
WireConnection;6282;1;5551;0
WireConnection;6282;0;6281;0
WireConnection;3144;0;6282;0
WireConnection;3144;1;3478;0
WireConnection;3144;2;4144;0
WireConnection;5871;0;5872;0
WireConnection;1783;0;2237;0
WireConnection;6283;0;5912;0
WireConnection;6099;0;5909;0
WireConnection;6099;3;5912;0
WireConnection;5400;0;6263;0
WireConnection;5400;2;6266;0
WireConnection;5398;1;5395;0
WireConnection;5395;0;5921;0
WireConnection;5395;2;5912;0
WireConnection;6268;0;2236;0
WireConnection;5921;0;546;0
WireConnection;5921;1;5927;0
WireConnection;2236;1;5921;0
WireConnection;1235;0;430;0
WireConnection;602;1;5251;0
WireConnection;602;2;5349;0
WireConnection;5240;0;5357;0
WireConnection;5240;1;5359;0
WireConnection;1234;0;602;0
WireConnection;6263;0;545;0
WireConnection;6266;0;5082;0
WireConnection;6266;1;6271;0
WireConnection;545;0;5082;0
WireConnection;545;1;6268;0
WireConnection;5910;0;4160;0
WireConnection;5910;1;5909;0
WireConnection;5082;0;6252;0
WireConnection;5297;0;6308;0
WireConnection;5297;1;5298;0
WireConnection;5304;0;5297;0
WireConnection;5304;1;5303;0
WireConnection;696;0;4346;0
WireConnection;696;1;6312;0
WireConnection;696;2;5304;0
WireConnection;5292;0;696;0
WireConnection;5292;1;5291;0
WireConnection;4345;0;5292;0
WireConnection;4345;1;4344;0
WireConnection;4807;0;4808;0
WireConnection;4809;0;701;0
WireConnection;5459;0;4345;0
WireConnection;3251;0;4807;0
WireConnection;3251;1;4809;0
WireConnection;560;1;3251;0
WireConnection;560;2;6236;0
WireConnection;5299;0;696;0
WireConnection;5299;2;5297;0
WireConnection;983;0;560;0
WireConnection;5303;0;5298;0
WireConnection;6236;0;5459;0
WireConnection;6236;1;6227;0
WireConnection;2984;0;5810;0
WireConnection;2984;1;3430;0
WireConnection;2984;7;5810;1
WireConnection;4923;1;2984;0
WireConnection;4923;0;5198;0
WireConnection;3262;1;6311;0
WireConnection;3262;2;3263;0
WireConnection;4801;0;4802;0
WireConnection;4801;3;3262;0
WireConnection;4801;4;4803;0
WireConnection;4804;0;4801;0
WireConnection;6291;0;6294;0
WireConnection;4203;0;5375;0
WireConnection;4203;1;5944;0
WireConnection;5941;0;5939;0
WireConnection;5941;2;6310;0
WireConnection;5941;3;5940;0
WireConnection;5940;0;6310;0
WireConnection;5375;0;5945;0
WireConnection;5375;1;5947;0
WireConnection;5375;2;5373;0
WireConnection;5947;0;5941;0
WireConnection;5947;1;5948;0
WireConnection;6293;0;6292;0
WireConnection;6294;0;4203;0
WireConnection;6292;0;4203;0
WireConnection;5945;0;5374;0
WireConnection;5944;0;4202;0
WireConnection;695;1;5294;0
WireConnection;5296;1;5295;0
WireConnection;3059;0;4302;0
WireConnection;3059;1;5866;0
WireConnection;3059;7;4302;1
WireConnection;5366;1;4197;0
WireConnection;5366;0;5368;0
WireConnection;4148;1;5366;0
WireConnection;5545;0;5845;0
WireConnection;5545;7;5845;1
WireConnection;6308;5;6287;0
WireConnection;6308;1;5296;0
WireConnection;6309;5;6289;0
WireConnection;6309;1;3109;0
WireConnection;6310;5;6295;0
WireConnection;6310;1;3059;0
WireConnection;6311;5;6297;0
WireConnection;6311;1;3059;0
WireConnection;6312;5;6284;0
WireConnection;6312;1;695;0
WireConnection;6313;5;6299;0
WireConnection;6313;1;4148;0
WireConnection;6315;5;6304;0
WireConnection;6315;1;5857;0
WireConnection;6316;5;6306;0
WireConnection;6316;1;5545;0
WireConnection;6314;97;3582;0
WireConnection;6314;156;3943;0
WireConnection;6318;60;4207;0
ASEEND*/
//CHKSM=0B4F327E1F80E5D846729CC8AA003F623322CE5D
