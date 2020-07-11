/// @description smf_collision_load_buffer(filename)
/// @param filename
if !file_exists(argument0){show_message("Failed to load collision buffer");return -1;}
return buffer_load(argument0);


