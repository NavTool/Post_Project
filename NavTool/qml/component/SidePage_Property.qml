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

    anchors.fill:parent

    PageRouter{
        id: property_router
        routes: {
            "/sidepage/property/blank": R.resolvedUrl("qml/component/SidePage_Blank.qml"),
            "/sidepage/property/obsfile": R.resolvedUrl("qml/component/SidePage_Property_ObsFile.qml"),
            "/sidepage/property/baseline": R.resolvedUrl("qml/component/SidePage_Property_Baseline.qml"),
            "/sidepage/property/station": R.resolvedUrl("qml/component/SidePage_Property_Station.qml"),
            "/sidepage/property/obsfile": R.resolvedUrl("qml/component/SidePage_Property_ObsFile.qml"),
            "/sidepage/property/baseline": R.resolvedUrl("qml/component/SidePage_Property_Baseline.qml")
        }
    }

    PageRouterView{
        id: property_panne
        anchors.fill: parent
        router: property_router
        clip: true

        Component.onCompleted: {
            property_router.go(Global.displayPropertyPage)
        }
    }

    Connections{
        target:Global
        function onDisplayPropertyPageChanged(){
            property_router.go(Global.displayPropertyPage)
        }
    }


}
