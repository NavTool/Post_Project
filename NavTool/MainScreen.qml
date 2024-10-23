import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls

Item{
    Column{
        anchors.centerIn: parent
        spacing: 15
        Image{
            width: 60
            height: 60
            source: "qrc:/qt/qml/NavTool/logo.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label{
            text: qsTr("Welcome to FluentUI")
            anchors.horizontalCenter: parent.horizontalCenter
            font: Typography.title
        }
        FilledButton{
            text: qsTr("Learn FluentUI")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                Qt.openUrlExternally("https://space.bilibili.com/275661059")
            }
        }
    }
    Row{
        anchors{
            bottom: parent.bottom
            bottomMargin: 14
            horizontalCenter: parent.horizontalCenter
        }
        Label{
            text: qsTr("Author's WeChat ID: ")
        }
        Label{
            text: "FluentUI"
        }
    }
}
