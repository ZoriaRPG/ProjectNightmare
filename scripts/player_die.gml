///player_die(holdable_zSpeed, deathSnd)
music_stop();
FMODGMS_Snd_PlaySound(global.mus[cMusLose], global.channel);
player_drop_holdable(0, 0, argument0);
player_sound_play(argument1);
