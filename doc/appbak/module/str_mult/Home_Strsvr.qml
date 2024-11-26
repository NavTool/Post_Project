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

    title: qsTr("Stream Service")

    FluExpander{
        headerText: qsTr("Version and Description")
        Layout.fillWidth: true
        Layout.rightMargin: 15
    }

    ExtraItem{
        _icon:FluentIcons.Flow
        _text:qsTr("服务管理")
        _text_extra:qsTr("配置和管理各个数据流的状态")
        _url:"qrc:/module/str_mult/Page_Service_Manage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.SubscriptionAdd
        _text:qsTr("添加数据流")
        _text_extra:qsTr("添加一个新的实时数据流")
        _url:"qrc:/module/str_mult/Page_Stream_Add.qml"
    }

    ExtraItem{
        _icon:FluentIcons.AllApps
        _text:qsTr("管理数据流")
        _text_extra:qsTr("查看、管理已添加的数据流配置信息")
        _url:"qrc:/module/str_mult/Page_Stream_Manage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.SaveLocal
        _text:qsTr("数据本地存储")
        _text_extra:qsTr("将数据流存储到文件")
        _url:"qrc:/module/str_mult/Page_Stream_Persistence.qml"
    }

    ExtraItem{
        _icon:FluentIcons.AreaChart
        _text:qsTr("状态统计")
        _text_extra:qsTr("服务运行状态和各个数据流统计信息")
        _url:"qrc:/module/str_mult/Page_Status.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Settings
        _text:qsTr("服务设置")
        _text_extra:qsTr("连接、配置和管理Stream服务")
        _url:"qrc:/module/str_mult/Page_Setting.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("版本信息")
        _text_extra:qsTr("模块版本、运行环境")
        _url:"qrc:/module/str_mult/Page_Info.qml"
    }

}
