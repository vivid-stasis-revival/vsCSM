
if (!string_starts_with(global.song_packs[0].name, "FCP2")){
    var all_custom_songs = [];
    for (i=0; i < array_length(global.song_list); i++) { 
        if (variable_struct_exists(global.song_list[i], "is_custom")) {
            array_push(global.valid_song_ids, global.song_list[i].song_id);
            array_push(all_custom_songs, global.song_list[i].song_id);
            array_push(global.song_packs[array_length(global.song_packs)-1].songs, global.song_list[i].song_id);
        }
    }
    array_push(global.song_packs, 
    {
        name: "All Custom Songs",
        songs: all_custom_songs,
        color1: 16777215,
        color2: 16777215,
        description: "Custom Songs."
    });
}