/// @description smf_frame_lerp_bone(targetFrame, sourceFrame, boneIndex, amount)
/// @param targetFrame
/// @param sourceFrame
/// @param boneIndex
/// @param amount
var targetFrame, sourceFrame, bone, amount, i, j;
targetFrame = argument0;
sourceFrame = argument1;
bone = argument2;
amount = argument3;
i = 8;
j = bone * 8;
while i--{targetFrame[@ j + i] = lerp(targetFrame[j + i], sourceFrame[j + i], amount);}


