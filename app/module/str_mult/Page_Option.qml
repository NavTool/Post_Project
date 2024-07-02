import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"

FluScrollablePage {

    property var navigationView

    title: qsTr("Options")

    FluFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        Layout.topMargin: 20

        FluButton{
            disabled: button_switch.checked
            text: qsTr("Standard Button")
            onClicked: {
                showInfo(qsTr("Click StandardButton"))
            }
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }
        FluToggleSwitch{
            id: button_switch
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }


    FluFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        Layout.topMargin: 10

        FluButton{

            // text: qsTr("Text Button")
            onClicked: {
                showInfo("点击Text Button")
            }
            anchors{
                fill: parent
            }
        }

        FluText{
            text: qsTr("Connect")
            font: FluTextStyle.Subtitle

            anchors{
                left: parent.left
                leftMargin: 20
                verticalCenter: parent.verticalCenter
            }
        }

        FluIcon{
            iconSource: FluentIcons.ChevronRight
            iconSize:15
            anchors{
                right: parent.right
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
        }
    }

    FluFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        Layout.topMargin: 10

        FluButton{

            // text: qsTr("Text Button")
            onClicked: {
                showInfo("点击Stream Button")
                url: "qrc:/module/str_mult/StreamPage.qml"
                loader.source=url
                ;
            }
            anchors{
                fill: parent
            }
        }

        FluText{
            text: qsTr("Stream")
            font: FluTextStyle.Subtitle

            anchors{
                left: parent.left
                leftMargin: 20
                verticalCenter: parent.verticalCenter
            }
        }

        FluIcon{
            iconSource: FluentIcons.ChevronRight
            iconSize:15
            anchors{
                right: parent.right
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
        }
    }

    FluFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        Layout.topMargin: 10

        FluButton{

            // text: qsTr("Text Button")
            onClicked: {
                showInfo("点击Text Button")
            }
            anchors{
                fill: parent
            }
        }

        FluText{
            text: qsTr("Option")
            font: FluTextStyle.Subtitle

            anchors{
                left: parent.left
                leftMargin: 20
                verticalCenter: parent.verticalCenter
            }
        }

        FluIcon{
            iconSource: FluentIcons.ChevronRight
            iconSize:15
            anchors{
                right: parent.right
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
        }
    }


}
