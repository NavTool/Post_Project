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
            "/screen/main": R.resolvedUrl("qml/screen/Screen_Main.qml"),
            "/screen/file": R.resolvedUrl("qml/screen/Screen_File.qml"),
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

