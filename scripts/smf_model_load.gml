/// @description smf_model_load(fname)
/// @param fname
/*
Load an SMF model

Script made by TheSnidr
www.TheSnidr.com
*/
var path, loadBuff, header, version, size, vertBuff, vBuff, n, vertList;
path = argument0;
if !file_exists(path){return -1;}
loadBuff = buffer_load(path);
header = buffer_read(loadBuff, buffer_u16);
version = buffer_read(loadBuff, buffer_string);

if !string_count("SnidrsModelFormat", version)
{
    //This is an old version of the format
    vBuff = vertex_create_buffer_from_buffer(loadBuff, SMF_format);
}
else if string_count("1.0", version)
{
    //This is the most recent version of the format this importer can read
    size = buffer_read(loadBuff, buffer_u32);
    vertBuff = buffer_create(10, buffer_grow, 1);
    buffer_copy(loadBuff, buffer_tell(loadBuff), size, vertBuff, 0);
    vBuff = vertex_create_buffer_from_buffer(vertBuff, SMF_format);
    buffer_delete(vertBuff);
}
else
{
    show_message("This model was made with a newer version of the SMF format and is not supported");
}
buffer_delete(loadBuff);

return vBuff;

