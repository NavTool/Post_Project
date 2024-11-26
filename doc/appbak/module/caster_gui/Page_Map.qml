import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

import QtQuick
import QtLocation
import QtPositioning

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"
import "../../qml/extra"

FluContentPage{


    FluFrame{

        anchors.fill: parent

        Plugin {
            id: mapPlugin
            name: "osm"

            PluginParameter {
                   name: "osm.mapping.custom.host"

                   // OSM plugin will auto-append if .png isn't suffix, and that screws up apikey which silently
                   // fails authentication (only Wireshark revealed it)
                   value: "http://tile.thunderforest.com/landscape/%z/%x/%y.png?apikey=2d92e1399d8643139c91d797879d331f&fake=.png"
               }
        }



        Map {
            id: map
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(59.91, 10.75) // Oslo
            zoomLevel: 14
            property geoCoordinate startCentroid

            // activeMapType: supportedMapTypes[supportedMapTypes.length - 1]

            PinchHandler {
                id: pinch
                target: null
                onActiveChanged: if (active) {
                                     map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                                 }
                onScaleChanged: (delta) => {
                                    map.zoomLevel += Math.log2(delta)
                                    map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                                }
                onRotationChanged: (delta) => {
                                       map.bearing -= delta
                                       map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                                   }
                grabPermissions: PointerHandler.TakeOverForbidden
            }
            WheelHandler {
                id: wheel
                // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
                // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
                // and we don't yet distinguish mice and trackpads on Wayland either
                acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                                 ? PointerDevice.Mouse | PointerDevice.TouchPad
                                 : PointerDevice.Mouse
                rotationScale: 1/120
                property: "zoomLevel"
            }
            DragHandler {
                id: drag
                target: null
                onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
            }
            Shortcut {
                enabled: map.zoomLevel < map.maximumZoomLevel
                sequence: StandardKey.ZoomIn
                onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
            }
            Shortcut {
                enabled: map.zoomLevel > map.minimumZoomLevel
                sequence: StandardKey.ZoomOut
                onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
            }
        }

    }
}
