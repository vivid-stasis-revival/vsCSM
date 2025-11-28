var hash;
var hash_mod;
    
    if (file_exists(customChartName))
    {
        finalstatName = customStatName;
        hash = sha1_file(customChartName);
        if file_exists(customModName){
            hash_mod=sha1_file(customModName);
            hash=hash+hash_mod
        }
        is_custom_chart = true;
    }
    else
    {
        finalstatName = statName;
        hash = sha1_file(binName);
    }