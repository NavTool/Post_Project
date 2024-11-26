import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"
import "../../qml/extra"

FluScrollablePage {

    title: qsTr("Position Processing")

    FluExpander{
        headerText: qsTr("Version and Description")
        Layout.fillWidth: true
        Layout.rightMargin: 15
    }

    ExtraItem{
        _icon:FluentIcons.Send
        _text:qsTr("实时数据处理")
        _text_extra:qsTr("接入实时数据或记录文件进行定位解算")
        _url:"qrc:/module/post_proc/Page_Navi.qml"
    }

    ExtraItem{
        _icon:FluentIcons.SendFill
        _text:qsTr("事后数据处理")
        _text_extra:qsTr("导入观测文件或记录文件进行定位解算")
        _url:"qrc:/module/post_proc/Page_Post.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("版本信息")
        _text_extra:qsTr("模块版本、使用算法和依赖库")
        _url:"qrc:/module/post_proc/Page_Info.qml"
    }

}
