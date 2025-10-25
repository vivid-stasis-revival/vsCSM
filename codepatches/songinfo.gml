var log = file_text_open_write(working_directory + "CustomSongMod_log.txt");

if (directory_exists("Custom Songs/"))
{
    file_text_write_string(log, "Loading Custom Songs...\n");
    var customPath = file_find_first("Custom Songs/*", 16);
    
    while (customPath != "")
    {
        customPath = "Custom Songs/" + customPath + "/";
        file_text_write_string(log, "nowPath:" + customPath + "\n");
        file_text_write_string(log, "   songID:" + string(array_length(global.song_list)) + "\n");
        
        if (file_exists(customPath + "info.json"))
        {
            file_text_write_string(log, "   Loading info.json...\n");
            var customSongInfo = file_text_open_read(customPath + "info.json");
            var songInfoJson = "";
            
            while (!file_text_eof(customSongInfo))
                songInfoJson = songInfoJson + file_text_readln(customSongInfo);
            
            var songInfo = json_parse(songInfoJson);
            songInfo.is_custom = true;
            songInfo.song_id = array_length(global.song_list);
            songInfo.unlock.song_id = array_length(global.song_list);
            songInfo.audio_id = audio_create_stream(customPath + "music.ogg");
            
            if (file_exists(customPath + "preview.ogg"))
            {
                songInfo.preview_id = audio_create_stream(customPath + "preview.ogg");
            }
            else
            {
                file_text_write_string(log, "   [Error] No preview.ogg found in " + customPath + " , using whole music as preview\n");
                songInfo.preview_id = songInfo.audio_id;
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
                file_text_write_string(log, "   [Error] No jacket found in " + customPath + " , using default jacket\n");
                songInfo.jacket = song_generic;
            }

            if !struct_exists(songInfo,"sort_artists")
            {
                songInfo.sort_artists=[songInfo.artist];
                file_text_write_string(log, "   [Error] No sort_artists found,using artist info\n");
            }

            //enc_data(BACKSTAGE)部分
            if (struct_exists(songInfo, "enc_data"))
            {
                songInfo.enc_data.song_id = array_length(global.song_list);
                
                if (struct_exists(songInfo.enc_data, "audio_id"))
                {
                    musicName = songInfo.enc_data.audio_id;
                    songInfo.enc_data.audio_id = audio_create_stream(customPath + musicName);
                }
                else
                {
                    file_text_write_string(log, "   No extra music for backspace, using original music\n");
                    songInfo.enc_data.audio_id = songInfo.audio_id;
                }
                
                if (struct_exists(songInfo.enc_data, "preview_id"))
                {
                    musicName = songInfo.enc_data.preview_id;
                    songInfo.enc_data.preview_id = audio_create_stream(customPath + musicName);
                }
                else
                {
                    file_text_write_string(log, "   No extra preview for backspace, using whole music as preview\n");
                    songInfo.enc_data.preview_id = songInfo.enc_data.audio_id;
                }
                
                if (struct_exists(songInfo.enc_data, "jacket"))
                {
                    jacketName = songInfo.enc_data.jacket;
                    songInfo.enc_data.jacket = sprite_add(customPath + jacketName, 1, false, false, 0, 0);
                }
                else
                {
                    file_text_write_string(log, "   No extra jacket for backspace, using original jacket\n");
                    songInfo.enc_data.jacket = songInfo.jacket;
                }
            }
            
            array_push(global.song_list, songInfo);
            file_text_close(customSongInfo);
        }
        
        customPath = file_find_next();
    }
    
    file_find_close();
}

file_text_close(log);
