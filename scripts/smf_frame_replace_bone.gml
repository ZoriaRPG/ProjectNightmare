/// @description smf_frame_replace_bone(targetFrame, sourceFrame, boneIndex)
/// @param targetFrame
/// @param sourceFrame
/// @param boneIndex
var targetFrame, sourceFrame, bone, i, j;
targetFrame = argument0;
sourceFrame = argument1;
bone = argument2;
i = 8;
j = bone * 8;
while i--{targetFrame[@ j + i] = sourceFrame[j + i];}


