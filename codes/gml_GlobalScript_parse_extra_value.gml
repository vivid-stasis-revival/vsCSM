function parse_extra_value(arg0) {
    if (arg0 == "") {
        return 404;
    }

    var d = {};
    var extraList = string_split(arg0, "|");

    for (var i = 0; i < array_length(extraList); i++) {
        var extraData = extraList[i];
        var arrKeyVal = string_split(extraData, ":");
        if (array_length(arrKeyVal) < 2) {
            continue;
        }
        var key = string_trim(arrKeyVal[0]);
        var val = (arrKeyVal[1] == "undefined")?undefined: string_trim(arrKeyVal[1]);
        variable_struct_set(d, key, val);
    }

    return d;
}
