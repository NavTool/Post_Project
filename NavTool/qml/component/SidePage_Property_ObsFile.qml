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
        id:com_station
        Item{
            height: 40
            Column{
                anchors.fill: parent
                ComItem{
                    item_name:qsTr("站点名称")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
            }
        }
    }

    Component{
        id:com_ant
        Item{
            height: 240
            Column{
                anchors.fill: parent
                ComItem{
                    item_name:qsTr("测量方式")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("测量天线高")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("天线高一致性补偿")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("厂商")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("天线型号")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("天线SN号")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
            }
        }
    }

    Component{
        id:com_device

        Item{
            height: 120
            Column{
                ComItem{
                    item_name:qsTr("接收机/SN")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("接收机类型")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("接收机版本号")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
            }
        }
    }

    Component{
        id:com_rinex
        Item{
            height: 160

            Column{
                ComItem{
                    item_name:qsTr("测量方式")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("天线高")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("厂商")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("天线类型")
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
                    text: "站点"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_station
            }
            Expander{
                width: parent.width

                expanded:true
                header: Label{
                    text: "天线"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_ant
            }
            Expander{
                width: parent.width

                expanded:true
                header: Label{
                    text: "仪器"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_device
            }
            Expander{
                width: parent.width

                expanded:true
                header: Label{
                    text: "Rinex输出的天线配置"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_rinex
            }
        }
    }






}
