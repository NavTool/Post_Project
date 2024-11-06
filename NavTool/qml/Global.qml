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

    property int mainScreenHeaderBarCurrentIndex:1   //主页面





    property bool visable_menu_bar:true  //顶部菜单栏可视
    property bool visable_top_side:true  //顶部菜单栏可视
    property bool visable_left_side:true //左侧可视
    property bool visable_right_side:true //右侧可视
    property bool visable_bottom_side:true //底部可视







}
