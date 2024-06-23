import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"

FluFrame{
    id:root

    property int _icon:FluentIcons.GlobalNavButton
    property var _text:qsTr("Undefined")
    property var _text_extra:qsTr("Undefined")
    property string _url :""
    property alias _button: button

    Layout.fillWidth: true
    Layout.preferredHeight: 75
    Layout.topMargin: 0
    Layout.rightMargin: 15

    FluButton{
        id:button
        onClicked: {
            nav_view.push(root._url)
        }
        anchors{
            fill: parent
        }
    }

    FluIcon{
        id:icon
        iconSource: root._icon
        iconSize: 20

        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 25
        }
    }

    FluText{
        id:text
        text: root._text
        font: FluTextStyle.BodyStrong

        anchors{
            left: icon.right
            leftMargin: 20
            top:parent.top
            topMargin: 20
        }
    }
    FluText{
        id:text_extra
        text: root._text_extra
        font: FluTextStyle.Body
        color: FluTheme.dark ? Qt.rgba(210/255,210/255,210/255,1) : Qt.rgba(96/255,96/255,96/255,1)
        anchors{
            left: icon.right
            leftMargin: 20
            top:text.bottom
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
