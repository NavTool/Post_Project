import QtQuick
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl

Column{
    spacing: 20
    Button{
        text: "Standard Button"
        flat: true
    }
    Button{
        text: "Standard Button"
    }
    Button{
        text: "Standard Button"
        highlighted: true
    }
    Button{
        text: "Standard Button"
        highlighted: true
        FluentUI.primaryColor: Qt.rgba(13/255,110/255,253/255,1)
    }
    Button{
        text: "Standard Button"
        highlighted: true
        FluentUI.primaryColor: Qt.rgba(25/255,135/255,84/255,1)
    }
    Button{
        text: "Standard Button"
        highlighted: true
        FluentUI.primaryColor: Qt.rgba(220/255,53/255,69/255,1)
    }
    Button{
        text: "Standard Button"
        highlighted: true
        FluentUI.primaryColor: Qt.rgba(255/255,193/255,7/255,1)
    }
    Button{
        text: "Standard Button"
        highlighted: true
        FluentUI.primaryColor: Qt.rgba(13/255,202/255,240/255,1)
    }
}
