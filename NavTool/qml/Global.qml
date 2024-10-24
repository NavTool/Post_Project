pragma Singleton

import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

QtObject {
    id: control
    property var starter
    property int displayMode: NavigationViewType.Auto
    property int windowEffect: WindowEffectType.Normal

    property var windowName: EXE_APPLICATION_NAME
    property var windowIcon:  "qrc:/qt/qml/NavTool/res/logo.png"
}
