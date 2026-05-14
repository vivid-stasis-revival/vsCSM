function readCustomSongPackInfo(dir){
    var customPackInfo = file_text_open_read(dir + "songpack_info.json");
    var packInfoJson = "";
            
    while (!file_text_eof(customPackInfo))
        packInfoJson = packInfoJson + file_text_readln(customPackInfo);
            
    var packInfo = json_parse(packInfoJson);
    if (!variable_struct_exists(packInfo, "songs"))
        packInfo.songs = [];
    file_text_close(customPackInfo);
    return packInfo;
}

function readShatterInfo(dir){
    var customSongInfo = file_text_open_read(dir + "shatterinfo.json");
    var songInfoJson = "";
    
    while (!file_text_eof(customSongInfo))
        songInfoJson = songInfoJson + file_text_readln(customSongInfo);
    file_text_close(customSongInfo);

    var songInfo = json_parse(songInfoJson);
    songInfo.chart_path = dir;
    songInfo.is_custom = true;
    songInfo.song_id = array_length(global.shatter_list);

    songInfo.audio_id=variable_struct_exists(songInfo,"audio_id")?audio_create_stream(dir + songInfo.audio_id):audio_create_stream(dir + "music.ogg")

    if (!variable_struct_exists(songInfo,"preview_id")){
        songInfo.preview_id = (file_exists(dir + "preview.ogg"))?audio_create_stream(dir + "preview.ogg"):songInfo.audio_id;
    }
    else{
        songInfo.preview_id = audio_create_stream(dir + songInfo.preview_id);
    }

    var hasJacket=false;
    if (variable_struct_exists(songInfo,"jacket")&&file_exists(dir + songInfo.jacket)){
        songInfo.jacket = sprite_add(dir + songInfo.jacket, 1, false, false, 0, 0);
        hasJacket=true;
    }
    else{
        var jacketNames = ["jacket.gif", "jacket.jpeg", "jacket.jpg", "jacket.png"];
        for(var i = 0; i < array_length(jacketNames); i++){
            if (file_exists(dir + jacketNames[i]))
            {
                songInfo.jacket = sprite_add(dir + jacketNames[i], 1, false, false, 0, 0);
                hasJacket = true;
                break;
            }
        }
    }
    if (!hasJacket)
        songInfo.jacket = song_generic;
    
    if (!variable_struct_exists(songInfo, "ticket_earns"))
        songInfo.ticket_earns = [0, 0, 0];
    
    if (!variable_struct_exists(songInfo, "unlock"))
    {
        songInfo.unlock = function()
        {
            return true;
        };
    }
    return songInfo; 
}

//Cause many place will call create_shatter_list(), so I had to load the whole Custom Songs again
function CustomShatterReader()
{    
    var customSongPackList = []
    if (!directory_exists("Custom Songs/"))
        return;
    var customPath = file_find_first("Custom Songs/*", 16);
    while (customPath != "")
    {
        customPath = "Custom Songs/" + customPath + "/";
        
        if (file_exists(customPath + "shatterinfo.json"))
        {
            var songInfo=readShatterInfo(customPath)
            array_push(global.shatter_list, songInfo);
            array_push(global.shatter_order, songInfo.song_id);
        }
        else if (file_exists(customPath + "songpack_info.json"))
        {
            array_push(customSongPackList,customPath);
        }
        
        customPath = file_find_next();
    }
    //Packs Loading
    for (var i = 0; i < array_length(customSongPackList); i++){
        var dir = customSongPackList[i];
        var packCustomPath = file_find_first(dir + "*", 16);
        while (packCustomPath != "")
            {
                packCustomPath = dir + packCustomPath + "/";
                if (file_exists(packCustomPath + "shatterinfo.json"))
                {
                    var songInfo = readShatterInfo(packCustomPath);
                    array_push(global.shatter_list, songInfo);
                    array_push(global.shatter_order, songInfo.song_id);
                }
                packCustomPath = file_find_next();
    
            }
    }
    file_find_close();
}

function readCustomSongInfo(dir){
    var songInfo = {};
    var customSongInfo = file_text_open_read(dir + "info.json");
    var songInfoJson = "";
        
    while (!file_text_eof(customSongInfo))
        songInfoJson = songInfoJson + file_text_readln(customSongInfo);
    file_text_close(customSongInfo);

    songInfo = json_parse(songInfoJson);
    songInfo.chart_path = dir;
    songInfo.is_custom = true;
    songInfo.song_id = array_length(global.song_list);

    songInfo.unlock.song_id = array_length(global.song_list);
    songInfo.audio_id=variable_struct_exists(songInfo,"audio_id")?audio_create_stream(dir + songInfo.audio_id):audio_create_stream(dir + "music.ogg")

    if (!variable_struct_exists(songInfo,"sort_artists")){
        songInfo.sort_artists = [songInfo.artist];
    }

    if (!variable_struct_exists(songInfo,"preview_id")){
        songInfo.preview_id = (file_exists(dir + "preview.ogg"))?audio_create_stream(dir + "preview.ogg"):songInfo.audio_id;
    }
    else{
        songInfo.preview_id = audio_create_stream(dir + songInfo.preview_id);
    }

    var hasJacket=false;
    if (variable_struct_exists(songInfo,"jacket")&&file_exists(dir + songInfo.jacket)){
        songInfo.jacket = sprite_add(dir + songInfo.jacket, 1, false, false, 0, 0);
        hasJacket=true;
    }
    else{
        var jacketNames = ["jacket.gif", "jacket.jpeg", "jacket.jpg", "jacket.png"];
        for(var i = 0; i < array_length(jacketNames); i++){
            if (file_exists(dir + jacketNames[i]))
            {
                songInfo.jacket = sprite_add(dir + jacketNames[i], 1, false, false, 0, 0);
                hasJacket = true;
                break;
            }
        }
    }
    if (!hasJacket)
        songInfo.jacket = song_generic;
    //enc_data(BACKSTAGE)部分
    if (variable_struct_exists(songInfo, "enc_data"))
    {
        var encData=songInfo.enc_data;

        encData.song_id = array_length(global.song_list);
        encData.audio_id = (variable_struct_exists(encData, "audio_id")) ? audio_create_stream(dir + encData.audio_id) : songInfo.audio_id;
        encData.preview_id = (variable_struct_exists(encData, "preview_id")) ? audio_create_stream(dir + encData.preview_id) : encData.audio_id;
        encData.jacket = (variable_struct_exists(songInfo.enc_data, "jacket")) ? sprite_add(dir + encData.jacket, 1, false, false, 0, 0) : songInfo.jacket;
        encData.jacket_designer = variable_struct_exists(encData, "jacket_designer") ? encData.jacket_designer : songInfo.jacket_artist;
        songInfo.enc_data = encData;
    }
    return songInfo; 
}

function CustomSongReader()
{
    global.custom_song_packs = [];
    var customSongList = [];
    var customSongPackList = []//stroage customPaths(songPacks)
    if (!directory_exists("Custom Songs/"))
        return;

    var customPath = file_find_first("Custom Songs/*", 16);

    //Song with no packs Loading && SongPacks Preloading
    while (customPath != "")
    {
        customPath = "Custom Songs/" + customPath + "/";
        //WriteInLogWithTimeAndTag("Load Normal Info",customPath)
        if (file_exists(customPath + "info.json"))
        {
            array_push(customSongList, array_length(global.song_list));
            var songInfo = readCustomSongInfo(customPath);
            array_push(global.song_list, songInfo);
        }
        else if (file_exists(customPath + "songpack_info.json"))
        {
            array_push(customSongPackList,customPath);
        }
        
        customPath = file_find_next();
    }  
    //Packs Loading
    for (var i = 0; i < array_length(customSongPackList); i++){
        var dir = customSongPackList[i];
        //WriteInLogWithTimeAndTag("Load Normal Pack Info:dir",customPath)
        var packInfo = readCustomSongPackInfo(dir);
        var packCustomPath = file_find_first(dir + "*", 16);
        while (packCustomPath != "")
            {
                packCustomPath = dir + packCustomPath + "/";
                //WriteInLogWithTimeAndTag("Load Normal Pack Info:path",packCustomPath)
                if (file_exists(packCustomPath + "info.json"))
                {
                    array_push(packInfo.songs, array_length(global.song_list));
                    array_push(customSongList, array_length(global.song_list));
                    var songInfo = readCustomSongInfo(packCustomPath);
                    array_push(global.song_list, songInfo);
                }
                packCustomPath = file_find_next();
    
            }
        
        array_push(global.custom_song_packs, packInfo);
    }
    ///////
    file_find_close();
    array_push(global.custom_song_packs, 
    {
        name: "All Custom Songs",
        songs: customSongList,
        color1: 16777215,
        color2: 16777215,
        description: "Custom Songs."
    });
}