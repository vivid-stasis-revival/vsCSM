var weight;
    
    if (file_exists(working_directory + "Custom Songs/" + arg0 + "/" + arg1 + ".vmv"))
    {
        ini_open(working_directory + "Custom Songs/" + arg0 + "/" + arg1 + ".vmv");
        weight = ini_read_real("mods", "weight", 0);
        ini_close();
    }
    else
    {
        ini_open(working_directory + "Charts/" + arg0 + "/" + arg1 + ".vmv");
        weight = ini_read_real("mods", "weight", 0);
        ini_close();
    }