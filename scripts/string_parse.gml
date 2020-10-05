///string_parse(str,token)
    //
    //  Returns a ds_list containing all substring elements within
    //  a given string which are separated by a given token.
    //
    //  eg. string_parse("cat|dog|house|bee", "|", true)
    //      returns a ds_list { "cat", "dog", "house", "bee" }
    //
    //      str         elements, string
    //      token       element separator,  string
    //
    /// GMLscripts.com/license
    {
        var str,token,ignore,list,tlen,temp;
        str = argument0;
        token = argument1;
        list = ds_list_create();
        tlen = string_length( token);
        while (string_length(str) != 0) {
            temp = string_pos(token,str);
            if (temp) {
                if (temp != 1) ds_list_add(list,string_copy(str,1,temp-1));
                str = string_copy(str,temp+tlen,string_length(str));
            } else {
                ds_list_add(list,str);
                str = "";
            }
        }
        return list;
    }
