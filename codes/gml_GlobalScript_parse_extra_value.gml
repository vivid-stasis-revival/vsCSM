function parse_extra_value(arg0)
{   
    if (arg0 == "")
        return 404;
    var line=arg0
    var key = "";
    var value = "";
    var d = {};

    var extra_list=string_split(line,"|");
    var b_text=extra_list[0];
    //ini_write_string("extra"+string_format(looper),"extradat_b_text",b_text);
    var b_list=string_split(b_text,":");
    var key="bpm";
    //ini_write_string("extra"+string_format(looper),"extradat_b_list1",b_list[1]);
    var value=real(b_list[1]);
    variable_struct_set(d, key, value);
    return d;
}
