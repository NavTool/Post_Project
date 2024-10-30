import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
// import Frame
import NavTool

Starter {
    id: starter
    appId: INFO_APP_NAME
    singleton: true
    //windowIcon:Global.windowIcon
    onActiveApplicationChanged:
        (args)=> {
            WindowRouter.go("/",{type:0,args:args})
        }
    Connections{
        target: Theme
        function onDarkModeChanged(){
            SettingsHelper.saveDarkMode(Theme.darkMode)
        }
    }
    Component.onCompleted: {
        R.windowIcon =Global.windowIcon
        Global.starter = starter
        Theme.darkMode = SettingsHelper.getDarkMode()
        WindowRouter.routes = {
            "/": R.resolvedUrl("qml/window/MainWindow.qml")
        }
        WindowRouter.go("/")
    }
}
