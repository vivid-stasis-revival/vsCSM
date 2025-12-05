function modOutputer(modDEF, songname, chartdiff,chartid=0)
{   
    if chartid==0{
        chartid="uk"
    }
    var modtext = "";
    var text_file = file_text_open_write(working_directory + "Gimmick_OutPut/" + "" + "_" + chartdiff +"_"+chartid+ ".vsm");
    var obj = modDEF.data.obj;
    var pxy = modDEF.data.proxies;
    var mod_list = modDEF.mods;
    var mpf_list = modDEF.perFrame;
    var gimmick = {};
    var mpf = {};
    var e = "";
    var v1 = 0;
    var v2 = 0;
    modtext += string("!proxies:{0}\n", pxy);
    modtext += string("!obj:{0}\n", obj);
    
    for (i = 0; i < ds_list_size(mod_list); i++)
    {
        gimmick = ds_list_find_value(mod_list, i);
        e = script_get_name(gimmick.e)
        v1 = gimmick.v1;
        v2 = gimmick.v2;
        
        if (v1 == 573613)
            v1 = "_";
        
        if (v2 == 573613)
            v2 = "_";
        
        modtext += string("{0},{1},{2},{3},{4},{5},{6}\n", gimmick.b, gimmick.d, e, v1, v2, gimmick.m, gimmick.p);
    }
    
    modtext += "mpf\n";
    
    if (ds_list_size(mpf_list) != 0)
    {
        for (i = 0; i < ds_list_size(mpf_list); i++)
        {
            mpf = ds_list_find_value(mpf_list, i);
            modtext += string("{0},{1},{2}\n", mpf.b, mpf.e,script_get_name(mpf.f));
        }
    }
    
    file_text_write_string(text_file, modtext);
    file_text_close(text_file);
}