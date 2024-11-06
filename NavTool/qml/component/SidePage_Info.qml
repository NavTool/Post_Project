import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl

Frame {

    anchors.fill: parent

    property string title
    property PageContext context
Column{

    anchors.centerIn: parent

    RowLayout{
        Layout.topMargin: 24
        Label{
            text: qsTr("Screenshots")
            Layout.preferredWidth: 90
            Layout.alignment: Qt.AlignVCenter
        }
        ShortcutPicker{
            implicitWidth: 90
            Layout.alignment: Qt.AlignVCenter
            current: ["Alt","A"]
        }
    }
    RowLayout{
        Label{
            text: qsTr("Send Message")
            Layout.preferredWidth: 90
            Layout.alignment: Qt.AlignVCenter
        }
        ShortcutPicker{
            implicitWidth: 90
            Layout.alignment: Qt.AlignVCenter
            current: ["Enter"]
        }
    }
    RowLayout{
        Label{
            text: qsTr("Open Gallery")
            Layout.preferredWidth: 90
            Layout.alignment: Qt.AlignVCenter
        }
        ShortcutPicker{
            implicitWidth: 90
            Layout.alignment: Qt.AlignVCenter
            current: ["Ctrl","Alt","W"]
        }
    }
    RowLayout{
        Label{
            text: qsTr("Lock Gallery")
            Layout.preferredWidth: 90
            Layout.alignment: Qt.AlignVCenter
        }
        ShortcutPicker{
            implicitWidth: 90
            Layout.alignment: Qt.AlignVCenter
            current: ["Ctrl","L"]
        }
    }
}
}
