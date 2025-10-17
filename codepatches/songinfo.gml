
var log = file_text_open_write(working_directory + "CustomSongMod_log.txt");

if (directory_exists("Custom Songs/"))
{
    file_text_write_string(log, "Loading Custom Songs...\n");
    var customPath = file_find_first("Custom Songs/*", 16);
    
    while (customPath != "")
    {
        customPath = "Custom Songs/" + customPath + "/";
        file_text_write_string(log, "   nowPath:" + customPath + "\n");
        file_text_write_string(log, "   songID:" + string(array_length(global.song_list)) + "\n");
        
        if (file_exists(customPath + "info.json"))
        {
            file_text_write_string(log, "   Loading info.json...\n");
            var customSongInfo = file_text_open_read(customPath + "info.json");
            var songInfoJson = "";
            
            while (!file_text_eof(customSongInfo))
                songInfoJson = songInfoJson + file_text_readln(customSongInfo);
            
            file_text_write_string(log, "   GotJsonFile:\n" + songInfoJson + "\n");
            var songInfo = json_parse(songInfoJson);
            songInfo.is_custom = true;
            songInfo.song_id = array_length(global.song_list);
            songInfo.unlock.song_id = array_length(global.song_list);
            
            if (file_exists(customPath + "music.ogg"))
                songInfo.audio_id = audio_create_stream(customPath + "music.ogg");
            else
                file_text_write_string(log, "   [Fatal Error] No music.ogg found in " + customPath + "\n");
            
            if (file_exists(customPath + "preview.ogg"))
            {
                songInfo.preview_id = audio_create_stream(customPath + "preview.ogg");
            }
            else
            {
                file_text_write_string(log, "   [Error] No preview.ogg found in " + customPath + " ,using whole music as preview\n");
                songInfo.preview_id = audio_create_stream(customPath + "music.ogg");
            }
            
            if (file_exists(customPath + "jacket.gif"))
            {
                songInfo.jacket = sprite_add(customPath + "jacket.gif", 1, false, false, 0, 0);
            }
            else if (file_exists(customPath + "jacket.jpeg"))
            {
                songInfo.jacket = sprite_add(customPath + "jacket.jpeg", 1, false, false, 0, 0);
            }
            else if (file_exists(customPath + "jacket.jpg"))
            {
                songInfo.jacket = sprite_add(customPath + "jacket.jpg", 1, false, false, 0, 0);
            }
            else if (file_exists(customPath + "jacket.png"))
            {
                songInfo.jacket = sprite_add(customPath + "jacket.png", 1, false, false, 0, 0);
            }
            else
            {
                file_text_write_string(log, "   [Error] No jacket found in " + customPath + " ,using default jacket\n");
                songInfo.jacket = song_generic;
            }
            
            array_push(global.song_list, songInfo);
            file_text_close(customSongInfo);
        }
        
        customPath = file_find_next();
    }
    
    file_find_close();
}

file_text_close(log);
