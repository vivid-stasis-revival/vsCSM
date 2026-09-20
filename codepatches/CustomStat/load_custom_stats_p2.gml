// arg1:diff_name
var statName = baseName + ".stats";
var baseCustomPath = working_directory + get_chart_path_from_chart(arg0);
var customChartName = baseCustomPath + arg1 + ".vsc";
var customModName = baseCustomPath + arg1 + ".vsm";

if (! file_exists(customModName)) {
    customModName = baseCustomPath + "GLOBAL.vsm";
    if (! file_exists(customModName)) {
        customModName = undefined;
    }
}

var customStatName = baseCustomPath + +arg1 + ".stats_custom";
var finalstatName = "";
var is_custom_chart = false;