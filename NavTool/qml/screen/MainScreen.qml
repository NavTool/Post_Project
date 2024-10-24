import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

Item{

    Component.onCompleted:{
        window.setHitTestVisible(top_bar_left) //设置组件id来顶部的按键可以使用
        window.setHitTestVisible(top_bar_mid) //设置组件id来顶部的按键可以使用
        window.setHitTestVisible(top_bar_right) //设置组件id来顶部的按键可以使用
    }

    Item{
        id:top_bar

        width:row.width
        height:20

        clip:true

        anchors{
            top:parent.top
            left:parent.left
            topMargin:13
            leftMargin:15
        }
        Row{
            id: row
            spacing:10
            Image{
                source: Global.windowIcon
                width: 20
                height: width
                // fillMode:Image.PreserveAspectFit
                fillMode: Image.PreserveAspectFit

                anchors.verticalCenter: parent.verticalCenter
            }
            Text{
                text:Global.windowName+" "+ INFO_APP_VERSION
                font: Typography.bodyStrong

                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    // 左侧按钮，从左到右排列


    RowLayout {
        id:top_bar_left

        anchors
        {
            top:parent.top
            left:top_bar.right
            topMargin:5
            leftMargin:10
        }

        Layout.fillWidth: true  // 左侧区域填充可用空间
        spacing: 0

        Label{
            text: qsTr("自动保存")
            anchors.verticalCenter: parent.verticalCenter
        }
        Switch{
            id: switch_disabled
            anchors.verticalCenter: parent.verticalCenter
        }



        IconButton{
            text: "Save"
            icon.name: FluentIcons.graph_Save
            icon.width: 18
            icon.height: 18
            spacing: 5
            display: IconButton.IconOnly
        }


        IconButton{
            text: "Undo"
            icon.name: FluentIcons.graph_Undo
            icon.width: 18
            icon.height: 18
            spacing: 5
            display: IconButton.IconOnly
        }


        IconButton{
            text: "Undo"
            icon.name: FluentIcons.graph_Redo
            icon.width: 18
            icon.height: 18
            spacing: 5
            display: IconButton.IconOnly
        }

        IconButton{
            text: "Refresh"
            icon.name: FluentIcons.graph_Refresh
            icon.width: 18
            icon.height: 18
            spacing: 5
            display: IconButton.IconOnly
        }

        Item{
            width:30
        }

        Item{
            width:project_state.width+40
            height:35

            IconButton{
                anchors.fill:parent
            }

            Row{
                id:project_state

                anchors{
                    centerIn: parent
                }

                spacing:15

                CopyableText{
                    text:"xxxxxxx测试工程xxxx.cps"+ " - "+ "未保存"
                    font:Typography.body
                    anchors.verticalCenter: parent.verticalCenter
                }

                Icon{
                    source:FluentIcons.graph_ChevronDownMed
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

        }

        Item{
            width:60
        }


        TextBox{
            placeholderText: "TextBox"
            trailing: IconButton{
                implicitWidth: 30
                implicitHeight: 20
                icon.name: FluentIcons.graph_Search
                icon.width: 14
                icon.height: 14
                padding: 0
            }
        }


    }


    // 中间按钮，从中间向左右扩展
    RowLayout {
        id:top_bar_mid

        anchors
        {
            top:parent.top
            topMargin:5
            horizontalCenter:parent.horizontalCenter
        }

        Layout.alignment: Qt.AlignHCenter  // 中间对齐
        spacing:0


    }

    // 右侧按钮，从右向左排列
    RowLayout {
        id:top_bar_right

        anchors
        {
            top:parent.top
            left:parent.left
            topMargin:5
            leftMargin:300
        }

        Layout.fillWidth: true  // 右侧区域填充可用空间
        spacing: 5

        // 设置 LayoutMirroring 使其从右向左排列
        LayoutMirroring.enabled: true
        LayoutMirroring.childrenInherit: true
    }


    Frame{

        anchors{
            left:parent.left
            right:parent.right
            top:parent.top
            topMargin:40
            bottom:parent.bottom
        }

    }






}
