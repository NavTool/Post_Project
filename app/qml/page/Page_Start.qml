import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool
ScrollablePage{
    Row{
        spacing: 10
        Button{
            text: "切换到初始页面"
            icon.name: FluentIcons.graph_Copy
            icon.width: 18
            icon.height: 18
            spacing: 5

            onClicked:{
                Global.displayScreen="/screen/init"
            }
        }
        Button{
            text: "切换到主页"
            icon.name: FluentIcons.graph_Copy
            icon.width: 18
            icon.height: 18
            spacing: 5

            onClicked:{
                Global.displayScreen="/screen/main"
            }
        }
        Button{
            text: "切换到文件页面"
            icon.name: FluentIcons.graph_Copy
            icon.width: 18
            icon.height: 18
            spacing: 5

            onClicked:{
                Global.displayScreen="/screen/file"
            }
        }
    }
}
