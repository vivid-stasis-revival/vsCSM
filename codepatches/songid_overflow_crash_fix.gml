global.last_freeplay_song = ini_read_real("profile", "last_freeplay_song", 0);

if (global.last_freeplay_song>=array_length(global.song_list)){
    global.last_freeplay_pack=0;
    global.last_freeplay_song=44;
}

if (global.last_freeplay_pack>=array_length(global.song_packs)){
    global.last_freeplay_pack=0;
    global.last_freeplay_song=44;
}