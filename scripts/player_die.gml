///player_die(holdable_zSpeed, deathSnd)
audio_stop_all();
audio_play_sound(musLose, 1, false);
player_drop_holdable(0, 0, argument0);
player_sound_play(argument1);
