import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

Frame{

    anchors.fill: parent

    property string title
    property PageContext context


    property list<QtObject> originalItems : [
        PaneItem{
            key: "/page/station"
            title: "站点列表"
            icon.name: FluentIcons.graph_MapPin
        },
        PaneItem{
            key: "/page/obsfile"
            title: "观测文件列表"
            icon.name: FluentIcons.graph_Page
        },
        PaneItem{
            key: "/page/baseline"
            title: "基线列表"
            icon.name: FluentIcons.graph_ResizeTouchLarger
        },
        PaneItem{
            key: "/page/check"
            title: "检核列表"
            icon.name: FluentIcons.graph_Shield
        },
        PaneItem{
            key: "/page/closeloop"
            title: "闭合环"
            icon.name: FluentIcons.graph_DialShape2
        }

    ]
    property list<QtObject> originalFooterItems : [
        PaneItem{
            icon.name: FluentIcons.graph_Settings
            key: "/page/option"
            title: "Option"
        }
    ]
    PageRouter{
        id: page_router
        routes: {
            "/page/station": "qrc:/qt/qml/NavTool/qml/page/Page_Station.qml",
            "/page/obsfile": "qrc:/qt/qml/NavTool/qml/page/Page_ObsFile.qml",
            "/page/baseline": "qrc:/qt/qml/NavTool/qml/page/Page_Baseline.qml",
            "/page/closeloop": "qrc:/qt/qml/NavTool/qml/page/Page_CloseLoop.qml",
            "/page/check": "qrc:/qt/qml/NavTool/qml/page/Page_Check.qml",
            "/page/option": "qrc:/qt/qml/NavTool/qml/page/Page_Option.qml",
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
            page_router.go(Global.displayTablePage)
        }

        Connections{
            target:Global
            function onDisplayTablePageChanged(){
                page_router.go(Global.displayTablePage)
            }
        }

    }
}
