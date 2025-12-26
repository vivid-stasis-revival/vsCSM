var weight=0;
    var vmvFile=working_directory + get_chart_path_from_chart(arg0) + arg1 + ".vmv"
    if (file_exists(vmvFile))
    {
        ini_open(vmvFile);
        weight = ini_read_real("mods", "weight", 0);
        ini_close();
    }