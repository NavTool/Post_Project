import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl

Frame{
    id:root

    anchors.fill: parent

    property string title
    property PageContext context

    property int item_name_width:width*0.4
    property int item_value_width:width*0.6
    property int item_height:40

    Label{
        text:qsTr("目标属性栏")
    }

    component ComItem:Item{
        property string item_name;
        property Component delegate

        width: item_name_width
        height:item_height
        // anchors.verticalCenter: parent.verticalCenter
        Row{
            Item{
                width: item_name_width
                height:item_height
                anchors.verticalCenter: parent.verticalCenter
                IconButton{
                    anchors.fill: parent
                    text: item_name
                }
            }
            Item{
                width: item_name_width
                height:item_height
                AutoLoader{
                    anchors{
                        verticalCenter: parent.verticalCenter
                    }
                    sourceComponent: delegate
                }
            }
        }
    }

    Component{
        id:com_baseline
        Item{
            height: 240
            Column{
                anchors.fill: parent
                ComItem{
                    item_name:qsTr("基线ID")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("起点文件")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("终点文件")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("起点名")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("终点名")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("同步时段")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
            }
        }
    }

    Component{
        id:com_solution
        Item{
            height: 640
            Column{
                anchors.fill: parent
                ComItem{
                    item_name:qsTr("RMS")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("Ratio")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("Dx")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("Dy")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("Dz")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("平距")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("斜距")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("高差")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("站点名称")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("NS前进方位角")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("椭球距离")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("大地高")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("RDOP")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("PDOP")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("HDOP")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("VDOP")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
            }
        }
    }




    Flickable{
        anchors.fill: parent
        contentHeight: columnItem.height
        // contentHeight: rowItem.height
        interactive: contentHeight > height

        Column{
            id:columnItem
            width: root.width

            Expander{
                width: parent.width

                expanded:true
                header: Label{
                    text: "基线属性"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_baseline
            }
            Expander{
                width: parent.width

                expanded:true
                header: Label{
                    text: "解"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_solution
            }
        }
    }






}
