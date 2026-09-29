function load_text_chart(path, diff) {
    var filePath = path + diff + ".vsc";
    var modfilePath = path + diff + ".vsm";
    var modDefinition = load_text_mods(path, diff);
    var map = file_text_open_read(filePath);
    var i = 0;
    var lines = [];

    if (map == -1) {
        return 404;
    }

    while (! file_text_eof(map)) {
        array_push(lines, file_text_read_string(map));
        file_text_readln(map);
    }

    file_text_close(map);
    var _notes = [];

    for (i = 0; i < array_length(lines); i++) {

        var parts = split_string(",", lines[i], false);
        if (array_length(parts) < 3) {
            continue;
        }
        var _time = real(parts[0]);
        var _type = real(parts[1]);
        var _lane = real(parts[2]);
        var _extra = {};
        var _modExtra = {};
        var endTime = _time;
        if (array_length(parts) > 4) {
            _modExtra = parse_extra_value(parts[4]);
        }
        if (array_length(parts) > 3) {
            if (_type == 2) {
                variable_struct_set(_extra, 1, real(parts[3]));
            }
            else if (_type == 3) {

                var extraList = string_split(parts[3], "|");
                var BPMData = extraList[0];
                var bpmKeyVal = string_split(BPMData, ":");
                var b_val = real(bpmKeyVal[1]);
                variable_struct_set(_extra, 1, b_val);
            }
            else {
                _extra = parts[3];
            }
        }

        var noteData = {time: _time, type: _type, lane: _lane, extra: _extra, modExtra: _modExtra};
        array_push(_notes, noteData);
    }
    array_sort(_notes, function(a, b){return a.time - b.time; });
    WriteInLogWithTag("notes", _notes);
    return {notes: _notes, mods: modDefinition};
}
