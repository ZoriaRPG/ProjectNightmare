hitboxShape=c_shape_create();
c_shape_add_box(hitboxShape,radius,radius,height*0.5);
hitbox=c_object_create(hitboxShape,1,1);
c_world_add_object(hitbox);
sprite_index=sprActor;
image_xscale=(radius*2)/3;
image_yscale=image_xscale;
