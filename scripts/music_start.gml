for (var i = 0; i < 2; i++)
    if (global.levelMusic[i])
    {
        var battleBool = !i;
        //If the player is currently fighting, play the battle music on the fly
        if (global.battle)
            battleBool = i;
        global.musicVolume[i] = battleBool;
        audio_sound_gain(global.levelMusic[i], global.musicVolume[i], 0);
        audio_play_sound(global.levelMusic[i], 0, 1);
    }