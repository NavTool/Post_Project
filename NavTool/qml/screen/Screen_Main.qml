import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool

Item{

    id:root


    property string title
    property PageContext context

    Component.onCompleted:{
        window.setHitTestVisible(top_bar_left) //设置组件id来顶部的按键可以使用
        window.setHitTestVisible(top_bar_right) //设置组件id来顶部的按键可以使用
        window.setHitTestVisible(project_info)
    }

    //导航栏菜单元素
    property list<QtObject> navbar_items : [
        PaneItem{
            key: "/"
            title: "文件"
        },
        PaneItem{
            key: "/navbar/start"
            title: "开始"
        },
        PaneItem{
            key: "/navbar/view"
            title: "视图"
        },
        PaneItem{
            key: "/navbar/net"
            title: "静态网"
        },
        PaneItem{
            key: "/navbar/gnss"
            title: "GNSS"
        },
        PaneItem{
            key: "/navbar/ins"
            title: "组合导航"
        },
        PaneItem{
            key: "/navbar/tool"
            title: "工具"
        },
        PaneItem{
            key: "/navbar/about"
            title: "关于"
        }
    ]

    //导航栏具体条目
    PageRouter{
        id: navbar_router
        routes: {
            "/navbar/start": R.resolvedUrl("qml/component/NavBar_Start.qml"),
            "/navbar/view": R.resolvedUrl("qml/component/NavBar_View.qml"),
            "/navbar/net": R.resolvedUrl("qml/component/NavBar_NET.qml"),
            "/navbar/gnss": R.resolvedUrl("qml/component/NavBar_GNSS.qml"),
            "/navbar/ins": R.resolvedUrl("qml/component/NavBar_INS.qml"),
            "/navbar/tool": R.resolvedUrl("qml/component/NavBar_Tool.qml"),
            "/navbar/about": R.resolvedUrl("qml/component/NavBar_Support.qml")
        }
    }

    //主页面导航栏
    ListModel{
        id: body_midtop_info_model
        ListElement{key:"/page/blank";title:qsTr("起始页");icon:""}
        ListElement{key:"/page/map";title:qsTr("平面视图");icon:""}
        ListElement{key:"/page/table";title:qsTr("资源视图");icon:""}
        ListElement{key:"/page/dataspan";title:qsTr("数据区间");icon:""}
        ListElement{key:"/page/task";title:qsTr("任务队列");icon:""}
    }
    PageRouter{
        id: body_midtop_router
        routes:{
            "/page/blank": R.resolvedUrl("qml/page/Page_Blank.qml"),
            "/page/map": {url:R.resolvedUrl("qml/page/Page_Map.qml"),singleton:true},
            "/page/table": {url:R.resolvedUrl("qml/page/Page_Table.qml"),singleton:true},
            "/page/dataspan": {url:R.resolvedUrl("qml/page/Page_DataSpan.qml"),singleton:true},
            "/page/task": {url:R.resolvedUrl("qml/page/Page_Task.qml"),singleton:true}
        }
    }
    //中下导航栏
    PageRouter{
        id: body_midbottom_router
        routes: {
            "/sidepage/log":{url: R.resolvedUrl("qml/component/SidePage_Log.qml"),singleton:true},
        }
    }

    //左上导航栏
    PageRouter{
        id: body_lefttop_router
        routes: {
            "/sidepage/resource":{url: R.resolvedUrl("qml/component/SidePage_Resource.qml"),singleton:true},
            "/sidepage/layer": R.resolvedUrl("qml/component/SidePage_Layer.qml"),
            "/sidepage/property": R.resolvedUrl("qml/component/SidePage_Property.qml"),
            "/sidepage/status": R.resolvedUrl("qml/component/SidePage_Status.qml")
        }
    }
    //左下导航栏
    PageRouter{
        id: body_leftbottom_router
        routes: {
            "/sidepage/resource":{url: R.resolvedUrl("qml/component/SidePage_Resource.qml"),singleton:true},
            "/sidepage/layer": R.resolvedUrl("qml/component/SidePage_Layer.qml"),
            "/sidepage/property": R.resolvedUrl("qml/component/SidePage_Property.qml"),
            "/sidepage/status": R.resolvedUrl("qml/component/SidePage_Status.qml")
        }
    }

    //右上导航栏
    PageRouter{
        id: body_righttop_router
        routes: {
            "/sidepage/resource":{url: R.resolvedUrl("qml/component/SidePage_Resource.qml"),singleton:true},
            "/sidepage/layer": R.resolvedUrl("qml/component/SidePage_Layer.qml"),
            "/sidepage/property": R.resolvedUrl("qml/component/SidePage_Property.qml"),
            "/sidepage/status": R.resolvedUrl("qml/component/SidePage_Status.qml")
        }
    }
    //右下导航栏
    PageRouter{
        id: body_rightbottom_router
        routes: {
            "/sidepage/resource":{url: R.resolvedUrl("qml/component/SidePage_Resource.qml"),singleton:true},
            "/sidepage/layer": R.resolvedUrl("qml/component/SidePage_Layer.qml"),
            "/sidepage/property": R.resolvedUrl("qml/component/SidePage_Property.qml"),
            "/sidepage/status": R.resolvedUrl("qml/component/SidePage_Status.qml")
        }
    }




    InfoBarManager{
        id: info_manager_topright
        target: root
        edge: Qt.TopEdge | Qt.RightEdge
    }

    InfoBarManager{
        id: info_manager_top
        target: root
        edge: Qt.TopEdge
    }

    InfoBarManager{
        id: info_manager_topleft
        target: root
        edge: Qt.TopEdge | Qt.LeftEdge
    }

    InfoBarManager{
        id: info_manager_bottomright
        target: root
        edge: Qt.BottomEdge | Qt.RightEdge
    }

    InfoBarManager{
        id: info_manager_bottom
        target: root
        edge: Qt.BottomEdge
    }

    InfoBarManager{
        id: info_manager_bottomleft
        target: root
        edge: Qt.BottomEdge | Qt.LeftEdge
    }

    InfoBarManager{
        id: info_manager_custom
        target: root
        edge: Qt.TopEdge | Qt.RightEdge
    }


    //左上角应用名称
    Item{
        id:top_bar

        width:row.width
        height:20
        clip:true

        anchors{
            top:parent.top
            left:parent.left
            topMargin:13
            leftMargin:15
        }
        Row{
            id: row
            spacing:6
            Image{
                source: Global.windowIcon
                width: 20
                height: width
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
            }
            Label{
                text:Global.windowName+" "+ INFO_APP_VERSION
                font: Typography.bodyStrong

                anchors.verticalCenter: parent.verticalCenter
            }
            Label{
                text: qsTr("自动保存")
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    //应用顶部：左侧按钮，从左到右排列
    RowLayout {
        id:top_bar_left

        anchors
        {
            top:parent.top
            left:top_bar.right
            topMargin:5
            leftMargin:0
        }

        Layout.fillWidth: true  // 左侧区域填充可用空间
        spacing: 0

        Switch{
            id: switch_disabled

            onCheckedChanged:{
                if(checked){
                    info_manager_top.show(InfoBarType.Success,qsTr("AutoSave is Turn On!"))
                }
                else{
                    info_manager_top.show(InfoBarType.Info,qsTr("AutoSave is Turn Off!"))
                }
            }

            ToolTip.visible: hovered
            ToolTip.delay: 500
            ToolTip.text: "Auto Save"
        }

        IconButton{
            text: "Save"
            icon.name: FluentIcons.graph_Save
            icon.width: 18
            icon.height: 18
            spacing: 5
            display: IconButton.IconOnly

            onClicked:{
                info_manager_top.show(InfoBarType.Success,qsTr("The project has been saved!"))
            }

            ToolTip.visible: hovered
            ToolTip.delay: 500
            ToolTip.text: text
        }

        IconButton{
            text: "Undo"
            icon.name: FluentIcons.graph_Undo
            icon.width: 18
            icon.height: 18
            spacing: 5
            display: IconButton.IconOnly

            ToolTip.visible: hovered
            ToolTip.delay: 500
            ToolTip.text: text

            onClicked:{
                Global.displayScreen=1
            }
        }

        IconButton{
            text: "Rndo"
            icon.name: FluentIcons.graph_Redo
            icon.width: 18
            icon.height: 18
            spacing: 5
            display: IconButton.IconOnly

            ToolTip.visible: hovered
            ToolTip.delay: 500
            ToolTip.text: text
            onClicked:{
                Global.displayScreen=2
            }
        }

        IconButton{
            text: "Refresh"
            icon.name: FluentIcons.graph_Refresh
            icon.width: 18
            icon.height: 18
            spacing: 5
            display: IconButton.IconOnly

            ToolTip.visible: hovered
            ToolTip.delay: 500
            ToolTip.text: text
        }

        Item{
            width:5
        }
    }

    //应用顶部  右侧按钮，从右向左排列
    RowLayout {
        id:top_bar_right

        anchors
        {
            top:parent.top
            left:parent.left
            topMargin:5
            leftMargin:0.25*parent.width
        }

        Layout.fillWidth: true  // 右侧区域填充可用空间
        spacing: 5

        // 设置 LayoutMirroring 使其从右向左排列
        LayoutMirroring.enabled: true
        // LayoutMirroring.childrenInherit: true

        TextBox{

            placeholderText: "搜索"
            trailing: IconButton{
                implicitWidth: 30
                implicitHeight: 20
                icon.name: FluentIcons.graph_Search
                icon.width: 14
                icon.height: 14
                padding: 0
            }

            focusReason:Qt.MouseFocusReason

        }

    }

    //用用主页面：
    Item{
        anchors{
            left:parent.left
            right:parent.right
            top:parent.top
            topMargin:50
            bottom:parent.bottom
        }

        //主页面顶部菜单栏
        Item{
            id:header
            property alias header_bar: bar
            height:Global.visable_header?28:0
            width:parent.width
            clip:true

            TabBar {
                id: bar
                width: parent.width-40
                height:22

                anchors{
                    top:parent.top
                    topMargin:4
                    horizontalCenter:parent.horizontalCenter
                }

                currentIndex:Global.navbarCurrentIndex

                clip: true
                Repeater {
                    model: navbar_items
                    TabButton {
                        id: btn_tab
                        text: model.title
                        font:Typography.body
                        height:22
                    }
                }

                onCurrentIndexChanged: {
                    if(navbar_items[bar.currentIndex].key==="/")
                    {
                        Global.displayScreen="/screen/file";
                        bar.currentIndex=Global.navbarCurrentIndex
                    }
                    else
                    {
                        navbar_router.go(navbar_items[bar.currentIndex].key,{info:navbar_items[bar.currentIndex].title})
                        Global.navbarCurrentIndex=bar.currentIndex
                    }
                }

                Component.onCompleted: {
                    bar.currentIndex=Global.navbarCurrentIndex
                    navbar_router.go(navbar_items[bar.currentIndex].key,{info:navbar_items[bar.currentIndex].title})
                }
            }

            IconButton{
                text: "Fold"
                icon.name:Global.visable_header_extra? FluentIcons.graph_ChevronUp:FluentIcons.graph_ChevronDown
                icon.width: 15
                icon.height: 15
                spacing: 0
                display: IconButton.IconOnly

                anchors{
                    right:parent.right
                    top:parent.top
                    rightMargin:15
                }

                onClicked:{
                    Global.visable_header_extra=!Global.visable_header_extra
                }
            }
        }

        //主页主要框架栏
        Item{
            id:body
            anchors{
                top:header.bottom
                bottom:footer.top
                left:parent.left
                right:parent.right
                topMargin:5
                leftMargin:5
                rightMargin:5
            }
            width:parent.width

            SplitView {
                id:split_layout
                anchors.fill: parent
                orientation: Qt.Horizontal

                //页面左侧框架
                Item {
                    clip: true
                    visible:Global.visable_left_side
                    implicitWidth: body.width*0.15
                    implicitHeight: body.height
                    // SplitView.maximumWidth: 400
                    // SplitView.maximumHeight: 400

                    SplitView {
                        id:split_layout1
                        anchors.fill: parent
                        anchors.topMargin: header_extra.visible?header_extra.height:0
                        orientation: Qt.Vertical

                        //页面左侧框架上部
                        Item {
                            clip: true
                            visible:Global.visable_left_top_side
                            implicitWidth: parent.width
                            implicitHeight: parent.height*0.7
                            // SplitView.maximumWidth: 400
                            // SplitView.maximumHeight: 400
                            // SplitView.minimumHeight: header_extra.visible?header_extra.height:0

                            PageRouterView{
                                id: lefttop_panne
                                anchors.fill: parent
                                router: body_lefttop_router
                                clip: true

                                Component.onCompleted: {
                                    body_lefttop_router.go(Global.displayLeftTop)
                                }

                                Connections{
                                    target:Global
                                    function onDisplayLeftTopChanged(){
                                        body_lefttop_router.go(Global.displayLeftTop)
                                    }
                                }
                            }
                        }

                        //页面左侧框架下部
                        Item {
                            clip: true
                            visible:Global.visable_left_bottom_side
                            // SplitView.minimumWidth: 50
                            // SplitView.minimumHeight: 50
                            SplitView.fillWidth: true
                            SplitView.fillHeight: true

                            PageRouterView{
                                id: leftbottom_panne
                                anchors.fill: parent
                                router: body_leftbottom_router
                                clip: true

                                Component.onCompleted: {
                                    body_leftbottom_router.go(Global.displayLeftBottom)
                                }

                                Connections{
                                    target:Global
                                    function onDisplayLeftBottomChanged(){
                                        body_leftbottom_router.go(Global.displayLeftBottom)
                                    }
                                }
                            }
                        }
                    }
                }
                Item {
                    clip: true
                    visible:Global.visable_mid_side
                    // SplitView.minimumWidth: 50
                    // SplitView.minimumHeight: 50
                    SplitView.fillWidth: true
                    SplitView.fillHeight: true
                    SplitView {
                        id:split_layout2
                        anchors.fill: parent
                        anchors.topMargin: header_extra.visible?header_extra.height:0
                        orientation: Qt.Vertical

                        //页面中间框架上部
                        Item {
                            clip: true
                            visible:Global.visable_mid_top_side
                            implicitWidth:500
                            implicitHeight: 400
                            SplitView.fillWidth: true
                            SplitView.fillHeight: true
                            // SplitView.maximumWidth: 400
                            // SplitView.maximumHeight: 400
                            // SplitView.minimumHeight: header_extra.visible?header_extra.height:0


                            Item{
                                anchors.fill: parent

                                Component{
                                    id:com_page
                                    PageRouterView{
                                        id: midtop_panne
                                        anchors.fill: parent
                                        // anchors.topMargin: header_extra.visible?header_extra.height:0
                                        router: body_midtop_router
                                        clip: true

                                        Component.onCompleted: {
                                            body_midtop_router.go(Global.displayMidTop)
                                        }

                                        Connections{
                                            target:Global
                                            function onDisplayMidTopChanged(){
                                                body_midtop_router.go(Global.displayMidTop)
                                            }
                                        }
                                    }
                                }


                                Component.onCompleted: {
                                    //创建一个新窗格，查找指定的key的信息
                                    for (var j = 0; j < body_midtop_info_model.count; j++) {
                                        let item = body_midtop_info_model.get(j)
                                        console.log(item.key)
                                        if(Global.displayMidTop===item.key)
                                        {
                                            //不存在，创建一个新的auto_loader页面，页面指向这个页面，添加到tab中
                                            tab_view.appendTab(item.key,item.icon,item.title,com_page)
                                            tab_view.tab_nav.currentIndex=tab_view.tab_model.count-1;
                                            return
                                        }
                                    }

                                    throw new Error(`updateTabView '${Global.displayMidTop}' not found!`);
                                }

                                Frame{
                                    anchors.fill: parent
                                    TabViewEx{
                                        id:tab_view
                                        tab_nav.height: 25
                                        addButtonVisibility:false
                                        tabWidthBehavior:TabViewType.SizeToContent
                                        closeButtonVisibility:TabViewType.OnHover

                                        onTab_nav_clicked:(index) => {
                                            let item=tab_view.tab_model.get(index)
                                            Global.displayMidTop=item.key
                                        }
                                    }
                                }

                                Connections{
                                    target:Global
                                    function onDisplayMidTopChanged(){
                                        //从tab_view中查找是否已经存在该页面
                                        for(var i=0;i<tab_view.tab_model.count;i++)
                                        {
                                            let item=tab_view.tab_model.get(i)
                                            console.log("find exist "+Global.displayMidTop+" result "+item.key)
                                            if(Global.displayMidTop===item.key)
                                            {
                                                //存在，页面切换到页面的current_index
                                                console.log(i)
                                                tab_view.tab_nav.currentIndex=i;
                                                return
                                            }
                                        }

                                        //不存在，创建一个新窗格，查找指定的key的信息
                                        for (var j = 0; j < body_midtop_info_model.count; j++) {
                                            let item = body_midtop_info_model.get(j)
                                            console.log(item.key)
                                            if(Global.displayMidTop===item.key)
                                            {
                                                //不存在，创建一个新的auto_loader页面，页面指向这个页面，添加到tab中
                                                tab_view.appendTab(item.key,item.icon,item.title,com_page)
                                                tab_view.tab_nav.currentIndex=tab_view.tab_model.count-1;
                                                return
                                            }
                                        }

                                        throw new Error(`updateTabView '${Global.displayMidTop}' not found!`);
                                    }
                                }

                            }


                            // PageRouterView{
                            //     id: midtop_panne
                            //     anchors.fill: parent
                            //     // anchors.topMargin: header_extra.visible?header_extra.height:0
                            //     router: body_midtop_router
                            //     clip: true

                            //     Component.onCompleted: {
                            //         body_midtop_router.go(Global.displayMidTop)
                            //     }

                            //     Connections{
                            //         target:Global
                            //         function onDisplayMidTopChanged(){
                            //             body_midtop_router.go(Global.displayMidTop)
                            //         }
                            //     }

                            // }




                        }

                        //页面中间框架下部
                        Item {
                            clip: true
                            visible:Global.visable_mid_bottom_side
                            implicitWidth: parent.width
                            implicitHeight: parent.height*0.25

                            PageRouterView{
                                id: midbottom_panne
                                anchors.fill: parent
                                router: body_midbottom_router
                                clip: true

                                Component.onCompleted: {
                                    body_midbottom_router.go(Global.displayMidBottom)
                                }

                                Connections{
                                    target:Global
                                    function onDisplayMidBottomChanged(){
                                        body_midbottom_router.go(Global.displayMidBottom)
                                    }
                                }
                            }
                        }
                    }
                }
                Item {
                    clip: true
                    visible:Global.visable_right_side
                    implicitWidth: body.width*0.2
                    implicitHeight: body.height
                    SplitView {
                        id:split_layout3
                        anchors.fill: parent
                        anchors.topMargin: header_extra.visible?header_extra.height:0
                        orientation: Qt.Vertical

                        //页面右侧框架上部
                        Item {
                            clip: true
                            visible:Global.visable_right_top_side
                            implicitWidth: parent.width
                            implicitHeight: parent.height*0.55
                            // SplitView.maximumWidth: 400
                            // SplitView.maximumHeight: 400
                            // SplitView.minimumWidth: 50
                            //SplitView.minimumHeight: header_extra.visible?header_extra.height:0

                            PageRouterView{
                                id: righttop_panne
                                anchors.fill: parent
                                //anchors.topMargin: header_extra.visible?header_extra.height:0
                                router: body_righttop_router
                                clip: true
                                Component.onCompleted: {
                                    body_righttop_router.go(Global.displayRightTop)
                                }

                                Connections{
                                    target:Global
                                    function onDisplayRightTopChanged(){
                                        body_righttop_router.go(Global.displayRightTop)
                                    }
                                }
                            }
                        }

                        //页面右侧框架下部
                        Item {
                            clip: true
                            visible:Global.visable_right_bottom_side
                            // SplitView.minimumWidth: 50
                            // SplitView.minimumHeight: 50
                            SplitView.fillWidth: true
                            SplitView.fillHeight: true

                            PageRouterView{
                                id: rightbottom_panne
                                anchors.fill: parent
                                router: body_rightbottom_router
                                clip: true

                                Component.onCompleted: {
                                    body_rightbottom_router.go(Global.displayRightBottom)
                                }

                                Connections{
                                    target:Global
                                    function onDisplayRightBottomChanged(){
                                        body_rightbottom_router.go(Global.displayRightBottom)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        //顶部功能栏
        Item{
            id:header_extra
            visible:Global.visable_header_extra

            width:parent.width-10
            height:100

            anchors{
                top:header.bottom
                topMargin:1
                horizontalCenter:parent.horizontalCenter
            }

            PageRouterView{
                id: navbar_panne
                anchors.fill: parent
                router: navbar_router
                clip: true
            }

        }

        //页面底部状态栏
        Item{
            id:footer

            anchors{
                bottom:parent.bottom
            }
            width:parent.width
            height:25

            Menu {
                id:footer_menu
                width:180

                MenuItem{
                    icon.name: FluentIcons.graph_GlobalNavButton
                    text:Global.visable_header_extra?qsTr("Hide Top Bar"): qsTr("Show Top Bar")

                    onTriggered:{
                        Global.visable_header_extra=!Global.visable_header_extra
                    }
                }

                MenuItem{
                    icon.name:Global.visable_header?FluentIcons.graph_CheckMark:FluentIcons.graph_CheckboxIndeterminate
                    text:qsTr("Show Menu Bar")

                    onTriggered:{
                        Global.visable_header=!Global.visable_header

                        if(Global.visable_header==false)
                        {
                            Global.visable_header_extra=false
                        }
                    }
                }

                MenuSeparator { }

                MenuItem{
                    icon.name: FluentIcons.graph_ResizeMouseTall
                    text:Global.visable_left_side?qsTr("Hide Left Sidebar"): qsTr("Show Left Sidebar")

                    onTriggered:{
                        Global.visable_left_side=!Global.visable_left_side
                    }
                }
                MenuItem{
                    icon.name:  FluentIcons.graph_ResizeMouseTall
                    text: Global.visable_right_side?qsTr("Hide Right Sidebar"): qsTr("Show Right Sidebar")

                    onTriggered:{
                        Global.visable_right_side=!Global.visable_right_side
                    }
                }

                MenuItem{
                    icon.name:  FluentIcons.graph_ResizeMouseWide
                    text: Global.visable_mid_bottom_side?qsTr("Hide Bottom Bar"): qsTr("Show Bottom Bar")

                    onTriggered:{
                        Global.visable_mid_bottom_side=!Global.visable_mid_bottom_side
                    }
                }

                MenuSeparator { }


                MenuItem{
                    icon.name:  FluentIcons.graph_Settings
                    text:qsTr("Settings")
                    onTriggered:{
                    }
                }

                MenuItem{
                    icon.name:  FluentIcons.graph_Info
                    text:qsTr("About")
                    onTriggered:{
                    }
                }

                MenuSeparator { }
                MenuItem{
                    icon.name:  FluentIcons.graph_More
                    text:qsTr("More")
                    onTriggered:{
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton  // 仅接受右键点击

                onPressed: (mouse) => {
                               if (mouse.button === Qt.RightButton) {
                                   // 显示菜单，并设置菜单显示位置为鼠标点击的位置
                                   footer_menu.open();
                                   footer_menu.x = mouse.x;
                                   footer_menu.y = mouse.y;
                               }
                           }
            }


            // 左侧按钮，从左到右排列
            RowLayout {
                id:foot_bar_left

                anchors
                {
                    left:parent.left
                    leftMargin:0
                    verticalCenter: parent.verticalCenter
                }

                Layout.fillWidth: true  // 左侧区域填充可用空间
                spacing: 0

                IconButton{
                    text: "Fold"
                    icon.name: FluentIcons.graph_ResizeMouseTall
                    icon.width: 18
                    icon.height: 18
                    spacing: 5
                    display: IconButton.IconOnly
                    icon.color:"Grey"


                    property bool pre_left_top_visible
                    property bool pre_left_bottom_visible

                    Component.onCompleted:
                    {
                        pre_left_top_visible=Global.visable_left_top_side
                        pre_left_bottom_visible==Global.visable_left_bottom_side
                    }

                    onClicked:{
                        Global.visable_left_side=!Global.visable_left_side
                        if(Global.visable_left_side)
                        {
                            if(!Global.visable_left_top_side && !Global.visable_left_bottom_side)
                            {
                                Global.visable_left_top_side=pre_left_top_visible;
                                Global.visable_left_bottom_side=pre_left_bottom_visible;
                            }
                        }
                        else
                        {
                            pre_left_top_visible=Global.visable_left_top_side
                            pre_left_bottom_visible=Global.visable_left_bottom_side
                            Global.visable_left_top_side=false
                            Global.visable_left_bottom_side=false
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.RightButton  // 仅接受右键点击

                        onPressed: (mouse) => {
                                       if (mouse.button === Qt.RightButton) {
                                           // 显示菜单，并设置菜单显示位置为鼠标点击的位置
                                           footer_left_menu.open();
                                           footer_left_menu.x = mouse.x;
                                           footer_left_menu.y = mouse.y;
                                       }
                                   }
                    }

                    Menu {
                        id:footer_left_menu
                        width:180

                        MenuItem{
                            icon.name:Global.visable_left_top_side?FluentIcons.graph_CheckMark:FluentIcons.graph_CheckboxIndeterminate
                            text:qsTr("Show Left Top Bar")

                            onTriggered:{
                                Global.visable_left_top_side=!Global.visable_left_top_side
                                Global.update_visable()
                            }
                        }
                        MenuItem{
                            icon.name:Global.visable_left_bottom_side?FluentIcons.graph_CheckMark:FluentIcons.graph_CheckboxIndeterminate
                            text:qsTr("Show Left Bottom Bar")

                            onTriggered:{
                                Global.visable_left_bottom_side=!Global.visable_left_bottom_side
                                Global.update_visable()
                            }
                        }
                    }
                }
            }


            // 右侧按钮，从右向左排列
            RowLayout {
                id:foot_bar_right

                anchors
                {
                    left:parent.left
                    leftMargin:0
                    verticalCenter: parent.verticalCenter
                }

                spacing: 0

                // 设置 LayoutMirroring 使其从右向左排列
                LayoutMirroring.enabled: true
                LayoutMirroring.childrenInherit: true
                IconButton{
                    text: "Fold"
                    icon.name: FluentIcons.graph_ResizeMouseTall
                    icon.width: 18
                    icon.height: 18
                    spacing: 5
                    display: IconButton.IconOnly
                    rotation:180
                    icon.color:"Grey"

                    property bool pre_right_top_visible
                    property bool pre_right_bottom_visible

                    Component.onCompleted:
                    {
                        pre_right_top_visible=Global.visable_right_top_side
                        pre_right_bottom_visible==Global.visable_right_bottom_side
                    }

                    onClicked:{
                        Global.visable_right_side=!Global.visable_right_side
                        if(Global.visable_right_side)
                        {
                            if(!Global.visable_right_top_side && !Global.visable_right_bottom_side)
                            {
                                Global.visable_right_top_side=pre_right_top_visible;
                                Global.visable_right_bottom_side=pre_right_bottom_visible;
                            }
                        }
                        else
                        {
                            pre_right_top_visible=Global.visable_right_top_side
                            pre_right_bottom_visible=Global.visable_right_bottom_side
                            Global.visable_right_top_side=false
                            Global.visable_right_bottom_side=false
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.RightButton  // 仅接受右键点击

                        onPressed: (mouse) => {
                                       if (mouse.button === Qt.RightButton) {
                                           // 显示菜单，并设置菜单显示位置为鼠标点击的位置
                                           footer_right_menu.open();
                                           footer_right_menu.x = mouse.x;
                                           footer_right_menu.y = mouse.y;
                                       }
                                   }
                    }

                    Menu {
                        id:footer_right_menu
                        width:180

                        MenuItem{
                            icon.name:Global.visable_right_top_side?FluentIcons.graph_CheckMark:FluentIcons.graph_CheckboxIndeterminate
                            text:qsTr("Show Right Top Bar")

                            onTriggered:{
                                Global.visable_right_top_side=!Global.visable_right_top_side
                                Global.update_visable()
                            }
                        }
                        MenuItem{
                            icon.name:Global.visable_right_bottom_side?FluentIcons.graph_CheckMark:FluentIcons.graph_CheckboxIndeterminate
                            text:qsTr("Show Right Bottom Bar")

                            onTriggered:{
                                Global.visable_right_bottom_side=!Global.visable_right_bottom_side
                                Global.update_visable()
                            }
                        }
                    }
                }

                IconButton{
                    text: "Fold"
                    icon.name: FluentIcons.graph_ResizeMouseWide
                    icon.width: 18
                    icon.height: 18
                    spacing: 5
                    display: IconButton.IconOnly
                    icon.color:"Grey"

                    onClicked:{
                        Global.visable_mid_bottom_side=!Global.visable_mid_bottom_side
                        if(Global.visable_mid_side)
                        {
                            if(!Global.visable_mid_top_side)
                            {
                                Global.visable_mid_top_side=true;
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.RightButton  // 仅接受右键点击

                        onPressed: (mouse) => {
                                       if (mouse.button === Qt.RightButton) {
                                           // 显示菜单，并设置菜单显示位置为鼠标点击的位置
                                           footer_mid_menu.open();
                                           footer_mid_menu.x = mouse.x;
                                           footer_mid_menu.y = mouse.y;
                                       }
                                   }
                    }

                    Menu {
                        id:footer_mid_menu
                        width:180

                        MenuItem{
                            icon.name:Global.visable_mid_top_side?FluentIcons.graph_CheckMark:FluentIcons.graph_CheckboxIndeterminate
                            text:qsTr("Show Mid Top Bar")

                            onTriggered:{
                                Global.visable_mid_top_side=!Global.visable_mid_top_side
                                Global.update_visable()
                            }
                        }
                        MenuItem{
                            icon.name:Global.visable_mid_bottom_side?FluentIcons.graph_CheckMark:FluentIcons.graph_CheckboxIndeterminate
                            text:qsTr("Show Mid Bottom Bar")

                            onTriggered:{
                                Global.visable_mid_bottom_side=!Global.visable_mid_bottom_side
                                Global.update_visable()
                            }
                        }
                    }

                }
            }

        }
    }


    Expander{
        id: project_info

        implicitWidth: 300

        anchors{
            // top:parent.top
            left:top_bar_left.right
        }

        leading: Label{
            text:  "未保存"
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
        header: Label{
            text: "测试工程0101.cps"
            verticalAlignment: Qt.AlignVCenter
        }
        content: Frame{

            height: 300
            Button{
                anchors.fill:parent
            }
        }
    }



}
