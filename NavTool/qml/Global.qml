pragma Singleton

import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

QtObject {
    id: control
    property var starter
    property int displayMode: NavigationViewType.Auto
    property int windowEffect: WindowEffectType.Normal

    property var windowName: INFO_APP_NAME
    property string windowIcon: "qrc:/qt/qml/NavTool/res/logo.png"


    property int displayScreen:0   //0:初始页面  1：主要页面  2：文件页面

    property int displayPage:0   //0:blink  1：map  2：main

    property int mainScreenHeaderBarCurrentIndex:1   //主页面当前停留的菜单编号（从0开始）


    //主页页面可视控制
    property bool visable_header:true  //顶部菜单栏可视（顶部的那一排功能（文件、开始...））
    property bool visable_header_extra:true  //顶部菜单栏可视控制（顶部的具体功能页）
    property bool visable_footer:true  //底部状态栏可视控制（最底部那一排）
    //主要布局控制（左、中、右各两格）
    property bool visable_left_side:true //左侧可视（左状态栏）
    property bool visable_right_side:true //右侧可视（右状态栏）
    property bool visable_mid_side:true //中间可视（主页面+底部状态栏）
    property bool visable_left_top_side:true //左侧上部可视
    property bool visable_left_bottom_side:true //左侧下部可视
    property bool visable_mid_top_side:true //中间上部可视（主页面）
    property bool visable_mid_bottom_side:true //中间下部可视（日志栏）
    property bool visable_right_top_side:true //右侧上部可视
    property bool visable_right_bottom_side:true //右侧下部可视

    //当主页面可视化更新的时候，根据更新的状态来配置联动可视化状态
    function update_visable()
    {
        //根据六个子模块的可视性来确定三个大组（左、中、右）的可视性（
        if(visable_left_top_side || visable_left_bottom_side)
        {
            visable_left_side=true
        }
        else
        {
            visable_left_side=false
        }

        if(visable_right_top_side || visable_right_bottom_side)
        {
            visable_right_side=true
        }
        else
        {
            visable_right_side=false
        }

        if(visable_mid_top_side || visable_mid_bottom_side)
        {
            visable_mid_side=true
        }
        else
        {
            visable_mid_side=false
        }
    }



}
