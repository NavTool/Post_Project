import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import QtWebEngine
ScrollablePage{

    Column{
        spacing: 20
        PillButton{
            text: "Pill Button"
            flat: true
        }
        PillButton{
            text: "Pill Button"
        }
        PillButton{
            text: "Pill Button"
            highlighted: true
        }
        PillButton{
            text: "Pill Button"
            highlighted: true
            FluentUI.primaryColor: Qt.rgba(13/255,110/255,253/255,1)
        }
        PillButton{
            text: "Pill Button"
            highlighted: true
            FluentUI.primaryColor: Qt.rgba(25/255,135/255,84/255,1)
        }
        PillButton{
            text: "Pill Button"
            highlighted: true
            FluentUI.primaryColor: Qt.rgba(220/255,53/255,69/255,1)
        }
        PillButton{
            text: "Pill Button"
            highlighted: true
            FluentUI.primaryColor: Qt.rgba(255/255,193/255,7/255,1)
        }
        PillButton{
            text: "Pill Button"
            highlighted: true
            FluentUI.primaryColor: Qt.rgba(13/255,202/255,240/255,1)
        }
    }

    Frame {
         width: 800
         height: 600
         visible: true
         WebEngineView {
            anchors.fill: parent
             url: "qrc:/qt/qml/NavTool/module/plot/echart_dev.html"
         }
     }


    WebEngineView {
        id:web2
        width:1280
        height: 720
        url: "https://echarts.apache.org/examples/zh/editor.html?c=line-race"


        onNewWindowRequested: (url) =>{
            web2.url=url
        }
    }


}
