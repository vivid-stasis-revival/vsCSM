## 准备

vsm文件需要和谱面同目录，且文件名与对应谱面的文件名保持一致，如谱面为ENCORE.vsc，则vsm文件名应为ENCORE.vsm。

## 文件格式

一条gimmick语句格式如下，使用括号标注代表可选；gimmick语句之间用换行分隔：
【注意：vsm内的时间单位均是节拍。】

```
(!proxies:{proxies})
(!obj:{object})
{beat(:endbeat:step)},{duration},{easing},{value1},{value2},{modname},{proxy}

(mpf)
({beat},{e},{func})
```

**!proxies**：指定谱面使用的轨道数量<br>
**!obj**：指定该vsm需要引用的特效库，用于使用一些独有的gimmick，不填默认为常规gimmick（即obj_base_gimmick）；一个谱面只能使用一个obj，具体可使用的obj在文档末尾列出<br>
**{beat(:endbeat:step)}**：指定gimmick所在时间；如果使带上括号内的部分代表重复该gimmick，此时endbeat指最后一次重复的时间，step指每次重复的间隔；<br>
**{duraion}**：该gimmick的持续时间；<br>
**{easing}**：该gimmick使用的缓动，具体可用缓动将会写在文档末尾；<br>
**{value1}，{value2}**：如果两个值都有使用则分别代表gimmick的开始值，结束值；使用"_"符号或值573613代表不使用其中一个值；<br>
**{modname}**：gimmck名，具体可用gimmick见文档末尾;<br>
**{proxy}**：要控制的轨道编号，0为第一个轨道;<br>
<br>
**此处介绍mpf**<br>
mpf用于指定在beat处启用一个函数，一般这个函数与一个gimmick关联，在该gimmick填入的参数会送到该函数进行计算；一个object可能会有一或多个函数，每个obj可用的mpf会在下方表格列出。<br>
**mpf**：mpf字段开始标志；<br>
**{beat}**：设置启用时间；<br>
**{e}**：设置结束启用时间；<br>
**{func}**：指定启用的函数名；<br>

**注**：关于感叹号开头的语句，只有!proxies和!obj有具体含义，其它只要形如!{name}:{content}的形式不会被游戏读取，或者说不会对游戏造成影响（当然加太多可能会增加内存消耗，因为感叹号语句本质上是给chart.mods的data信息加属性），其中name为非obj和proxies以外的字符串；content为任意字符串。<br>

## 示例

```20,3,linear,_,0.5,uialpha,-1```

这个语句代表在20beat时，用3beat的时间让UI透明度变为50%；<br>

```36.00,4,outCubic,1,0,fx_glow,-1```

这个语句代表在36beat时让界面发光，持续4beat，光的强度4beat内按outCubic缓动减弱；<br>

## 枚举

**可用缓动**<br>easings.net上的都支持，但是注意书写格式：<br>**线性**：linear<br>其它的以sine系列为例<br>**加速**:inSine<br>**减速**:outSine<br>**先加后减**:inOutSine<br>

**以下是基础gimmick**<br>
*注：ssf指quaver里scroll speed factor的效果；<br>使用这些gimmick时proxy必须为-1*

| 可用mod               | 作用                 | 说明                                            |
|:-------------------:|:------------------:|:---------------------------------------------:|
| "scrollspeed"       | 调整流速，效果和velocity相似 | 默认值为2                                         |
| "noterot"           | 旋转note             | 数为顺时针旋转 ，正数逆时针旋转                              |
| "velocity"          | 调整全局ssf            | 默认为1                                          |
| "driven"            | 带着判定线平移谱面          | 默认为0                                          |
| "beat"              | 让note每拍晃动一次        | 值越大晃动幅度越大                                     |
| "wave"              | note波浪下落           | 值越大起伏越明显                                      |
| "yoffset"           | 给谱面施加高度偏移          | 默认为0                                          |
| "notealp"           | 调整note透明度          | val范围[0,1]<br>1完全不透明                          |
| "scrollind0"        | 调整1轨道的流速           | 默认值为2                                         |
| "scrollind1"        | 调整2轨道的流速           | 默认值为2                                         |
| "scrollind2"        | 调整3轨道的流速           | 默认值为2                                         |
| "scrollind3"        | 调整4轨道的流速           | 默认值为2                                         |
| "scrollind4"        | 调整左bumper的流速       | 默认值为2                                         |
| "scrollind5"        | 调整中bumper的流速       | 默认值为2                                         |
| "scrollind6"        | 调整右bumper的流速       | 默认值为2                                         |
| "drawdist"          | 调整note出现的位置        | 值越小出现位置越靠下                                    |
| "pburstleft"        | 向左喷粒子              | 值越小，粒子密度越小                                    |
| "pburstright"       | 向右喷粒子              | 同上                                            |
| "particlexpower"    | 向粒子施加横向速度          | 默认值为0                                         |
| "particleypower"    | 向粒子施加纵向速度          | 默认值为0                                         |
| "uialpha"           | ui透明度              | val范围[0-1]<br>1完全不透明                          |
| "fx_contrast"       | 调整ui颜色的对比度         | 默认为1                                          |
| "fx_glow"           | ui发光               | 默认值为0                                         |
| "fx_particleglow"   | 粒子发光               | 默认值为0                                         |
| "pburstspeed"       | 调整粒子喷射速度           |                                               |
| "freeze"            | note停止下落           | 0解冻，1冻结                                       |
| "fx_chroma_distort" | 作用未知               |                                               |
| "fx_film"           | 老电影效果              | 0不启用，1启用                                      |
| "boost_distance"    | 让note靠近判定线时加速下落    | 0为无效果，值越大加速越明显；<br>如果是负数，效果...很奇特只能说，而且值越小越明显 |
| "boost_time"        | 作用未知               |                                               |
| "hom"               | 轨道重影               | 使用时proxies不能为-1；0为无重影，值越大，重影越明显，大于1后就没什么变化了   |

<br>

**这些是轨道控制gimmick**<br>
*注：以下记横轴为x轴，纵轴为y轴，竖轴为z轴；轨道默认在（0，0）；<br>proxy不可为-1*

| 可用mod        | 作用             | 说明                                                                        |
|:------------:|:--------------:|:-------------------------------------------------------------------------:|
| "spinradius" | 作用未知           |                                                                           |
| "spiny"      | 作用未知           |                                                                           |
| "spinx"      | 作用未知           |                                                                           |
| "prx"        | 调整轨道的x坐标       | 默认为0                                                                      |
| "prxb"       | 调整轨道的x坐标       | 默认为0                                                                      |
| "prxc"       | 调整轨道的x坐标       | 默认为0                                                                      |
| "prxd"       | 调整轨道的x坐标       | 默认为0<br>这四个有什么区别吗（恼                                                       |
| "pry"        | 调整轨道的y坐标       | 默认为0                                                                      |
| "pryb"       | 调整轨道的y坐标       | 默认为0                                                                      |
| "pryc"       | 调整轨道的y坐标       | 默认为0                                                                      |
| "pryd"       | 调整轨道的y坐标       | 默认为0                                                                      |
| "prsx"       | 将轨道拉斜          | 正常为0，绝对值越大倾斜越明显                                                           |
| "pra"        | 调整轨道透明度        | 0为完全透明，1为完全不透明                                                            |
| "przm"       | 调整轨道缩放         | 默认为1                                                                      |
| "przmb"      | 调整轨道缩放         | 默认为1                                                                      |
| "przmc"      | 调整轨道缩放         | 默认为1                                                                      |
| "przx"       | 调整轨道横向缩放       | 默认为1                                                                      |
| "przy"       | 调整轨道纵向缩放       | 正常为1                                                                      |
| "prrx"       | 调整轨道在x轴上的旋转角度  | 默认为0                                                                      |
| "prry"       | 调整轨道在y轴上的旋转角度  | 默认为0                                                                      |
| "prrz"       | 调整轨道在z轴上的旋转角度  | 默认为0                                                                      |
| "prrzb"      | 调整轨道在z轴上的旋转角度  | 默认为0                                                                      |
| "shxs"       | 设置x轴方向上波浪特效的相位 |                                                                           |
| "shxp"       | 设置x轴方向上波浪特效的频率 |                                                                           |
| "shxa"       | 设置x轴方向上波浪特效的振幅 |                                                                           |
| "shys"       | 设置y轴方向上波浪特效的相位 |                                                                           |
| "shyp"       | 设置y轴方向上波浪特效的频率 |                                                                           |
| "shya"       | 设置y轴方向上波浪特效的振幅 |                                                                           |
| "prct"       | 将ui遮盖向上移动      | 0为完全不遮盖，1完全遮盖                                                             |
| "prcb"       | 将ui遮盖向下移动      | 0为完全不遮盖，1完全遮盖                                                             |
| "prcl"       | 将ui遮盖向右移动      | 0为完全遮盖，320为完全不遮盖；<br>如果先用cl再用cr或反过来效果是先向右拉走遮盖，再从左侧拉出遮盖<br>（哈集美丽你写的什么艾斯比代码 |
| "prcr"       | 将ui遮盖向右移动      | （同prcr）                                                                   |
| "prvib"      | 作用未知           |                                                                           |
| "shct"       | 将轨道从上往下覆盖      | 0为完全不覆盖，1为完全覆盖                                                            |
| "shcb"       | 将轨道从下往上覆盖      | 0为完全不覆盖，1为完全覆盖                                                            |
| "shcl"       | 将轨道从左往右覆盖      | 0为完全不覆盖，1为完全覆盖                                                            |
| "shcr"       | 将轨道从右往左覆盖      | 0为完全不覆盖，1为完全覆盖                                                            |
| "shfb"       | 往轨道底部添加阴影      | 0为无阴影，值越大阴影覆盖范围越大                                                         |
| "shft"       | 往轨道顶部添加阴影      | 0为无阴影，值越大阴影覆盖范围越大                                                         |
| "shfl"       | 往轨道左侧添加阴影      | 0为无阴影，值越大阴影覆盖范围越大                                                         |
| "shfr"       | 往轨道右侧添加阴影      | 0为无阴影，值越大阴影覆盖范围越大                                                         |

**以下是可用obj**

| 可用obj                      | 描述  | 可用mpf                                         |
|:--------------------------:|:---:|:---------------------------------------------:|
| obj_base_gimmick           |     | 无                                             |
| obj_00_gimmick             |     | spinProxyZero <br>spinProxyOne<br>spinProxies |
| obj__gimmick               |     | quake<br>spin3D<br>wiggle<br>swirl            |
| obj_00_gimmick_old         |     | spinProxyZero <br>spinProxyOne<br>spinProxies |
| obj_aleph_gimmick          |     | aberControl                                   |
| obj_angelstar_gimmick      |     | aberControl                                   |
| obj_astellion_gimmick      |     | aberControl                                   |
| obj_convergence_gimmick    |     | aberControl                                   |
| obj_credits_gimmick_encore |     | 无                                             |
| obj_credits_gimmick        |     | 无                                             |
| obj_distortedfate_gimmick  |     | aberControl                                   |
| obj_dracula_gimmick        |     | aberControl                                   |
| obj_firstbreath_gimmick    |     | aberControl                                   |
| obj_lastwish_gimmick       |     | aberControl                                   |
| obj_libertia_gimmick       |     | aberControl                                   |
| obj_marenol_gimmick        |     | spinDizzy                                     |
| obj_memories_gimmick       |     | aberControl                                   |
| obj_multigrode_gimmick     |     | aberControl                                   |
| obj_pictured_gimmick       |     | aberControl                                   |
| obj_plaude_gimmick         |     | aberControl                                   |
| obj_ram_gimmick            |     | quake<br>wigglr<br>filcker                    |
| obj_scarletdeath_gimmick   |     | aberControl                                   |
| obj_self_gimmick           |     | aberControl                                   |
| obj_stargazers_gimmick     |     | aberControl                                   |
| obj_stopmotion_gimmick     |     | aberControl                                   |
| obj_supernova_gimmick      |     | aberControl                                   |
| obj_times_gimmick          |     | spinVibrate                                   |
| obj_tutorial_gimmick       |     | aberControl                                   |
| obj_unraveling_gimmick     |     | aberControl                                   |

<br>
各个obj的独有gimmick将另起文件说明
