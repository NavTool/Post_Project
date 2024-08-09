import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels
import FluentUI 1.0

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"
import "../../qml/extra"

FluScrollablePage {
    title: qsTr("Info")

    ExtraExpander{

        Layout.fillWidth: true
        Layout.rightMargin: 15

        headerHeight: 75
        headerText: qsTr("软件信息")
        headerIcon: FluentIcons.Apps

        expand:true
        contentHeight: 180

        TableView{
            anchors.fill: parent
            topMargin: 15
            columnSpacing: 0
            rowSpacing: 5

            interactive:false // 设置交互为false则禁止拖动

            model:TableModel{
                TableModelColumn{display: "key"}
                TableModelColumn{display:"value"}

                rows:[
                    {
                        key:"软件名称",
                        value:"Nav Tool"
                    },
                    {
                        key:"版本",
                        value:"内测版本"
                    },
                    {
                        key:"版本号",
                        value:"1.0.0.0"
                    },
                    {
                        key:"发布日期",
                        value:"2024/7/2"
                    },
                    {
                        key:"GIT版本",
                        value:"1.1.5-15-gba609412-dev"
                    },
                    {
                        key:"TAG版本",
                        value:"ba609412"
                    }
                ]
            }

            delegate: DelegateChooser{
                DelegateChoice{
                    column: 0
                    delegate:Item {
                        implicitWidth:160
                        implicitHeight:20
                        FluText{
                            text:model.display
                            font: FluTextStyle.BodyStrong
                            color: FluTheme.fontPrimaryColor
                            anchors{
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 70
                            }
                        }
                    }
                }
                DelegateChoice{
                    column: 1
                    delegate: Item {
                        implicitWidth:100
                        implicitHeight:20
                        FluCopyableText{
                            text:model.display
                            font: FluTextStyle.BodyStrong
                            color: FluTheme.fontSecondaryColor
                            anchors{
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 20

                            }
                        }
                    }
                }
            }
        }
    }

    ExtraExpander{
        Layout.fillWidth: true
        Layout.rightMargin: 15

        headerHeight: 75
        headerText: qsTr("激活状态")
        headerIcon: FluentIcons.Completed

        expand:false
        contentHeight: 150

        TableView{
            anchors.fill: parent
            topMargin: 15
            columnSpacing: 0
            rowSpacing: 5

            interactive:false // 设置交互为false则禁止拖动

            model:TableModel{
                TableModelColumn{display: "key"}
                TableModelColumn{display:"value"}

                rows:[
                    {
                        key:"激活策略",
                        value:"内测版本"
                    },
                    {
                        key:"激活状态",
                        value:"已激活"
                    },
                    {
                        key:"过期时间",
                        value:"0000/0/0"
                    },
                    {
                        key:"设备码",
                        value:"1c99a3cc-d75e-4da9-8e94-00d89a7dffde"
                    },
                    {
                        key:"激活密钥",
                        value:"1c99a3cc-d75e-4da9-8e94-00d89a7dffde"
                    }

                ]
            }

            delegate: DelegateChooser{
                DelegateChoice{
                    column: 0
                    delegate:Item {
                        implicitWidth:160
                        implicitHeight:20
                        FluText{
                            text:model.display
                            font: FluTextStyle.BodyStrong
                            color: FluTheme.fontPrimaryColor
                            anchors{
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 70
                            }
                        }
                    }
                }
                DelegateChoice{
                    column: 1
                    delegate: Item {
                        implicitWidth:100
                        implicitHeight:20
                        FluCopyableText{
                            text:model.display
                            font: FluTextStyle.BodyStrong
                            color: FluTheme.fontSecondaryColor
                            anchors{
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 20

                            }
                        }
                    }
                }
            }
        }
    }

    ExtraExpander{

        Layout.fillWidth: true
        Layout.rightMargin: 15

        headerHeight: 75
        headerText: qsTr("构建信息")
        headerIcon: FluentIcons.Repair

        expand:false
        contentHeight: 100

        TableView{
            anchors.fill: parent
            topMargin: 15
            columnSpacing: 0
            rowSpacing: 5

            interactive:false // 设置交互为false则禁止拖动


            model:TableModel{
                TableModelColumn{display: "key"}
                TableModelColumn{display:"value"}

                rows:[
                    {
                        key:"编译环境",
                        value:"Windows 11 build 22631"
                    },
                    {
                        key:"编译器版本",
                        value:"Qt 6.6.3 (MSVC 2019, x86_64)"
                    },
                    {
                        key:"构建日期",
                        value:"2024/7/2"
                    }
                ]
            }

            delegate: DelegateChooser{
                DelegateChoice{
                    column: 0
                    delegate:Item {
                        implicitWidth:160
                        implicitHeight:20
                        FluText{
                            text:model.display
                            font: FluTextStyle.BodyStrong
                            color: FluTheme.fontPrimaryColor
                            anchors{
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 70
                            }
                        }
                    }
                }
                DelegateChoice{
                    column: 1
                    delegate: Item {
                        implicitWidth:100
                        implicitHeight:20
                        FluCopyableText{
                            text:model.display
                            font: FluTextStyle.BodyStrong
                            color: FluTheme.fontSecondaryColor
                            anchors{
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 20

                            }
                        }
                    }
                }
            }
        }
    }

    ExtraExpander{

        Layout.fillWidth: true
        Layout.rightMargin: 15

        headerHeight: 75
        headerText: qsTr("支持与许可")
        headerIcon: FluentIcons.Unknown

        expand:false
        contentHeight: 130

        TableView{
            anchors.fill: parent
            topMargin: 15
            columnSpacing: 0
            rowSpacing: 5

            interactive:false // 设置交互为false则禁止拖动

            model:TableModel{
                TableModelColumn{display: "key"}
                TableModelColumn{display:"value"}

                rows:[
                    {
                        key:"开发组织",
                        value:"NavTool"
                    },
                    {
                        key:"官方网站",
                        value:"https://github.com/NavTool"
                    },
                    {
                        key:"项目网站",
                        value:"https://github.com/NavTool/NavTool"
                    },
                    {
                        key:"许可信息",
                        value:"MIT Licence"
                    }
                ]
            }

            delegate: DelegateChooser{
                DelegateChoice{
                    column: 0
                    delegate:Item {
                        implicitWidth:160
                        implicitHeight:20
                        FluText{
                            text:model.display
                            font: FluTextStyle.BodyStrong
                            color: FluTheme.fontPrimaryColor
                            anchors{
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 70
                            }
                        }
                    }
                }
                DelegateChoice{
                    column: 1
                    delegate: Item {
                        implicitWidth:100
                        implicitHeight:20
                        FluCopyableText{
                            text:model.display
                            font: FluTextStyle.BodyStrong
                            color: FluTheme.fontSecondaryColor
                            anchors{
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 20
                            }
                        }
                    }
                }
            }
        }
    }

}
