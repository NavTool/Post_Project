import QtQuick
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Controls
import Qt.labs.folderlistmodel 2.15
import FluentUI.Controls
import FluentUI.impl
import NavTool

/*
    导入卫导观测文件的一组对话框
    输入：
        填充观测文件、星历、归属站点（站点属性）

    输出（调用接口）
    调用：
        针对每一个文件
        1、如果是新建的站点，调用添加测站接口（站点名称，站点类型）
        2、调用解析观测文件接口，创建一个解析任务，放入任务队列（观测文件、星历文件、观测文件格式、星历文件格式
*/


Item{

    id:root

    property string title
    property PageContext context

    Component.onCompleted: {
        fileDialog.open()
        //contentDialog.open()
    }

    //选择观测文件的dialog 选中之后会添加到指定数据集中
    FileDialog {
        id: fileDialog
        title: "选择文件"
        fileMode: FileDialog.OpenFiles

        nameFilters: [
            "All files (*.*)",
            "Rinex files (*.*O *.obs)",
            "ComNavBinary files (*.cnb)",
            "RTCM3 files (*.rtcm3)"
        ]

        onAccepted: {
            for(let i=0;i<selectedFiles.length;i++)
            {
                dataModel.add_obs_item(selectedFiles[i].toString())
            }
            contentDialog.open()
        }
    }

    //导入文件配置的Dialog  用来配置导入文件的详细选项
    Dialog {
        id: contentDialog
        x: Math.ceil((parent.width - width) / 2)
        y: Math.ceil((parent.height - height) / 2)
        width: 1000//Math.ceil(parent.width / 2)
        // contentHeight: 400
        parent: Overlay.overlay
        modal: true
        title: qsTr("观测文件导入配置")
        standardButtons: Dialog.Ok | Dialog.Cancel

        Column{
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Row{
                Label{
                    text: qsTr("导入文件管理")
                }
            }
            Row{
                Label{
                    text: qsTr("请检查和配置文件的类型、归属站点、以及需要配置使用星历！")
                }
            }
            Row{
                Frame{
                    width:950
                    height: 300

                    Component{
                        id: comp_column_frozen
                        Item{
                            Label{
                                anchors.fill: parent
                                text: columnModel.title
                                verticalAlignment: Qt.AlignVCenter
                                leftPadding: 10
                                rightPadding: 10
                                elide: Label.ElideRight
                            }
                            IconButton{
                                id: btn_pinned
                                icon.name: FluentIcons.graph_Pinned
                                icon.width: 12
                                icon.height: 12
                                width: 24
                                height: 24
                                icon.color: columnModel.frozen ? Theme.primaryColor : btn_pinned.FluentUI.textColor
                                anchors.right: parent.right
                                onClicked: {
                                    columnModel.frozen = !columnModel.frozen
                                }
                            }
                        }
                    }

                    Component{
                        id: comp_row_file_format
                        ComboBox{
                            width:100
                            height:30

                            model: ListModel {
                                id: station_model
                                ListElement {text: qsTr("Rinex") ; def:DefFileFormat.RINEX }
                                ListElement {text: qsTr("RTCM3"); def:DefFileFormat.RTCM3 }
                                ListElement {text: qsTr("CNB"); def:DefFileFormat.CNB }
                            }
                            // editable: true
                            textRole: "text"
                            currentIndex: 0
                            Component.onCompleted: {
                                //初始化，判断文件的形式
                                for(let i=0;i<model.count;i++)
                                {
                                    if(rowModel[columnModel.dataIndex]==model.get(i).def)
                                    {
                                        currentIndex=i;
                                        break;
                                    }
                                }
                            }
                            onCurrentIndexChanged: {
                                console.log(currentIndex,model.get(currentIndex).text,model.get(currentIndex).def)
                                rowModel[columnModel.dataIndex]=model.get(currentIndex).def
                            }
                        }
                    }

                    Component{
                        id: comp_row_station_name

                        ComboBox{

                            width:150
                            height:30
                            model: ListModel {
                                id: model
                                ListElement { text: "station1" ; def:DefStationType.Static ;newstation:false}
                                ListElement { text: "station2" ; def:DefStationType.Static ;newstation:false}
                            }
                            textRole: "text"
                            editable: true
                            Component.onCompleted: {

                                //载入所有基站，
                                //添加当前基站信息


                                editText = display
                                this.contentItem.forceActiveFocus()
                                this.contentItem.selectAll()
                            }
                            onActiveFocusChanged: {
                                if(!activeFocus){
                                    dataGrid.closeEditor()
                                }
                            }
                            Keys.onEnterPressed: {
                                changeDisplay()
                            }
                            Keys.onReturnPressed: {
                                changeDisplay()
                            }
                            function changeDisplay(){
                                rowModel[columnModel.dataIndex] = editText
                                dataGrid.closeEditor()
                            }
                        }
                    }

                    Component{
                        id: comp_row_station_type
                        ComboBox{
                            width:80
                            height:30

                            model: ListModel {
                                id: model
                                ListElement { def:DefStationType.Static; text: qsTr("静态") }
                                ListElement { def:DefStationType.Dynamic;text: qsTr("动态") }
                            }
                            // editable: true
                            textRole: "text"
                            currentIndex: 0
                            Component.onCompleted: {
                                //初始化，判断文件的形式
                                for(let i=0;i<model.count;i++)
                                {
                                    if(rowModel[columnModel.dataIndex]==model.get(i).def)
                                    {
                                        currentIndex=i;
                                        break;
                                    }
                                }
                            }
                            onCurrentIndexChanged: {
                                // console.log(columnModel.dataIndex,model.get(currentIndex).text,model.get(currentIndex).def)
                                rowModel[columnModel.dataIndex]=model.get(currentIndex).def
                                console.log("update value:",columnModel.index,columnModel.dataIndex,model.get(currentIndex).text,model.get(currentIndex).def)
                            }
                        }
                    }

                    Component{
                        id: comp_row_eph_name

                        Item {
                            Row{
                                ComboBox{
                                    id:combox
                                    property var model_eph_file:display
                                    implicitWidth:200
                                    implicitHeight:28
                                    model: eph_model
                                    // editable: true
                                    currentIndex: 0
                                    textRole: "eph_name"
                                    Component.onCompleted: {
                                        //获取全局星历，添加到eph_model
                                        //获取当前星历,添加到eph_model
                                        eph_model.insert(0,{eph_name:rowModel.eph_name,eph_path:rowModel.eph_path})
                                    }

                                    onCurrentIndexChanged: {
                                        rowModel.eph_name=model.get(currentIndex).eph_name
                                        rowModel.eph_path=model.get(currentIndex).eph_path
                                    }
                                }
                                Button{
                                    width: 28
                                    height: 28
                                    icon.name: FluentIcons.graph_More
                                    icon.height: 20
                                    onClicked: {
                                        ephDialog.open()
                                    }
                                }

                                ListModel {
                                    id: eph_model
                                    // ListElement { text: qsTr("XXXXXXXXXXX.24P") }
                                    // ListElement { text: qsTr("动态") }
                                }

                                FileDialog {
                                    id: ephDialog
                                    title: "选择文件"
                                    fileMode: FileDialog.OpenFile

                                    nameFilters: [
                                        "All files (*.*)",
                                        "Rinex files (*.*P *.nav)",
                                        "ComNavBinary files (*.cnb)",
                                        "RTCM3 files (*.rtcm3)"
                                    ]

                                    onAccepted: {
                                        var ephpath= toAbsolutePath(selectedFile.toString())
                                        var ephname= ephpath.split('/').pop()
                                        eph_model.insert(0,{eph_name:ephname,eph_path:ephpath})
                                        rowModel.eph_name=ephpath
                                        rowModel.eph_path=ephname
                                    }
                                }

                            }
                        }
                    }

                    DataGridEx{
                        id: dataGrid
                        anchors{
                            fill:parent
                            margins: 5
                        }
                        defaultHeight: 30
                        defaultminimumHeight:25
                        defaultmaximumHeight:240
                        horizonalHeaderHeight:30

                        sourceModel: dataModel
                        onRowClicked:(model)=>{
                                         console.debug("Choose Item:",safeStringify(model))

                                     }
                        onRowRightClicked:(model)=>{
                                              console.debug(model.file_name)
                                              // Global.displayPropertyPage="/sidepage/property/blank"
                                          }
                        columnSourceModel: ListModel{
                            ListElement{
                                title: qsTr("导入文件名")
                                dataIndex: "file_name"
                                width: 200
                                frozen: true
                                delegate: function(){return comp_column_frozen} //列名的样式
                                //rowDelegate：                                 //列的样式
                                //editDelegate：                                //编辑的样式
                            }
                            ListElement{
                                title: qsTr("文件格式")
                                dataIndex: "file_format"
                                rowDelegate: function(){return comp_row_file_format}
                                width: 100
                            }
                            ListElement{
                                title: qsTr("选择归属站点")
                                dataIndex: "station_name"
                                rowDelegate: function(){return comp_row_station_name}
                                width: 150
                            }
                            ListElement{
                                title: qsTr("站点类型")
                                dataIndex: "station_type"
                                rowDelegate: function(){return comp_row_station_type}
                                width:80
                            }
                            ListElement{
                                title: qsTr("使用星历")
                                dataIndex: "eph_name"
                                width: 230
                                // frozen: true
                                rowDelegate: function(){return comp_row_eph_name}
                            }
                            ListElement{
                                title: qsTr("星历格式")
                                dataIndex: "eph_format"
                                width: 100
                                // frozen: true
                                rowDelegate: function(){return comp_row_file_format}
                            }
                            ListElement{
                                title: qsTr("观测文件路径")
                                dataIndex: "file_path"
                                width: 400
                            }
                            ListElement{
                                title: qsTr("星历文件路径")
                                dataIndex: "eph_path"
                                // rowDelegate: function(){return comp_row_eph_path}
                                width: 400
                            }
                        }
                    }
                }
            }

            Row{
                Frame{
                    width:700
                    height: 30
                    Row{
                        Button{
                            text:qsTr("重置修改")
                        }

                        Button{
                            text:qsTr("继续添加文件")

                            onClicked: {
                                fileDialog.open()
                            }
                        }
                        Button{
                            text:qsTr("移除所有文件")
                        }
                        Button{
                            text:qsTr("移除选中文件")
                        }
                    }
                }
            }
        }
    }
    DataGridModel{
        id: dataModel

        function add_obs_item(filepath){

            var file_name=""                                    //文件名称
            var eph_name;                                        //星历名称
            var station_name;                                   //站点名称
            var file_format=DefFileFormat.UNKNOWN                //文件格式
            var eph_format=DefFileFormat.UNKNOWN                //星历类型
            var station_type=DefStationType.Static                 //站点类型
            var file_path=""                                    //文件路径
            var eph_path="";                                     //星历路径

            file_path=toAbsolutePath(filepath)
            file_name=filepath.split('/').pop()
            station_name=file_name.replace(/\.[^/]+$/, '') // 去除扩展名

            //判断文件类型，如果是Rinex，则需要生成对应的OBS文件
            let regex1 = /\.\d+o$/i; // 匹配 .数字O 或 .数字o// i 表示忽略大小写
            let regex2 = /\.obs$/i; // 匹配 .obs 或 .OBS
            let regex3 = /\.rtcm3$/i; // 匹配 .rtcm3
            let regex4 = /\.cnb$/i; // 匹配 .cnb

            if(regex1.test(filepath))
            {
                eph_path=file_path.replace(/(\.\d+)o$/i, "$1p")
                file_format=DefFileFormat.RINEX
                eph_format=DefFileFormat.RINEX

            }
            else if(regex2.test(filepath))
            {
                eph_path=file_path.replace(/\.obs$/i, ".nav");
                file_format=DefFileFormat.RINEX
                eph_format=DefFileFormat.RINEX
            }
            else if(regex3.test(filepath))
            {
                eph_path=file_path
                file_format=DefFileFormat.RTCM3
                eph_format=DefFileFormat.RTCM3
            }
            else if(regex4.test(filepath))
            {
                eph_path=file_path
                file_format=DefFileFormat.CNB
                eph_format=DefFileFormat.CNB
            }

            eph_name=eph_path.split('/').pop()


            //判断星历文件是否存在
            // let localUrl = Qt.resolvedUrl(eph_path);
            // if (File.exists(localUrl)) {
            //     console.log("Set Nav File:", ephpath);
            // }
            // else
            // {
            //     console.log("Nav File not exists:", ephpath);
            //     ephpath=""
            // }

            var item={
                file_name: file_name,
                file_format:file_format,
                station_name:station_name,
                station_type: station_type,
                eph_name:eph_name,
                eph_format:eph_format,
                file_path: file_path,
                eph_path: eph_path
            }

            console.log("Add ObsFile:\n",JSON.stringify(item, null, 2));

            dataModel.addUniqueItem(item)
        }

        // //已经存在的站点
        // DataGridModel{
        //     id: exist_station

        // }

        // //已经添加的全局星历
        // DataGridModel{
        //     id: exist_eph
        // }



        // 检查是否重复的方法
        function isDuplicate(newItem) {
            for (let i = 0; i < dataModel.count; i++) {
                if (dataModel.get(i).file_name === newItem.file_name) {
                    return true; // 找到重复项
                }
            }
            return false; // 没有找到重复项
        }

        // 添加元素的方法
        function addUniqueItem(newItem) {
            if (!isDuplicate(newItem)) {
                dataModel.append(newItem);
            } else {
                console.log("Item is duplicate:", newItem.file_name);
            }
        }
    }



    function toAbsolutePath(fileUrl) {
        var path = fileUrl;

        // Remove the "file://" prefix
        if (fileUrl.startsWith("file://")) {
            path = fileUrl.replace("file://", "");

            // Windows-specific adjustment
            if (Qt.platform.os === "windows") {
                // On Windows, paths after "file://" may start with a drive letter (e.g., "C:/")
                // In this case, an additional slash might be present (e.g., "file:///C:/path")
                if (path.length > 3 && path.charAt(2) === ':') {
                    path = path.substring(1); // Remove the leading slash before "C:/"
                }
            }
        }
        return path;
    }

    function safeStringify(obj, space = 2) {
        const seen = new WeakSet();

        return JSON.stringify(obj, (key, value) => {
                                  if (typeof value === 'object' && value !== null) {
                                      // 检查循环引用
                                      if (seen.has(value)) {
                                          return; // 返回 undefined 会跳过该属性
                                      }
                                      seen.add(value);
                                  }
                                  return value;
                              }, space);
    }

}
