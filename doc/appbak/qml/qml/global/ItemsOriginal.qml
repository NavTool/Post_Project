pragma Singleton

import QtQuick 2.15
import FluentUI 1.0

FluObject{

    property var navigationView
    property var paneItemMenu


    function rename(item, newName){
        if(newName && newName.trim().length>0){
            item.title = newName;
        }
    }

    FluPaneItem{
        id:item_home
        count: 0
        title: qsTr("Home")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_home.count
        }
        icon: FluentIcons.Home
        url: "qrc:/qml/page/T_Home.qml"
        onTap: {
            if(navigationView.getCurrentUrl()){
                item_home.count = 0
            }
            navigationView.push(url)
        }
    }

    FluPaneItem{
        id:item_nav_tool
        count: 0
        title: qsTr("Nav Tool")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_str_mult.count
        }
        icon: FluentIcons.OEM
        url: "qrc:/module/nav_tool/DashboardPage.qml"
        onTap: {
            if(navigationView.getCurrentUrl()){
                item_str_mult.count = 0
            }
            navigationView.push(url)
        }
    }

    FluPaneItem{
        id:item_caster_service
        count: 0
        title: qsTr("Caster Service")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_caster_service.count
        }
        icon: FluentIcons.TapAndSend
        url: "qrc:/module/caster_gui/DashboardPage.qml"
        onTap: {
            if(navigationView.getCurrentUrl()){
                item_caster_service.count = 0
            }
            navigationView.push(url)
        }
    }







    FluPaneItem{
        id:item_auth_gui
        count: 0
        title: qsTr("User Management")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_caster_service.count
        }
        icon: FluentIcons.PassiveAuthentication
        url: "qrc:/module/auth_gui/DashboardPage.qml"
        onTap: {
            if(navigationView.getCurrentUrl()){
                item_caster_service.count = 0
            }
            navigationView.push(url)
        }
    }

    FluPaneItem{
        id:item_str_mult
        count: 0
        title: qsTr("Stream Tool")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_str_mult.count
        }
        icon: FluentIcons.Sort
        url: "qrc:/module/str_mult/DashboardPage.qml"
        onTap: {
            if(navigationView.getCurrentUrl()){
                item_str_mult.count = 0
            }
            navigationView.push(url)
        }
    }



    FluPaneItem{
        id:item_ntrip_tool
        count: 0
        title: qsTr("Test Tool")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_caster_service.count
        }
        icon: FluentIcons.SpeedHigh
        url: "qrc:/module/test_tool/DashboardPage.qml"
        onTap: {
            if(navigationView.getCurrentUrl()){
                item_caster_service.count = 0
            }
            navigationView.push(url)
        }
    }



    function getRecentlyAddedData(){
        var arr = []
        var items = navigationView.getItems();
        for(var i=0;i<items.length;i++){
            var item = items[i]
            if(item instanceof FluPaneItem && item.extra && item.extra.recentlyAdded){
                arr.push(item)
            }
        }
        arr.sort(function(o1,o2){ return o2.extra.order-o1.extra.order })
        return arr
    }

    function getRecentlyUpdatedData(){
        var arr = []
        var items = navigationView.getItems();
        for(var i=0;i<items.length;i++){
            var item = items[i]
            if(item instanceof FluPaneItem && item.extra && item.extra.recentlyUpdated){
                arr.push(item)
            }
        }
        return arr
    }

    function getSearchData(){
        if(!navigationView){
            return
        }
        var arr = []
        var items = navigationView.getItems();
        for(var i=0;i<items.length;i++){
            var item = items[i]
            if(item instanceof FluPaneItem){
                if (item.parent instanceof FluPaneItemExpander)
                {
                    arr.push({title:`${item.parent.title} -> ${item.title}`,key:item.key})
                }
                else
                    arr.push({title:item.title,key:item.key})
            }
        }
        return arr
    }

    function startPageByItem(data){
        navigationView.startPageByItem(data)
    }

}
