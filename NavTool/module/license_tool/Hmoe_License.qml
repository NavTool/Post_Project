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

    title: qsTr("User Management")

    FluExpander{
        headerText: qsTr("Version and Description")
        Layout.fillWidth: true
        Layout.rightMargin: 15
    }

    ExtraItem{
        _icon:FluentIcons.People
        _text:qsTr("生成工具")
        _text_extra:qsTr("生成密钥")
        _url:"qrc:/module/auth_gui/Page_User_Record.qml"
    }

    ExtraItem{
        _icon:FluentIcons.ContactInfo
        _text:qsTr("验证工具")
        _text_extra:qsTr("验证注册的密钥")
        _url:"qrc:/module/auth_gui/Page_User_Online.qml"
    }


    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("版本信息")
        _text_extra:qsTr("模块版本、运行环境")
        _url:"qrc:/module/auth_gui/Page_Info.qml"
    }

}
