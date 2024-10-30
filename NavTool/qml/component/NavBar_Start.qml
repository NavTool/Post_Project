import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool


Rectangle{
       anchors.fill: parent

       Text {
           id: name
           text: qsTr("tex222211122t")
       }
}

// GroupBox{

//     id:function_box
//     anchors.fill: parent

//     padding: 3

//     ListView{
//         anchors.fill: parent

//         orientation: Qt.Horizontal
//         spacing: 3

//         // model: modelData. attributes

//         delegate:Frame{
//             height:header_extra.height-function_box.padding*2
//             width:60

//             Frame{
//                 id:function_action

//                 height:parent.height-20
//                 width:parent.width




//                 Row {
//                     IconButton {
//                         text: qsTr("帮助")
//                         width: 60
//                         height:function_action.height  // 设置按键的高度

//                         icon.name: FluentIcons.graph_Help
//                         icon.width: 30
//                         icon.height: 30
//                         spacing: 10
//                         display: IconButton.TextUnderIcon
//                     }
//                     IconButton {
//                         text: qsTr("版本说明")
//                         width: 60
//                         height:function_action.height  // 设置按键的高度

//                         icon.name: FluentIcons.graph_Copy
//                         icon.width: 30
//                         icon.height: 30
//                         spacing: 10
//                         display: IconButton.TextUnderIcon
//                     }
//                     Column {
//                         IconButton {
//                             text: qsTr("工作流程")
//                             width: 60
//                             height: function_action.height*0.6 // 半高按钮的高度

//                             icon.name: FluentIcons.graph_OEM
//                             icon.width: 30
//                             icon.height: 30
//                             spacing: 0
//                             display: IconButton.IconOnly
//                         }

//                         IconButton {
//                             // text: qsTr("工作流程")
//                             width: 60
//                             height: function_action.height*0.4 // 半高按钮的高度

//                             // icon.name: FluentIcons.graph_FlickDown

//                             Label{
//                                 anchors{
//                                     centerIn: parent
//                                     verticalCenterOffset: -4
//                                 }
//                                 text: qsTr("工作流程")
//                             }


//                             onClicked: {
//                                 menu.popup()
//                             }

//                             Menu {
//                                 id:menu
//                                 width: 140
//                                 title: qsTr("File")
//                                 Action { text: qsTr("New...")}
//                                 Action { text: qsTr("Open...") }
//                                 Action { text: qsTr("Save") }
//                                 MenuSeparator { }
//                                 MenuItem{
//                                     text: qsTr("Quit")
//                                 }
//                             }
//                         }
//                     }

//                     IconButton {
//                         text: qsTr("在线帮助")
//                         width: 60
//                         height:function_action.height  // 设置按键的高度

//                         icon.name: FluentIcons.graph_WebSearch
//                         icon.width: 30
//                         icon.height: 30
//                         spacing: 10
//                         display: IconButton.TextUnderIcon
//                     }
//                 }

//             }


//             Item{
//                 height:20
//                 width:parent.width
//                 anchors{
//                     top:function_action.bottom
//                 }

//                 Label{
//                     text:qsTr("帮助")
//                     font:Typography.bodyStrong
//                     // color:Theme.res.textFillColorPrimary
//                     anchors.centerIn: parent
//                 }

//             }

//         }

//     }

//     // radius: 5
//     // color:Theme.dark ?  Qt.rgba(62/255,62/255,62/255,1) : Qt.rgba(254/255,254/255,254/255,1)

//     // Column{

//     //     Item{
//     //         height:80
//     //         width:120

//     //         Button{
//     //             text: "Copy"
//     //             icon.name: FluentIcons.graph_Copy
//     //             icon.width: 40
//     //             icon.height: 40
//     //             spacing: 5
//     //             display: Button.TextUnderIcon

//     //             onClicked:{
//     //                 menu.popup()
//     //             }
//     //         }
//     //         Menu {
//     //             id:menu
//     //             width: 140
//     //             title: qsTr("File")
//     //             Action { text: qsTr("New...")}
//     //             Action { text: qsTr("Open...") }
//     //             Action { text: qsTr("Save") }
//     //             MenuSeparator { }
//     //             MenuItem{
//     //                 text: qsTr("Quit")
//     //             }
//     //         }
//     //     }
//     //     Rectangle{

//     //         height:20
//     //         width:120
//     //     }

//     // }
// }
