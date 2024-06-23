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
            text:"Common Tool"
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
        _icon:FluentIcons.TiltUp
        _text:qsTr("坐标转换工具")
        _text_extra:qsTr("不同坐标系下的坐标互转")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.ChromeSwitch
        _text:qsTr("NMEA-0183 转换工具")
        _text_extra:qsTr("生成和转换GGA、GSV、RMC格式数据")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

    ExtraItem{
        _icon:FluentIcons.SpecialEffectSize
        _text:qsTr("星空图")
        _text_extra:qsTr("根据广播星历来计算指定位置的星空图")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }


    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("版本信息")
        _text_extra:qsTr("工具版本、使用算法和依赖库")
        _url:"qrc:/module/str_mult/MonitorPage.qml"
    }

}
