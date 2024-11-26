import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl

Frame{
    id:root

    anchors.fill: parent

    property string title
    property PageContext context

    property var colors : [Colors.yellow,Colors.orange,Colors.red,Colors.magenta,Colors.purple,Colors.blue,Colors.teal,Colors.green]

    property var randomAccentColor: function(){
        return colors[Math.floor(Math.random() * 8)]
    }

    ListModel{
        id: tab_model
        ListElement{
            title: "操作日志"
        }
        ListElement{
            title: "任务输出"
        }
        ListElement{
            title: "Console"
        }
    }

    SegmentedControl {
        id: bar
        clip: true
        Repeater {
            model: tab_model
            SegmentedButton {
                id: btn_tab
                text: model.title
            }
        }
    }

    Component{
        id:comp_page
        Frame{
            anchors.fill: parent
            Label{
                font: Typography.titleLarge
                anchors.centerIn: parent
                text: modelData.title
                //color: modelData.accentColor().normal
            }
        }
    }

    StackLayout {
        currentIndex: bar.currentIndex
        anchors{
            left: parent.left
            right: parent.right
            top: bar.bottom
            bottom: parent.bottom
            topMargin: 5
        }
        Repeater{
            model:tab_model
            AutoLoader{
                property var modelData: model
                sourceComponent: comp_page
            }
        }
    }

}
