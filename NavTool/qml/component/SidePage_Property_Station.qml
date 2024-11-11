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
        id:com_common
        Item{
            height: 120
            Column{
                anchors.fill: parent
                ComItem{
                    item_name:qsTr("点名")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("编码")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("站点备注")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
            }
        }
    }

    Component{
        id:com_coord
        Item{
            height: 80
            Column{
                anchors.fill: parent
                ComItem{
                    item_name:qsTr("坐标来源")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("坐标类型")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
            }
        }
    }

    Component{
        id:com_llh

        Item{
            height: 120
            Column{
                ComItem{
                    item_name:qsTr("纬度")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("经度")
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
            }
        }
    }

    Component{
        id:com_ecef
        Item{
            height: 120

            Column{
                ComItem{
                    item_name:qsTr("X")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("Y")
                    delegate:TextField{
                        placeholderText: "TextField"
                    }
                }
                ComItem{
                    item_name:qsTr("Z")
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
                    text: "常规"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_common
            }
            Expander{
                width: parent.width

                expanded:true
                header: Label{
                    text: "坐标系统"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_coord
            }
            Expander{
                width: parent.width

                expanded:true
                header: Label{
                    text: "大地坐标"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_llh
            }
            Expander{
                width: parent.width

                expanded:true
                header: Label{
                    text: "空间直角坐标系"
                    verticalAlignment: Qt.AlignVCenter
                }
                content: com_ecef
            }
        }
    }






}
