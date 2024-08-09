import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import FluentUI 1.0
import frame 1.0
import "../component"

FluContentPage {

    id:hotload

    launchMode: FluWindowType.SingleInstance
    FileWatcher{
        id:watcher
        onFileChanged: {
            loader.reload()
        }
    }
    Item{
        anchors.fill: parent
        FluRemoteLoader{
            id:loader
            anchors.fill: parent
            statusMode: FluStatusLayoutType.Success
            lazy: true
            errorItem: Item{
                FluText{
                    text:loader.itemLodaer().sourceComponent.errorString()
                    color:"red"
                    anchors.fill: parent
                    wrapMode: Text.WrapAnywhere
                    padding: 20
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
            }
        }


        Component.onCompleted:
        {
            var url ="file:///F:/Dev/NavTool/app/qml/Test.qml"
            if(url !== ""){
                loader.source = url
                watcher.path = url
                loader.reload()
            }
        }
    }

    //     DropArea{
    //         id:drop_area
    //         anchors.fill: parent
    //         onEntered:
    //             (event)=>{
    //                 if(!event.hasUrls){
    //                     event.accepted = false
    //                     return
    //                 }
    //                 var url = getUrlByEvent(event)
    //                 if(url === ""){
    //                     event.accepted = false
    //                     return
    //                 }
    //                 var fileExtension = url.substring(url.lastIndexOf(".") + 1)
    //                 if (fileExtension !== "qml") {
    //                     event.accepted = false
    //                     return
    //                 }
    //                 return true
    //             }
    //         onDropped:
    //             (event)=>{
    //                 var url = getUrlByEvent(event)
    //                 if(url !== ""){
    //                     loader.source = url
    //                     watcher.path = url
    //                     loader.reload()
    //                 }
    //             }
    //     }
    // }

    // function getUrlByEvent(event){
    //     var url = ""
    //     if (event.urls.length === 0) {
    //         url = "file:///"+event.getDataAsString("text/plain")
    //     }else{
    //         url = event.urls[0].toString()
    //     }
    //     return url
    // }

}
