import QtQuick
import QtQuick.Controls
import FluentUI.Controls

Starter {
    id: starter
    Component.onCompleted: {
        WindowRouter.routes = {
            "/": resolvedUrl("MainWindow.qml")
        }
        WindowRouter.go("/")
    }
}
