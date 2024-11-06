import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl

Frame{
    id:root

    anchors.fill: parent

    property string title
    property PageContext context
    Column{
        anchors.centerIn: parent

        spacing: 20
        ProgressRing{
            indeterminate: true
        }
        ProgressRing{
            FluentUI.primaryColor: Qt.rgba(13/255,110/255,253/255,1)
            indeterminate: true
        }
        ProgressRing{
            FluentUI.primaryColor: Qt.rgba(25/255,135/255,84/255,1)
            indeterminate: true
        }
        ProgressRing{
            FluentUI.primaryColor: Qt.rgba(220/255,53/255,69/255,1)
            indeterminate: true
        }
        ProgressRing{
            FluentUI.primaryColor: Qt.rgba(255/255,193/255,7/255,1)
            indeterminate: true
        }
        ProgressRing{
            FluentUI.primaryColor: Qt.rgba(13/255,202/255,240/255,1)
            indeterminate: true
        }
    }
}
