// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:1,bsrc:0,bdst:1,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:_AriaBlurGrab,coma:15,ufog:False,aust:False,igpj:False,qofs:1000,qpre:4,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:35795,y:33827,varname:node_3138,prsc:2|custl-8641-OUT,clip-4805-OUT;n:type:ShaderForge.SFN_ValueProperty,id:880,x:30574,y:34824,ptovrint:False,ptlb:Blur Size,ptin:_BlurSize,varname:node_880,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Lerp,id:1612,x:33687,y:32567,varname:node_1612,prsc:2|A-4475-RGB,B-3807-RGB,T-8157-OUT;n:type:ShaderForge.SFN_Lerp,id:2781,x:33687,y:32954,varname:node_2781,prsc:2|A-4218-RGB,B-7133-OUT,T-4821-OUT;n:type:ShaderForge.SFN_Lerp,id:7133,x:33687,y:32754,varname:node_7133,prsc:2|A-702-RGB,B-1612-OUT,T-6301-OUT;n:type:ShaderForge.SFN_Lerp,id:9457,x:34004,y:33346,varname:node_9457,prsc:2|A-2781-OUT,B-2455-OUT,T-9462-OUT;n:type:ShaderForge.SFN_Vector1,id:9462,x:34023,y:33553,varname:node_9462,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:3569,x:32819,y:32546,varname:node_3569,prsc:2|A-9103-U,B-1924-OUT;n:type:ShaderForge.SFN_Add,id:8216,x:32819,y:32677,varname:node_8216,prsc:2|A-9103-U,B-2480-OUT;n:type:ShaderForge.SFN_Add,id:2478,x:32819,y:32828,varname:node_2478,prsc:2|A-9103-U,B-1560-OUT;n:type:ShaderForge.SFN_Add,id:6381,x:32819,y:32959,varname:node_6381,prsc:2|A-9103-U,B-1359-OUT;n:type:ShaderForge.SFN_SceneColor,id:3807,x:33417,y:32542,varname:node_3807,prsc:2|UVIN-6304-OUT;n:type:ShaderForge.SFN_SceneColor,id:4475,x:33411,y:32678,varname:node_4475,prsc:2|UVIN-8130-OUT;n:type:ShaderForge.SFN_SceneColor,id:4218,x:33411,y:32971,varname:node_4218,prsc:2|UVIN-5862-OUT;n:type:ShaderForge.SFN_SceneColor,id:702,x:33411,y:32832,varname:node_702,prsc:2|UVIN-1441-OUT;n:type:ShaderForge.SFN_SceneColor,id:9853,x:33410,y:33240,varname:node_9853,prsc:2|UVIN-6155-OUT;n:type:ShaderForge.SFN_SceneColor,id:204,x:33410,y:33530,varname:node_204,prsc:2|UVIN-1911-OUT;n:type:ShaderForge.SFN_SceneColor,id:9226,x:33410,y:33396,varname:node_9226,prsc:2|UVIN-5501-OUT;n:type:ShaderForge.SFN_SceneColor,id:9277,x:33410,y:33680,varname:node_9277,prsc:2|UVIN-2451-OUT;n:type:ShaderForge.SFN_Multiply,id:1924,x:30969,y:34958,varname:node_1924,prsc:2|A-7365-W,B-880-OUT,C-5630-OUT;n:type:ShaderForge.SFN_Multiply,id:2480,x:31073,y:34791,varname:node_2480,prsc:2|A-7365-Z,B-880-OUT,C-5630-OUT;n:type:ShaderForge.SFN_Multiply,id:1560,x:31221,y:34648,varname:node_1560,prsc:2|A-7365-Y,B-880-OUT,C-5630-OUT;n:type:ShaderForge.SFN_Multiply,id:1359,x:31399,y:34527,varname:node_1359,prsc:2|A-7365-X,B-880-OUT,C-5630-OUT;n:type:ShaderForge.SFN_Add,id:6615,x:33007,y:33926,varname:node_6615,prsc:2|A-9103-V,B-1924-OUT;n:type:ShaderForge.SFN_Add,id:4865,x:33007,y:34068,varname:node_4865,prsc:2|A-9103-V,B-2480-OUT;n:type:ShaderForge.SFN_Add,id:1470,x:33007,y:34209,varname:node_1470,prsc:2|A-9103-V,B-1560-OUT;n:type:ShaderForge.SFN_Add,id:14,x:33007,y:34354,varname:node_14,prsc:2|A-9103-V,B-1359-OUT;n:type:ShaderForge.SFN_Append,id:6304,x:33168,y:32536,varname:node_6304,prsc:2|A-3569-OUT,B-7884-OUT;n:type:ShaderForge.SFN_Append,id:8130,x:33168,y:32681,varname:node_8130,prsc:2|A-8216-OUT,B-7966-OUT;n:type:ShaderForge.SFN_Append,id:5862,x:33168,y:32961,varname:node_5862,prsc:2|A-6381-OUT,B-4609-OUT;n:type:ShaderForge.SFN_Append,id:1441,x:33168,y:32816,varname:node_1441,prsc:2|A-2478-OUT,B-3642-OUT;n:type:ShaderForge.SFN_Append,id:1911,x:33168,y:33523,varname:node_1911,prsc:2|A-4213-OUT,B-1468-OUT;n:type:ShaderForge.SFN_Append,id:5501,x:33168,y:33378,varname:node_5501,prsc:2|A-1703-OUT,B-8345-OUT;n:type:ShaderForge.SFN_Append,id:6155,x:33168,y:33242,varname:node_6155,prsc:2|A-8316-OUT,B-2729-OUT;n:type:ShaderForge.SFN_Append,id:2451,x:33168,y:33680,varname:node_2451,prsc:2|A-189-OUT,B-6412-OUT;n:type:ShaderForge.SFN_SceneColor,id:6604,x:32919,y:33134,varname:node_6604,prsc:2|UVIN-9103-UVOUT;n:type:ShaderForge.SFN_ScreenPos,id:9103,x:32479,y:34410,varname:node_9103,prsc:2,sctp:2;n:type:ShaderForge.SFN_Subtract,id:4213,x:32811,y:33542,varname:node_4213,prsc:2|A-9103-U,B-2480-OUT;n:type:ShaderForge.SFN_Subtract,id:189,x:32811,y:33680,varname:node_189,prsc:2|A-9103-U,B-1924-OUT;n:type:ShaderForge.SFN_Append,id:9476,x:33180,y:34302,varname:node_9476,prsc:2|A-8526-OUT,B-14-OUT;n:type:ShaderForge.SFN_Append,id:9412,x:33180,y:34157,varname:node_9412,prsc:2|A-5947-OUT,B-1470-OUT;n:type:ShaderForge.SFN_Append,id:8798,x:33180,y:34022,varname:node_8798,prsc:2|A-9214-OUT,B-4865-OUT;n:type:ShaderForge.SFN_Subtract,id:1703,x:32817,y:33381,varname:node_1703,prsc:2|A-9103-U,B-1560-OUT;n:type:ShaderForge.SFN_Subtract,id:8316,x:32817,y:33248,varname:node_8316,prsc:2|A-9103-U,B-1359-OUT;n:type:ShaderForge.SFN_Append,id:9634,x:33180,y:33877,varname:node_9634,prsc:2|A-3662-OUT,B-6615-OUT;n:type:ShaderForge.SFN_SceneColor,id:678,x:33429,y:33883,varname:node_678,prsc:2|UVIN-9634-OUT;n:type:ShaderForge.SFN_SceneColor,id:6988,x:33423,y:34019,varname:node_6988,prsc:2|UVIN-8798-OUT;n:type:ShaderForge.SFN_SceneColor,id:2962,x:33423,y:34173,varname:node_2962,prsc:2|UVIN-9412-OUT;n:type:ShaderForge.SFN_SceneColor,id:4585,x:33423,y:34312,varname:node_4585,prsc:2|UVIN-9476-OUT;n:type:ShaderForge.SFN_Lerp,id:3285,x:34510,y:34151,varname:node_3285,prsc:2|A-5148-OUT,B-559-OUT,T-7280-OUT;n:type:ShaderForge.SFN_Vector1,id:7280,x:34179,y:34273,varname:node_7280,prsc:2,v1:0.5;n:type:ShaderForge.SFN_SceneColor,id:2927,x:33422,y:34581,varname:node_2927,prsc:2|UVIN-7369-OUT;n:type:ShaderForge.SFN_SceneColor,id:126,x:33422,y:34737,varname:node_126,prsc:2|UVIN-2158-OUT;n:type:ShaderForge.SFN_SceneColor,id:8367,x:33422,y:34871,varname:node_8367,prsc:2|UVIN-6015-OUT;n:type:ShaderForge.SFN_SceneColor,id:4601,x:33422,y:35021,varname:node_4601,prsc:2|UVIN-4971-OUT;n:type:ShaderForge.SFN_Append,id:4971,x:33180,y:35021,varname:node_4971,prsc:2|A-6572-OUT,B-3340-OUT;n:type:ShaderForge.SFN_Append,id:6015,x:33180,y:34864,varname:node_6015,prsc:2|A-7397-OUT,B-4089-OUT;n:type:ShaderForge.SFN_Append,id:2158,x:33180,y:34719,varname:node_2158,prsc:2|A-9988-OUT,B-8661-OUT;n:type:ShaderForge.SFN_Append,id:7369,x:33180,y:34583,varname:node_7369,prsc:2|A-2152-OUT,B-6863-OUT;n:type:ShaderForge.SFN_Subtract,id:3340,x:32986,y:35047,varname:node_3340,prsc:2|A-9103-V,B-1924-OUT;n:type:ShaderForge.SFN_Subtract,id:4089,x:32986,y:34917,varname:node_4089,prsc:2|A-9103-V,B-2480-OUT;n:type:ShaderForge.SFN_Subtract,id:8661,x:32986,y:34780,varname:node_8661,prsc:2|A-9103-V,B-1560-OUT;n:type:ShaderForge.SFN_Subtract,id:6863,x:32986,y:34631,varname:node_6863,prsc:2|A-9103-V,B-1359-OUT;n:type:ShaderForge.SFN_Lerp,id:9333,x:34726,y:33254,varname:node_9333,prsc:2|A-6604-RGB,B-782-OUT,T-9778-OUT;n:type:ShaderForge.SFN_Add,id:7884,x:33003,y:32597,varname:node_7884,prsc:2|A-9103-V,B-1924-OUT;n:type:ShaderForge.SFN_Add,id:7966,x:33003,y:32728,varname:node_7966,prsc:2|A-9103-V,B-2480-OUT;n:type:ShaderForge.SFN_Add,id:3642,x:33003,y:32879,varname:node_3642,prsc:2|A-9103-V,B-1560-OUT;n:type:ShaderForge.SFN_Add,id:4609,x:33003,y:33010,varname:node_4609,prsc:2|A-9103-V,B-1359-OUT;n:type:ShaderForge.SFN_Add,id:2152,x:32820,y:34592,varname:node_2152,prsc:2|A-9103-U,B-1359-OUT;n:type:ShaderForge.SFN_Add,id:9988,x:32820,y:34723,varname:node_9988,prsc:2|A-9103-U,B-1560-OUT;n:type:ShaderForge.SFN_Add,id:7397,x:32820,y:34874,varname:node_7397,prsc:2|A-9103-U,B-2480-OUT;n:type:ShaderForge.SFN_Add,id:6572,x:32820,y:35005,varname:node_6572,prsc:2|A-9103-U,B-1924-OUT;n:type:ShaderForge.SFN_Subtract,id:2729,x:33001,y:33295,varname:node_2729,prsc:2|A-9103-V,B-1359-OUT;n:type:ShaderForge.SFN_Subtract,id:8345,x:33001,y:33428,varname:node_8345,prsc:2|A-9103-V,B-1560-OUT;n:type:ShaderForge.SFN_Subtract,id:1468,x:32995,y:33589,varname:node_1468,prsc:2|A-9103-V,B-2480-OUT;n:type:ShaderForge.SFN_Subtract,id:6412,x:32995,y:33727,varname:node_6412,prsc:2|A-9103-V,B-1924-OUT;n:type:ShaderForge.SFN_Subtract,id:3662,x:32824,y:33893,varname:node_3662,prsc:2|A-9103-U,B-1924-OUT;n:type:ShaderForge.SFN_Subtract,id:9214,x:32824,y:34026,varname:node_9214,prsc:2|A-9103-U,B-2480-OUT;n:type:ShaderForge.SFN_Subtract,id:5947,x:32818,y:34187,varname:node_5947,prsc:2|A-9103-U,B-1560-OUT;n:type:ShaderForge.SFN_Subtract,id:8526,x:32818,y:34325,varname:node_8526,prsc:2|A-9103-U,B-1359-OUT;n:type:ShaderForge.SFN_Blend,id:3827,x:34437,y:33284,varname:node_3827,prsc:2,blmd:5,clmp:False|SRC-6604-RGB,DST-782-OUT;n:type:ShaderForge.SFN_Vector4Property,id:7365,x:30574,y:34578,ptovrint:False,ptlb:Step Distances,ptin:_StepDistances,varname:node_7365,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.03,v2:0.04,v3:0.05,v4:0.06;n:type:ShaderForge.SFN_Append,id:8910,x:33218,y:35248,varname:node_8910,prsc:2|A-9103-U,B-5895-OUT;n:type:ShaderForge.SFN_Add,id:5895,x:33018,y:35261,varname:node_5895,prsc:2|A-9103-V,B-1671-OUT;n:type:ShaderForge.SFN_Subtract,id:9780,x:33018,y:36016,varname:node_9780,prsc:2|A-9103-V,B-9468-OUT;n:type:ShaderForge.SFN_Append,id:8025,x:33218,y:35392,varname:node_8025,prsc:2|A-9103-U,B-2636-OUT;n:type:ShaderForge.SFN_Add,id:7377,x:33018,y:35551,varname:node_7377,prsc:2|A-9103-V,B-1327-OUT;n:type:ShaderForge.SFN_Append,id:1625,x:33224,y:35695,varname:node_1625,prsc:2|A-9103-U,B-1872-OUT;n:type:ShaderForge.SFN_Append,id:3437,x:33224,y:35551,varname:node_3437,prsc:2|A-9103-U,B-7377-OUT;n:type:ShaderForge.SFN_SceneColor,id:1860,x:33431,y:35261,varname:node_1860,prsc:2|UVIN-8910-OUT;n:type:ShaderForge.SFN_SceneColor,id:8291,x:33425,y:35397,varname:node_8291,prsc:2|UVIN-8025-OUT;n:type:ShaderForge.SFN_SceneColor,id:6475,x:33425,y:35551,varname:node_6475,prsc:2|UVIN-3437-OUT;n:type:ShaderForge.SFN_SceneColor,id:508,x:33425,y:35690,varname:node_508,prsc:2|UVIN-1625-OUT;n:type:ShaderForge.SFN_Subtract,id:4738,x:33018,y:35886,varname:node_4738,prsc:2|A-9103-V,B-7893-OUT;n:type:ShaderForge.SFN_Add,id:2636,x:33018,y:35407,varname:node_2636,prsc:2|A-9103-V,B-8714-OUT;n:type:ShaderForge.SFN_Add,id:1872,x:33018,y:35695,varname:node_1872,prsc:2|A-9103-V,B-1261-OUT;n:type:ShaderForge.SFN_Subtract,id:2542,x:33018,y:36153,varname:node_2542,prsc:2|A-9103-V,B-3450-OUT;n:type:ShaderForge.SFN_Subtract,id:4612,x:33018,y:36283,varname:node_4612,prsc:2|A-9103-V,B-8393-OUT;n:type:ShaderForge.SFN_Append,id:8196,x:33229,y:36318,varname:node_8196,prsc:2|A-9103-U,B-4612-OUT;n:type:ShaderForge.SFN_Append,id:781,x:33229,y:36174,varname:node_781,prsc:2|A-9103-U,B-2542-OUT;n:type:ShaderForge.SFN_Append,id:9292,x:33223,y:36015,varname:node_9292,prsc:2|A-9103-U,B-9780-OUT;n:type:ShaderForge.SFN_Append,id:1745,x:33223,y:35864,varname:node_1745,prsc:2|A-9103-U,B-4738-OUT;n:type:ShaderForge.SFN_SceneColor,id:3924,x:33436,y:35884,varname:node_3924,prsc:2|UVIN-1745-OUT;n:type:ShaderForge.SFN_SceneColor,id:2897,x:33430,y:36020,varname:node_2897,prsc:2|UVIN-9292-OUT;n:type:ShaderForge.SFN_SceneColor,id:5691,x:33430,y:36174,varname:node_5691,prsc:2|UVIN-781-OUT;n:type:ShaderForge.SFN_SceneColor,id:9879,x:33430,y:36313,varname:node_9879,prsc:2|UVIN-8196-OUT;n:type:ShaderForge.SFN_Lerp,id:782,x:34367,y:33512,varname:node_782,prsc:2|A-9457-OUT,B-3285-OUT,T-9462-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:8641,x:35056,y:33413,ptovrint:False,ptlb:Bloom Mode,ptin:_BloomMode,varname:node_8641,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9333-OUT,B-25-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1437,x:34221,y:33147,ptovrint:False,ptlb:Blur Strenth Unlocked,ptin:_BlurStrenthUnlocked,varname:node_1437,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Slider,id:2537,x:34143,y:33052,ptovrint:False,ptlb:Blur Strength,ptin:_BlurStrength,varname:node_2537,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_SwitchProperty,id:9778,x:34512,y:33095,ptovrint:False,ptlb:Unlock Blur Strength,ptin:_UnlockBlurStrength,varname:node_9778,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-2537-OUT,B-1437-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4056,x:34143,y:32783,ptovrint:False,ptlb:>Blend FarStep,ptin:_BlendFarStep,varname:node_4056,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_ValueProperty,id:5712,x:34143,y:32855,ptovrint:False,ptlb:>Blend MidStep,ptin:_BlendMidStep,varname:node_5712,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_ValueProperty,id:4816,x:34143,y:32929,ptovrint:False,ptlb:>Blend ShortStep,ptin:_BlendShortStep,varname:node_4816,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Set,id:1580,x:34361,y:32783,varname:FarStep,prsc:2|IN-4056-OUT;n:type:ShaderForge.SFN_Set,id:998,x:34361,y:32855,varname:MidStep,prsc:2|IN-5712-OUT;n:type:ShaderForge.SFN_Set,id:583,x:34361,y:32929,varname:ShortStep,prsc:2|IN-4816-OUT;n:type:ShaderForge.SFN_Get,id:8157,x:33687,y:32687,varname:node_8157,prsc:2|IN-1580-OUT;n:type:ShaderForge.SFN_Get,id:6301,x:33687,y:32881,varname:node_6301,prsc:2|IN-998-OUT;n:type:ShaderForge.SFN_Get,id:4821,x:33687,y:33077,varname:node_4821,prsc:2|IN-583-OUT;n:type:ShaderForge.SFN_Get,id:8643,x:33708,y:33399,varname:node_8643,prsc:2|IN-583-OUT;n:type:ShaderForge.SFN_Lerp,id:2455,x:33708,y:33276,varname:node_2455,prsc:2|A-9853-RGB,B-6495-OUT,T-8643-OUT;n:type:ShaderForge.SFN_Get,id:486,x:33708,y:33599,varname:node_486,prsc:2|IN-998-OUT;n:type:ShaderForge.SFN_Lerp,id:6495,x:33708,y:33472,varname:node_6495,prsc:2|A-9226-RGB,B-5980-OUT,T-486-OUT;n:type:ShaderForge.SFN_Get,id:4840,x:33708,y:33783,varname:node_4840,prsc:2|IN-1580-OUT;n:type:ShaderForge.SFN_Lerp,id:5980,x:33708,y:33663,varname:node_5980,prsc:2|A-204-RGB,B-9277-RGB,T-4840-OUT;n:type:ShaderForge.SFN_Get,id:3261,x:33729,y:34389,varname:node_3261,prsc:2|IN-583-OUT;n:type:ShaderForge.SFN_Lerp,id:1370,x:33729,y:34266,varname:node_1370,prsc:2|A-4585-RGB,B-6331-OUT,T-3261-OUT;n:type:ShaderForge.SFN_Get,id:8639,x:33729,y:34193,varname:node_8639,prsc:2|IN-998-OUT;n:type:ShaderForge.SFN_Lerp,id:6331,x:33729,y:34066,varname:node_6331,prsc:2|A-2962-RGB,B-5110-OUT,T-8639-OUT;n:type:ShaderForge.SFN_Get,id:106,x:33729,y:33999,varname:node_106,prsc:2|IN-1580-OUT;n:type:ShaderForge.SFN_Lerp,id:5110,x:33729,y:33879,varname:node_5110,prsc:2|A-6988-RGB,B-678-RGB,T-106-OUT;n:type:ShaderForge.SFN_Get,id:5449,x:33699,y:34676,varname:node_5449,prsc:2|IN-583-OUT;n:type:ShaderForge.SFN_Lerp,id:4079,x:33699,y:34553,varname:node_4079,prsc:2|A-2927-RGB,B-2598-OUT,T-5449-OUT;n:type:ShaderForge.SFN_Get,id:5338,x:33699,y:34870,varname:node_5338,prsc:2|IN-998-OUT;n:type:ShaderForge.SFN_Lerp,id:2598,x:33699,y:34743,varname:node_2598,prsc:2|A-126-RGB,B-8060-OUT,T-5338-OUT;n:type:ShaderForge.SFN_Get,id:4347,x:33718,y:35084,varname:node_4347,prsc:2|IN-1580-OUT;n:type:ShaderForge.SFN_Lerp,id:8060,x:33718,y:34964,varname:node_8060,prsc:2|A-8367-RGB,B-4601-RGB,T-4347-OUT;n:type:ShaderForge.SFN_Get,id:6848,x:33678,y:35765,varname:node_6848,prsc:2|IN-583-OUT;n:type:ShaderForge.SFN_Lerp,id:7815,x:33678,y:35642,varname:node_7815,prsc:2|A-508-RGB,B-7891-OUT,T-6848-OUT;n:type:ShaderForge.SFN_Get,id:6334,x:33678,y:35569,varname:node_6334,prsc:2|IN-998-OUT;n:type:ShaderForge.SFN_Lerp,id:7891,x:33678,y:35442,varname:node_7891,prsc:2|A-6475-RGB,B-4066-OUT,T-6334-OUT;n:type:ShaderForge.SFN_Get,id:8361,x:33678,y:35375,varname:node_8361,prsc:2|IN-1580-OUT;n:type:ShaderForge.SFN_Lerp,id:4066,x:33678,y:35255,varname:node_4066,prsc:2|A-8291-RGB,B-1860-RGB,T-8361-OUT;n:type:ShaderForge.SFN_Get,id:372,x:33706,y:36012,varname:node_372,prsc:2|IN-583-OUT;n:type:ShaderForge.SFN_Lerp,id:1432,x:33706,y:35889,varname:node_1432,prsc:2|A-3924-RGB,B-5246-OUT,T-372-OUT;n:type:ShaderForge.SFN_Get,id:4397,x:33706,y:36195,varname:node_4397,prsc:2|IN-998-OUT;n:type:ShaderForge.SFN_Lerp,id:5246,x:33706,y:36068,varname:node_5246,prsc:2|A-2897-RGB,B-1257-OUT,T-4397-OUT;n:type:ShaderForge.SFN_Get,id:539,x:33706,y:36401,varname:node_539,prsc:2|IN-1580-OUT;n:type:ShaderForge.SFN_Lerp,id:1257,x:33706,y:36281,varname:node_1257,prsc:2|A-5691-RGB,B-9879-RGB,T-539-OUT;n:type:ShaderForge.SFN_Lerp,id:5148,x:34179,y:34378,varname:node_5148,prsc:2|A-1370-OUT,B-4079-OUT,T-7280-OUT;n:type:ShaderForge.SFN_Lerp,id:559,x:34057,y:35815,varname:node_559,prsc:2|A-7815-OUT,B-1432-OUT,T-6656-OUT;n:type:ShaderForge.SFN_Vector1,id:6656,x:34057,y:35956,varname:node_6656,prsc:2,v1:0.5;n:type:ShaderForge.SFN_SwitchProperty,id:4805,x:35347,y:34496,ptovrint:False,ptlb:♥-by GenesisAria-♥,ptin:_byGenesisAria,cmnt:Feel free to share just remember where it came from,varname:node_4805,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9623-OUT,B-9623-OUT;n:type:ShaderForge.SFN_Multiply,id:7893,x:32553,y:35781,varname:node_7893,prsc:2|A-2667-OUT,B-1359-OUT;n:type:ShaderForge.SFN_Multiply,id:9468,x:32553,y:35897,varname:node_9468,prsc:2|A-2667-OUT,B-1560-OUT;n:type:ShaderForge.SFN_Multiply,id:3450,x:32553,y:36023,varname:node_3450,prsc:2|A-2667-OUT,B-2480-OUT;n:type:ShaderForge.SFN_Multiply,id:8393,x:32553,y:36148,varname:node_8393,prsc:2|A-2667-OUT,B-1924-OUT;n:type:ShaderForge.SFN_Multiply,id:1671,x:32550,y:35281,varname:node_1671,prsc:2|A-2667-OUT,B-1924-OUT;n:type:ShaderForge.SFN_Multiply,id:8714,x:32550,y:35397,varname:node_8714,prsc:2|A-2667-OUT,B-2480-OUT;n:type:ShaderForge.SFN_Multiply,id:1327,x:32550,y:35523,varname:node_1327,prsc:2|A-2667-OUT,B-1560-OUT;n:type:ShaderForge.SFN_Multiply,id:1261,x:32550,y:35648,varname:node_1261,prsc:2|A-2667-OUT,B-1359-OUT;n:type:ShaderForge.SFN_Slider,id:2667,x:32094,y:35771,ptovrint:False,ptlb:Y Dist Multiply,ptin:_YDistMultiply,varname:node_2667,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:5;n:type:ShaderForge.SFN_Lerp,id:25,x:35009,y:33235,varname:node_25,prsc:2|A-6604-RGB,B-8673-OUT,T-9778-OUT;n:type:ShaderForge.SFN_Multiply,id:8673,x:34697,y:33490,varname:node_8673,prsc:2|A-3827-OUT,B-4736-OUT;n:type:ShaderForge.SFN_Slider,id:4736,x:34618,y:33668,ptovrint:False,ptlb:Bloom Intensity,ptin:_BloomIntensity,varname:node_4736,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:5;n:type:ShaderForge.SFN_ObjectPosition,id:5189,x:30366,y:36023,varname:node_5189,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:9074,x:30366,y:35887,varname:node_9074,prsc:2;n:type:ShaderForge.SFN_Distance,id:6748,x:30567,y:35958,varname:node_6748,prsc:2|A-9074-XYZ,B-5189-XYZ;n:type:ShaderForge.SFN_Subtract,id:1451,x:30824,y:35292,varname:node_1451,prsc:2|A-8504-OUT,B-6748-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8504,x:30116,y:35802,ptovrint:False,ptlb:Fade Range,ptin:_FadeRange,varname:node_8504,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Clamp01,id:5630,x:30684,y:35011,varname:node_5630,prsc:2|IN-1451-OUT;n:type:ShaderForge.SFN_Subtract,id:9623,x:34089,y:36544,varname:node_9623,prsc:2|A-5421-OUT,B-6748-OUT;n:type:ShaderForge.SFN_Multiply,id:5421,x:31703,y:36218,varname:node_5421,prsc:2|A-8504-OUT,B-8751-OUT;n:type:ShaderForge.SFN_Vector1,id:8751,x:31703,y:36376,varname:node_8751,prsc:2,v1:2;proporder:880-2667-7365-2537-9778-1437-8641-4736-4056-5712-4816-8504-4805;pass:END;sub:END;*/

Shader "GenesisAria/Blur+Bloom" {
    Properties {
        _BlurSize ("Blur Size", Float ) = 0.5
        _YDistMultiply ("Y Dist Multiply", Range(0, 5)) = 2
        _StepDistances ("Step Distances", Vector) = (0.03,0.04,0.05,0.06)
        _BlurStrength ("Blur Strength", Range(0, 1)) = 0.5
        [MaterialToggle] _UnlockBlurStrength ("Unlock Blur Strength", Float ) = 0.5
        _BlurStrenthUnlocked ("Blur Strenth Unlocked", Float ) = 0.5
        [MaterialToggle] _BloomMode ("Bloom Mode", Float ) = 0
        _BloomIntensity ("Bloom Intensity", Range(1, 5)) = 1
        _BlendFarStep (">Blend FarStep", Float ) = 0.5
        _BlendMidStep (">Blend MidStep", Float ) = 0.5
        _BlendShortStep (">Blend ShortStep", Float ) = 0.5
        _FadeRange ("Fade Range", Float ) = 5
        [MaterialToggle] _byGenesisAria ("♥-by GenesisAria-♥", Float ) = 10
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="Overlay+1000"
            "RenderType"="TransparentCutout"
        }
        GrabPass{ "_AriaBlurGrab" }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Front
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _AriaBlurGrab;
            uniform float _BlurSize;
            uniform float4 _StepDistances;
            uniform fixed _BloomMode;
            uniform float _BlurStrenthUnlocked;
            uniform float _BlurStrength;
            uniform fixed _UnlockBlurStrength;
            uniform float _BlendFarStep;
            uniform float _BlendMidStep;
            uniform float _BlendShortStep;
            uniform fixed _byGenesisAria;
            uniform float _YDistMultiply;
            uniform float _BloomIntensity;
            uniform float _FadeRange;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 projPos : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 sceneColor = tex2D(_AriaBlurGrab, sceneUVs);
                float node_6748 = distance(_WorldSpaceCameraPos,objPos.rgb);
                float node_9623 = ((_FadeRange*2.0)-node_6748);
                clip(lerp( node_9623, node_9623, _byGenesisAria ) - 0.5);
////// Lighting:
                float4 node_6604 = tex2D( _AriaBlurGrab, sceneUVs.rg);
                float node_5630 = saturate((_FadeRange-node_6748));
                float node_1359 = (_StepDistances.r*_BlurSize*node_5630);
                float node_1560 = (_StepDistances.g*_BlurSize*node_5630);
                float node_2480 = (_StepDistances.b*_BlurSize*node_5630);
                float node_1924 = (_StepDistances.a*_BlurSize*node_5630);
                float FarStep = _BlendFarStep;
                float MidStep = _BlendMidStep;
                float ShortStep = _BlendShortStep;
                float node_9462 = 0.5;
                float node_7280 = 0.5;
                float3 node_782 = lerp(lerp(lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r+node_1359),(sceneUVs.g+node_1359))).rgb,lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r+node_1560),(sceneUVs.g+node_1560))).rgb,lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r+node_2480),(sceneUVs.g+node_2480))).rgb,tex2D( _AriaBlurGrab, float2((sceneUVs.r+node_1924),(sceneUVs.g+node_1924))).rgb,FarStep),MidStep),ShortStep),lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r-node_1359),(sceneUVs.g-node_1359))).rgb,lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r-node_1560),(sceneUVs.g-node_1560))).rgb,lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r-node_2480),(sceneUVs.g-node_2480))).rgb,tex2D( _AriaBlurGrab, float2((sceneUVs.r-node_1924),(sceneUVs.g-node_1924))).rgb,FarStep),MidStep),ShortStep),node_9462),lerp(lerp(lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r-node_1359),(sceneUVs.g+node_1359))).rgb,lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r-node_1560),(sceneUVs.g+node_1560))).rgb,lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r-node_2480),(sceneUVs.g+node_2480))).rgb,tex2D( _AriaBlurGrab, float2((sceneUVs.r-node_1924),(sceneUVs.g+node_1924))).rgb,FarStep),MidStep),ShortStep),lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r+node_1359),(sceneUVs.g-node_1359))).rgb,lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r+node_1560),(sceneUVs.g-node_1560))).rgb,lerp(tex2D( _AriaBlurGrab, float2((sceneUVs.r+node_2480),(sceneUVs.g-node_2480))).rgb,tex2D( _AriaBlurGrab, float2((sceneUVs.r+node_1924),(sceneUVs.g-node_1924))).rgb,FarStep),MidStep),ShortStep),node_7280),lerp(lerp(tex2D( _AriaBlurGrab, float2(sceneUVs.r,(sceneUVs.g+(_YDistMultiply*node_1359)))).rgb,lerp(tex2D( _AriaBlurGrab, float2(sceneUVs.r,(sceneUVs.g+(_YDistMultiply*node_1560)))).rgb,lerp(tex2D( _AriaBlurGrab, float2(sceneUVs.r,(sceneUVs.g+(_YDistMultiply*node_2480)))).rgb,tex2D( _AriaBlurGrab, float2(sceneUVs.r,(sceneUVs.g+(_YDistMultiply*node_1924)))).rgb,FarStep),MidStep),ShortStep),lerp(tex2D( _AriaBlurGrab, float2(sceneUVs.r,(sceneUVs.g-(_YDistMultiply*node_1359)))).rgb,lerp(tex2D( _AriaBlurGrab, float2(sceneUVs.r,(sceneUVs.g-(_YDistMultiply*node_1560)))).rgb,lerp(tex2D( _AriaBlurGrab, float2(sceneUVs.r,(sceneUVs.g-(_YDistMultiply*node_2480)))).rgb,tex2D( _AriaBlurGrab, float2(sceneUVs.r,(sceneUVs.g-(_YDistMultiply*node_1924)))).rgb,FarStep),MidStep),ShortStep),0.5),node_7280),node_9462);
                float _UnlockBlurStrength_var = lerp( _BlurStrength, _BlurStrenthUnlocked, _UnlockBlurStrength );
                float3 finalColor = lerp( lerp(node_6604.rgb,node_782,_UnlockBlurStrength_var), lerp(node_6604.rgb,(max(node_6604.rgb,node_782)*_BloomIntensity),_UnlockBlurStrength_var), _BloomMode );
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform fixed _byGenesisAria;
            uniform float _FadeRange;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float node_6748 = distance(_WorldSpaceCameraPos,objPos.rgb);
                float node_9623 = ((_FadeRange*2.0)-node_6748);
                clip(lerp( node_9623, node_9623, _byGenesisAria ) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
