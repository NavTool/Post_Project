import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

Item{

    id:root

    property string title
    property PageContext context

    width: parent.width
    height: 460
    property list<QtObject> originalItems : [
        PaneItem{
            key: "/"
            title: ""
            icon.name: FluentIcons.graph_Back
        },
        PaneItem{
            key: "/file/start"
            title: "Start"
            icon.name: FluentIcons.graph_Home
        },
        PaneItem{
            key: "/file/new"
            title: "New"
            icon.name: FluentIcons.graph_Page
        },
        PaneItem{
            key: "/file/open"
            title: "Open"
            icon.name: FluentIcons.graph_FolderOpen
        },
        PaneItemSeparator{},
        PaneItem{
            key: "/file/info"
            title: "Info"
            icon.name: FluentIcons.graph_Tablet
        },
        PaneItem{
            key: "/file/save"
            title: "Save"
            icon.name: FluentIcons.graph_Save
        },
        PaneItem{
            key: "/file/saveas"
            title: "Save As"
            icon.name: FluentIcons.graph_SaveAs
        },
        PaneItem{
            key: "/file/export"
            title: "Export"
            icon.name: FluentIcons.graph_Export
        },
        PaneItem{
            key: "/file/close"
            title: "Close"
            icon.name: FluentIcons.graph_ChromeClose
        }
    ]
    property list<QtObject> originalFooterItems : [
        PaneItem{
            icon.name: FluentIcons.graph_Settings
            key: "/file/setting"
            title: "Settings"
        }
    ]
    PageRouter{
        id: page_router
        routes: {
            "/file/start": R.resolvedUrl("qml/page/Page_Start.qml"),
            "/file/new": R.resolvedUrl("qml/page/Page_New.qml"),
            "/file/open": R.resolvedUrl("qml/page/Page_Open.qml"),
            "/file/setting": R.resolvedUrl("qml/page/Page_Setting.qml")
        }
    }
    NavigationView{
        anchors.fill: parent
        logo: Global.windowIcon
        title: Global.windowName
        router: page_router
        items: originalItems
        footerItems: originalFooterItems
        displayMode: NavigationViewType.Open
        sideBarShadow: false
        sideItemHeight: 60
        sideBarWidth: 200
        goBackButton.visible:false
        logoDelegate: comp_logo

        onTap:
            (item)=>{
                if(item.key){
                    if(item.title===""){
                        Global.displayScreen="/screen/main"
                    }
                    else
                    {
                        page_router.go(item.key,{info:item.title})
                    }
                }
            }
        Component.onCompleted: {
            page_router.go("/file/start",{info:"Satrt"})
        }

        Component{
            id: comp_logo
            Image{
                width: Global.windowIcon ? 20 : 0
                height: width
                source: Global.windowIcon ? Global.windowIcon : ""
            }
        }

    }
}

