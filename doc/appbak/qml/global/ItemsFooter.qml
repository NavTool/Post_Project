pragma Singleton

import QtQuick 2.15
import FluentUI 1.0

FluObject{

    property var navigationView
    property var paneItemMenu

    id:footer_items

    FluPaneItemSeparator{}

    // FluPaneItem{
    //     title:qsTr("About")
    //     icon:FluentIcons.Contact
    //     onTapListener:function(){
    //         FluRouter.navigate("/about")
    //     }
    // }



    FluPaneItem{
        title: qsTr("Test")
        visible: isDebugBuild
        menuDelegate: paneItemMenu
        icon:FluentIcons.Bug
        url:"qrc:/qml/page/Test_Hotload.qml"
        //url:"qrc:/qml/Test.qml"
        onTap:{
            navigationView.push(url)
        }
    }

    FluPaneItem{
        title: qsTr("Hotload Page")
        visible: isDebugBuild
        menuDelegate: paneItemMenu
        icon:FluentIcons.AdjustHologram
        url:"qrc:/qml/page/Page_Hotload.qml"
        onTap:{
            navigationView.push(url)
        }
    }

    FluPaneItem{
        title: qsTr("Hotload Window")
        visible: isDebugBuild
        icon:FluentIcons.AdjustHologram
        onTapListener: function(){
            FluRouter.navigate("/hotload")
        }
    }


    FluPaneItem{
        title:qsTr("关于")
        menuDelegate: paneItemMenu
        icon:FluentIcons.Info
        url:"qrc:/qml/page/Page_Info.qml"
        onTap:{
            navigationView.push(url)
        }
    }

    FluPaneItem{
        title:qsTr("设置")
        menuDelegate: paneItemMenu
        icon:FluentIcons.Settings
        url:"qrc:/qml/page/Page_Setting.qml"
        onTap:{
            navigationView.push(url)
        }
    }



}
