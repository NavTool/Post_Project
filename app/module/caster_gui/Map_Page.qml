import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

import QtLocation 5.15
import QtPositioning 5.15

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"
import "../../qml/extra"

FluScrollablePage{
    Map {
            anchors.fill: parent
            plugin: Plugin {
                name: "osm" // 使用 OpenStreetMap 插件
            }
            center: QtPositioning.coordinate(0, 0) // 初始地图中心
            zoomLevel: 3

            MapQuickItem {
                coordinate: QtPositioning.coordinate(52.5, 13.4) // 标记点坐标
                anchorPoint.x: icon.width / 2
                anchorPoint.y: icon.height
                sourceItem: Image {
                    id: icon
                    source: "qrc:/marker.png" // 标记点图标
                }
            }
        }
}
