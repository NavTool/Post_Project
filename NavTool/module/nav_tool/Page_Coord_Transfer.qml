import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

import "../../qml/window"
import "../../qml/global"
import "../../qml/component"
import "../../qml/extra"


FluContentPage{
    title: qsTr("Coord Transfer")

    ColumnLayout
    {
        anchors{
            left: parent.left
            right: parent.right
        }

        FluFrame{

            Layout.fillWidth: true
            Layout.preferredHeight: 180
            Layout.rightMargin: 15


            ColumnLayout
            {
                FluText{
                    text: "坐标类型:"
                    font:FluTextStyle.Subtitle
                }
                FluText{
                    text: "坐标类型:"
                    font:FluTextStyle.Subtitle
                }
                FluText{
                    text: "坐标类型:"
                    font:FluTextStyle.Subtitle
                }
            }
        }
        FluExpander{
            headerText: qsTr("转换结果")
            Layout.fillWidth: true
            Layout.rightMargin: 15
        }

        ExtraItem{

        }

    }

}
