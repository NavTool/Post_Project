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

    title:  qsTr("Caster Service")

    FluExpander{
        headerText: qsTr("Version and Description")
        Layout.fillWidth: true
        Layout.rightMargin: 15
    }

    Item{
        id:root
        Layout.fillWidth: true
        Layout.preferredHeight: 240
        Layout.topMargin: 0
        Layout.rightMargin: 15

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


        ListModel{
            id: model_header

            ListElement{
                icon: "qrc:/res/logo/icon-1.png"
                title: qsTr("Service Node-A3F2\n运行中")
                desc: qsTr("Node:127.0.0.1:4202\nconnect:6366\nserver/client:2847/3519")
                url: "https://github.com/NavTool/Caster_Service"
                clicked: function(model){
                    Qt.openUrlExternally(model.url)
                }
            }

            ListElement{
                icon: "qrc:/res/logo/icon-1.png"
                title: qsTr("Service Node-B1C0\n运行中")
                desc: qsTr("Node:127.0.0.1:4203\nconnect:6366\nserver/client:2847/3519")
                url: "https://github.com/NavTool/Caster_Service"
                clicked: function(model){
                    Qt.openUrlExternally(model.url)
                }
            }

            ListElement{
                icon: "qrc:/res/logo/icon-1.png"
                title: qsTr("Redis Server-已连接\n运行中")
                desc: qsTr("Node:127.0.0.1:6379\nconnect:6366\nserver/client:2847/3519")
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
            ListElement{
                icon: "qrc:/res/image/control/AppBarButton.png"
                title: qsTr("添加节点监控")
                desc: qsTr("A Multi platform Ntrip Caster based on Libevent and Redis implementation, support Ntrip1.0/2.0 protocol.")
                url: "https://github.com/NavTool/Caster_Service"
                clicked: function(model){
                    Qt.openUrlExternally(model.url)
                }
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
                    // anchors.centerIn: parent
                    anchors{
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }
                    // FluAcrylic{
                    //     anchors.fill: parent
                    //     tintColor: FluTheme.frameActiveColor
                    //     target: bg
                    //     tintOpacity: FluTheme.dark ? 0.8 : 0.9
                    //     blurRadius : 40
                    //     targetRect: Qt.rect(list.x-list.contentX+10+(control.width)*index,list.y+10,width,height)
                    // }
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
    }


    ExtraItem{
        _icon:FluentIcons.AllApps
        _text:qsTr("在线挂载点")
        _text_extra:qsTr("查看、管理在线挂载点的状态和详细信息")
        _url:"qrc:/module/caster_gui/Page_Server.qml"
    }

    ExtraItem{
        _icon:FluentIcons.ContactInfo
        _text:qsTr("在线用户")
        _text_extra:qsTr("查看、管理在线用户的状态和详细信息")
        _url:"qrc:/module/caster_gui/Page_Client.qml"
    }

    ExtraItem{
        _icon:FluentIcons.POI
        _text:qsTr("地图")
        _text_extra:qsTr("在地图上查看挂载点和用户")
        _url:"qrc:/module/caster_gui/Page_Map.qml"
    }

    ExtraItem{
        _icon:FluentIcons.AreaChart
        _text:qsTr("状态统计")
        _text_extra:qsTr("服务运行状态和统计信息")
        _url:"qrc:/module/caster_gui/Page_Status.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Permissions
        _text:qsTr("激活和许可")
        _text_extra:qsTr("激活状态、订阅、产品密钥")
        _url:"qrc:/module/caster_gui/Page_Licence.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Settings
        _text:qsTr("服务设置")
        _text_extra:qsTr("连接、配置和管理Caster服务")
        _url:"qrc:/module/caster_gui/Page_Setting.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("版本信息")
        _text_extra:qsTr("软件版本、运行环境")
        _url:"qrc:/module/caster_gui/Page_Info.qml"
    }

}
