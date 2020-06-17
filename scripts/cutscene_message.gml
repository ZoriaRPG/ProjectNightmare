///cutscene_message(string)
//Displays a message on the screen, one string at a time. Use cutscene_wait_message if you
//want the cutscene to resume only after closing the message.
ds_list_add(list,3);
var strings=ds_list_create();
for (var i=0;i<argument_count;i++)
    ds_list_add(strings,argument[i]);
ds_list_add(list,strings);
