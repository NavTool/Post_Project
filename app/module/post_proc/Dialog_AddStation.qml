import QtQuick 2.15
import FluentUI 1.0
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../../qml/component"


FluContentDialog{
    id: root

    Component.onCompleted: {
        root.open()
    }

    title: qsTr("Friendly Reminder")
    message: qsTr("Data is loading, please wait...")
    negativeText: qsTr("Unload")
    contentDelegate: Component{
        Item{
            implicitWidth: parent.width
            implicitHeight: 160
            // FluProgressRing{
            //     anchors.centerIn: parent
            // }






        }
    }
    onNegativeClicked: {
        showSuccess(qsTr("Click the Cancel Button"))
    }
    positiveText: qsTr("OK")
    onPositiveClickListener: function(){
        showError(qsTr("Test the InfoBar level on top of the Popup"))
    }
}
