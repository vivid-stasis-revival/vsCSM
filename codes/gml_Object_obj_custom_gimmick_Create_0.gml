event_inherited();
for (var i = 0; i < proxyCount; i++)
    ds_list_find_value(proxies, i).pra = 1;
funcs = 
{
    aberControl: function(arg0)
    {
        var radius = cc.mod_aberamp;
        cc.mod_abx = radius * 0.2 * sin(arg0 * 0.25 * pi);
        cc.mod_aby = radius * -0.4 * cos(arg0 * 0.25 * pi);
    }
};

addExtraMod("linearblurx")
addExtraMod("linearblury")
cc.mod_linearblurx=0;
cc.mod_linearblury=0;