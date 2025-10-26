function load_text_chart(arg0, arg1)//arg0<<chart_id, arg<<diff_name
{
    var filePath = working_directory + "Custom Songs/" + arg0 + "/" + arg1 + ".vsc";
    var modfilePath = working_directory + "Custom Songs/" + arg0 + "/" + arg1 + ".vsm";
    var modDefinition = load_text_mods(working_directory + "Custom Songs/" + arg0 + "/" + arg1 + ".vsm");
    var map = file_text_open_read(filePath);
    var i = 0;
    var lines = [];
    
    if (map == -1)
        return 404;
    
    while (!file_text_eof(map))
    {
        array_push(lines, file_text_read_string(map));
        file_text_readln(map);
    }
    
    file_text_close(map);
    var notes = [];
    
    for (i = 0; i < array_length(lines); i++)
    {
        var parts = split_string(",", lines[i], false);
        var time = real(parts[0]);
        var type = real(parts[1]);
        var lane = real(parts[2]);
        var extra = {};
        var extraData = {};
        var endTime = time;
        
        if (array_length(parts) > 3)
        {
            if (type == 2)
            {
                variable_struct_set(extra, 1, real(parts[3]));
            }
            else if (type == 3)
            {
                extraData = parse_extra_value(parts[3]);
                variable_struct_set(extra, 1, variable_struct_get(extraData, "bpm"));
            }
        }
        
        var noteData = 
        {
            time: time,
            type: type,
            lane: lane,
            extra: extra
        };
        array_push(notes, noteData);
    }
    
    array_sort(notes, function(arg0, arg1)
    {
        return arg0.time - arg1.time;
    });
    return 
    {
        notes: notes,
        mods: modDefinition
    };
}
