import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool
ScrollablePage{

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
                        value:INFO_APP_NAME
                    },
                    {
                        key:"版本",
                        value:INFO_VERSION_TYPE
                    },
                    {
                        key:"版本号",
                        value:INFO_APP_VERSION
                    },
                    {
                        key:"GIT版本",
                        value:INFO_GIT_VERSION
                    },
                    {
                        key:"TAG版本",
                        value:INFO_TAG_VERSION
                    },
                    {
                        key:"提交日期",
                        value:INFO_SUBMIT_TIME
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
                        value:"无需激活"
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
        contentHeight: 120

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
                        value:BUILD_SYSTEM
                    },
                    {
                        key:"编译架构",
                        value:BUILD_SYSTEM_PROCESSOR
                    },
                    {
                        key:"编译器版本",
                        value:BUILD_COMPILER_VERSION
                    },
                    {
                        key:"构建日期",
                        value:BUILD_DATE
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
                        key:"开发组织",
                        value:SUPPORT_DEVELOPER
                    },
                    {
                        key:"许可信息",
                        value:"MIT Licence"
                    },
                    {
                        key:"官方网站",
                        value:SUPPORT_OFFICIAL_DOMAIN
                    },
                    {
                        key:"项目网站",
                        value:SUPPORT_PROJECT_DOMAIN
                    },
                    {
                        key:"问题反馈",
                        value:SUPPORT_FEEDBACK
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


    Component:
    Item {
        property string  headerText: ""
        property int headerIcon:FluentIcons.GlobalNavButton
        property int headerHeight: 75
        property bool expand: false
        property int contentHeight : 300
        default property alias content: container.data
        id:control
        implicitHeight: Math.max((layout_header.height + layout_container.height),layout_header.height)
        implicitWidth: 400
        QtObject{
            id:d
            property bool flag: false
            function toggle(){
                d.flag = true
                expand = !expand
                d.flag = false
            }
        }
        clip: true
        Rectangle{
            id:layout_header
            width: parent.width
            height: headerHeight
            radius: 4
            border.color: FluTheme.dividerColor
            color: {
                if(Window.active){
                    return FluTheme.frameActiveColor
                }
                return FluTheme.frameColor
            }
            MouseArea{
                id:control_mouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    d.toggle()
                }
            }


            FluIcon{
                id:icon
                iconSource: headerIcon
                iconSize: 20

                anchors{
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 25
                }
            }


            FluText{
                text: headerText
                font: FluTextStyle.BodyStrong
                anchors{
                    left: icon.right
                    leftMargin: 20
                    verticalCenter: parent.verticalCenter
                    topMargin: 20
                }
            }

            // FluIcon{
            //     iconSource: expand ? FluentIcons.ChevronUp : FluentIcons.ChevronDown
            //     iconSize:15
            //     anchors{
            //         right: parent.right
            //         rightMargin: 25
            //         verticalCenter: parent.verticalCenter
            //     }
            // }


            FluIconButton{
                anchors{
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 15
                }
                color:{
                    if(Window.active){
                        return FluTheme.frameActiveColor
                    }
                    return FluTheme.frameColor
                }
                    /*{
                    if(control_mouse.containsMouse || hovered){
                        return FluTheme.dark ? Qt.rgba(73/255,73/255,73/255,1) : Qt.rgba(245/255,245/255,245/255,1)
                    }
                    return FluTheme.dark ? Qt.rgba(0,0,0,0) : Qt.rgba(0,0,0,0)
                }*/
                onClicked: {
                    d.toggle()
                }
                contentItem: FluIcon{
                    rotation: expand?0:180
                    iconSource:FluentIcons.ChevronUp
                    iconSize: 15
                    Behavior on rotation {
                        enabled: FluTheme.animationEnabled
                        NumberAnimation{
                            duration: 167
                            easing.type: Easing.OutCubic
                        }
                    }
                }
            }
        }
        Item{
            id:layout_container
            anchors{
                top: layout_header.bottom
                topMargin: -1
                left: layout_header.left
            }
            visible: contentHeight+container.anchors.topMargin !== 0
            height: contentHeight+container.anchors.topMargin
            width: parent.width
            z:-999
            clip: true
            Rectangle{
                id:container
                anchors.fill: parent
                radius: 4
                clip: true
                color: {
                    if(Window.active){
                        return FluTheme.frameActiveColor
                    }
                    return FluTheme.frameColor
                }
                border.color: FluTheme.dividerColor
                anchors.topMargin: -contentHeight
                states: [
                    State{
                        name:"expand"
                        when: control.expand
                        PropertyChanges {
                            target: container
                            anchors.topMargin:0
                        }
                    },
                    State{
                        name:"collapsed"
                        when: !control.expand
                        PropertyChanges {
                            target: container
                            anchors.topMargin:-contentHeight
                        }
                    }
                ]
                transitions: [
                    Transition {
                        to:"expand"
                        NumberAnimation {
                            properties: "anchors.topMargin"
                            duration: FluTheme.animationEnabled && d.flag ? 167 : 0
                            easing.type: Easing.OutCubic
                        }
                    },
                    Transition {
                        to:"collapsed"
                        NumberAnimation {
                            properties: "anchors.topMargin"
                            duration: FluTheme.animationEnabled && d.flag ? 167 : 0
                            easing.type: Easing.OutCubic
                        }
                    }
                ]
            }
        }
    }





}

