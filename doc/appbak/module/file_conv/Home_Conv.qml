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

    title: qsTr("File Format Convert")

    FluExpander{
        headerText: qsTr("Version and Description")
        Layout.fillWidth: true
        Layout.rightMargin: 15
    }

    ExtraItem{
        _icon:FluentIcons.Send
        _text:qsTr("原始观测数据转换")
        _text_extra:qsTr("Rinex、RTCM格式数据转换")
        _url:"qrc:/module/file_conv/Page_Conv.qml"
    }

    ExtraItem{
        _icon:FluentIcons.SendFill
        _text:qsTr("结果文件格式转换")
        _text_extra:qsTr("定位结果文件格式转换")
        _url:"qrc:/module/file_conv/Page_Format.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("版本信息")
        _text_extra:qsTr("模块版本、使用算法和依赖库")
        _url:"qrc:/module/file_conv/Page_Info.qml"
    }

}
