在你steam的游戏目录下找到Custom Songs文件夹（没有就创建一个），之后将你的自制谱文件夹拖进去就行了。
<br>

*在新版本(2.2.0+)你可以在Custom Songs文件夹下新建一个曲包文件夹，再把自制谱文件夹拖进去；一个曲包文件夹需要songpack_info.json文件，下文将给出格式；不拖入曲包文件夹直接放在Custom Songs下的自制谱文件夹将被归类到Custom Songs曲包*

<br>

 **（注意，格式说明内"//"开头的文字是我为了介绍方便加的注释，实际json文件内不能有注释！）**

songpack_info.json格式：

```json5
{
    "name":"Test Pack",//曲包名
    "description":"awawawa",//曲包简介
    "color1":16777215,//曲包方框两边渐变色的顶部颜色；需要填转为10进制后的HEX颜色，下同
    "color2":16777215//曲包方框两边渐变色的底部颜色
}
```

一个自制谱文件夹有以下文件：

- music.ogg
- jacket.png（非必须，图片格式可以是png,jpg,jpeg,gif）
- preview.ogg（非必须）
- .vsc谱面文件
- .vsm特效文件（非必须）
- .vmv特效信息文件（非必须，没有这个文件将无法显示gimmick stats）
- info.json，shatterinfo.json（二者至少有一个）

一个完整的info.json文件如下

```json5
{
    "chart_id": "cusi", //谱面识别名，需要和谱面文件夹同名
    "name": "SuddeNDeath",//曲名
    "formatted_name": "Sudde\u88a0Death",//原始曲名
    "artist": "xi vs. Morimori Atsushi",//曲师名
    "sort_artists":["morimori atsushi","xi"],//按曲师分类时使用的曲师名，可以填多个曲师，没写这项会把artist放进去
    "bpm_display": "236",//bpm的显示值，最好不要乱填，stats计算以这个值作为平均bpm
    "version": "9.9.9",
    "is_original": false,
    "is_published": true,
    "jacket_artist": "idk",//曲绘作者
    "has_encore": true,//有encore难度这个必须为true；
    "difficulty_constant_1": 0,//OPENING难度值
    "difficulty_display_1": "0",//OPENING显示的难度
    "note_designer_1": "N/A",//OPENING的谱师名
    //往下2为MIDDLE，3为FINALE，4为ENCORE(BACKSTAGE)；
    "difficulty_constant_2": 0,
    "difficulty_display_2": "0",
    "note_designer_2": "N/A",
    "difficulty_constant_3": 0,
    "difficulty_display_3": "0",
    "note_designer_3": "0",
    "difficulty_constant_4": 1,
    "difficulty_display_4": "18",
    "note_designer_4": "\"IV\"",
    "unlock": {
        "type": 0,
        "enc_type": 0,
        "per_difficulty": false,
        "hidden": false,
        "hint": "",
        "enc_hint": ""
    },
    //BACKSTAGE的信息，可以不写（BACKSTAGE本质上是修改ENCORE难度的音源，曲绘等信息
    //所以有这项必须带ENCORE难度）
    //谱师名和难度相关要填上面的diffculty4部分

    //以下的项均可不填，不填的项与上面相同
    "enc_data":{
        "audio_id":"miao.ogg",//曲目文件
        "preview_id":"miao_preview.ogg",//预览音频文件
        "jacket":"miao.png",//曲绘文件
        "bpm_display":"222",//bpm显示
        "name":"SuddeNDeath meow",
        "formatted_name":"Sudde\u88a0Death meow",
        "artist":"idk",
        "jacket_designer":"cusi"
    }
}
```

一个完整的shatterinfo.json文件如下

```json5
{"chart_id": "cusi", //谱面识别名，需要和谱面文件夹同名
    "name": "SuddeNDeath",
    "formatted_name": "Sudde\u88a0Death",
    "artist": "xi vs. Morimori Atsushi",
    "bpm_display": "236",
    "version": "9.9.9",
    "is_original": false,
    "is_published": true,
    "jacket_artist": "idk",
    "difficulty_name": "ZHEPUSHUIXIEDE",//shatter谱的难度名；注意：shatter谱的vsc文件名称要与这项同名
    "difficulty_number": "18+",//shatter谱的难度值
    "note_designer": "\"IV\"",//shatter谱的谱师名
    "ticket_earns": [
        9999,
        9999,
        9999
    ]//打这个shatter获得的ticket数
}
```

**无注释版本**

songpack_info.json：

```json
{
    "name":"Test Pack",
    "description":"awawawa",
    "color1":16777215,
    "color2":16777215
}
```

info.json:

```json
{
    "chart_id": "cusi",
    "name": "SuddeNDeath",
    "formatted_name": "Sudde\u88a0Death",
    "artist": "xi vs. Morimori Atsushi",
    "sort_artists":["morimori atsushi","xi"],
    "bpm_display": "236",
    "version": "9.9.9",
    "is_original": false,
    "is_published": true,
    "jacket_artist": "idk",
    "has_encore": true,
    "difficulty_constant_1": 0,
    "difficulty_display_1": "0",
    "note_designer_1": "N/A",
    "difficulty_constant_2": 0,
    "difficulty_display_2": "0",
    "note_designer_2": "N/A",
    "difficulty_constant_3": 0,
    "difficulty_display_3": "0",
    "note_designer_3": "0",
    "difficulty_constant_4": 1,
    "difficulty_display_4": "18",
    "note_designer_4": "\"IV\"",
    "unlock": {
        "type": 0,
        "enc_type": 0,
        "per_difficulty": false,
        "hidden": false,
        "hint": "",
        "enc_hint": ""
    },
    "enc_data":{
        "audio_id":"miao.ogg",
        "preview_id":"miao_preview.ogg",
        "jacket":"miao.png",
        "bpm_display":"222",
        "name":"SuddeNDeath meow",
        "formatted_name":"Sudde\u88a0Death meow",
        "artist":"idk",
        "jacket_designer":"cusi"
    }
}
```

shatterinfo.json:

```json
{"chart_id": "cusi",
    "name": "SuddeNDeath",
    "formatted_name": "Sudde\u88a0Death",
    "artist": "xi vs. Morimori Atsushi",
    "bpm_display": "236",
    "version": "9.9.9",
    "is_original": false,
    "is_published": true,
    "jacket_artist": "idk",
    "difficulty_name": "ZHEPUSHUIXIEDE",
    "difficulty_number": "18+",
    "note_designer": "\"IV\"",
    "ticket_earns": [
        9999,
        9999,
        9999
    ]
}
```
