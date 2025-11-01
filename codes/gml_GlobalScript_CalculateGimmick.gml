function CalcGimmickWeight(mods){
    var sum_w=0;
    for (i = 0; i < ds_list_size(mods.mods); i++)
    {
        sum_w += ds_list_find_value(mods.mods, i).w??1;
    }
    return sum_w;
}