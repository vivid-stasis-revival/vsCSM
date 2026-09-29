## 准备

vsm 文件需要和谱面同目录，且文件名与对应谱面的文件名保持一致，如谱面为 ENCORE.vsc，则 vsm 文件名应为 ENCORE.vsm。

## 文件格式

一条 gimmick 语句格式如下，使用方括号括住的部分表示可选部分；gimmick 语句之间用换行分隔：

【注意：vsm 内的时间单位均是节拍。】

```
[!proxies:一个整数]
[!obj:gimmick obj名]
beat[:endbeat:step],duration,easing,value1,value2,modname,proxy
[
mpf
beat,endbeat,func
]
```

**!proxies**：指定谱面使用的轨道数量

**!obj**：指定该 vsm 需要引用的特效库，用于使用一些独有的 gimmick，不填默认为常规 gimmick（即 obj_base_gimmick）；一个谱面只能使用一个 obj，具体可使用的 obj 在文档末尾列出

**beat\[:endbeat:step\]**：指定 gimmick 所在时间；如果使带上括号内的部分代表重复执行该 gimmick，此时 endbeat 指最后一次重复的时间，step 指每次重复的间隔；

**duration**：该 gimmick 的持续时间；

**easing**：该 gimmick 使用的缓动，具体可用缓动将会写在文档末尾；

**value1，value2**：通常情况下，如果两个值都有使用则分别代表 gimmick 的开始值，结束值；使用 "\_" 符号或值 573613 代表不使用其中一个值；

**modname**：gimmick 名，具体可用 gimmick 见文档末尾;

**proxy**：要控制的轨道编号，0 为第一个轨道；

此处介绍 mpf

mpf 用于指定在一段时间内要运行的函数（或者说功能），运行期间这个函数会被每帧执行一次

**mpf**：mpf 字段开始标志；

**beat**：设置启用时间；

**endbeat**：设置结束时间；

**func**：指定启用的函数名；

注：关于感叹号开头的语句，只有 !proxies 和 !obj 有具体含义，其它只要形如 !{name}:{content} 的形式不会被游戏读取，或者说不会对游戏造成影响（当然加太多可能会增加内存消耗，因为感叹号语句本质上是给 chart.mods 的 data 信息加属性），其中 name 为非 obj 和 proxies 以外的字符串；content 为任意字符串。

## 示例

```
20,3,linear,_,0.5,uialpha,-1
```

这个语句代表在 20 beat 时，用 3 beat 的时间让 UI 透明度变为 50%；

```
36.00,4,outCubic,1,0,fx_glow,-1
```

这个语句代表在 36 beat 时让界面发光，持续 4 beat，光的强度 4 beat 内按 outCubic 缓动减弱；

## 枚举

### 可用缓动

easings.net 上的都支持，但是注意书写格式：

**线性**：linear

其它的以 sine 系列为例

**加速**：inSine

**减速**：outSine

**先加后减**：inOutSine

### 以下是基础 gimmick

_注：_

- _ssf 指 quaver 里 scroll speed factor 的效果；_
- _使用这些 gimmick 时 proxy 必须为 -1；_
- _记当前流速下1ms移动的距离为1msx；_

| **可用 mod**        | **作用**                                                 | **说明**                                                                                            |
| ------------------- | -------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| "scrollspeed"       | 调整流速，效果 和 velocity 相似                          | 默认值为 玩家设置流速/5+1                                                                           |
| "noterot"           | 旋转 note                                                | 负数为顺时针旋转 ，正数逆时针旋转 ，单位deg                                                         |
| "velocity"          | 调整全局 ssf                                             | 默认为 1                                                                                            |
| "driven"            | 带着判定线平移谱面n msx的距离                            | 默认为 0                                                                                            |
| "beat"              | 让 note 每拍晃动一次                                     | 绝对值越大晃动幅度越大                                                                              |
| "wave"              | note 波浪下落                                            | 值越大起伏越明显                                                                                    |
| "yoffset"           | 给谱面施加n msx的高度偏移                                | 默认为 0，正数往下，负数往上                                                                        |
| "notealp"           | 调整 note 不透明度                                       | val 范围 \[0,1\]；<br><br>1 为完全不透明                                                            |
| "scrollind0"        | 调整 1 轨道的 velocity                                   | 默认值为 1                                                                                          |
| "scrollind1"        | 调整 2 轨道的 velocity                                   | 默认值为 1                                                                                          |
| "scrollind2"        | 调整 3 轨道的 velocity                                   | 默认值为 1                                                                                          |
| "scrollind3"        | 调整 4 轨道的 velocity                                   | 默认值为 1                                                                                          |
| "scrollind4"        | 调整左 bumper 的 velocity                                | 默认值为 1                                                                                          |
| "scrollind5"        | 调整中 bumper 的 velocity                                | 默认值为 1                                                                                          |
| "scrollind6"        | 调整右 bumper 的 velocity                                | 默认值为 1                                                                                          |
| "drawdist"          | 设置note在距判定n msx处(?)位置开始显示                   | 值越小出现位置越靠下；<br><br>默认值为1250                                                          |
| "pburstleft"        | 向左喷粒子                                               | 值越小，粒子密度越小                                                                                |
| "pburstright"       | 向右喷粒子                                               | 同上                                                                                                |
| "particlexpower"    | 向粒子施加横向速度                                       | 默认值为 0                                                                                          |
| "particleypower"    | 向粒子施加纵向速度                                       | 默认值为 0                                                                                          |
| "uialpha"           | ui 不透明度                                              | val 范围 \[0-1\]；<br><br>1时完全不透明                                                             |
| "fx_contrast"       | 调整 ui 颜色的对比度                                     | 默认为 1                                                                                            |
| "fx_glow"           | ui 发光                                                  | 默认值为 0                                                                                          |
| "fx_particleglow"   | 粒子发光                                                 | 默认值为 0.5                                                                                        |
| "pburstspeed"       | 调整粒子喷射速度                                         |                                                                                                     |
| "freeze"            | 完全停止note下落                                         | 0 解冻，1 冻结                                                                                      |
| "fx_chroma_distort" | 效果为带色散的扭曲                                       | 值不可为0，否则会黑屏                                                                               |
| "fx_film"           | 老电影效果                                               | 0 不启用，1 启用                                                                                    |
| "boost_distance"    | 让 note 在靠近判定线n 像素处开始加速下落<sup>\[1\]</sup> | 0 为无效果，值越大开始加速的距离离判定线越远；<br><br>如果是负数会让 note 往上飞；<br><br>默认值为0 |
| "boost_time"        | 控制 boost_distance 的加速度                             | 值越大加速度越小，小于等于 0 不生效；<br><br>默认值为300                                            |
| "hom"               | 轨道重影                                                 | 使用时 proxies 不能为 -1；0 为无重影，值越大，重影越明显，大于 1 后就没什么变化了                   |

**\[1\]** boost系列本质上是对所有note的纵向位置加偏移，这个偏移是在boost_time msx处开始以inCubic减少，到note所在时间处为0。

### 这些是轨道控制 gimmick

_注：_

- _游玩房间的大小为320x180像素，左上角为(0，0)；_
- _以下记横轴为 x 轴，纵轴为 y 轴，竖轴为 z 轴，向下，向右为正；_
- _轨道中心(?)在房间内的实际位置为（160,82)；_
- _轨道左右(含边框)的实际横坐标范围为\[114,207\]像素，黑色矩形背景板右延伸32像素，左延伸33像素_
- _proxy 不可为 -1；_

| **可用 mod** | **作用**                          | **说明**                                                                                                        |
| ------------ | --------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| "spinradius" | 用于控制 spinProxies/swirl 的幅度 | mpf 中有 spinProxies/swirl 才生效                                                                               |
| "spiny"      | 已废弃                            |                                                                                                                 |
| "spinx"      | 已废弃                            |                                                                                                                 |
| "prx"        | 调整轨道的 x 相对坐标             | 默认为 0<br><br>x 实际相对位置 = prx+prxb+prxc+prxd                                                             |
| "prxb"       | 调整轨道的 x 相对坐标             | 默认为 0                                                                                                        |
| "prxc"       | 调整轨道的 x 相对坐标             | 默认为 0                                                                                                        |
| "prxd"       | 调整轨道的 x 相对坐标             | 默认为 0                                                                                                        |
| "pry"        | 调整轨道的 y 相对坐标             | 默认为 0；<br><br>y 实际相对位置 = pry+pryb+pryc+pryd                                                           |
| "pryb"       | 调整轨道的 y 相对坐标             | 默认为 0                                                                                                        |
| "pryc"       | 调整轨道的 y 相对坐标             | 默认为 0                                                                                                        |
| "pryd"       | 调整轨道的 y 相对坐标             | 默认为 0                                                                                                        |
| "prsx"       | 将轨道拉斜                        | 正常为 0，绝对值越大倾斜越明显                                                                                  |
| "pra"        | 调整轨道透明度                    | 0 为完全透明，1 为完全不透明                                                                                    |
| "przm"       | 调整轨道缩放                      | 默认为 1；<br><br>实际缩放 = przm \* przmb \* przmc                                                             |
| "przmb"      | 调整轨道缩放                      | 默认为 1                                                                                                        |
| "przmc"      | 调整轨道缩放                      | 默认为 1                                                                                                        |
| "przx"       | 调整轨道横向缩放                  | 默认为 1                                                                                                        |
| "przy"       | 调整轨道纵向缩放                  | 正常为 1                                                                                                        |
| "prrx"       | 调整轨道在 x 轴上的旋转角度       | 默认为 0                                                                                                        |
| "prry"       | 调整轨道在 y 轴上的旋转角度       | 默认为 0                                                                                                        |
| "prrz"       | 调整轨道在 z 轴上的旋转角度       | 默认为 0；<br><br>实际z轴旋转角 = prrz + prrzb                                                                  |
| "prrzb"      | 调整轨道在 z 轴上的旋转角度       | 默认为 0                                                                                                        |
| "shxs"       | 设置 x 轴方向上波浪特效的相位     |                                                                                                                 |
| "shxp"       | 设置 x 轴方向上波浪特效的频率     |                                                                                                                 |
| "shxa"       | 设置 x 轴方向上波浪特效的振幅     |                                                                                                                 |
| "shys"       | 设置 y 轴方向上波浪特效的相位     |                                                                                                                 |
| "shyp"       | 设置 y 轴方向上波浪特效的频率     |                                                                                                                 |
| "shya"       | 设置 y 轴方向上波浪特效的振幅     |                                                                                                                 |
| "prct"       | 设定轨道区域的下边界（屏幕 y = 180 − ceil(180 × prct)，下边界以下的轨道不再绘制）                | 取值为屏幕高度的比例。默认 prct = 0.08（下边界 y = 165，正好是底部 UI 条的上沿）、prcb = 0（上边界 y = −1，即不遮盖）；只改其中一个时，另一个按默认值参与计算。特殊情况：prct = 1 时下边界收到 y = 0、轨道区域几乎不再绘制；prcb 接近 1 时上边界会压到屏幕最下方。<br><br>详见注 <sup>\[2\]</sup>                                                                                      |
| "prcb"       | 设定轨道区域的上边界（屏幕 y = 180 × prcb − 1，上边界以上的轨道不再绘制）                | 取值为屏幕高度的比例。默认 prct = 0.08（下边界 y = 165，正好是底部 UI 条的上沿）、prcb = 0（上边界 y = −1，即不遮盖）；只改其中一个时，另一个按默认值参与计算。特殊情况：prct = 1 时下边界收到 y = 0、轨道区域几乎不再绘制；prcb 接近 1 时上边界会压到屏幕最下方。<br><br>详见注 <sup>\[2\]</sup>                                                                                      |
| "prcl"       | 设定轨道区域的水平边界（屏幕 x，单位像素）                | 单位是屏幕像素（0 ~ 320）；0.35 只是“未设置”的标记值。默认左边界为 113 − shxa（只包含轨道列本身），默认不包含 UI，要让左侧的 UI 也一起被变换就把它改小（如 0），并且必须和 prcr 一起写。<br><br>详见注 <sup>\[2\]</sup> |
| "prcr"       | 设定轨道区域的水平边界（屏幕 x，单位像素）                | 单位同上，也是 0 ~ 320 的屏幕像素。默认右边界为 208 + shxa；要让右侧的 UI 也一起被变换就把它改大（如 320）。特殊情况：只写一个会让另一侧保持 0.35、范围宽度变成负数（轨道消失或错位）。<br><br>详见注 <sup>\[2\]</sup> |
| "prvib"      | 用于控制 quake 效果的强度         | mpf 中有 quake 的才有效                                                                                         |
| "shct"       | 把该轨道重绘的画面中、顶部 shct × 180 像素的范围抹成透明                | 取值以整个屏幕（320 × 180）为基准的比例；默认 0（不生效），1 时整块画面都在范围内、该轨道完全消失。<br><br>详见注 <sup>\[3\]</sup>                                                                                    |
| "shcb"       | 把该轨道重绘的画面中、底部 shcb × 180 像素的范围抹成透明                | 取值以整个屏幕（320 × 180）为基准的比例；默认 0（不生效），1 时整块画面都在范围内、该轨道完全消失。<br><br>详见注 <sup>\[3\]</sup>                                                                                    |
| "shcl"       | 把该轨道重绘的画面中、左侧 shcl × 320 像素的范围抹成透明                | 取值以整个屏幕（320 × 180）为基准的比例；默认 0（不生效），1 时整块画面都在范围内、该轨道完全消失。<br><br>详见注 <sup>\[3\]</sup>                                                                                    |
| "shcr"       | 把该轨道重绘的画面中、右侧 shcr × 320 像素的范围抹成透明                | 取值以整个屏幕（320 × 180）为基准的比例；默认 0（不生效），1 时整块画面都在范围内、该轨道完全消失。<br><br>详见注 <sup>\[3\]</sup>                                                                                    |
| "shfb"       | 底部透明范围的渐变宽度（长度 = shfb × 180 像素）                | 长度同样是屏幕对应方向尺寸的比例（数值 × 180 或 × 320 得到像素）；默认 0 = 硬边。特殊情况：对应方向的 shc\* 为 0 时，单独给它一个较大的值就是从该边缘往里的渐显渐变。<br><br>详见注 <sup>\[3\]</sup>                                                                              |
| "shft"       | 顶部透明范围的渐变宽度（长度 = shft × 180 像素）                | 长度同样是屏幕对应方向尺寸的比例（数值 × 180 或 × 320 得到像素）；默认 0 = 硬边。特殊情况：对应方向的 shc\* 为 0 时，单独给它一个较大的值就是从该边缘往里的渐显渐变。<br><br>详见注 <sup>\[3\]</sup>                                                                              |
| "shfl"       | 左侧透明范围的渐变宽度（长度 = shfl × 320 像素）                | 长度同样是屏幕对应方向尺寸的比例（数值 × 180 或 × 320 得到像素）；默认 0 = 硬边。特殊情况：对应方向的 shc\* 为 0 时，单独给它一个较大的值就是从该边缘往里的渐显渐变。<br><br>详见注 <sup>\[3\]</sup>                                                                              |
| "shfr"       | 右侧透明范围的渐变宽度（长度 = shfr × 320 像素）                | 长度同样是屏幕对应方向尺寸的比例（数值 × 180 或 × 320 得到像素）；默认 0 = 硬边。特殊情况：对应方向的 shc\* 为 0 时，单独给它一个较大的值就是从该边缘往里的渐显渐变。<br><br>详见注 <sup>\[3\]</sup>                                                                              |

**\[2\]** prct / prcb / prcl / prcr 一起圈出屏幕上的一个矩形区域，这个区域就是“每条轨道各自重绘一次”的范围，也就是会被 prx / pry / przm / prrz / prsx 等变换影响的范围，区域之外保持黑底。上下边界由 prct / prcb 给出（屏幕高度比例），左右边界由 prcl / prcr 给出（屏幕像素）。默认范围只有轨道列本身（113 − shxa ~ 208 + shxa），所以默认情况下轨道两侧与底部的 UI 不会跟着轨道一起动（这就是“要用 prcl / prcr 才能带上 ui”的原因）。注意：prcl / prcr 只要有一个不是 0.35，另一个也会被直接当成边界使用（未写的一侧会保持 0.35），所以两个要一起写；手动指定后，默认给横向波浪预留的 shxa 余量也不再自动生效（实际范围为 prcl + shxa ~ prcr + shxa）。另外，左边界 ≥ 右边界或上边界 ≥ 下边界时范围宽高会变成负数，绘制会异常，应避免；prct 与 prcb 都保持默认值（0.08 / 0）时代码走默认分支（上下边界直接取 0 与 165），与公式只差顶部 1 像素。

**\[3\]** shc\* 与 shf\* 的取值都以整个屏幕（320 × 180）为基准，而不是以轨道区域自身的宽高为基准（shader 里用的是整张轨道贴图的归一化纹理坐标）：例如 shcl = 0.5 表示屏幕 x = 160 以左的轨道全部透明，而不是“轨道区域左半边”；处在遮盖侧的范围内，轨道的透明度会被直接乘 0（也就是让这部分轨道变透明，露出底下的黑底、UI 或已经画好的其它轨道，而不是盖一层黑色）。它不是像 pra 那样整体调整该轨道的透明度，而是按源画面（即屏幕快照）的绝对坐标把一块矩形内的像素抹成透明：这块范围跟着画面一起被 prx / pry / przm / prrz 等变换移动，变换后不一定还在屏幕上的原位置。名字里的 c 是遮盖边界（cover），f 是该边界处的渐变宽度（fade）：f = 0（或负数）为硬边，c = 0 而 f 较大时就是从该边缘往里的一条渐显渐变。四个方向的遮盖值相乘后作用到轨道透明度上，因此可以同时使用。常用取值参考：0.35 与 0.65 正好是默认轨道区域的左右边缘（113 / 320 ≈ 0.35、208 / 320 = 0.65），所以 (shcl, shcr) = (0.35, 0.35) 相当于不生效；把轨道列按四等分取 0.35 / 0.4275 / 0.5 / 0.5725 / 0.65 两两配对，可以让每条轨道只显示自己那一轨；shcb = 0.08 对应 y = 165.6，正好从底部 UI 条的上沿开始。

### 可用 obj

| **可用 obj**               | **描述** | **可用 mpf**                                         |
| -------------------------- | -------- | ---------------------------------------------------- |
| obj_base_gimmick           |          | 无                                                   |
| obj_00_gimmick             |          | spinProxyZero<br><br>spinProxyOne<br><br>spinProxies |
| obj_\_gimmick              |          | quake<br><br>spin3D<br><br>wiggle<br><br>swirl       |
| obj_00_gimmick_old         |          | spinProxyZero<br><br>spinProxyOne<br><br>spinProxies |
| obj_aleph_gimmick          |          | aberControl                                          |
| obj_angelstar_gimmick      |          | aberControl                                          |
| obj_astellion_gimmick      |          | aberControl                                          |
| obj_convergence_gimmick    |          | aberControl                                          |
| obj_credits_gimmick_encore |          | 无                                                   |
| obj_credits_gimmick        |          | 无                                                   |
| obj_distortedfate_gimmick  |          | aberControl                                          |
| obj_dracula_gimmick        |          | aberControl                                          |
| obj_firstbreath_gimmick    |          | aberControl                                          |
| obj_lastwish_gimmick       |          | aberControl                                          |
| obj_libertia_gimmick       |          | aberControl                                          |
| obj_marenol_gimmick        |          | spinDizzy                                            |
| obj_memories_gimmick       |          | aberControl                                          |
| obj_multigrode_gimmick     |          | aberControl                                          |
| obj_pictured_gimmick       |          | aberControl                                          |
| obj_plaude_gimmick         |          | aberControl                                          |
| obj_ram_gimmick            |          | quake<br><br>wigglr<br><br>filcker                   |
| obj_scarletdeath_gimmick   |          | aberControl                                          |
| obj_self_gimmick           |          | aberControl                                          |
| obj_stargazers_gimmick     |          | aberControl                                          |
| obj_stopmotion_gimmick     |          | aberControl                                          |
| obj_supernova_gimmick      |          | aberControl                                          |
| obj_times_gimmick          |          | spinVibrate                                          |
| obj_tutorial_gimmick       |          | aberControl                                          |
| obj_unraveling_gimmick     |          | aberControl                                          |

各个 obj 的独有 gimmick 请见 Extra Gimmicks 表格