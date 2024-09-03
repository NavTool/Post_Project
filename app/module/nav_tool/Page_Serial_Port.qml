import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

import frame

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"
import "../../qml/extra"

FluContentPage {

    property string send_buffer
    property string recv_buffer

    property string port_name
    property int baud_rate
    property int baud_stop
    property int data_bits
    property int data_parity

    id:root


    title: qsTr("串口调试工具")

    FluFrame{
        id:receive_space

        anchors{
            top:parent.top
            bottom: transfer_space.top
            left: parent.left
            right: options_space.left
        }

        ScrollView{
            anchors{
                top:parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            FluMultilineTextBox{
                id:recv_textbox
                width: parent.width
                //text:
                text:Nav_Serial_Port.recvHexString?root.toHexString(recv_buffer):recv_buffer
            }
        }
    }

    ScrollView {
        id: options_space

        width: 200
        anchors{
            top: parent.top
            bottom: transfer_space.top
            right:parent.right
        }

        Column{
            anchors{
                fill: parent
                leftMargin: 10
            }

            spacing: 10

            Row{
                spacing: 105
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("串口选择")
                }
                FluIconButton{
                    anchors.verticalCenter: parent.verticalCenter
                    iconSource: FluentIcons.Refresh
                    iconSize: 12
                    text: qsTr("刷新串口列表")

                    onClicked: {
                        root.refresh_serial_port()
                    }
                }
            }
            FluComboBox{
                id:port_name
                width:188
                disabled: nav_serial_port.isConnected
                editable: false
                model:port_name_model
                currentIndex: 0
                onAccepted: {
                    if (find(editText) === -1)
                        model.append({text: editText})
                }
                onCurrentTextChanged: {
                    root.port_name=currentText
                    showSuccess(qsTr("设置串口：")+ root.port_name)
                }
            }


            Row{
                spacing: 10
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("波特率")
                }
                FluComboBox{
                    id:baud_rate
                    anchors.verticalCenter: parent.verticalCenter

                    disabled: nav_serial_port.isConnected
                    editable: false
                    model:baud_rate_model
                    currentIndex: 7
                    onAccepted: {
                        if (find(editText) === -1)
                            model.append({text: editText})
                    }
                    onCurrentTextChanged: {
                        root.baud_rate=currentText
                        showSuccess(qsTr("设置波特率:")+ root.baud_rate)
                    }
                }
            }

            Row{
                spacing: 10
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("停止位")
                }
                FluComboBox{
                    id:stop_bits
                    anchors.verticalCenter: parent.verticalCenter
                    disabled: nav_serial_port.isConnected
                    editable: false
                    model: baud_stop_model
                    onAccepted: {
                        if (find(editText) === -1)
                            model.append({text: editText})
                    }
                    onCurrentIndexChanged: {
                        root.baud_stop=currentIndex
                        showSuccess(qsTr("设置停止位:")+ root.baud_stop)
                    }
                }
            }

            Row{
                spacing: 10
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("数据位")
                }
                FluComboBox{
                    id:data_bits
                    anchors.verticalCenter: parent.verticalCenter
                    disabled: nav_serial_port.isConnected
                    editable: false
                    model: data_bits_model
                    onAccepted: {
                        if (find(editText) === -1)
                            model.append({text: editText})
                    }
                    onCurrentIndexChanged: {
                        root.data_bits=currentIndex
                        showSuccess(qsTr("设置数据位:")+ root.data_bits)
                    }
                }
            }

            Row{
                spacing: 10
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("校验位")
                }
                FluComboBox{
                    id:data_parity
                    anchors.verticalCenter: parent.verticalCenter
                    disabled: nav_serial_port.isConnected
                    editable: false
                    model: data_parity_model
                    onAccepted: {
                        if (find(editText) === -1)
                            model.append({text: editText})
                    }
                    onCurrentIndexChanged: {
                        root.data_parity=currentIndex
                        showSuccess(qsTr("设置检验位:")+ root.data_parity)
                    }
                }
            }

            Row{
                spacing: 15
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("串口操作")
                }

                FluToggleButton{
                    id:serial_port_switch

                    width: 120
                    anchors.verticalCenter: parent.verticalCenter

                    text: qsTr("打开串口")
                    onClicked: {
                        if(checked)
                        {
                            //执行打开串口操作
                            if(root.open_serial_port())
                            {
                                //如果打开完成
                                showSuccess(qsTr("打开串口成功"))
                                text=qsTr("关闭串口")
                            }
                            else
                            {
                                showError(qsTr("打开串口失败"))
                            }
                        }
                        else
                        {
                            //执行关闭串口操作

                            if(root.close_serial_port())
                            {
                                //如果关闭完成
                                showSuccess(qsTr("关闭串口成功"))
                                text=qsTr("打开串口")
                            }
                        }
                        // showSuccess(checked)
                    }
                }
            }


            Row{
                spacing: 10
                FluButton{
                    width: 90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("保存窗口")
                }

                FluButton{
                    width: 90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("清除接收")

                    onClicked: {
                        root.recv_buffer=""
                        showInfo(qsTr("接收缓冲区已清空"))
                    }
                }
            }

            Row{
                spacing: 10

                FluCheckBox{
                    width: 90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("16进制显示")

                    onClicked: {
                      nav_serial_port.recvHexString=  checked

                        showInfo(nav_serial_port.recvHexString)
                    }
                }

                FluCheckBox{
                    width: 90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("自动保存")
                }
            }


            Row{
                spacing: 50

                FluCheckBox{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("DTR")
                }

                FluCheckBox{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("RTS")
                }
            }

            Row{
                spacing: 10

                FluCheckBox{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("时间戳")
                }

                FluTextBox{
                    width: 80
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("1000")
                }

                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("ms")
                }
            }
        }
    }


    Item {
        id: transfer_space

        height:190
        width:parent.width
        anchors{
            bottom: bottom_space.top
        }
        Item {
            id: send_page
            height: 30

            Row{
                FluToggleButton{
                    text: qsTr("单条发送")
                    checked: true
                    onClicked: {
                        checked=true
                    }
                }
                FluToggleButton{
                    text: qsTr("多条发送")
                    onClicked: {

                    }
                    disabled: true
                }
                FluToggleButton{
                    text: qsTr("协议传输")
                    onClicked: {

                    }
                    disabled: true
                }
            }
        }

        Item{
            anchors{
                top:send_page.bottom
                bottom: parent.bottom
                left: parent.left
                right:parent.right
                rightMargin: 5
            }

            ScrollView{


                anchors{
                    top:parent.top
                    bottom: send_extra.top
                    bottomMargin: 5
                    left: parent.left
                    rightMargin: 5
                    right: send_message_option.left
                }
                FluMultilineTextBox{
                    id:send_textbox
                    onTextChanged: {
                        root.send_buffer=text
                    }
                }
            }

            Item {
                id: send_message_option
                width: 100
                anchors{
                    top:parent.top
                    bottom: parent.bottom
                    right: parent.right
                }

                Column{
                    spacing: 30

                    FluButton{
                        width:100
                        text:qsTr("发送")

                        onClicked: {
                            if(nav_serial_port.isConnected)
                            {
                                send_message()
                            }
                            else
                            {
                                showWarning(qsTr("串口未连接"))
                            }
                        }
                    }

                    FluButton{
                        width:100
                        text:qsTr("清除发送")

                        onClicked: {
                            send_textbox.text=""
                            showInfo(qsTr("发送缓冲区已清空"))
                        }
                    }
                }

            }


            Item {
                id:send_extra
                height:60
                anchors{
                    margins: 5
                    left: parent.left
                    bottom: parent.bottom
                    right:parent.right
                }
                Column{
                    spacing: 5

                    width: parent.width

                    Item{
                        width: parent.width
                        height: 30
                        Row{
                            id:intv_send_message_option

                            spacing: 5
                            FluCheckBox{
                                anchors.verticalCenter: parent.verticalCenter
                                text: qsTr("定时发送")
                            }

                            FluText{
                                anchors.verticalCenter: parent.verticalCenter
                                text: qsTr("   周期")
                            }

                            FluTextBox{
                                width: 80
                                anchors.verticalCenter: parent.verticalCenter
                                text: qsTr("1000")
                            }

                            FluText{
                                anchors.verticalCenter: parent.verticalCenter
                                text: qsTr("ms")
                            }
                        }

                        FluTextBox{
                            anchors{
                                left:intv_send_message_option.right
                                leftMargin: 5
                                right: file_send_message_option.left
                                rightMargin: 5
                                verticalCenter: parent.verticalCenter
                            }
                        }

                        Row{
                            id:file_send_message_option
                            anchors{
                                right: parent.right
                                verticalCenter: parent.verticalCenter
                            }
                            layoutDirection: Qt.RightToLeft
                            spacing: 1

                            FluButton{
                                anchors.verticalCenter: parent.verticalCenter
                                text: qsTr("停止发送")
                            }

                            FluButton{
                                anchors.verticalCenter: parent.verticalCenter
                                text: qsTr("发送文件")
                            }
                            FluButton{
                                anchors.verticalCenter: parent.verticalCenter
                                text: qsTr("打开文件")
                            }
                        }
                    }


                    Item{
                        width: parent.width
                        height:30
                        Row{
                            id:send_format_option
                            spacing: 5
                            anchors.verticalCenter: parent.verticalCenter
                            FluCheckBox{
                                anchors.verticalCenter: parent.verticalCenter
                                text: qsTr("十六进制发送")
                            }

                            FluCheckBox{
                                anchors.verticalCenter: parent.verticalCenter
                                text: qsTr("发送新行")
                            }
                        }
                        FluProgressBar{
                            indeterminate: false
                            anchors{
                                left:send_format_option.right
                                leftMargin: 50
                                right:  parent.right
                                rightMargin: 40
                                verticalCenter: parent.verticalCenter
                            }

                            progressVisible: true
                            value:0
                        }
                    }
                }
            }
        }
    }
    FluFrame {
        id: bottom_space

        height:30
        width:parent.width
        anchors{
            bottom: parent.bottom
        }

        Row{
            anchors.verticalCenter: parent.verticalCenter

            spacing: 5

            FluIconButton{
                anchors.verticalCenter: parent.verticalCenter
                iconSource: FluentIcons.Settings
                iconSize: 15
            }


            FluText{
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("连接状态:")
            }

            FluText{
                anchors.verticalCenter: parent.verticalCenter
                width:50
                text: nav_serial_port.isConnected?qsTr("已连接"):qsTr("未连接")
            }

            FluText{
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("发送字节：")
            }

            FluText{
                width:60
                anchors.verticalCenter: parent.verticalCenter
                text: nav_serial_port.sendbyte
            }

            FluText{
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("接收字节：")
            }

            FluText{
                width:80
                anchors.verticalCenter: parent.verticalCenter
                text: nav_serial_port.recvbyte
            }
        }

        Row{
            anchors{
                right: parent.right
                rightMargin: 50
                verticalCenter: parent.verticalCenter
            }
            layoutDirection: Qt.RightToLeft
            spacing: 5

            FluText{
                width:90
                anchors.verticalCenter: parent.verticalCenter
                text: Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")

                Timer {
                    interval: 1000  // 每秒更新一次
                    running: true
                    repeat: true
                    onTriggered: {
                        parent.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
                    }
                }
            }

            FluText{
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("当前时间:")
            }
        }
    }

    ListModel {
        id: port_name_model

        Component.onCompleted:
        {
            root.refresh_serial_port()
        }
    }
    ListModel {
        id: baud_rate_model
        ListElement { text: "9600" }
        ListElement { text: "14400" }
        ListElement { text: "19200" }
        ListElement { text: "38400" }
        ListElement { text: "43000" }
        ListElement { text: "57600" }
        ListElement { text: "76800" }
        ListElement { text: "115200" }
        ListElement { text: "128000" }
        ListElement { text: "230400" }
        ListElement { text: "256000" }
        ListElement { text: "460800" }
        ListElement { text: "921600" }
        ListElement { text: "1000000" }
        ListElement { text: "2000000" }
        ListElement { text: "3000000" }
    }
    ListModel {
        id: baud_stop_model
        ListElement { text: "1" }
        ListElement { text: "1.5" }
        ListElement { text: "2" }
    }

    ListModel {
        id: data_bits_model
        ListElement { text: "8" }
        ListElement { text: "7" }
        ListElement { text: "6" }
        ListElement { text: "5" }
    }
    ListModel {
        id: data_parity_model
        ListElement { text: "None" }
        ListElement { text: "Odd" }
        ListElement { text: "Even" }
    }

    function refresh_serial_port()
    {
        port_name_model.clear()
        var list=nav_serial_port.getAvailableSerialPort()
        console.log(list)
        showSuccess(list)

        for(var i=0;i<list.length;i++)
        {
            console.log(list[i])
            port_name_model.append({"text":list[i].portname})// +":"+ list[i].description})
        }
    }

    //打开串口
    function open_serial_port()
    {
        //设置参数
        nav_serial_port.port_name=root.port_name        //COMX
        nav_serial_port.baud_rate=root.baud_rate        //115200
        nav_serial_port.baud_stop=root.baud_stop        //0:OneStop 1:OneAndHalfStop 2:TwoStop
        nav_serial_port.data_bits=root.data_bits        //0:8 1:7 2:6 3:5
        nav_serial_port.data_parity=root.data_parity    //0:NoParity 1:OddParity 2:EvenParity

        //执行打开函数
        return nav_serial_port.connectSerialPort()
    }
    //关闭串口
    function close_serial_port()
    {
        //执行关闭函数
        return nav_serial_port.disconnectSerialPort()
    }
    //发送数据
    function send_message()
    {
        console.log(send_buffer)
        return nav_serial_port.sendSerialData(root.send_buffer);
    }

    function toHexString(input) {
        var hexString = "";
        for (var i = 0; i < input.length; i++) {
            var charCode = input.charCodeAt(i);
            var bytes = [];

            // 处理 UTF-8 编码的字符
            if (charCode <= 0x7F) {
                // 1-byte UTF-8 character (ASCII)
                bytes.push(charCode);
            } else if (charCode <= 0x7FF) {
                // 2-byte UTF-8 character
                bytes.push(0xC0 | (charCode >> 6));
                bytes.push(0x80 | (charCode & 0x3F));
            } else if (charCode <= 0xFFFF) {
                // 3-byte UTF-8 character
                bytes.push(0xE0 | (charCode >> 12));
                bytes.push(0x80 | ((charCode >> 6) & 0x3F));
                bytes.push(0x80 | (charCode & 0x3F));
            } else if (charCode <= 0x10FFFF) {
                // 4-byte UTF-8 character
                bytes.push(0xF0 | (charCode >> 18));
                bytes.push(0x80 | ((charCode >> 12) & 0x3F));
                bytes.push(0x80 | ((charCode >> 6) & 0x3F));
                bytes.push(0x80 | (charCode & 0x3F));
            }

            // 将每个字节转换为两位的十六进制字符串
            for (var j = 0; j < bytes.length; j++) {
                var hex = bytes[j].toString(16);
                if (hex.length < 2) {
                    hex = "0" + hex; // 确保两位
                }
                hexString += hex.toUpperCase() + " ";
            }
        }
        return hexString.trim(); // 返回最终的十六进制字符串
    }



    Nav_Serial_Port{
        id:nav_serial_port
    }


    Connections {
        target: nav_serial_port

        onRecvNewBuffer: {
            root.recv_buffer+=data

            console.log(data)
        }
    }

}
