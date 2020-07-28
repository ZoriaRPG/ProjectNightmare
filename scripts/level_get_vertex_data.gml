///level_get_vertex_data(file)
//Obtains a number from the current line of the file as a string and continues to the next
//line. Returns the number as a real.
var data = file_text_read_string(argument0);
file_text_readln(argument0);
return (real(data))
