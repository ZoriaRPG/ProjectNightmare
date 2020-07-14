if (audio_emitter_exists(emitter))
{
    show_debug_message(string(id) + ": Destroyed audio emitter");
    audio_emitter_free(emitter);
}
show_debug_message("Freed memory from " + string(id));
