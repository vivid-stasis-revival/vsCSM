function get_chart_path_from_chart(chart)
{
    for (var i = 0; i < array_length(global.song_list); i++)
    {
        if (global.song_list[i].chart_id == chart)
            return struct_get_fallback(global.song_list[i], "chart_path", "Charts/" + chart + "/");
    }
    
    for (var i = 0; i < array_length(global.shatter_list); i++)
    {
        if (global.shatter_list[i].chart_id == chart)
            return struct_get_fallback(global.shatter_list[i], "chart_path", "Charts/" + chart + "/");
    }
    
}
