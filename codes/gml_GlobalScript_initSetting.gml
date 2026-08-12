ini_open("system")
var soundEng=ini_read_real("config", "use_gamemaker_audio", 1);
if (soundEng==0){
    global.op_use_gamemaker_audio=1
    ini_write_real("config", "use_gamemaker_audio",1);
}
ini_close();