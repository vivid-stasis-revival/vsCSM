在游戏根目录下找到Custom Songs文件夹，之后将你的自制谱文件夹拖进去就行了。
<br>

一个自制谱文件夹有以下文件：

- music.ogg
- jacket.png（非必须，图片格式可以是png,jpg,jpeg,gif）
- preview.ogg（非必须）
- .vsc谱面文件
- .vsm特效文件（非必须）
- info.json，shatterinfo.json（二者至少有一个）

一个完整的info.json文件如下 **（注意，"//"开头的文字是我为了介绍方便加的注释，实际info.json和shatterinfo.json内不能有注释！）**

```jsonc
{
    "chart_id": "cusi", //谱面识别名，需要和谱面文件夹同名
    "name": "SuddeNDeath",
    "formatted_name": "Sudde\u88a0Death",
    "artist": "xi vs. Morimori Atsushi",
    "bpm_display": "236",
    "version": "9.9.9",
    "is_original": false,
    "is_published": true,
    "jacket_artist": "idk",
    "has_encore": true,//有encore难度这个必须为true；
    "difficulty_constant_1": 0,//OPENING难度值
    "difficulty_display_1": "0",//OPENING显示的难度
    "note_designer_1": "N/A",//OPENING的谱师名
    //往下2为MIDDLE，3为FINALE，4为ENCORE；没有ENCORE难度可不写4的部分
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
    }
}
```

一个完整的shatterinfo.json文件如下

```jsonc
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

info.json:

```jsonc
{
    "chart_id": "cusi", 
    "name": "SuddeNDeath",
    "formatted_name": "Sudde\u88a0Death",
    "artist": "xi vs. Morimori Atsushi",
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
    }
}
```

shatterinfo.json:

```jsonc
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
