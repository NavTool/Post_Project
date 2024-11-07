import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl

Frame{

    anchors.fill: parent

    property string title
    property PageContext context


    property list<QtObject> originalItems : [
        PaneItem{
            key: "/page/table"
            title: "站点列表"
            icon.name: FluentIcons.graph_Home
        },
        PaneItem{
            key: "/page/blank"
            title: "观测文件列表"
            icon.name: FluentIcons.graph_Home
        },
        PaneItem{
            key: "/page/table"
            title: "基线列表"
            icon.name: FluentIcons.graph_Home
        },
        PaneItem{
            key: "/page/blank"
            title: "检核列表"
            icon.name: FluentIcons.graph_Home
        }


    ]
    property list<QtObject> originalFooterItems : [
        PaneItem{
            icon.name: FluentIcons.graph_Settings
            key: "/test/settings"
            title: "Settings"
        }
    ]
    PageRouter{
        id: page_router
        routes: {
            "/page/blank": "qrc:/qt/qml/NavTool/qml/page/Page_Blank.qml",
            "/page/table": "qrc:/qt/qml/NavTool/qml/page/Page_Table.qml",
        }
    }
    NavigationView{
        anchors.fill: parent
        //logo: "qrc:/qt/qml/Gallery/res/image/logo.png"
        //title: "FluentUI Gallery"
        router: page_router
        items: originalItems
        footerItems: originalFooterItems
        displayMode: NavigationViewType.Compact
        sideBarShadow: false
        goBackButton.visible: false
        appBarHeight: 0
        sideBarWidth:180
        // sideItemHeight:35
        onTap:
            (item)=>{
                if(item.key){
                    page_router.go(item.key,{info:item.title})
                }
            }
        Component.onCompleted: {
            page_router.go("/page/table",{info:"Blank"})
        }
    }
}
