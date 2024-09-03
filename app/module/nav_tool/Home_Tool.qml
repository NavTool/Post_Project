import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"
import "../../qml/extra"

FluScrollablePage {

    title: qsTr("Nav Tool")

    FluExpander{
        headerText: qsTr("Version and Description")
        Layout.fillWidth: true
        Layout.rightMargin: 15
    }

    ExtraItem{
        _icon:FluentIcons.TiltUp
        _text:qsTr("坐标转换工具")
        _text_extra:qsTr("不同坐标系下的坐标互转")
        _url:"qrc:/module/nav_tool/Page_Coord_Transfer.qml"
    }

    ExtraItem{
        _icon:FluentIcons.DateTime
        _text:qsTr("时间转换工具")
        _text_extra:qsTr("不同时间系统间的时间互转")
        _url:"qrc:/module/nav_tool/Page_Time_Transfer.qml"
    }

    ExtraItem{
        _icon:FluentIcons.ChromeSwitch
        _text:qsTr("NMEA-0183 转换工具")
        _text_extra:qsTr("生成和转换GGA、GSV、RMC格式数据")
        _url:"qrc:/module/nav_tool/Page_NMEA_Transfer.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Filter
        _text:qsTr("RTCM3 数据解析工具")
        _text_extra:qsTr("读取和解析RTCM数据流")
        _url:"qrc:/module/nav_tool/Page_RTCM_Decoder.qml"
    }

    ExtraItem{
        _icon: FluentIcons.AreaChart
        _text:qsTr("Rinex 数据分析工具")
        _text_extra:qsTr("读取Rinex文件并分析观测数据")
        _url:"qrc:/module/nav_tool/Page_Rinex_Decoder.qml"
    }

    ExtraItem{
        _icon:FluentIcons.SpecialEffectSize
        _text:qsTr("星空图")
        _text_extra:qsTr("根据广播星历来计算指定位置的星空图")
        _url:"qrc:/module/nav_tool/Page_Sky_Plot.qml"
    }

    ExtraItem{
        _icon:FluentIcons.MapPin
        _text:qsTr("位置查询工具")
        _text_extra:qsTr("根据坐标查询位置或根据位置查询坐标")
        _url:"qrc:/module/nav_tool/Page_Sky_Plot.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Link
        _text:qsTr("串口工具")
        _text_extra:qsTr("通过串口连接到设备")
        _url:"qrc:/module/nav_tool/Page_Serial_Port.qml"
    }

    ExtraItem{
        _icon:FluentIcons.Info
        _text:qsTr("版本信息")
        _text_extra:qsTr("工具版本、使用算法和依赖库")
        _url:"qrc:/module/nav_tool/Page_Info.qml"
    }

}
