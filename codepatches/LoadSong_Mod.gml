var filePath = working_directory + "Charts/" + arg0 + "/" + arg1 + ".vsb";
var modFilePath=working_directory + "Custom Songs/" + arg0 + "/" + arg1 + ".vsm";
var chart = undefined;

if (file_exists(filePath))
{   
    chart = read_binary_chart(filePath);
}
else
{
    chart = load_text_chart(arg0,arg1);
}


// if chart.mods != undefined{
//    modOutputer(chart.mods,global.songname,arg1,arg0);
// }