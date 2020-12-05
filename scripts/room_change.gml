///room_change(roomID)
//Clears everything and switches to another room. This is a workaround for GM:S 1.4's room memory leaks.
global.currentRoom = argument0;
//---ROOM END---
with (all)
{
    if (object_index == objControl) continue
    instance_destroy();
}
with (objControl)
{
    if (c_world_exists()) c_world_destroy();
    if (c_object_exists(worldObject)) c_object_destroy(worldObject);
    if (c_shape_exists(worldShape)) c_shape_destroy(worldShape);
    //Destroy world model segments
    repeat (ds_list_size(global.worldModel[0]))
    {
        vertex_delete_buffer(ds_list_find_value(global.worldModel[0], 0));
        ds_list_delete(global.worldModel[0], 0);
    }
    //Clear world model texture list
    ds_list_clear(global.worldModel[1]);
    if (background_exists(pauseBg))
    {
        global.paused = false;
        background_delete(pauseBg);
    }
    audio_stop_all();
    music_stop();
    global.dawn = false;
    global.skybox = 0;
    //---ROOM START---
    var i = 0, file = file_text_open_read(cDirMap + string(global.currentRoom) + ".pnl"), tempData = ds_list_create(); //Open level file that corresponds to the current room ID
    //Read level information
    repeat (2)
    {
        global.levelMusic[i] = level_read_real(file);
        i++;
    }
    global.roomIcon = level_read_real(file);
    global.roomName = level_read_string(file);
    global.skybox = level_read_real(file);
    background_color[0] = level_read_real(file);
    ds_list_read(tempData, level_read_string(file)); //Get world geometry list
    var dataSize = ds_list_size(tempData);
    //Start loading world model
    ds_list_add(global.worldModel[1], tempData[| 9]); //Add the first triangle's texture to the world textures list
    for (i = 19; i < dataSize; i += 10) //First loop through the list to get every texture that gets used in the level
    {
        var unique = true, j;
        //Iterate through every texture ID in the world textures list to see if the current triangle's texture is already included
        for (j = 0; j < ds_list_size(global.worldModel[1]); j++)
            if (tempData[| i] == ds_list_find_value(global.worldModel[1], j)) //If the texture ID is already included, skip to the next triangle
            {
                unique = false;
                break
            }
        if (unique) ds_list_add(global.worldModel[1], tempData[| i]); //Add the unique texture ID to the world textures list
    }
    var textures = ds_list_size(global.worldModel[1]);
    repeat (textures) ds_list_add(global.worldModel[0], vertex_create_buffer()); //Create vertex buffers as world model segments for each texture
    //Preparations to add triangles to world collision mesh while world model segments assemble
    worldShape = c_shape_create();
    c_shape_begin_trimesh();
    for (i = 0; i < textures; i++) //Loop through the texture IDs list to add every triangle with the corresponding texture ID to each world model segment
    {
        var buffer = ds_list_find_value(global.worldModel[0], i);
        vertex_begin(buffer, global.worldModel[2]);
        for (j = 0; j < dataSize; j += 10) //Iterate through every triangle to be added and skip those that don't have the corresponding texture ID
        {
            var texID = tempData[| j + 9];
            if (texID != ds_list_find_value(global.worldModel[1], i)) continue
            var pos, texPointer = ds_list_find_value(global.tex[| texID], 0);
            //X,Y,Z
            for (var k = 0; k < 9; k++) pos[k] = tempData[| j + k];
            //U,V
            pos[9] = image_get_width(texPointer) * 0.5;
            pos[10] = image_get_height(texPointer) * 0.5;
            vertex_position_3d(buffer, pos[0], pos[1], pos[2]);
            vertex_texcoord(buffer, pos[0] / pos[9], pos[1] / pos[10]);
            vertex_position_3d(buffer, pos[3], pos[4], pos[5]);
            vertex_texcoord(buffer, pos[3] / pos[9], pos[4] / pos[10]);
            vertex_position_3d(buffer, pos[6], pos[7], pos[8]);
            vertex_texcoord(buffer, pos[6] / pos[9], pos[7] / pos[10]);
            c_shape_add_triangle(pos[0], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6], pos[7], pos[8]);
            global.minZ = min(global.minZ, pos[2], pos[5], pos[8]);
        }
        vertex_end(buffer);
    }
    c_shape_end_trimesh(worldShape);
    worldObject = c_object_create(worldShape, 1, 1);
    global.world = c_world_create();
    c_world_add_object(worldObject);
    with (instance_create(0, 0, objMario)) z = half;
    with (instance_create(0, 0, objBomb)) z = half;
    with (instance_create(0, 0, objCamera))
    {
        //Set global camera variables
        global.cX = x;
        global.cY = y;
        global.cZ = z;
        global.cD = faceDir;
        global.cP = pitch;
    }
    ds_list_destroy(tempData);
    file_text_close(file);
    //Reset in-game states
    music_start();
    global.battle = false;
    framerate_set();
    discord_update_presence("0 backups collected", global.roomName, "largeicon" + string(global.roomIcon), "smallicon");
    window_set_cursor(cr_default);
}
