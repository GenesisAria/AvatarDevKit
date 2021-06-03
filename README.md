# Avatar Devepolment Kit
	Aria's Avatar Development Kit for VRChat - utilities, shaders, resources


# Aria's VertexLit Toon
A quick informal rundown of features:

– First off, the entire shader is **vextex-lit ONLY**.  This means there are no extra passes on the shader, notably reducing render cost, and allowing more control over the received light.
There are some compromises made here, most apparent will be the incapability of receiving cookied light data from spot and point light sources – a workaround is to use projectors instead.  The lighting will behave somewhat differently from a more standard lighting model, due to hacks needed in order to work with unity's, imperfect vertex lighting system.  I have also implemented some unique behaviours, such as rotation of shading proportionally based on the colour/intensity of light sources.\
– This lighting system also consists of a number of configurable behaviours for control/limitation of received light and light saturation, which is beneficial for compensating for nonsensical lighting setups in open or semi-open development platforms such as VRChat.

VRChat specific features:
- force shader-blockage fallback to doublesided (cull off)
- shader-blockage fallback cutout visible or invisible (_cutoff=2)
- friends-only system, allowing only friends to see or not see materials rendered (use in conjunction with fallback visibility if needed – requires a camera and low resolution rendertexture; make camera culling mask nothing and clear to solid colour white, minimize all settings for performance)


General features:

**Alpha to coverage** – a very nice system for optimized transparency, which can dither the alpha channel in opaque materials in a way that can be anti-aliased to being less noticeable.  [Now works the same on nVidia, credit to lukis.](https://github.com/lukis101/VRCUnityStuffs/blob/master/Shaders/DJL/A2C-Custom.shader)

**Shading** – uses a basic ramp created from the dot product of light direction (biased) and normals, with plenty of configurability.  Includes mask for lighting.  It also has a separate soft shading system which uses light and view directions to add definition.

**Main texture** – has hue and saturation adjustments, as well as a supersampled override for combatting aliasing, built using [Ben Golus's guide](https://bgolus.medium.com/sharper-mipmapping-using-shader-based-supersampling-ed7aadb47bec).  This is one of the more expensive aspects of this shader, use sparingly.

**Emission** – goes without saying. Also includes an ability to include the shading into the emission to control it's brightness in light vs dark more finely.

**Normal map** – has strength sliders for every aspect of the shader that uses normal maps.  I have also implemented an optional system for biasing the normal map's strength based on distance from the surface, to make them more visible at range (0=off).  Includes mask.\
– Has supersampling system built using [Ben Golus's guide](https://bgolus.medium.com/sharper-mipmapping-using-shader-based-supersampling-ed7aadb47bec).  This is most beneficial for normal maps with fine detail that alias heavily, supersampling can counteract this.  This is one of the more expensive aspects of this shader, use sparingly.

**Specularity** – includes blinn-phong specular, and **specular matcap**, both can be set between additive or pre-multiplicative to incorporate the colour of the surface before adding.  Matcaps include option to use either [Xiexe's](https://github.com/Xiexe) world-up singularity system, or the legacy mode for UnityChanToonShader2's [view direction corrected version of traditional matcaps](https://twitter.com/kanihira/status/1061448868221480960), as well as a stereo-convergence option to “flatten” it to the surface instead of a shiny depth effect given in vr/3d.  Includes a mask for all specular.

**Reflection probe** – basic implementation of reflection probes.

**Fake subsurface light** – uses negative view direction and normal direction to imitate the impression of subsurface scattering on standard render pipeline.  Behaves like a rimlight except only if the light source is opposite your view.

**Glitter/Shimmer** – because shiny things are awesome.  Has a semi-complex system for calculating sparkles based on the double-overlap of a texture.  Effect will vary drastically depending on texture used.  One is static to the surface, one is offset based on view and world position.  Can animate offset.  Includes mask.\
– Has supersampling system built using [Ben Golus's guide](https://bgolus.medium.com/sharper-mipmapping-using-shader-based-supersampling-ed7aadb47bec).  This is one of the more expensive aspects of this shader, use sparingly.

**Rim fresnel effect** – can be used for rim lighting or rim darkening, includes multiple blend modes.

**Hard matcap** – this is for strictly non-additive matcaps.  Has the ability to the matcap texture for effect.\
Matcaps include option to use either [Xiexe's](https://github.com/Xiexe) world-up singularity system, or the legacy mode for UnityChanToonShader2's [view direction corrected version of traditional matcaps](https://twitter.com/kanihira/status/1061448868221480960), as well as a stereo-convergence option to “flatten” it to the surface instead of a shiny depth effect given in vr/3d.  Includes mask.

**Parallax map** – using a simple parallax for a single texture to make it appear closer or farther from the surface. Includes mask.

**Mirror system** – a simple compare function to determine if the material is being rendered in a camera or not, for which mirror renders do not flag as cameras.  Mostly a toy, though can be used to mitigate some mirror-specific issues by showing a separate material in the mirror.

**Advanced**\
Allows for adjustment of ZWrite, ZTest and full control over the Stencil buffer.

<br />

**※ This shader does not include variants for fade, transparent etc at this time.  Use the advanced → debug section to override blend modes, or use alpha to coverage.**\
Uses `Fallback "Legacy Shaders/Transparent/Cutout/VertexLit"` for shadow casting and depth until i develop my own Shadowcaster.

<br /><br />

You are free to manipulate, extract from, and learn from my shader work as you please, and to this end, all shader functions and node graphs for Amplify Shader Editor are provided.  Note: some shaders will have dependant functions, needing their appropriate function nodes in order to use the graph without errors.

<br />

～
Thanks to the great help of the people in the VRC Shader Development and Amplify Technology discords, as well as my friend Kilerbomb, in making some of the core systems of my shader work.
