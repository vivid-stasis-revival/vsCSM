global.eases = 
{
    linear: EaseLinear,
    inSine: EaseInSine,
    outSine: EaseOutSine,
    inOutSine: EaseInOutSine,
    inQuad: EaseInQuad,
    outQuad: EaseOutQuad,
    inOutQuad: EaseInOutQuad,
    inCubic: EaseInCubic,
    outCubic: EaseOutCubic,
    inOutCubic: EaseInOutCubic,
    inQuart: EaseInQuart,
    outQuart: EaseOutQuart,
    inOutQuart: EaseInOutQuart,
    inQuint: EaseInQuint,
    outQuint: EaseOutQuint,
    inOutQuint: EaseInOutQuint,
    inExpo: EaseInExpo,
    outExpo: EaseOutExpo,
    inOutExpo: EaseInOutExpo,
    inCirc: EaseInCirc,
    outCirc: EaseOutCirc,
    inOutCirc: EaseInOutCirc,
    inBack: EaseInBack,
    outBack: EaseOutBack,
    inOutBack: EaseInOutBack,
    inElastic: EaseInElastic,
    outElastic: EaseOutElastic,
    inOutElastic: EaseInOutElastic,
    inBounce: EaseInBounce,
    outBounce: EaseOutBounce,
    inOutBounce: EaseInOutBounce
};
global.easeBytes = 
{
    linear: 1,
    outElastic: 2,
    inExpo: 3,
    outExpo: 4,
    inOutExpo: 5,
    inQuad: 6,
    outQuad: 7,
    inOutQuad: 8,
    inCubic: 9,
    outCubic: 10,
    inOutCubic: 11,
    outBack: 12,
    inSine: 13,
    outSine: 14,
    inOutSine: 15,
    outQuart: 16,
    inOutCirc: 17,
    inCirc: 18,
    outCirc: 19
};
global.mods = {};
global.mod_weight = {};

function addGlobalMod(arg0, arg1)
{
    static lastIndex = 0;
    
    var i = lastIndex;
    
    if (i >= 128)
        throw "Too many global mods defined.";
    
    lastIndex++;
    variable_struct_set(global.mods, arg0, i);
    variable_struct_set(global.mod_weight, arg0, arg1);
}

addGlobalMod("unknown", 0);
addGlobalMod("prx", 2);
addGlobalMod("prxb", 2);
addGlobalMod("prxc", 2);
addGlobalMod("pry", 2);
addGlobalMod("pryb", 2);
addGlobalMod("pryc", 2);
addGlobalMod("prsx", 2);
addGlobalMod("pra", 2);
addGlobalMod("przm", 2);
addGlobalMod("przmb", 2);
addGlobalMod("przx", 2);
addGlobalMod("przy", 2);
addGlobalMod("prrx", 2);
addGlobalMod("prry", 2);
addGlobalMod("prrz", 2);
addGlobalMod("prrzb", 2);
addGlobalMod("shxs", 1.5);
addGlobalMod("shxp", 1.5);
addGlobalMod("shxa", 1.5);
addGlobalMod("shys", 1.5);
addGlobalMod("shyp", 1.5);
addGlobalMod("shya", 1.5);
addGlobalMod("scrollspeed", 0);
addGlobalMod("noterot", 2.5);
addGlobalMod("velocity", 2);
addGlobalMod("spinradius", 2);
addGlobalMod("spiny", 2);
addGlobalMod("spinx", 2);
addGlobalMod("driven", 4);
addGlobalMod("beat", 1.5);
addGlobalMod("wave", 2.5);
addGlobalMod("hom", 2);
addGlobalMod("boost_distance", 2.5);
addGlobalMod("boost_time", 2.5);
addGlobalMod("yoffset", 1.5);
addGlobalMod("notealp", 1.5);
addGlobalMod("przmc", 1);
addGlobalMod("prxd", 1);
addGlobalMod("pryd", 1);
addGlobalMod("prct", 1);
addGlobalMod("prcb", 1);
addGlobalMod("prcl", 1);
addGlobalMod("prcr", 1);
addGlobalMod("prvib", 1);
addGlobalMod("shct", 1);
addGlobalMod("shft", 1);
addGlobalMod("shcb", 1);
addGlobalMod("shfb", 1);
addGlobalMod("shcl", 1);
addGlobalMod("shfl", 1);
addGlobalMod("shcr", 1);
addGlobalMod("shfr", 1);
addGlobalMod("scrollind0", 1.5);
addGlobalMod("scrollind1", 1.5);
addGlobalMod("scrollind2", 1.5);
addGlobalMod("scrollind3", 1.5);
addGlobalMod("scrollind4", 1.5);
addGlobalMod("scrollind5", 1.5);
addGlobalMod("scrollind6", 1.5);
addGlobalMod("drawdist", 0);
addGlobalMod("pburstleft", 0.5);
addGlobalMod("pburstright", 0.5);
addGlobalMod("particlexpower", 0.5);
addGlobalMod("particleypower", 0.5);
addGlobalMod("uialpha", 0);
addGlobalMod("fx_contrast", 0.5);
addGlobalMod("fx_chroma_distort", 0.5);
addGlobalMod("fx_film", 1);
addGlobalMod("fx_glow", 1);
addGlobalMod("fx_particleglow", 0.5);
addGlobalMod("pburstspeed", 0.5);
addGlobalMod("freeze", 2);
addGlobalMod("enable_hue",0);

function isChartSpecificMod(arg0)
{
    return (arg0 & 128) == 128;
}

function getModGimmickObj(arg0)
{
    if (arg0 != undefined)
    {
        var asset = asset_get_index(arg0);
        
        if (asset > -1)
        {
            var obj = instance_find(asset, 0);
            
            if (instance_exists(obj))
            {
                return 
                {
                    obj: obj,
                    isNew: false
                };
            }
            else
            {
                return 
                {
                    obj: instance_create_depth(0, 0, 0, asset, 
                    {
                        readOnly: true
                    }),
                    isNew: true
                };
            }
        }
    }
    
    return false;
}

function getModByteFromName(arg0, arg1)
{
    var mods = global.mods;
    
    if (variable_struct_exists(mods, arg0))
        return variable_struct_get(mods, arg0);
    
    var obj = getModGimmickObj(arg1);
    
    if (obj)
    {
        debug(arg1, obj.obj, variable_struct_exists(obj.obj.extraMods, arg0));
        
        if (variable_struct_exists(obj.obj.extraMods, arg0))
            return variable_struct_get(obj.obj.extraMods, arg0);
        
        if (obj.isNew)
            instance_destroy(obj.obj);
    }
    
    throw "Unknown mod " + arg0;
    return mods.unknown;
}

function getModNameFromByte(arg0, arg1)
{
    var mods = global.mods;
    
    if (isChartSpecificMod(arg0))
    {
        var obj = getModGimmickObj(arg1);
        
        if (obj)
        {
            mods = obj.obj.extraMods;
            
            if (obj.isNew)
                instance_destroy(obj.obj);
        }
    }
    
    var names = variable_struct_get_names(mods);
    
    for (var i = 0; i < array_length(names); i++)
    {
        var name = names[i];
        
        if (variable_struct_get(mods, name) == arg0)
            return name;
    }
    
    throw "Unknown mod " + string(arg0);
}

function getEaseFromByte(arg0)
{
    var eases = global.eases;
    var easeBytes = global.easeBytes;
    var names = variable_struct_get_names(eases);
    
    for (var i = 0; i < array_length(names); i++)
    {
        var name = names[i];
        
        if (variable_struct_get(easeBytes, name) == arg0)
            return variable_struct_get(eases, name);
    }
}
