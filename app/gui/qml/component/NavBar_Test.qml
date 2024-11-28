import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

// ContentPage
Item{
    id:root

    anchors.fill: parent

    property string title
    property PageContext context
    property int group_height:root.height-function_box.padding*2
    property int function_height:group_height-groupname_height

    property int groupbox_padding:5 //内容与背景边框的间距
    property int group_spacing:5  //每个组之间的间距
    property int group_padding:5  //每个组内按键与组边框的间距
    property int groupname_height:20 //每个组名的高度

    property int iconbutton_spacing: 10 //每个标准按键，图标和文字的间距
    property int iconbutton_size: 22    //标准按键，图标的宽度
    property int iconbutton_width:60    //标准按键，按键的指定宽度（一般都是默认宽度）

    GroupBox{
        id:function_box
        anchors.fill: parent
        padding: groupbox_padding

        Flickable{

            anchors.fill: parent
            contentWidth: rowItem.width
            // contentHeight: rowItem.height

            Row{
                id:rowItem
                spacing: group_spacing

                Frame{
                    width: implicitWidth

                    Column{
                        Frame{
                            width: implicitWidth
                            Row {
                                padding: group_padding
                                IconButton {
                                    text: qsTr("载入进度条")
                                    // width: iconbutton_width
                                    height:function_height.height  // 设置按键的高度

                                    icon.name: FluentIcons.graph_Puzzle
                                    icon.width: iconbutton_size
                                    icon.height: iconbutton_size
                                    spacing: iconbutton_spacing
                                    display: IconButton.TextUnderIcon

                                    onClicked: {
                                        info_manager_bottomright.showCustom(com_custom,10000)
                                    }

                                    Component{
                                        id: com_custom
                                        Pane{
                                            width: 400
                                            height: 100
                                            ProgressBar{
                                                anchors.bottom: parent.bottom
                                                width: parent.width

                                                indeterminate: true
                                            }
                                            Button{
                                                text: "Cancal"
                                                onClicked: {
                                                    // if(model.severity !== InfoBarType.Success){
                                                    //     model.severity = InfoBarType.Success
                                                    // }else{
                                                    infoControl.remove(model.index)
                                                    // }
                                                }
                                            }
                                        }
                                    }

                                }
                                IconButton {
                                    text: qsTr("保存工程")
                                    // width: iconbutton_width
                                    height:function_height.height  // 设置按键的高度

                                    icon.name: FluentIcons.graph_Puzzle
                                    icon.width: iconbutton_size
                                    icon.height: iconbutton_size
                                    spacing: iconbutton_spacing
                                    display: IconButton.TextUnderIcon

                                    property int iter:0
                                    onClicked: {

                                        iter=iter%4;
                                        switch (iter) {
                                        case 0:
                                            info_manager_top.show(InfoBarType.Info,qsTr("工程保存中..."))
                                            break;
                                        case 1:
                                            info_manager_top.show(InfoBarType.Success,qsTr("工程保存成功！"))
                                            break;
                                        case 2:
                                            info_manager_top.show(InfoBarType.Warning,qsTr("任务处理中，当前状态下无法保存，请等待处理完成或取消正在处理的任务！"),3000)
                                            break;
                                        case 3:
                                            info_manager_top.show(InfoBarType.Error,qsTr("工程保存失败！请检查工程文件路径是否已满或权限不足！"),3000)
                                            break;
                                        default:
                                            console.log("Default case");
                                        }
                                        iter+=1

                                    }
                                }

                                IconButton {
                                    text: qsTr("添加站点")
                                    // width: iconbutton_width
                                    height:function_height.height  // 设置按键的高度

                                    icon.name: FluentIcons.graph_Puzzle
                                    icon.width: iconbutton_size
                                    icon.height: iconbutton_size
                                    spacing: iconbutton_spacing
                                    display: IconButton.TextUnderIcon

                                    property int iter:0
                                    onClicked: {

                                        iter=iter%2;
                                        switch (iter) {
                                        case 0:
                                            info_manager_top.show(InfoBarType.Success,qsTr("站点已添加！"))
                                            break;
                                        case 1:
                                            info_manager_top.show(InfoBarType.Error,qsTr("站点添加失败！请检查是否已存在同名站点！"))
                                            break;
                                        default:
                                            console.log("Default case");
                                        }
                                        iter+=1
                                    }
                                }

                                IconButton {
                                    text: qsTr("导入文件")
                                    // width: iconbutton_width
                                    height:function_height.height  // 设置按键的高度

                                    icon.name: FluentIcons.graph_Puzzle
                                    icon.width: iconbutton_size
                                    icon.height: iconbutton_size
                                    spacing: iconbutton_spacing
                                    display: IconButton.TextUnderIcon

                                    property int iter:0
                                    onClicked: {

                                        iter=iter%4;
                                        switch (iter) {
                                        case 0:
                                            info_manager_top.show(InfoBarType.Success,qsTr("文件已添加！"))
                                            break;
                                        case 1:
                                            info_manager_top.show(InfoBarType.Info,qsTr("缺少星历文件，无法进行单点定位"))
                                            break;
                                        case 2:
                                            info_manager_top.show(InfoBarType.Warning,qsTr("文件解析失败，请检查选择的文件格式是否正确"))
                                            break;
                                        case 3:
                                            info_manager_top.show(InfoBarType.Error,qsTr("文件添加失败，请检查文件或程序权限！"))
                                            break;
                                        default:
                                            console.log("Default case");
                                        }
                                        iter+=1
                                    }
                                }


                                IconButton {
                                    text: qsTr("处理基线")
                                    // width: iconbutton_width
                                    height:function_height.height  // 设置按键的高度

                                    icon.name: FluentIcons.graph_Puzzle
                                    icon.width: iconbutton_size
                                    icon.height: iconbutton_size
                                    spacing: iconbutton_spacing
                                    display: IconButton.TextUnderIcon

                                    property int iter:0
                                    onClicked: {

                                        iter=iter%4;
                                        switch (iter) {
                                        case 0:
                                            info_manager_bottomright.show(InfoBarType.Info,qsTr("基线B01(SHJD01-SHJD02) 处理任务已添加到队列。"))
                                            break;
                                        case 1:
                                            info_manager_bottomright.show(InfoBarType.Warning,qsTr("基线B01(SHJD01-SHJD02) 处理任务已开始处理。"))
                                            break;
                                        case 2:
                                            info_manager_bottomright.show(InfoBarType.Success,qsTr("基线B01(SHJD01-SHJD02) 处理任务处理成功！"))
                                            break;
                                        case 3:
                                            info_manager_bottomright.show(InfoBarType.Error,qsTr("基线B01(SHJD01-SHJD02) 处理任务处理失败!"))
                                            break;
                                        default:
                                            console.log("Default case");
                                        }
                                        iter+=1
                                    }
                                }


                            }
                        }
                        Label{
                            height:groupname_height
                            text:qsTr("提示/进度条测试")
                            font:Typography.bodyStrong
                            // color:Theme.res.textFillColorPrimary
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }

            }
        }
    }

}
