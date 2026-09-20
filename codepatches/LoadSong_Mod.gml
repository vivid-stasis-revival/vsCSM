var filePath = working_directory + "Charts/" + arg0 + "/" + arg1 + ".vsb";
var chart = undefined;
var chartPath = "";

if (file_exists(filePath))
{   
    chart = read_binary_chart(filePath);
}
else
{
    chartPath = get_chart_path_from_chart(arg0);
    chart = load_text_chart(chartPath, arg1);
}