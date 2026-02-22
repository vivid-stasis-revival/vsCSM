function parse_extra_value(arg0)
{
    var aliasMaps = 
    {
        t: 0,
        b: 1,
        v: 2,
        s: 3
    };
    
    if (arg0 == "")
        return 404;
    
    var d = {};
    var extraList = string_split(arg0, "|");
    
    for (var i = 0; i < array_length(extraList); i++)
    {
        var extraData = extraList[i];
        var arrKeyVal = string_split(extraData, ":");
        var key = variable_struct_get(aliasMaps, arrKeyVal[0]);
        var val = (arrKeyVal[1] == "undefined") ? undefined : real(arrKeyVal[1]);
        variable_struct_set(d, key, val);
    }
    
    return d;
}
