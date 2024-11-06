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

    HotLoader{
        id: loader_container
        FluentUI.dark: control.FluentUI.dark
        anchors{
            fill: parent
            topMargin: fitsAppBarWindows ? 0 : layout_appbar.height
        }
        source: {
            if(root.initialItem){
                return root.initialItem
            }
            return ""
        }
    }

    Component.onCompleted:{
        initialItem=R.resolvedUrl("qml/screen/InitScreen.qml")
    }

    Connections{
        target:Global

        function onDisplayScreenChanged(){
            // console.log("change:",Global.displayScreen)

            if(Global.displayScreen==2)
            {
                initialItem=R.resolvedUrl("qml/screen/FileScreen.qml")
            }
            else if(Global.displayScreen==1) //=1
            {
                initialItem=R.resolvedUrl("qml/screen/MainScreen.qml")
            }
            else
            {
                initialItem=R.resolvedUrl("qml/screen/InitScreen.qml")
            }
        }



    }


}

