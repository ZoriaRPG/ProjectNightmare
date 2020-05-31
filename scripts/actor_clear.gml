if (c_world_exists())
{
    show_debug_message(string(id)+": Removed hitbox from world");
    c_world_remove_object(hitbox);
}
if (c_object_exists(hitbox))
{
    show_debug_message(string(id)+": Destroyed hitbox object");
    c_object_destroy(hitbox);
}
if (c_shape_exists(hitboxShape))
{
    show_debug_message(string(id)+": Destroyed hitbox shape");
    c_shape_destroy(hitboxShape);
}
if (audio_emitter_exists(emitter))
{
    show_debug_message(string(id)+": Destroyed audio emitter");
    audio_emitter_free(emitter);
}
show_debug_message("Freed memory from "+string(id));
