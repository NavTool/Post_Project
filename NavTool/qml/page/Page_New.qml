import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import QtWebEngine
ContentPage{


    WebEngineView {
        id:web
        anchors.fill: parent
        url: "https://echarts.apache.org"


        onNewWindowRequested: (url) =>{
            web.url=url
        }
    }


}
