if (sprite_type(sprite) > 2)
{
    var getModel = sprite_get(sprite), skinSize = ds_list_size(getModel[| 0]), bodygroupSize = ds_list_size(getModel[| 1]), i = 0;
    if (skinSize)
    {
        skin = array_create(skinSize);
        repeat (array_length_1d(skin))
        {
            skin[i] = 0;
            i++;
        }
    }
    if (bodygroupSize)
    {
        i = 0;
        bodygroup = array_create(bodygroupSize);
        repeat (array_length_1d(bodygroup))
        {
            bodygroup[i] = 0;
            i++;
        }
    }
}
half = height * 0.5;
sprite_index = sprActor;
image_xscale = radius * 0.5;
image_yscale = image_xscale;
