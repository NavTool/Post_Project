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
        title: qsTr("主页")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_home.count
        }
        icon: FluentIcons.Home
        url: "qrc:/qml/page/Home_Main.qml"
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
        title: qsTr("通用工具")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_str_mult.count
        }
        icon: FluentIcons.OEM
        url: "qrc:/module/nav_tool/Home_Tool.qml"
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
        title: qsTr("基站服务")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_caster_service.count
        }
        icon: FluentIcons.TapAndSend
        url: "qrc:/module/caster_gui/Home_Caster.qml"
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
        title: qsTr("用户管理")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_caster_service.count
        }
        icon: FluentIcons.ContactInfoMirrored
        url: "qrc:/module/auth_gui/Home_Auth.qml"
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
        title: qsTr("数据流工具")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_str_mult.count
        }
        icon: FluentIcons.Sort
        url: "qrc:/module/str_mult/Home_Strsvr.qml"
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
        title: qsTr("测试工具")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_caster_service.count
        }
        icon: FluentIcons.SpeedHigh
        url: "qrc:/module/test_tool/Home_Test.qml"
        onTap: {
            if(navigationView.getCurrentUrl()){
                item_caster_service.count = 0
            }
            navigationView.push(url)
        }
    }

    FluPaneItem{
        id:item_post_proc
        count: 0
        title: qsTr("数据解算")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_caster_service.count
        }
        icon: FluentIcons.POI
        url: "qrc:/module/post_proc/Home_Post.qml"
        onTap: {
            if(navigationView.getCurrentUrl()){
                item_caster_service.count = 0
            }
            navigationView.push(url)
        }
    }


    FluPaneItem{
        id:item_file_conv
        count: 0
        title: qsTr("文件转换")
        menuDelegate: paneItemMenu
        infoBadge: FluBadge{
            count: item_caster_service.count
        }
        icon: FluentIcons.SyncFolder
        url: "qrc:/module/file_conv/Home_Conv.qml"
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
