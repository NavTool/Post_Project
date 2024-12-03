import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

Item{

    id:root

    property var initialItem

    anchors.fill:parent

    InfoBarManager{
        id: info_manager_topright
        target: root
        edge: Qt.TopEdge | Qt.RightEdge
    }

    InfoBarManager{
        id: info_manager_top
        target: root
        edge: Qt.TopEdge
    }

    InfoBarManager{
        id: info_manager_topleft
        target: root
        edge: Qt.TopEdge | Qt.LeftEdge
    }

    InfoBarManager{
        id: info_manager_bottomright
        target: root
        edge: Qt.BottomEdge | Qt.RightEdge
    }

    InfoBarManager{
        id: info_manager_bottom
        target: root
        edge: Qt.BottomEdge
    }

    InfoBarManager{
        id: info_manager_bottomleft
        target: root
        edge: Qt.BottomEdge | Qt.LeftEdge
    }

    InfoBarManager{
        id: info_manager_custom
        target: root
        edge: Qt.TopEdge | Qt.RightEdge
    }



    PageRouter{
        id: dialog_router
        routes: {
            "/dialog/project/newproject": R.resolvedUrl("qml/dialog/Dialog_Project_NewProject.qml"),

        }
    }


    // 用于存储多个对话框的Loader
    HotLoader {
        id: dialogLoader
    }

    Connections{
        target: Global

        function  onOpen_dialog(path)
        {
            dialogLoader.source =dialog_router.toUrl(path)
            dialogLoader.reload()
        }
    }

    PageRouter{
        id: screen_router
        routes: {
            "/screen/init": R.resolvedUrl("qml/screen/Screen_Init.qml"),
            "/screen/main": {url:R.resolvedUrl("qml/screen/Screen_Main.qml"),singleton:true},
            "/screen/file": R.resolvedUrl("qml/screen/Screen_File.qml")
        }
    }

    PageRouterView{
        id: screen_panne
        anchors.fill: parent
        router: screen_router
        clip: true

        Component.onCompleted: {
            screen_router.go(Global.displayScreen)
        }
    }

    Connections{
        target:Global
        function onDisplayScreenChanged(){
            screen_router.go(Global.displayScreen)
        }
    }


}

