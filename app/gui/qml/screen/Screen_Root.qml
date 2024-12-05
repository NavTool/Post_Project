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

    PageRouter{
        id: screen_router
        routes: {
            "/screen/init": R.resolvedUrl("qml/screen/Screen_Init.qml"),
            "/screen/main": {url:R.resolvedUrl("qml/screen/Screen_Main.qml"),singleton:true},
            "/screen/file": R.resolvedUrl("qml/screen/Screen_File.qml")
        }
    }


    PageRouter{
        id: dialog_router
        routes: {
            "/dialog/project/new_project": R.resolvedUrl("qml/dialog/Dialog_Project_NewProject.qml"),
            "/dialog/project/import_sp3": R.resolvedUrl("qml/dialog/Dialog_Project_ImportIMU.qml"),
            "/dialog/project/import_list": R.resolvedUrl("qml/dialog/Dialog_Project_ImportList.qml"),
            "/dialog/project/import_nav": R.resolvedUrl("qml/dialog/Dialog_Project_ImportNav.qml"),
            "/dialog/project/import_obs": R.resolvedUrl("qml/dialog/Dialog_Project_ImportObs.qml"),
            "/dialog/project/import_setting": R.resolvedUrl("qml/dialog/Dialog_Project_ImportSetting.qml"),
            "/dialog/project/import_sp3": R.resolvedUrl("qml/dialog/Dialog_Project_ImportSp3.qml"),
            "/dialog/project/station_edit": R.resolvedUrl("qml/dialog/Dialog_Project_StationEdit.qml"),
            "/dialog/project/station_list": R.resolvedUrl("qml/dialog/Dialog_Project_StationList.qml"),
            "/dialog/project/station_new": R.resolvedUrl("qml/dialog/Dialog_Project_Stationnew.qml")
        }
    }


    InfoBarManager{
        id: tip_topright
        target: root
        edge: Qt.TopEdge | Qt.RightEdge
    }

    InfoBarManager{
        id: tip_top
        target: root
        edge: Qt.TopEdge
    }

    InfoBarManager{
        id: tip_topleft
        target: root
        edge: Qt.TopEdge | Qt.LeftEdge
    }

    InfoBarManager{
        id: tip_bottomright
        target: root
        edge: Qt.BottomEdge | Qt.RightEdge
    }

    InfoBarManager{
        id: tip_bottom
        target: root
        edge: Qt.BottomEdge
    }

    InfoBarManager{
        id: tip_bottomleft
        target: root
        edge: Qt.BottomEdge | Qt.LeftEdge
    }



    // 用于存储多个对话框的Loader
    HotLoader {
        id: dialogLoader
    }

    Connections{
        target: Global

        function  onOpen_dialog(path)
        {
            if(dialogLoader.source==dialog_router.toUrl(path))
            {
                console.log("reload dialog")
                dialogLoader.reload()
            }
            else
            {
                console.log("load dialog:"+path)
                dialogLoader.source =dialog_router.toUrl(path)
            }
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

