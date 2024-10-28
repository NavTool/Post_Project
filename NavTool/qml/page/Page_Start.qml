import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl

Row{
    spacing: 10
    Button{
        text: "Copy"
        icon.name: FluentIcons.graph_Copy
        icon.width: 18
        icon.height: 18
        spacing: 5
    }
    Button{
        text: "Copy"
        icon.name: FluentIcons.graph_Copy
        icon.width: 18
        icon.height: 18
        spacing: 5
        LayoutMirroring.enabled: true
    }
    Button{
        text: "Copy"
        icon.name: FluentIcons.graph_Copy
        icon.width: 18
        icon.height: 18
        spacing: 5
        display: Button.TextUnderIcon
    }
    Button{
        text: "Copy"
        icon.source: "qrc:/qt/qml/Gallery/res/image/logo.png"
        width: 40
        height: 40
        icon.width: 18
        icon.height: 18
        display: Button.IconOnly
        icon.color: "#00000000"
    }
}
