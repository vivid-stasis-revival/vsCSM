var filePath = working_directory + "Charts/" + arg0 + "/" + arg1 + ".vsb";
var modFilePath=working_directory + "Custom Songs/" + arg0 + "/" + arg1 + ".vsm";
var chart = undefined;

if (file_exists(filePath))
{   
    chart = read_binary_chart(filePath);
}
else
{
    chart = load_text_chart(working_directory + "Custom Songs/" + arg0 + "/" + arg1 + ".vsc");
}

if file_exists(modFilePath)
{
    chart.mods=load_text_mods(modFilePath);
}

// if chart.mods != undefined{
//    modOutputer(chart.mods,global.songname,arg1,arg0);
// }