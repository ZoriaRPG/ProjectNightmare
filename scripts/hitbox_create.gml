hitboxShape=c_shape_create();
c_shape_add_box(hitboxShape,radius,radius,height*0.5);
hitbox=c_object_create(hitboxShape,1,1);
c_object_set_userid(hitbox,id);
c_world_add_object(hitbox);
