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
        title: qsTr("Hotload Page")
        menuDelegate: paneItemMenu
        icon:FluentIcons.AdjustHologram
        url:"qrc:/qml/page/HotloadPage.qml"
        onTap:{
            navigationView.push(url)
        }
    }

    FluPaneItem{
        title: qsTr("Hotload Window")
        icon:FluentIcons.AdjustHologram
        onTapListener: function(){
            FluRouter.navigate("/hotload")
        }
    }


    FluPaneItem{
        title:qsTr("Settings")
        menuDelegate: paneItemMenu
        icon:FluentIcons.Settings
        url:"qrc:/qml/page/T_Settings.qml"
        onTap:{
            navigationView.push(url)
        }
    }


}
