import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

import "qrc:/qml/window"
import "qrc:/qml/global"

FluContentPage {

    title: qsTr("Str Monitor")

    FluFrame{
        id: page_top
        anchors{
            // top:parent.top
            left:parent.left
            right:parent.right
        }
        // Layout.fillWidth: true

        Layout.fillWidth: true
        Layout.preferredHeight: 40


        Row{
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 5
            }

            FluButton {
                id: add_stream
                text: qsTr("Add Stream")

                onClicked: {
                    add_stream_dialog.open();
                }
            }
        }
    }




    FluContentDialog {
        id: add_stream_dialog

        property string value_project_name
        property string value_project_path
        property string value_project_temp

        Component.onCompleted:
            //root.open()//调试用，正式使用要注释掉
        {
        }

        title: qsTr("Add Stream")
        width: 750

        contentDelegate: Component {
            Item {
                implicitWidth: parent.width
                implicitHeight: 250
                Item {
                    anchors.fill: parent
                    anchors.margins: 40

                    Column {
                        spacing: 10
                        Row{
                            spacing: 530
                            FluText {
                                text: "Input Stream:"
                            }

                            FluText {
                                text: "opt"
                            }
                        }
                        Row {
                            spacing: 10
                            FluComboBox {
                                id:input_type

                                editable: false
                                model: ListModel {
                                    id: input_model
                                    ListElement {
                                        text: "TCP Client"
                                    }
                                    ListElement {
                                        text: "TCP Server"
                                    }
                                    ListElement {
                                        text: "Ntrip Client"
                                    }
                                }

                                ListModel {
                                    id: input_format
                                    ListElement {
                                        text: "Addr:Port ( e.g. 127.0.0.1:10001 )"
                                    }
                                    ListElement {
                                        text: "Port ( e.g. 10001)"
                                    }
                                    ListElement {
                                        text: "user:pwd@addr:port/mpt ( e.g. abc:123@127.0.0.1:2101/TEST)"
                                    }
                                }
                            }

                            FluTextBox {

                                width: 450

                                placeholderText: input_format.get(input_type.currentIndex).text
                            }

                            FluButton {
                                id:input_opt
                                text: "..."
                                onClicked: {
                                }
                                disabled: true
                            }
                        }

                        Row {
                            spacing: 10
                            FluText {
                                text: "Output Stream:"
                            }
                        }

                        Row {

                            spacing: 10

                            FluComboBox {

                                id:output_type

                                editable: false
                                model: ListModel {
                                    id: output_model
                                    ListElement {
                                        text: "TCP Client"
                                    }
                                    ListElement {
                                        text: "TCP Server"
                                    }
                                    ListElement {
                                        text: "Ntrip Server"
                                    }
                                    ListElement {
                                        text: "File"
                                    }
                                }

                                ListModel {
                                    id: output_format
                                    ListElement {
                                        text: "Addr:Port ( e.g. 127.0.0.1:10001 )"
                                    }
                                    ListElement {
                                        text: "Port ( e.g. 10001)"
                                    }
                                    ListElement {
                                        text: "user:pwd@addr:port/mpt ( e.g. abc:123@127.0.0.1:2101/TEST)"
                                    }

                                    ListElement {
                                        text: "filepath ( e.g. D:'\'gnss_data'\'test.dat)"
                                    }
                                }

                            }

                            FluTextBox {
                                width: 450
                                placeholderText: output_format.get(output_type.currentIndex).text
                            }

                            FluButton {
                                text: "..."
                                onClicked: {
                                }
                                disabled: true
                            }

                        }
                    }

                    // FluPivot{
                    //     anchors.fill: parent
                    //     currentIndex: 2

                    //     FluPivotItem{
                    //         title: qsTr("All")
                    //         contentItem:FluText{
                    //             text: qsTr("All emails go here.")
                    //         }
                    //     }
                    //     FluPivotItem{
                    //         title: qsTr("Unread")
                    //         contentItem: FluText{
                    //             text: qsTr("Unread emails go here.")
                    //         }
                    //     }
                    //     FluPivotItem{
                    //         title: qsTr("Flagged")
                    //         contentItem: FluText{
                    //             text: qsTr("Flagged emails go here.")
                    //         }
                    //     }
                    //     FluPivotItem{
                    //         title: qsTr("Urgent")
                    //         contentItem: FluText{
                    //             text: qsTr("Urgent emails go here.")
                    //         }
                    //     }
                    // }

                }
            }
        }
        buttonFlags: FluContentDialogType.PositiveButton | FluContentDialogType.NegativeButton
        positiveText: "确定"
        negativeText: "取消"
        onPositiveClicked: {
            showSuccess("创建成功");

        }
        onNegativeClicked: {
            showInfo("取消创建");
        }
    }
}
