function readCustomSongInfo(dir){
    var log = file_text_open_write(working_directory + "CustomSongMod_log.txt");
    file_text_write_string(log, "Loading song in directory " + dir + "\n");

    var songInfo = {};
    if (file_exists(dir + "info.json")){
        file_text_write_string(log, "\tLoading info.json...\n");
        var customSongInfo = file_text_open_read(dir + "info.json");
        var songInfoJson = "";
            
        while (!file_text_eof(customSongInfo))
            songInfoJson = songInfoJson + file_text_readln(customSongInfo);
        
        songInfo = json_parse(songInfoJson);
        songInfo.chart_path = dir;
        songInfo.is_custom = true;
        songInfo.song_id = array_length(global.song_list);
        songInfo.unlock.song_id = array_length(global.song_list);
        songInfo.audio_id = audio_create_stream(dir + "music.ogg");
        
        if (file_exists(dir + "preview.ogg"))
        {
            songInfo.preview_id = audio_create_stream(dir + "preview.ogg");
        }
        else
        {
            file_text_write_string(log, "\t[Error] No preview.ogg found in " + dir + " , using whole music as preview\n");
            songInfo.preview_id = songInfo.audio_id;
        }
        
        var jacketNames = ["jacket.gif", "jacket.jpeg", "jacket.jpg", "jacket.png"];
        var hasJacket = false;
        for(var i = 0; i < array_length(jacketNames); i++)
            if (file_exists(dir + jacketNames[i]))
            {
                songInfo.jacket = sprite_add(dir + jacketNames[i], 1, false, false, 0, 0);
                hasJacket = true;
                break;
            }
        if (!hasJacket)
        {
            file_text_write_string(log, "\t[Error] No jacket found in " + dir + " , using default jacket\n");
            songInfo.jacket = song_generic;
        }

        if !struct_exists(songInfo,"sort_artists")
        {
            songInfo.sort_artists=[songInfo.artist];
            file_text_write_string(log, "\tNo sort_artists found,using artist info\n");
        }

        //enc_data(BACKSTAGE)部分
        if (struct_exists(songInfo, "enc_data"))
        {
            songInfo.enc_data.song_id = array_length(global.song_list);
            
            if (struct_exists(songInfo.enc_data, "audio_id"))
            {
                musicName = songInfo.enc_data.audio_id;
                songInfo.enc_data.audio_id = audio_create_stream(dir + musicName);
            }
            else
            {
                file_text_write_string(log, "\tNo extra music for backspace, using original music\n");
                songInfo.enc_data.audio_id = songInfo.audio_id;
            }
                
            if (struct_exists(songInfo.enc_data, "preview_id"))
            {
                musicName = songInfo.enc_data.preview_id;
                songInfo.enc_data.preview_id = audio_create_stream(dir + musicName);
            }
            else
            {
                file_text_write_string(log, "\tNo extra preview for backspace, using whole music as preview\n");
                songInfo.enc_data.preview_id = songInfo.enc_data.audio_id;
            }
            
            if (struct_exists(songInfo.enc_data, "jacket"))
            {
                jacketName = songInfo.enc_data.jacket;
                songInfo.enc_data.jacket = sprite_add(dir + jacketName, 1, false, false, 0, 0);
            }
            else
            {
                file_text_write_string(log, "\tNo extra jacket for backspace, using original jacket\n");
                songInfo.enc_data.jacket = songInfo.jacket;
            }
        }
        file_text_close(customSongInfo);
    }
    file_text_close(log);
    return songInfo; 
}

global.custom_song_packs = [];
var customSongList = [];
var log = file_text_open_write(working_directory + "CustomSongMod_log.txt");

if (directory_exists("Custom Songs/"))
{
    file_text_write_string(log, "Loading Custom Songs...\n");
    var customPath = file_find_first("Custom Songs/*", 16);
    
    while (customPath != "")
    {
        customPath = "Custom Songs/" + customPath + "/";
        file_text_write_string(log, "\nnowPath:" + customPath + "\n");
        
        if (file_exists(customPath + "info.json"))
        {
            file_text_write_string(log, "songID:" + string(array_length(global.song_list)) + "\n");
            array_push(customSongList, array_length(global.song_list));
            var songInfo = readCustomSongInfo(customPath);
            array_push(global.song_list, songInfo);
        }
        else if (file_exists(customPath + "songpack_info.json"))
        {
            file_text_write_string(log, "Loading songpack_info.json...\n");
            var customPackInfo = file_text_open_read(customPath + "songpack_info.json");
            var packInfoJson = "";
            
            while (!file_text_eof(customPackInfo))
                packInfoJson = packInfoJson + file_text_readln(customPackInfo);
            
            packInfo = json_parse(packInfoJson);
            if (!struct_exists(packInfo, "songs"))
                packInfo.songs = [];
            
            var packCustomPath = file_find_first(customPath + "*", 16);
    
            while (packCustomPath != "")
            {
                packCustomPath = customPath + packCustomPath + "/";
                file_text_write_string(log, "\nnowPath:" + packCustomPath + "\n");

                if (file_exists(packCustomPath + "info.json"))
                {
                    file_text_write_string(log, "songID:" + string(array_length(global.song_list)) + "\n");
                    array_push(packInfo.songs, array_length(global.song_list));
                    array_push(customSongList, array_length(global.song_list));
                    var songInfo = readCustomSongInfo(packCustomPath);
                    array_push(global.song_list, songInfo);
                }
        
                packCustomPath = file_find_next();
            }

            array_push(global.custom_song_packs, packInfo);
        }
        
        customPath = file_find_next();
    }
    
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

file_text_close(log);
