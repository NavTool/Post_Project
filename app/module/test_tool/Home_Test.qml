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

    title: qsTr("Test Tool")

    FluExpander{
        headerText: qsTr("Version and Description")
        Layout.fillWidth: true
        Layout.rightMargin: 15
    }

    ExtraItem{
        // _icon:FluentIcons.ChromeSwitch
        _icon:FluentIcons.Sort
        _text:qsTr("TCP Server 转发工具")
        _text_extra:qsTr("连通两个TCP端口，并进行数据互传")
        _url:"qrc:/module/test_tool/Page_TCP_Connector.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Market
        _text:qsTr("Ntrip Server 压测工具")
        _text_extra:qsTr("模拟并创建若干个Ntrip Server挂载点连接")
        _url:"qrc:/module/test_tool/Page_Ntrip_Server_Sim.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Market
        _text:qsTr("Ntrip Client 压测工具")
        _text_extra:qsTr("模拟并创建若干个Ntrip Client用户连接")
        _url:"qrc:/module/test_tool/Page_Ntrip_Client_Sim.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("版本信息")
        _text_extra:qsTr("工具版本、运行环境")
        _url:"qrc:/module/test_tool/Page_Info.qml"
    }

}
