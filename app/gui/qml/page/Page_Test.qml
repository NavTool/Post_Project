import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool
import "../extra"

Item {
    id:root

    anchors.fill: parent

    property string title
    property PageContext context

    //导航栏具体条目
    PageRouter{
        id: dialog_router
        routes: {
            "/dialog/project/newpeoject": R.resolvedUrl("qml/dialog/Dialog_Project_NewProject.qml"),

        }
    }

    // PageRouterView{
    //     id: dialog_panne
    //     anchors.fill: parent
    //     router: dialog_router
    //     clip: true

    //     Component.onCompleted: {
    //         // if(Global.displayDialog!=="")
    //         // {
    //         //     dialog_router.go(Global.displayDialog)

    //         // }

    //     }

    //     Connections{
    //         target: Global

    //         function  onOpen_dialog(path)
    //         {
    //             dialog_router.go("")
    //  dialog_router.go(path)
    //         }
    //     }


        // Connections{
        //     target:Global
        //     function onDisplayDialogChanged(){
        //         console.log("onDisplayDialogChanged")
        //         if(Global.displayDialog!=="")
        //         {
        //             dialog_router.go(path)
        //         }

        //     }
        // }
    // }


    // // 用于存储多个对话框的Loader
    // Loader {
    //     id: dialogLoader
    // }

    // // 按钮触发打开对话框的事件
    // Button {
    //     text: "打开对话框"
    //     anchors.centerIn: parent
    //     onClicked: {

    //         console.log("onClicked")

    //         // 加载并显示对话框
    //         dialogLoader.source=""  //重置
    //         dialogLoader.source =dialog_router.toUrl("/dialog/project/newpeoject")
    //         dialogLoader.item.open()
    //     }
    // }

Column{

    IconButton{
        text: "xxxxxxxxxx"

        onClicked: {
            console.log("onClicked")
            // Global.displayDialog=""
            // Global.displayDialog="/dialog/project/newpeoject"


            Global.open_dialog("/dialog/project/newpeoject")
        }
    }

    IconButton{
        text: "xxxxxxxxxx"

        onClicked: {
            WindowRouter.go("/page",{url:dialog_router.toUrl("/dialog/project/newpeoject"),title:"xxx"})
        }
    }

}

}
