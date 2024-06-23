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

    // Component.onCompleted: {
    //     var items = []
    //     for(var i=0;i<10;i++){
    //         items.push({title:"Item_"+(i+1)})
    //     }
    //     breadbar.items = items
    // }

    // FluBreadcrumbBar{
    //     id:breadbar
    //     separator:">"
    //     spacing:8
    //     textSize:18
    //     Layout.fillWidth: true
    //     onClickItem:
    //         (model)=>{
    //             if(model.index+1!==count()){
    //                 breadbar.remove(model.index+1,count()-model.index-1)
    //             }
    //             showSuccess(model.title)
    //         }
    // }


    ListModel{
        id: model_header

        ListElement{
            icon: "qrc:/res/logo/icon-1.png"
            title: qsTr("Caster Service")
            desc: qsTr("A Multi platform Ntrip Caster based on Libevent and Redis implementation, support Ntrip1.0/2.0 protocol.")
            url: "https://github.com/NavTool/Caster_Service"
            clicked: function(model){
                Qt.openUrlExternally(model.url)
            }
        }

        ListElement{
            icon: "qrc:/res/logo/icon-1.png"
            title: qsTr("Caster Service")
            desc: qsTr("A Multi platform Ntrip Caster based on Libevent and Redis implementation, support Ntrip1.0/2.0 protocol.")
            url: "https://github.com/NavTool/Caster_Service"
            clicked: function(model){
                Qt.openUrlExternally(model.url)
            }
        }

    }
    Item{
        Layout.fillWidth: true
        Layout.preferredHeight: 320
        Image {
            id: bg
            fillMode:Image.PreserveAspectCrop
            anchors.fill: parent
            verticalAlignment: Qt.AlignTop
            sourceSize: Qt.size(960,640)
            source: "qrc:/res/image/bg_home_header.png"
        }
        Rectangle{
            anchors.fill: parent
            gradient: Gradient{
                GradientStop { position: 0.8; color: FluTheme.dark ? Qt.rgba(0,0,0,0) : Qt.rgba(1,1,1,0) }
                GradientStop { position: 1.0; color: FluTheme.dark ? Qt.rgba(0,0,0,1) : Qt.rgba(1,1,1,1) }
            }
        }
        FluText{
            text:"Stream Tool"
            font: FluTextStyle.TitleLarge
            anchors{
                top: parent.top
                left: parent.left
                topMargin: 20
                leftMargin: 20
            }
        }
        Component{
            id:com_grallery
            Item{
                id: control
                width: 220
                height: 240
                FluShadow{
                    radius:5
                    anchors.fill: item_content
                }
                FluClip{
                    id:item_content
                    radius: [5,5,5,5]
                    width: 200
                    height: 220
                    anchors.centerIn: parent
                    FluAcrylic{
                        anchors.fill: parent
                        tintColor: FluTheme.dark ? Qt.rgba(0,0,0,1) : Qt.rgba(1,1,1,1)
                        target: bg
                        tintOpacity: FluTheme.dark ? 0.8 : 0.9
                        blurRadius : 40
                        targetRect: Qt.rect(list.x-list.contentX+10+(control.width)*index,list.y+10,width,height)
                    }
                    Rectangle{
                        anchors.fill: parent
                        radius: 5
                        color:FluTheme.itemHoverColor
                        visible: item_mouse.containsMouse
                    }
                    Rectangle{
                        anchors.fill: parent
                        radius: 5
                        color:Qt.rgba(0,0,0,0.0)
                        visible: !item_mouse.containsMouse
                    }
                    ColumnLayout{
                        Image {
                            Layout.topMargin: 20
                            Layout.leftMargin: 20
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 50
                            source: model.icon
                        }
                        FluText{
                            text: model.title
                            font: FluTextStyle.Body
                            Layout.topMargin: 20
                            Layout.leftMargin: 20
                        }
                        FluText{
                            text: model.desc
                            Layout.topMargin: 5
                            Layout.preferredWidth: 160
                            Layout.leftMargin: 20
                            color: FluColors.Grey120
                            font.pixelSize: 12
                            font.family: FluTextStyle.family
                            wrapMode: Text.WrapAnywhere
                        }
                    }
                    FluIcon{
                        iconSource: FluentIcons.OpenInNewWindow
                        iconSize: 15
                        anchors{
                            bottom: parent.bottom
                            right: parent.right
                            rightMargin: 10
                            bottomMargin: 10
                        }
                    }
                    MouseArea{
                        id:item_mouse
                        anchors.fill: parent
                        hoverEnabled: true
                        onWheel:
                            (wheel)=>{
                                if (wheel.angleDelta.y > 0) scrollbar_header.decrease()
                                else scrollbar_header.increase()
                            }
                        onClicked: {
                            model.clicked(model)
                        }
                    }
                }
            }
        }

        ListView{
            id: list
            anchors{
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            orientation: ListView.Horizontal
            height: 240
            model: model_header
            header: Item{height: 10;width: 10}
            footer: Item{height: 10;width: 10}
            ScrollBar.horizontal: FluScrollBar{
                id: scrollbar_header
            }
            clip: false
            delegate: com_grallery
        }
    }

    Component{
        id:com_item
        Item{
            property string desc: modelData.extra.desc
            width: 320
            height: 120
            FluFrame{
                radius: 8
                width: 300
                height: 100
                anchors.centerIn: parent
                Rectangle{
                    anchors.fill: parent
                    radius: 8
                    color:{
                        if(item_mouse.containsMouse){
                            return FluTheme.itemHoverColor
                        }
                        return FluTheme.itemNormalColor
                    }
                }
                Image{
                    id:item_icon
                    height: 40
                    width: 40
                    source: modelData.extra.image
                    anchors{
                        left: parent.left
                        leftMargin: 20
                        verticalCenter: parent.verticalCenter
                    }
                }
                FluText{
                    id:item_title
                    text:modelData.title
                    font: FluTextStyle.BodyStrong
                    anchors{
                        left: item_icon.right
                        leftMargin: 20
                        top: item_icon.top
                    }
                }
                FluText{
                    id:item_desc
                    text:desc
                    color:FluColors.Grey120
                    wrapMode: Text.WrapAnywhere
                    elide: Text.ElideRight
                    font: FluTextStyle.Caption
                    maximumLineCount: 2
                    anchors{
                        left: item_title.left
                        right: parent.right
                        rightMargin: 20
                        top: item_title.bottom
                        topMargin: 5
                    }
                }

                Rectangle{
                    height: 12
                    width: 12
                    radius:  6
                    color: FluTheme.primaryColor
                    anchors{
                        right: parent.right
                        top: parent.top
                        rightMargin: 14
                        topMargin: 14
                    }
                }

                MouseArea{
                    id:item_mouse
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        ItemsOriginal.startPageByItem(modelData)
                    }
                }
            }
        }
    }

    FluExpander{
        headerText: qsTr("Version and Description")
        Layout.fillWidth: true
        Layout.rightMargin: 15
    }

    ExtraItem{
        _icon:FluentIcons.Play
        _text:qsTr("服务管理")
        _text_extra:qsTr("启动和停止数据流服务")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Add
        _text:qsTr("添加数据流")
        _text_extra:qsTr("查看、管理在线用户的状态和详细信息")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.AllApps
        _text:qsTr("管理数据流")
        _text_extra:qsTr("查看、管理在线用户的状态和详细信息")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.SaveLocal
        _text:qsTr("数据本地存储")
        _text_extra:qsTr("将数据流存储到文件")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.AreaChart
        _text:qsTr("状态统计")
        _text_extra:qsTr("服务运行状态和统计信息")
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
