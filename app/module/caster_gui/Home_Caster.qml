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

    property var navigationView

    // title: qsTr("Caster Service")

    Component.onCompleted: {
        var items = []
        for(var i=0;i<10;i++){
            items.push({title:"Item_"+(i+1)})
        }
        breadbar.items = items
    }

    FluBreadcrumbBar{
        id:breadbar
        separator:">"
        spacing:8
        textSize:18
        Layout.fillWidth: true
        onClickItem:
            (model)=>{
                if(model.index+1!==count()){
                    breadbar.remove(model.index+1,count()-model.index-1)
                }
                showSuccess(model.title)
            }
    }

    FluExpander{
        headerText: qsTr("Version and Description")
        Layout.fillWidth: true
        Layout.rightMargin: 15
    }

    ExtraItem{
        _icon:FluentIcons.AllApps
        _text:qsTr("在线挂载点")
        _text_extra:qsTr("查看、管理在线挂载点的状态和详细信息")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.ContactInfoMirrored
        _text:qsTr("在线用户")
        _text_extra:qsTr("查看、管理在线用户的状态和详细信息")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.POI
        _text:qsTr("地图")
        _text_extra:qsTr("在地图上查看挂载点和用户")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.AreaChart
        _text:qsTr("状态统计")
        _text_extra:qsTr("服务运行状态和统计信息")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.CheckboxComposite14
        _text:qsTr("激活和许可")
        _text_extra:qsTr("激活状态、订阅、产品密钥")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Settings
        _text:qsTr("服务设置")
        _text_extra:qsTr("连接、配置和管理Caster服务")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("服务信息")
        _text_extra:qsTr("软件版本、运行环境")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

}
