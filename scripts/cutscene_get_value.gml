//Gets a value from the cutscene's list for later use and removes it from the list.
var value=ds_list_find_value(list,0);
ds_list_delete(list,0);
return (value)
