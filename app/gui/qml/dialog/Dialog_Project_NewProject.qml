import QtQuick
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

Item{
    property string title
    property PageContext context

    Dialog{
        id:import_file_dialog
        property PageContext context

        x: Math.ceil((parent.width - width) / 2)
        y: Math.ceil((parent.height - height) / 2)
        parent: Overlay.overlay
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        header: Label{
            topPadding: 20
            leftPadding: 20
            text:qsTr("新建工程")
            font: Typography.title
        }

        width: 600
        contentHeight: 350

        Flickable{
            anchors.fill: parent
            // contentWidth: rowItem.width
            contentHeight: columnItem.height
            interactive: contentHeight > height

            clip: true

            Column{
                id:columnItem
                leftPadding: 50
                spacing: 10
                Label{
                    text:qsTr("工程设置")
                    font: Typography.subtitle
                }

                Row{
                    spacing: 10
                    Label{
                        text:qsTr("工程名称:")
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    TextBox{
                        id:project_create_name
                        width: 360
                    }
                    IconButton
                    {
                        icon.name: FluentIcons.graph_Page

                        Component.onCompleted: {

                            var currentDate = new Date();
                            var year = currentDate.getFullYear();
                            var month = currentDate.getMonth() + 1;  // 月份从 0 开始
                            var day = currentDate.getDate();
                            var hours = currentDate.getHours();
                            var minutes = currentDate.getMinutes();
                            var seconds = currentDate.getSeconds();

                            project_create_name.text="CPS_"+year+"-"+month+"-"+day+"-"+hours+minutes
                        }
                    }
                }

                Row{
                    spacing: 10
                    Label{
                        text:qsTr("工程路径:")
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    TextArea{
                        id:project_create_path
                        width: 360
                        wrapMode: TextArea.Wrap
                    }

                    IconButton
                    {
                        icon.name: FluentIcons.graph_FolderOpen

                        onClicked: {
                            project_save_folder_dialog.open()

                        }
                        FolderDialog{
                            id:project_save_folder_dialog

                            onAccepted: {
                                console.log(selectedFolder)
                                project_create_path.text=toAbsolutePath(selectedFolder.toString())
                            }

                            function toAbsolutePath(fileUrl) {
                                var path = fileUrl;
                                // Remove the "file://" prefix
                                if (fileUrl.startsWith("file://")) {
                                    path = fileUrl.replace("file://", "");

                                    // Windows-specific adjustment
                                    if (Qt.platform.os === "windows") {
                                        // On Windows, paths after "file://" may start with a drive letter (e.g., "C:/")
                                        // In this case, an additional slash might be present (e.g., "file:///C:/path")
                                        if (path.length > 3 && path.charAt(2) === ':') {
                                            path = path.substring(1); // Remove the leading slash before "C:/"
                                        }
                                    }
                                }

                                return path;
                            }

                            Component.onCompleted: {
                                console.log(currentFolder)
                                project_create_path.text=toAbsolutePath(currentFolder.toString())
                            }
                        }
                    }
                }

                Label{
                    text:qsTr("工程信息")
                    font: Typography.subtitle
                }
                Row{
                    spacing: 10
                    Label{
                        text:qsTr("时区设置:")
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    ComboBox{
                        width: 400
                        model: ["(UTC-12:00)",
                            "(UTC-11:00)",
                            "(UTC-10:00)",
                            "(UTC-09:00)",
                            "(UTC-08:00)",
                            "(UTC-07:00)",
                            "(UTC-06:00)",
                            "(UTC-05:00)",
                            "(UTC-04:00)",
                            "(UTC-03:00)",
                            "(UTC-02:00)",
                            "(UTC-01:00)",
                            "(UTC+00:00)协调世界时",
                            "(UTC+01:00)",
                            "(UTC+02:00)",
                            "(UTC+03:00)",
                            "(UTC+04:00)",
                            "(UTC+05:00)",
                            "(UTC+06:00)",
                            "(UTC+07:00)",
                            "(UTC+08:00) 北京,重庆,香港特别行政区,乌鲁木齐",
                            "(UTC+09:00)",
                            "(UTC+10:00)",
                            "(UTC+11:00)",
                            "(UTC+12:00)"
                        ]

                        Component.onCompleted: {
                            currentIndex=20
                        }
                    }
                }
                Row{
                    spacing: 10
                    Label{
                        text:qsTr("坐标系统:")
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    ComboBox{
                        width: 400
                        model: ["CGCS 2000",
                            "WGS84"
                        ]

                        Component.onCompleted: {
                            currentIndex=0
                        }
                    }
                }
                Row{
                    spacing: 10
                    Label{
                        text:qsTr("工程日期:")
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    TextBox{
                        width: 300

                        id:project_create_date

                        Component.onCompleted: {
                            var date=new Date()
                            text=date.toLocaleDateString(control.locale,"yyyy/M/d")
                        }

                    }
                    CalendarPicker {
                        onCurrentChanged: {
                            project_create_date.text= current.toLocaleDateString(control.locale,"yyyy/M/d")
                        }
                    }
                }
                Row{
                    spacing: 10
                    Label{
                        text:qsTr("工程备注:")
                        anchors.verticalCenter: parent.verticalCenter

                        anchors{
                            top:parent.top
                            topMargin: 8
                        }
                    }

                    TextArea{
                        id:project_tips
                        width: 400
                        // implicitHeight: 90
                        wrapMode: TextArea.Wrap

                        // verticalScrollBarPolicy: TextArea.AlwaysOn // 总是显示垂直滚动条
                    }
                }
            }
        }


        onAccepted: {
            tip_top.show(InfoBarType.Success,qsTr("工程创建成功！"))
            Global.displayScreen="/screen/main"
        }

        onRejected: {
            tip_top.show(InfoBarType.Info,qsTr("取消创建工程"))
            // Global.displayScreen="/screen/main"
        }

    }



    Component.onCompleted:
    {
        import_file_dialog.open()
    }

}
