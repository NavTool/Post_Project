import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool
import "../extra"


Frame{
    id:root

    anchors.fill: parent

    property string title
    property PageContext context

    Component.onCompleted: {
        ResourceDataController.loadData()
    }

    Connections{
        target: ResourceDataController
        function onLoadDataStart(){
            panel_loading.visible = true
        }
        function onLoadDataSuccess(){
            dataModel.sourceData  = ResourceDataController.obsfile_data
            panel_loading.visible = false
        }
    }

    Component{
        id: comp_column_frozen
        Item{
            Label{
                anchors.fill: parent
                text: columnModel.title
                verticalAlignment: Qt.AlignVCenter
                leftPadding: 10
                rightPadding: 10
                elide: Label.ElideRight
            }
            IconButton{
                id: btn_pinned
                icon.name: FluentIcons.graph_Pinned
                icon.width: 12
                icon.height: 12
                width: 24
                height: 24
                icon.color: columnModel.frozen ? Theme.primaryColor : btn_pinned.FluentUI.textColor
                anchors.right: parent.right
                onClicked: {
                    columnModel.frozen = !columnModel.frozen
                }
            }
        }
    }


    DataGridModel{
        id: dataModel
    }
    RowLayout{
        id: layout_actions
        anchors{
            top: parent.top
            left: parent.left
        }
    }
    DataGridEx{
        id: dataGrid
        anchors{
            top: layout_actions.bottom
            bottom: parent.bottom
            left: parent.left
            leftMargin: 5
            right: parent.right
            rightMargin: 5
            topMargin: 5
            bottomMargin: 5
        }

        defaultHeight: 30
        defaultminimumHeight:25
        defaultmaximumHeight:240
        horizonalHeaderHeight:30


        sourceModel: dataModel
        onRowClicked:(model)=>{
                         console.debug(model.name)
                         Global.focusObsFile=model
                         Global.visable_right_top_side=true
                         Global.displayPropertyPage="/sidepage/property/obsfile"
                         Global.update_visable()
                     }
        onRowRightClicked:(model)=>{
                              console.debug(model.name)
                              Global.displayPropertyPage="/sidepage/property/blank"
                          }
        columnSourceModel: ListModel{
            ListElement{
                title: qsTr("文件名")
                dataIndex: "file_name"
                width: 200
                frozen: true
                delegate: function(){return comp_column_frozen}
            }
            ListElement{
                title: qsTr("文件类型")
                dataIndex: "file_type"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("测站")
                dataIndex: "station_name"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("开始时间")
                dataIndex: "file_start_time"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("结束时间")
                dataIndex: "file_end_time"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("时间段")
                dataIndex: "file_time_span"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("量测方式")
                dataIndex: "measurement_method"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("量测天线高")
                dataIndex: "measurement_ant_height"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("天线相位中心高")
                dataIndex: "ant_phase_height"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("天线座底部高")
                dataIndex: "ant_pedestal_height"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("天线厂商")
                dataIndex: "ant_manufacturer"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("天线类型")
                dataIndex: "ant_type"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("接收机/SN")
                dataIndex: "receiver"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("接收机类型")
                dataIndex: "receiver_type"
                editDelegate: function(){return comp_edit_combobox}
                width: 100
            }
            ListElement{
                title: qsTr("文件")
                dataIndex: "file_path"
                editDelegate: function(){return comp_edit_combobox}
                width: 300
            }
        }
    }

    Pane{
        id: panel_loading
        anchors.fill: dataGrid
        ProgressRing{
            anchors.centerIn: parent
            indeterminate: true
        }
        background: Rectangle{
            color: Theme.res.solidBackgroundFillColorBase
        }
    }
}
