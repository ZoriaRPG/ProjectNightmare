half = height * 0.5;
hitboxShape = c_shape_create();
c_shape_add_box(hitboxShape, radius, radius, half);
hitbox = c_object_create(hitboxShape, 1, 1);
sprite_index = sprActor;
image_xscale = (radius * 2) / 3;
image_yscale = image_xscale;
