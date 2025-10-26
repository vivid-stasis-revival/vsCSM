var hash;
    
    if (file_exists(customChartName))
    {
        finalstatName = customStatName;
        hash = sha1_file(customChartName);
        is_custom_chart = true;
    }
    else
    {
        finalstatName = statName;
        hash = sha1_file(binName);
    }