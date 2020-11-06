//Gets a value from the cutscene's list for later use and removes it from the list.
var value = list[| 0];
if (canLoop) ds_list_add(doneList, value);
ds_list_delete(list, 0);
return (value)
