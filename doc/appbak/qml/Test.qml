import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels

import FluentUI 1.0

import frame

// import Extra 1.0

import "global"
import "component"
import "extra"


FluScrollablePage {

    id:root

    title: qsTr("TabView Example")




    FluFrame{

        Layout.fillWidth: true
        Layout.preferredHeight: 500
        padding: 10


        visible: true
        width: 600
        height: 400
        // title: "Serial Port Tool"



        Flickable {
            width: 200
            height: 300

            contentHeight: myContent.height

            Rectangle {
                id: myContent
                width: 200
                height: dynamicHeight
                color: "lightblue"

                property int dynamicHeight: 300

                Button {
                    text: "Increase Height"
                    onClicked: {
                       myContent.dynamicHeight += 50
                        console.log("Content Height Changed:", contentHeight)
                    }
                }
            }



            onContentHeightChanged: {
                console.log("Content Height Changed:", contentHeight)

                contentY =myContent.height-300
            }
        }




    }




    FluFrame{

        Layout.fillWidth: true
        Layout.preferredHeight: 500
        padding: 10


        visible: true
        width: 600
        height: 400
        // title: "Serial Port Tool"

        Column{



            Row{

                ComboBox {
                    id: portSelector
                    width: 200
                    textRole: "Port Name"
                    // 将可用的串口设备列表填充到这里
                }

                ComboBox {
                    id: baudRateSelector
                    width: 200
                    model: ["9600", "19200", "38400", "57600", "115200"]
                    currentIndex: 4 // 默认选择115200
                }

                Button {
                    id: connectButton
                    text: "Connect"
                    onClicked: {
                        // 调用C++方法连接到串口
                    }
                }
            }

            TextArea {
                id: receiveArea
                width: 580
                height: 200
                readOnly: true
                placeholderText: "Received data will appear here"
            }

            TextField {
                id: sendField
                width: 480
                placeholderText: "Enter data to send"
            }

            Button {
                id: sendButton
                text: "Send"
                onClicked: {
                    // 调用C++方法发送数据
                }
            }
        }
    }



    FluFrame{
        Layout.fillWidth: true
        // Layout.preferredHeight: 136
        padding: 10


        id:option_diolag


        Component.onCompleted: {
            // get_rtkdll_option()
        }

        Column{
            width:parent.width

            spacing: 10

            FluText{
                text: qsTr("添加/修改参数")
            }

            Row{

                FluTextBox{
                    id:input_opt_name
                    placeholderText: qsTr("请输入配置项")
                }


                FluTextBox{
                    id:input_opt_value
                    placeholderText: qsTr("请输入参数")
                }

                Item {
                    width: 90
                    height: 30
                    FluButton{
                        anchors.centerIn: parent
                        text: qsTr("添加配置")

                        onClicked: {

                            var row_item={
                                option_name: input_opt_name.text,
                                option_value: input_opt_value.text,
                                option_enable: true,
                                delete_option: false
                            }
                            for(var i=0;i<option_model.rowCount;i++)
                            {
                                if(input_opt_name.text==option_model.getRow(i).option_name)
                                {
                                    option_model.setRow(i,row_item)
                                    showInfo(qsTr("已存在该配置，更新配置值并启用配置！"))
                                    return;
                                }
                            }
                            option_model.appendRow(row_item)
                            showSuccess(qsTr("配置添加成功"))
                        }
                    }
                }

                Item {
                    width: 80
                    height: 30
                    FluButton{
                        anchors.centerIn: parent
                        text: qsTr("保存配置")

                        onClicked: {
                            showSuccess(qsTr("配置保存成功"))
                        }


                    }
                }

            }
            Row{

                spacing: 30

                FluText{
                    anchors.verticalCenter:parent.verticalCenter
                    width: 220
                    text: qsTr("配置项")
                }

                FluText{
                    anchors.verticalCenter:parent.verticalCenter
                    width: 200
                    text: qsTr("参数")
                }

                FluText{
                    anchors.verticalCenter:parent.verticalCenter
                    text: qsTr("禁用/启用")
                }

                FluText{
                    anchors.verticalCenter:parent.verticalCenter
                    text: qsTr("删除")
                }

                FluIconButton{
                    anchors.verticalCenter:parent.verticalCenter
                    iconSource: FluentIcons.Refresh
                    iconSize: 12

                    onClicked: {
                        option_diolag.get_rtkdll_option()

                    }
                }

            }

            Rectangle{

                width: parent.width
                height: 250


                ScrollView {
                    id:scrollview

                    // visible: false

                    anchors.fill: parent
                    anchors.rightMargin: 5
                    TableView {
                        id: tableView
                        clip: true
                        interactive: true
                        rowSpacing: 2
                        columnSpacing: 10

                        columnWidthProvider:function (column) {
                            if (column === 0) {
                                return 240; // 第一列宽度
                            } else if (column === 1) {
                                return 240; // 第二列宽度
                            } else {
                                return 50; // 其他列宽度
                            }
                        }

                        model:option_model

                        selectionModel: ItemSelectionModel {}
                        delegate:DelegateChooser {
                            DelegateChoice {
                                column: 0
                                delegate: FluTextBox {
                                    text: model.display
                                    implicitWidth: 240
                                    onAccepted: model.display = option_name
                                    disabled:true
                                }
                            }
                            DelegateChoice {
                                column: 1
                                delegate: FluTextBox {
                                    text: model.display
                                    implicitWidth: 240
                                    onAccepted: model.display = option_value

                                }
                            }
                            DelegateChoice {
                                column: 2
                                delegate: FluToggleSwitch {
                                    checked: model.display
                                    onToggled: model.display = checked
                                }
                            }
                            DelegateChoice {
                                column: 3
                                delegate:FluButton {
                                    text: qsTr("删除")
                                    // checked: model.display
                                    // onToggled: model.display = checked
                                    onClicked: {
                                        // showInfo(model.row)
                                        option_model.removeRow(model.row)
                                        showInfo(qsTr("配置项已删除"))
                                    }
                                }
                            }
                        }
                    }
                }

                TableModel {
                    id:option_model

                    TableModelColumn { display: "option_name" }
                    TableModelColumn { display: "option_value" }
                    TableModelColumn { display: "option_enable" }
                    TableModelColumn { display: "delete_option" }
                    rows: [
                        // {
                        //     option_name: 0,
                        //     option_value: 0,
                        //     option_enable: false,
                        //     delete_option: false
                        // }
                    ]
                }
            }

        }


        //两个函数
        //从C++读取参数到QML
        function get_rtkdll_option()
        {
            //将数据填充到option_model

            //获取一个json字符串

            option_model.clear()

            for(var i=1;i<10;i++)
            {
                var row_item={
                    option_name: i,
                    option_value: i,
                    option_enable: false,
                    delete_option: false
                }


                option_model.appendRow(row_item)
            }


            //清空变量，将变量依次写入到


        }


        //将QML参数写入到C++
        function set_rtkdll_option()
        {
            //将数据填写入到c++

        }

    }



    SelectionRectangle {
        target: tableView
    }






    property int global_value:0

    property alias set_value:inner_value_test.inner_value


    Column{

        //一个组件的基本组成
        FluTextBox{
            //需要导出，链接、配置的额外附加属性
            property int result_intv


            //配置基本属性，绑定属性
            id:textbx1
            result_intv: root.global_value
            validator: RegularExpressionValidator { regularExpression: /[0-9]+/ }
            text:result_intv===0?"":result_intv

            placeholderText:"xxxxxx"

            //信号和槽//函数处理逻辑
            onTextChanged: {
                root.setglobal_value(text);
            }


            //函数部分
            function test()
            {
                return
            }


        }


        FluTextBox{
            //需要导出，链接。配置的属性
            property int result_intv

            id:textbox2

            result_intv: root.global_value
            validator: RegularExpressionValidator { regularExpression: /[0-9]+/ }
            text:result_intv===0?"":result_intv

            placeholderText:"xxxxxx"

            onTextChanged: {
                root.setglobal_value(text);
            }
        }


        FluTextBox{

            property int inner_value

            id:inner_value_test

            onTextChanged: {
                inner_value=text
            }

            onInner_valueChanged: {
                text=inner_value
            }
        }


        FluButton
        {


            onClicked: {
                set_value++
            }
        }


        TestClass{
            id:xxx

            onPersonChanged: {
                console.log(person.age);
                console.log(person.isStudent);
            }

        }

        DataClass{
            id:data

            age: 30
        }

        FluButton
        {
            onClicked: {
                console.log("xxxxx");
                console.log(xxx.age);
                xxx.age=10
                xxx.person.isStudent=!xxx.person.isStudent
            }
        }

        FluButton{
            id:err

            onClicked: {
                custom_btn_dialog.open()
            }
        }


        FluButton{
            id:err1

            onClicked: {
                showLoading()
            }
        }


        FluButton
        {
            text:  "xxxx"
            onClicked: {
                console.log("xxxxx");
                console.log(xxx.age);
                data.age+=1
                xxx.AddData(data)
                console.log(xxx.age);
                var dataage = xxx.GetData()
                console.log(dataage.ok);

                xxx.person.isStudent=!xxx.person.isStudent
            }
        }


        FluContentDialog{
            id: custom_btn_dialog
            title: qsTr("Friendly Reminder")
            message: qsTr("Data is loading, please wait...")
            negativeText: qsTr("Unload")
            contentDelegate: Component{
                Item{
                    implicitWidth: parent.width
                    implicitHeight: 80
                    FluProgressRing{
                        anchors.centerIn: parent
                    }

                    Item {
                        id: data

                        property bool check: ture
                    }

                }
            }
            onNegativeClicked: {
                showSuccess(qsTr("Click the Cancel Button"))
            }
            positiveText: qsTr("OK")
            onPositiveClickListener: function(){
                showError(qsTr("Test the InfoBar level on top of the Popup"))

                console.log(contentDelegate.data.check)
            }
        }


    }



    function setglobal_value(i)
    {
        global_value=parseInt(i,10);
    }









}
