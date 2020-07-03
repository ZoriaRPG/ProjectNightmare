///transition_create(room, color);
audio_sound_gain(global.levelMusic[0], 0, 800);
with (instance_create(0, 0, objTransition))
{
    next = argument0;
    image_blend = argument1;
}
