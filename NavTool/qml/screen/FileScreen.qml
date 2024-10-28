import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

Item{

    id:root


    width: parent.width
    height: 460
    property list<QtObject> originalItems : [
        PaneItem{
            key: "/"
            title: ""
            icon.name: FluentIcons.graph_Back
        },
        PaneItem{
            key: "/start/start"
            title: "Start"
            icon.name: FluentIcons.graph_Home
        },
        PaneItem{
            key: "/start/new"
            title: "New"
            icon.name: FluentIcons.graph_Page
        },
        PaneItem{
            key: "/start/open"
            title: "Open"
            icon.name: FluentIcons.graph_FolderOpen
        }
    ]
    property list<QtObject> originalFooterItems : [
        PaneItem{
            icon.name: FluentIcons.graph_Settings
            key: "/test/settings"
            title: "Settings"
        },
        PaneItem{
            icon.name: FluentIcons.graph_Contact
            key: "/test/addnewitem"
            title: "Add New Item"
        }
    ]
    PageRouter{
        id: page_router
        routes: {
            "/": "qrc:/qt/qml/Gallery/res/qml/page/T_Test.qml",
            "/test/track": "qrc:/qt/qml/Gallery/res/qml/page/T_Test.qml",
            "/test/mail": "qrc:/qt/qml/Gallery/res/qml/page/T_Test.qml",
            "/test/calendar": "qrc:/qt/qml/Gallery/res/qml/page/T_Test.qml",
            "/test/newitem": "qrc:/qt/qml/Gallery/res/qml/page/T_Test.qml",
            "/test/settings": "qrc:/qt/qml/Gallery/res/qml/page/T_Test.qml",
            "/test/addnewitem": "qrc:/qt/qml/Gallery/res/qml/page/T_Test.qml"
        }
    }
    NavigationView{
        anchors.fill: parent
        logo: "qrc:/qt/qml/Gallery/res/image/logo.png"
        title: "FluentUI Gallery"
        router: page_router
        items: originalItems
        footerItems: originalFooterItems
        displayMode: NavigationViewType.Open
        sideBarShadow: false
        property int sideItemHeight: 60


        onTap:
            (item)=>{
                if(item.key){
                    page_router.go(item.key,{info:item.title})
                }
            }
        Component.onCompleted: {
            page_router.go("/",{info:"Home"})
        }
    }
}

