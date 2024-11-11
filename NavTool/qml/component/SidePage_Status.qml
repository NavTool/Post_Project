import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels
import FluentUI.Controls
import FluentUI.impl

/*
//功能设计，这个主要就是根据当前选择的处理了任务，根据任务来获取状态信息，状态信息返回的是一个json字符串，通过解析json字符串，就能获取实时的信息了
//这个实时字符串包含的内容有：

处理统计信息
    任务状态：等待处理/处理中/已完成/已取消/（已删除）
    当前处理的进度： 0-10000 的一个浮点数（0.00-100.00）
    处理已经花费的时间（只传递开始处理的时间）

当前解的状态
    当前处理的时间： UTC秒数（历元的UTC时间）
    当前解的状态：   4、固定 5、浮点（参考GGA的定义）
    结果经度：
    结果纬度：
    结果高程：
    使用卫星数：
    RMS：
    其他信息：

同时提供了若干按钮，功能如下：
    查看日志：点击后，底部功能栏切换到对应的日志输出
    停止处理：点击后，终止该任务的处理功能

*/


Frame{
    id:root

    anchors.fill: parent

    property string title
    property PageContext context

    Label{
        text:qsTr("任务状态栏")
    }


   Column{
    anchors.fill: parent


    Item{
        width: root.width
        height: 60


    Row{


        Icon{
            source: FluentIcons.graph_Dial
        }


        ProgressBar{
            from: 0
            to: 1
            value: 1
            anchors.verticalCenter: parent.verticalCenter
        }
    }


    }



       Item{

           width: root.width
           height: 120


           ScrollView {
               id:scrollview

               // visible: false



               TableView {
                   id: tableView
                   clip: true
                   interactive: true
                   rowSpacing: 2
                   columnSpacing: 10


                   model:option_model

                   selectionModel: ItemSelectionModel {}
                   delegate:DelegateChooser {
                       DelegateChoice {
                           column: 0
                           delegate: Label {
                               text: model.display
                           }
                       }
                       DelegateChoice {
                           column: 1
                           delegate: Label {
                               text: model.display
                           }
                       }
                       DelegateChoice {
                           column: 2
                           delegate: Switch {
                               checked: model.display
                               onToggled: model.display = checked
                           }
                       }
                       DelegateChoice {
                           column: 3
                           delegate:Button {
                               text: qsTr("删除")
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
                   {
                       option_name: 0,
                       option_value: 0,
                       option_enable: false,
                       delete_option: false
                   }
               ]

           }
       }

   }







}
