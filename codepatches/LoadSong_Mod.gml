var filePath = working_directory + "Charts/" + arg0 + "/" + arg1 + ".vsb";
var chart = undefined;

if (file_exists(filePath))
{   
    chart = read_binary_chart(filePath);
}
else
{
    var chartPath = global.song_list[get_song_id_from_chart(arg0)].chart_path;
    var modFilePath = chartPath + arg1 + ".vsm";
    chart = load_text_chart(chartPath, arg1);
}


// if chart.mods != undefined{
//    modOutputer(chart.mods,global.songname,arg1,arg0);
// }