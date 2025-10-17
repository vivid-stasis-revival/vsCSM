function load_text_chart(arg0)
{
    var filePath = arg0;
    
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
    //ini_open("tt.ini");
    //looper=0;
    for (i = 0; i < array_length(lines); i++)
    {   
        //looper++
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
                variable_struct_set(extra, 1, real(parts[3]));
            else if (type == 3)
            {
                //ini_write_string("extra"+string_format(looper),"extradat",parts[3])
                extraData = parse_extra_value(parts[3]);
                //ini_write_string("extra"+string_format(looper),"extradat_bpm",variable_struct_get(extraData,"bpm"))
                variable_struct_set(extra, 1, variable_struct_get(extraData,"bpm"));
                //ini_write_string("extra"+string_format(looper),"extradat_bpm",typeof(variable_struct_get(extraData,"bpm") ))
            }
            
            // if (type == 3)
            // {
            //     extraData = parse_extra_value(extra);
                
            //     if (extraData == 404)
            //         push = false;
            // }
            // else if (type == 2)
            // {
            //     endTime = real(extra);
            // }
        }
        
        var noteData = 
        {
            time: time,
            type: type,
            lane: lane,
            extra: extra,
        };
        
        array_push(notes, noteData);
    }
    //ini_close();

    array_sort(notes, function(n1, n2)
    {
        return n1.time - n2.time;
    });

    return 
    {
        notes: notes,
        mods: undefined
    };
}
