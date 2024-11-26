import QtQuick

import FluentUI

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"
import "../../qml/extra"

FluContentPage {
    title: qsTr("Info")

    FluText{
        text: qsTr("开发中...")
        font: FluTextStyle.Title
        anchors.centerIn: parent
    }
}