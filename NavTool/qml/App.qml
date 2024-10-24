import QtQuick
import QtQuick.Controls
import FluentUI.Controls
// import Frame
import NavTool

Starter {
    id: starter
    appId: PROJECT_TAG_VERSION
    singleton: true
    windowIcon:Global.windowIcon
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
        Global.starter = starter
        Theme.darkMode = SettingsHelper.getDarkMode()
        WindowRouter.routes = {
            "/": resolvedUrl("qml/window/MainWindow.qml")
        }
        WindowRouter.go("/")
    }
}
