import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI

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
        _text:qsTr("用户列表")
        _text_extra:qsTr("查看、管理已经注册的账号")
        _url:"qrc:/module/auth_gui/Page_User_Record.qml"
    }

    ExtraItem{
        _icon:FluentIcons.ContactInfo
        _text:qsTr("在线用户")
        _text_extra:qsTr("查看、管理在线用户")
        _url:"qrc:/module/auth_gui/Page_User_Online.qml"
    }

    ExtraItem{
        _icon:FluentIcons.AddFriend
        _text:qsTr("添加用户")
        _text_extra:qsTr("添加一个新的账号")
        _url:"qrc:/module/auth_gui/Page_User_Add.qml"
    }

    ExtraItem{
        _icon:FluentIcons.SearchAndApps
        _text:qsTr("查找用户")
        _text_extra:qsTr("查找指定账户")
        _url:"qrc:/module/auth_gui/Page_User_Search.qml"
    }


    ExtraItem{
        _icon:FluentIcons.Lexicon
        _text:qsTr("用户日志")
        _text_extra:qsTr("查看用户的登录记录")
        _url:"qrc:/module/auth_gui/Page_User_Log.qml"
    }

    ExtraItem{
        _icon:FluentIcons.PlayerSettings
        _text:qsTr("登录策略")
        _text_extra:qsTr("配置用户登录策略")
        _url:"qrc:/module/auth_gui/Page_Login_Policy.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Settings
        _text:qsTr("服务设置")
        _text_extra:qsTr("连接、配置用户管理数据库")
        _url:"qrc:/module/auth_gui/Page_Setting.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("版本信息")
        _text_extra:qsTr("模块版本、运行环境")
        _url:"qrc:/module/auth_gui/Page_Info.qml"
    }

}
