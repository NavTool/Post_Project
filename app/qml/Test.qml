import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels

import FluentUI 1.0

import "window"
import "global"
import "component"
import "extra"

FluContentPage {

    title: qsTr("TabView Example")


    ScrollView {

        // visible: false


        anchors.fill: parent
        anchors.rightMargin: 5
        TableView {
            id: tableView
            clip: true
            interactive: true
            rowSpacing: 1
            columnSpacing: 1

            model: TableModel {
                TableModelColumn { display: "checked" }
                TableModelColumn { display: "amount" }
                TableModelColumn { display: "fruitType" }
                TableModelColumn { display: "fruitName" }
                TableModelColumn { display: "fruitPrice" }

                rows: [
                    {
                        checked: false,
                        amount: 1,
                        fruitType: "Apple",
                        fruitName: "Granny Smith",
                        fruitPrice: 1.50
                    },
                    {
                        checked: true,
                        amount: 4,
                        fruitType: "Orange",
                        fruitName: "Navel",
                        fruitPrice: 2.50
                    },
                    {
                        checked: false,
                        amount: 1,
                        fruitType: "Banana",
                        fruitName: "Cavendish",
                        fruitPrice: 3.50
                    },
                    {
                        checked: false,
                        amount: 1,
                        fruitType: "Apple",
                        fruitName: "Granny Smith",
                        fruitPrice: 1.50
                    },
                    {
                        checked: true,
                        amount: 4,
                        fruitType: "Orange",
                        fruitName: "Navel",
                        fruitPrice: 2.50
                    },
                    {
                        checked: false,
                        amount: 1,
                        fruitType: "Banana",
                        fruitName: "Cavendish",
                        fruitPrice: 3.50
                    },
                    {
                        checked: false,
                        amount: 1,
                        fruitType: "Apple",
                        fruitName: "Granny Smith",
                        fruitPrice: 1.50
                    }
                ]
            }

            selectionModel: ItemSelectionModel {}
            delegate:DelegateChooser {
                DelegateChoice {
                    column: 0
                    delegate: FluToggleSwitch {

                        checked: model.display
                        onToggled: model.display = checked
                    }
                }
                DelegateChoice {
                    column: 1
                    delegate: FluSpinBox {
                        value: model.display
                        onValueModified: model.display = value
                    }
                }
                DelegateChoice {
                    delegate: FluTextBox {
                        text: model.display
                        selectByMouse: true
                        implicitWidth: 140
                        onAccepted: model.display = text
                    }
                }
            }
                /*Rectangle {
                implicitWidth: 150
                implicitHeight: 50
                required property bool selected
                required property bool current
                border.width: current ? 2 : 0
                color: selected ? "lightblue" : palette.base
                Text{
                    text: model.display
                    padding: 12
                }
            }*/
        }
    }
    SelectionRectangle {
        target: tableView
    }




}
