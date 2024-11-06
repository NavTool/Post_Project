import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import QtWebEngine
ContentPage{

    Column{
        WebEngineView {
            id:web
            width:1280
            height: 720
            url: "https://echarts.apache.org"


            onNewWindowRequested: (url) =>{
                web.url=url
            }
        }


    }







}
