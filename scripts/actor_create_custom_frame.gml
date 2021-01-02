var animation = ds_list_find_value(sprite_get(sprite), 2 + anim);
customFrame = smf_frame_create(animation[| 0], animation[| 1], frame / (ds_list_size(animation) - 2));
