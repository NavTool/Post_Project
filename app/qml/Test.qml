import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels

import FluentUI 1.0

// import Extra 1.0


import "global"
import "component"
import "extra"


FluContentPage {

    id:root

    title: qsTr("TabView Example")


    property int global_value:0


    Row{

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
    }



    function setglobal_value(i)
    {
        global_value=parseInt(i,10);
    }




    // ScrollView {

    //     // visible: false


    //     anchors.fill: parent
    //     anchors.rightMargin: 5
    //     TableView {
    //         id: tableView
    //         clip: true
    //         interactive: true
    //         rowSpacing: 1
    //         columnSpacing: 1

    //         model: TableModel {
    //             TableModelColumn { display: "checked" }
    //             TableModelColumn { display: "amount" }
    //             TableModelColumn { display: "fruitType" }
    //             TableModelColumn { display: "fruitName" }
    //             TableModelColumn { display: "fruitPrice" }

    //             rows: [
    //                 {
    //                     checked: false,
    //                     amount: 1,
    //                     fruitType: "Apple",
    //                     fruitName: "Granny Smith",
    //                     fruitPrice: 1.50
    //                 },
    //                 {
    //                     checked: true,
    //                     amount: 4,
    //                     fruitType: "Orange",
    //                     fruitName: "Navel",
    //                     fruitPrice: 2.50
    //                 },
    //                 {
    //                     checked: false,
    //                     amount: 1,
    //                     fruitType: "Banana",
    //                     fruitName: "Cavendish",
    //                     fruitPrice: 3.50
    //                 },
    //                 {
    //                     checked: false,
    //                     amount: 1,
    //                     fruitType: "Apple",
    //                     fruitName: "Granny Smith",
    //                     fruitPrice: 1.50
    //                 },
    //                 {
    //                     checked: true,
    //                     amount: 4,
    //                     fruitType: "Orange",
    //                     fruitName: "Navel",
    //                     fruitPrice: 2.50
    //                 },
    //                 {
    //                     checked: false,
    //                     amount: 1,
    //                     fruitType: "Banana",
    //                     fruitName: "Cavendish",
    //                     fruitPrice: 3.50
    //                 },
    //                 {
    //                     checked: false,
    //                     amount: 1,
    //                     fruitType: "Apple",
    //                     fruitName: "Granny Smith",
    //                     fruitPrice: 1.50
    //                 }
    //             ]
    //         }

    //         selectionModel: ItemSelectionModel {}
    //         delegate:DelegateChooser {
    //             DelegateChoice {
    //                 column: 0
    //                 delegate: FluToggleSwitch {

    //                     checked: model.display
    //                     onToggled: model.display = checked
    //                 }
    //             }
    //             DelegateChoice {
    //                 column: 1
    //                 delegate: FluSpinBox {
    //                     value: model.display
    //                     onValueModified: model.display = value
    //                 }
    //             }
    //             DelegateChoice {
    //                 delegate: FluTextBox {
    //                     text: model.display
    //                     selectByMouse: true
    //                     implicitWidth: 140
    //                     onAccepted: model.display = text
    //                 }
    //             }
    //         }
    //             /*Rectangle {
    //             implicitWidth: 150
    //             implicitHeight: 50
    //             required property bool selected
    //             required property bool current
    //             border.width: current ? 2 : 0
    //             color: selected ? "lightblue" : palette.base
    //             Text{
    //                 text: model.display
    //                 padding: 12
    //             }
    //         }*/
    //     }
    // }
    // SelectionRectangle {
    //     target: tableView
    // }




}
