import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI.Controls
import FluentUI.impl
import NavTool
import QtPositioning
import QtLocation

// ContentPage
Item{
    id: root
    anchors.fill: parent

    property string title
    property PageContext context


    property real canvas_Width:0 //画布的宽
    property real center_Height:0 //画布的高

    property real center_Xpix:0 //中心点的像素
    property real center_Ypix:0 //中心点的像素

    property real grid_unit:50
    property var  grid_scale:[1.000,1.072,1.149,1.231,1.320,1.414,1.516,1.625,1.741,1.866,2.000]
    property real scaleFactor: 1.0  //缩放因子  （1.0就是   1m对应一个格网单位）  1.000/1.072/1.149/1.231/1.320/1.414/1.516/1.625/1.741/1.866/2.000  //放大10次则放大为之前的2倍

    //如果时

    property real coord_Xcenter: 0.0 //中心点的坐标
    property real coord_Ycenter: 0.0 //中心点的坐标


    property real coord_Xmax:0   //展示的最大坐标
    property real coord_Xmin:0   //展示的最小坐标
    property real coord_Ymax:0
    property real coord_Ymin:0



    //就二分分割来实现：如果当前的单位>=2倍的标准格网单位，则扩大格网绘制的单位缩小一位：及如果100像素表示1m，则进行格网切换，默认格网单位改为0.5m，格网像素改为标准格网
    //然后就是5分分割：如果当前像素的单位                                        及如果100像素表示0.5m，则格网切换，默认格网单位改为0.2米，格网像素改为标准格网的4/5


    //
    property real grid_unit_max:50



    //根据宽度和缩放比例，获取坐标范围



    //坐标范围除以像素 得到每个像素展示



}
// Item{


//     id: root
//     anchors.fill: parent

//     property string title
//     property PageContext context


//     property real scaleFactor: 1.0 // 当前缩放比例
//         property real baseGridDistance: 1.0 // 格网基础单位（1米）
//         property real pixelPerMeter: 50.0 // 初始1米=50像素

//         Canvas {
//             id: gridCanvas
//             anchors.fill: parent
//             onPaint: {
//                 var ctx = gridCanvas.getContext("2d")
//                 ctx.clearRect(0, 0, width, height)

//                 // 计算格网间距
//                 var actualDistance = baseGridDistance / scaleFactor
//                 var gridDistance = calculateGridDistance(actualDistance)
//                 var pixelGridSpacing = gridDistance * pixelPerMeter * scaleFactor

//                 // 设置画笔
//                 ctx.strokeStyle = "lightgray"
//                 ctx.lineWidth = 1
//                 ctx.font = "12px Arial"
//                 ctx.fillStyle = "black"

//                 // 计算中心点
//                 var centerX = gridCanvas.width / 2
//                 var centerY = gridCanvas.height / 2

//                 // 绘制垂直线和坐标（从中心向两侧扩展）
//                 for (var x = 0; x <= gridCanvas.width / 2; x += pixelGridSpacing) {
//                     // 左侧线
//                     ctx.beginPath()
//                     ctx.moveTo(centerX - x, 0)
//                     ctx.lineTo(centerX - x, gridCanvas.height)
//                     ctx.stroke()

//                     // 右侧线
//                     if (x !== 0) { // 中心线不重复绘制
//                         ctx.beginPath()
//                         ctx.moveTo(centerX + x, 0)
//                         ctx.lineTo(centerX + x, gridCanvas.height)
//                         ctx.stroke()
//                     }

//                     // 绘制底部坐标（非中心线）
//                     if (x !== 0) {
//                         var coordXLeft = (-x / pixelPerMeter / scaleFactor).toFixed(2)
//                         var coordXRight = (x / pixelPerMeter / scaleFactor).toFixed(2)
//                         ctx.fillText(coordXLeft + "m", centerX - x + 2, centerY + 15)
//                         ctx.fillText(coordXRight + "m", centerX + x + 2, centerY + 15)
//                     }
//                 }

//                 // 绘制水平线和坐标（从中心向上下扩展）
//                 for (var y = 0; y <= gridCanvas.height / 2; y += pixelGridSpacing) {
//                     // 上侧线
//                     ctx.beginPath()
//                     ctx.moveTo(0, centerY - y)
//                     ctx.lineTo(gridCanvas.width, centerY - y)
//                     ctx.stroke()

//                     // 下侧线
//                     if (y !== 0) { // 中心线不重复绘制
//                         ctx.beginPath()
//                         ctx.moveTo(0, centerY + y)
//                         ctx.lineTo(gridCanvas.width, centerY + y)
//                         ctx.stroke()
//                     }

//                     // 绘制左侧坐标（非中心线）
//                     if (y !== 0) {
//                         var coordYTop = (y / pixelPerMeter / scaleFactor).toFixed(2)
//                         var coordYBottom = (-y / pixelPerMeter / scaleFactor).toFixed(2)
//                         ctx.fillText(coordYTop + "m", centerX + 5, centerY - y - 2)
//                         ctx.fillText(coordYBottom + "m", centerX + 5, centerY + y - 2)
//                     }
//                 }
//             }
//         }

//         // 缩放按钮
//         Row {
//             spacing: 10
//             anchors.horizontalCenter: parent.horizontalCenter
//             anchors.bottom: parent.bottom
//             Button {
//                 text: "Zoom In"
//                 onClicked: {
//                     scaleFactor *= 1.2
//                     gridCanvas.requestPaint()
//                 }
//             }
//             Button {
//                 text: "Zoom Out"
//                 onClicked: {
//                     scaleFactor /= 1.2
//                     gridCanvas.requestPaint()
//                 }
//             }
//         }

//         // 格网间距计算函数
//         function calculateGridDistance(distance) {
//             var gridUnits = [1, 2, 5]; // 循环单位
//             var unitIndex = 0;         // 记录10的幂次

//             // 将距离归一化到1~10之间
//             while (distance < 1.0) {
//                 distance *= 10;
//                 unitIndex--;
//             }
//             while (distance >= 10.0) {
//                 distance /= 10;
//                 unitIndex++;
//             }

//             // 从 gridUnits 中选择最接近的单位
//             var selectedUnit = gridUnits.find(function (u) {
//                 return distance <= u;
//             }) || gridUnits[gridUnits.length - 1];

//             return selectedUnit * Math.pow(10, unitIndex);
//         }

//     // property real scaleFactor: 1.0 // 当前缩放比例
//     // property real baseGridDistance: 1.0 // 格网基础单位（1米）
//     // property real pixelPerMeter: 50.0 // 初始1米=50像素

//     // Canvas {
//     //     id: gridCanvas
//     //     anchors.fill: parent
//     //     onPaint: {
//     //         var ctx = gridCanvas.getContext("2d")
//     //         ctx.clearRect(0, 0, width, height)

//     //         // 计算格网间距
//     //         var actualDistance = baseGridDistance / scaleFactor
//     //         var gridDistance = calculateGridDistance(actualDistance)
//     //         var pixelGridSpacing = gridDistance * pixelPerMeter * scaleFactor

//     //         // 设置画笔
//     //         ctx.strokeStyle = "lightgray"
//     //         ctx.lineWidth = 1

//     //         // 绘制格网
//     //         var startX = Math.floor(gridCanvas.x / pixelGridSpacing) * pixelGridSpacing
//     //         var startY = Math.floor(gridCanvas.y / pixelGridSpacing) * pixelGridSpacing
//     //         for (var x = startX; x < gridCanvas.width; x += pixelGridSpacing) {
//     //             ctx.beginPath()
//     //             ctx.moveTo(x, 0)
//     //             ctx.lineTo(x, gridCanvas.height)
//     //             ctx.stroke()
//     //         }
//     //         for (var y = startY; y < gridCanvas.height; y += pixelGridSpacing) {
//     //             ctx.beginPath()
//     //             ctx.moveTo(0, y)
//     //             ctx.lineTo(gridCanvas.width, y)
//     //             ctx.stroke()
//     //         }
//     //     }
//     // }

//     // // 缩放按钮
//     // Row {
//     //     spacing: 10
//     //     anchors.horizontalCenter: parent.horizontalCenter
//     //     anchors.bottom: parent.bottom
//     //     Button {
//     //         text: "Zoom In"
//     //         onClicked: {
//     //             scaleFactor *= 1.2
//     //             gridCanvas.requestPaint()
//     //         }
//     //     }
//     //     Button {
//     //         text: "Zoom Out"
//     //         onClicked: {
//     //             scaleFactor /= 1.2
//     //             gridCanvas.requestPaint()
//     //         }
//     //     }
//     // }

//     // // 格网间距计算函数
//     // function calculateGridDistance(distance) {
//     //     var gridUnits = [1, 2, 5]
//     //     var unitIndex = 0
//     //     while (distance < 1.0) {
//     //         distance *= 10
//     //         unitIndex--
//     //     }
//     //     while (distance >= 10.0) {
//     //         distance /= 10
//     //         unitIndex++
//     //     }
//     //     var selectedUnit = gridUnits.find(function(u) { return distance <= u }) || gridUnits[gridUnits.length - 1]
//     //     return selectedUnit * Math.pow(10, unitIndex)
//     // }
// }

// Item {
//     id: root
//     anchors.fill: parent

//     property string title
//     property PageContext context

//     property real scaleFactor: 1.0 // 缩放因子
//     property real offsetX: 0       // 平移 X 偏移
//     property real offsetY: 0       // 平移 Y 偏移
//     property real baseUnit: 1.0    // 当前单位 (米)
//     property var units: [0.1, 0.2, 0.5, 1, 2, 5, 10, 20, 50, 100] // 单位循环

//     Canvas {
//         id: canvas
//         anchors.fill: parent

//         onPaint: {
//             var ctx = canvas.getContext("2d");
//             ctx.clearRect(0, 0, canvas.width, canvas.height);

//             // 绘制格网
//             drawGrid(ctx);

//             // 绘制坐标轴
//             drawAxes(ctx);

//             // 绘制比例尺
//             drawScale(ctx);
//         }

//         function drawGrid(ctx) {
//             var spacing = baseUnit * scaleFactor * 50; // 动态间距计算
//             ctx.strokeStyle = "#ccc";
//             ctx.lineWidth = 1;

//             var startX = offsetX % spacing;
//             var startY = offsetY % spacing;

//             for (var x = startX; x < canvas.width; x += spacing) {
//                 ctx.beginPath();
//                 ctx.moveTo(x, 0);
//                 ctx.lineTo(x, canvas.height);
//                 ctx.stroke();
//             }

//             for (var y = startY; y < canvas.height; y += spacing) {
//                 ctx.beginPath();
//                 ctx.moveTo(0, y);
//                 ctx.lineTo(canvas.width, y);
//                 ctx.stroke();
//             }
//         }

//         function drawAxes(ctx) {
//             ctx.strokeStyle = "#000";
//             ctx.lineWidth = 2;

//             var centerX = canvas.width / 2 + offsetX;
//             var centerY = canvas.height / 2 + offsetY;

//             // X 轴
//             ctx.beginPath();
//             ctx.moveTo(0, centerY);
//             ctx.lineTo(canvas.width, centerY);
//             ctx.stroke();

//             // Y 轴
//             ctx.beginPath();
//             ctx.moveTo(centerX, 0);
//             ctx.lineTo(centerX, canvas.height);
//             ctx.stroke();
//         }

//         function drawScale(ctx) {
//             var scaleLength = 100; // 比例尺长度 (px)
//             var scaleValue = baseUnit * scaleFactor * 10; // 对应的实际距离

//             ctx.strokeStyle = "#000";
//             ctx.lineWidth = 2;

//             var startX = 20;
//             var startY = canvas.height - 40;

//             // 比例尺线段
//             ctx.beginPath();
//             ctx.moveTo(startX, startY);
//             ctx.lineTo(startX + scaleLength, startY);
//             ctx.stroke();

//             // 显示比例单位
//             var label = scaleValue < 0.01
//                     ? (scaleValue * 1000).toFixed(1) + " mm"
//                     : scaleValue < 1
//                       ? (scaleValue * 100).toFixed(1) + " cm"
//                       : scaleValue < 1000
//                         ? scaleValue.toFixed(1) + " m"
//                         : (scaleValue / 1000).toFixed(1) + " km";

//             ctx.font = "14px Arial";
//             ctx.fillStyle = "#000";
//             ctx.fillText(label, startX + scaleLength + 10, startY + 5);
//         }
//     }

//     MouseArea {
//         id: dragArea
//         anchors.fill: parent

//         // 接收滚轮事件并调用显式处理函数
//         onWheel: handleWheelEvent

//         // 鼠标滚轮事件处理函数
//         function handleWheelEvent(event) {
//             var delta = event.angleDelta.y / 120;
//             var oldScale = scaleFactor;

//             // 调整缩放因子
//             scaleFactor = Math.max(0.1, Math.min(10, scaleFactor + delta * 0.1));

//             // 调整格网基础单位
//             adjustBaseUnit(oldScale, scaleFactor);

//             // 重新绘制画布
//             canvas.requestPaint();
//         }

//         onPositionChanged: handleMouseMove

//         // 鼠标移动事件处理函数
//         function handleMouseMove(event) {
//             offsetX += event.x - event.previousX;
//             offsetY += event.y - event.previousY;
//             canvas.requestPaint();
//         }

//         // 格网基础单位调整函数
//         function adjustBaseUnit(oldScale, newScale) {
//             var currentSize = baseUnit * oldScale * 50;

//             if (currentSize > 100 && baseUnit < units[units.length - 1]) {
//                 baseUnit = units[units.indexOf(baseUnit) + 1];
//             } else if (currentSize < 25 && baseUnit > units[0]) {
//                 baseUnit = units[units.indexOf(baseUnit) - 1];
//             }
//         }
//     }
// }


// Item {
//     id: root
//     anchors.fill: parent

//     property string title
//     property PageContext context

//     property real offsetX: 0
//     property real offsetY: 0
//     property bool dragging: false
//     property real initialX: 0
//     property real initialY: 0

//     property real baseSpacing: 50 // 基础间距（表示 1 米）
//     property real scaleFactor: 1.0
//     property real minScale: 0.5
//     property real maxScale: 5.0
//     property bool zoomAtMouse: false // 缩放方式：false 为画布中心，true 为鼠标点击位置

//     Canvas {
//         id: canvas
//         anchors.fill: parent

//         MouseArea {
//             id: dragArea
//             anchors.fill: parent
//             acceptedButtons: Qt.LeftButton | Qt.MiddleButton

//             onWheel: {
//                 var delta = wheel.angleDelta.y / 120;
//                 var oldScale = scaleFactor;
//                 var newScale = scaleFactor + delta * 0.1;
//                 newScale = Math.max(minScale, Math.min(maxScale, newScale));

//                 if (newScale !== oldScale) {
//                     var centerX = zoomAtMouse ? wheel.x : canvas.width / 2;
//                     var centerY = zoomAtMouse ? wheel.y : canvas.height / 2;

//                     // 根据缩放中心调整偏移
//                     offsetX = (offsetX - centerX) * (newScale / oldScale) + centerX;
//                     offsetY = (offsetY - centerY) * (newScale / oldScale) + centerY;

//                     scaleFactor = newScale;

//                     // 动态调整基础间距
//                     if (baseSpacing * scaleFactor > 100) {
//                         baseSpacing /= 2;
//                         scaleFactor /= 2;
//                     } else if (baseSpacing * scaleFactor < 25) {
//                         baseSpacing *= 2;
//                         scaleFactor *= 2;
//                     }

//                     canvas.requestPaint();
//                 }
//             }

//             onPressed: {
//                 dragging = true;
//                 initialX = mouse.x;
//                 initialY = mouse.y;
//             }

//             onReleased: {
//                 dragging = false;
//             }

//             onPositionChanged: {
//                 if (dragging) {
//                     offsetX += mouse.x - initialX;
//                     offsetY += mouse.y - initialY;
//                     initialX = mouse.x;
//                     initialY = mouse.y;
//                     canvas.requestPaint();
//                 }
//             }
//         }

//         onPaint: {
//             var ctx = canvas.getContext("2d");

//             ctx.clearRect(0, 0, canvas.width, canvas.height);
//             drawGrid(ctx);
//             drawAxes(ctx);
//             drawScale(ctx);
//         }

//         function drawGrid(ctx) {
//             ctx.strokeStyle = "#000000";
//             ctx.lineWidth = 1;

//             var spacing = baseSpacing * scaleFactor;

//             var startX = -offsetX % spacing;
//             var startY = -offsetY % spacing;

//             for (var x = startX; x < canvas.width; x += spacing) {
//                 ctx.beginPath();
//                 ctx.moveTo(x, 0);
//                 ctx.lineTo(x, canvas.height);
//                 ctx.stroke();
//             }

//             for (var y = startY; y < canvas.height; y += spacing) {
//                 ctx.beginPath();
//                 ctx.moveTo(0, y);
//                 ctx.lineTo(canvas.width, y);
//                 ctx.stroke();
//             }
//         }

//         function drawAxes(ctx) {
//             ctx.strokeStyle = "#FF0000";
//             ctx.lineWidth = 2;

//             ctx.beginPath();
//             ctx.moveTo(0, canvas.height / 2 + offsetY);
//             ctx.lineTo(canvas.width, canvas.height / 2 + offsetY);
//             ctx.stroke();

//             ctx.beginPath();
//             ctx.moveTo(canvas.width / 2 + offsetX, 0);
//             ctx.lineTo(canvas.width / 2 + offsetX, canvas.height);
//             ctx.stroke();
//         }

//         function drawScale(ctx) {
//             var scaleLength = baseSpacing * scaleFactor;

//             ctx.strokeStyle = "#0000FF";
//             ctx.lineWidth = 2;

//             var scaleX = 20;
//             var scaleY = canvas.height - 40;

//             ctx.beginPath();
//             ctx.moveTo(scaleX, scaleY);
//             ctx.lineTo(scaleX + scaleLength, scaleY);
//             ctx.stroke();

//             ctx.font = "14px Arial";
//             ctx.fillStyle = "#0000FF";
//             ctx.fillText("Scale: 1 grid = " + (1 / scaleFactor).toFixed(2) + " m", scaleX, scaleY - 10);
//         }
//     }
// }



// Item{
//     id:root

//     anchors.fill: parent

//     property string title
//     property PageContext context


//     // 鼠标拖动偏移量
//     property real offsetX: 0 // 水平方向偏移量
//     property real offsetY: 0 // 垂直方向偏移量

//     // 记录拖动状态
//     property bool dragging: false
//     property real initialX: 0
//     property real initialY: 0


//     // 固定的框线基础间距（表示 1 米）
//     property real baseSpacingX: 50 // 水平方向框线间距（50px表示1米）
//     property real baseSpacingY: 50 // 垂直方向框线间距（50px表示1米）

//     // 当前缩放因子
//     property real scaleFactor: 1.0

//     // 缩放范围
//     property real minScale: 0.5
//     property real maxScale: 5.0

//     Canvas {
//         id: canvas
//         anchors.fill: parent


//         // 鼠标事件处理（包括拖动和缩放）
//         MouseArea {
//             id: dragArea
//             anchors.fill: parent
//             acceptedButtons: Qt.LeftButton | Qt.MiddleButton

//             onWheel: {
//                 var delta = wheel.angleDelta.y / 120; // 每次滚轮滚动的级别
//                 var newScale = scaleFactor + delta * 0.1; // 缩放步长
//                 scaleFactor = Math.max(minScale, Math.min(maxScale, newScale)); // 限制缩放范围
//                 canvas.requestPaint(); // 请求重绘
//             }

//             onPressed: {
//                 dragging = true;
//                 initialX = mouse.x;
//                 initialY = mouse.y;
//             }

//             onReleased: {
//                 dragging = false;
//             }

//             onPositionChanged: {
//                 if (dragging) {
//                     var deltaX = mouse.x - initialX;
//                     var deltaY = mouse.y - initialY;
//                     offsetX += deltaX;
//                     offsetY += deltaY;
//                     initialX = mouse.x;
//                     initialY = mouse.y;
//                     canvas.requestPaint(); // 请求重绘
//                 }
//             }
//         }

//         onPaint: {
//             var ctx = canvas.getContext("2d");

//             // 清除画布
//             ctx.clearRect(0, 0, canvas.width, canvas.height);

//             // 绘制格网线
//             drawGrid(ctx);

//             // 绘制坐标轴
//             drawAxes(ctx);

//             // 绘制比例尺
//             drawScale(ctx);
//         }

//         function drawGrid(ctx) {
//             // 设置格网线颜色
//             ctx.strokeStyle = "#000000";
//             ctx.lineWidth = 1;

//             // 计算动态框线间距（基础间距乘以缩放因子）
//             var spacingX = baseSpacingX * scaleFactor;
//             var spacingY = baseSpacingY * scaleFactor;

//             // 计算水平和垂直框线数量
//             var horizontalLinesCount = Math.floor(canvas.height / spacingY);
//             var verticalLinesCount = Math.floor(canvas.width / spacingX);

//             // 绘制垂直框线
//             for (var i = -verticalLinesCount; i <= verticalLinesCount; i++) {
//                 var x = canvas.width / 2 + i * spacingX + offsetX;
//                 ctx.beginPath();
//                 ctx.moveTo(x, 0);          // 从顶部开始
//                 ctx.lineTo(x, canvas.height); // 到达底部
//                 ctx.stroke();
//             }

//             // 绘制水平框线
//             for (var j = -horizontalLinesCount; j <= horizontalLinesCount; j++) {
//                 var y = canvas.height / 2 + j * spacingY + offsetY;
//                 ctx.beginPath();
//                 ctx.moveTo(0, y);           // 从左侧开始
//                 ctx.lineTo(canvas.width, y); // 到达右侧
//                 ctx.stroke();
//             }
//         }

//         function drawAxes(ctx) {
//             // 设置坐标轴的样式
//             ctx.strokeStyle = "#FF0000";  // 坐标轴颜色
//             ctx.lineWidth = 2;

//             // 绘制 X 轴
//             ctx.beginPath();
//             ctx.moveTo(0, canvas.height / 2 + offsetY);
//             ctx.lineTo(canvas.width, canvas.height / 2 + offsetY);
//             ctx.stroke();

//             // 绘制 Y 轴
//             ctx.beginPath();
//             ctx.moveTo(canvas.width / 2 + offsetX, 0);
//             ctx.lineTo(canvas.width / 2 + offsetX, canvas.height);
//             ctx.stroke();

//             // 添加坐标单位标签
//             ctx.font = "14px Arial";
//             ctx.fillStyle = "#FF0000";

//             // 在坐标轴上显示单位
//             ctx.fillText("X (m)", canvas.width - 50, canvas.height / 2 + offsetY - 10);
//             ctx.fillText("Y (m)", canvas.width / 2 + offsetX + 10, 20);
//         }

//         function drawScale(ctx) {
//             // 动态调整比例尺长度
//             var scaleLength = baseSpacingX * scaleFactor;

//             // 设置比例尺颜色
//             ctx.strokeStyle = "#0000FF";
//             ctx.lineWidth = 2;

//             // 比例尺的固定位置
//             var scaleX = 20;  // 比例尺起始的 X 坐标（固定）
//             var scaleY = canvas.height - 40;  // 比例尺的 Y 坐标（固定）

//             // 画比例尺线段
//             ctx.beginPath();
//             ctx.moveTo(scaleX, scaleY);
//             ctx.lineTo(scaleX + scaleLength, scaleY);
//             ctx.stroke();

//             // 标记比例尺的起始点和结束点
//             ctx.beginPath();
//             ctx.moveTo(scaleX, scaleY - 5); // 起始点小标记
//             ctx.lineTo(scaleX, scaleY + 5);
//             ctx.moveTo(scaleX + scaleLength, scaleY - 5); // 结束点小标记
//             ctx.lineTo(scaleX + scaleLength, scaleY + 5);
//             ctx.stroke();

//             // 绘制比例尺的刻度标记
//             var scaleDivisionCount = 5; // 比例尺上显示的刻度数
//             var divisionSpacing = scaleLength / scaleDivisionCount;

//             for (var i = 1; i < scaleDivisionCount; i++) {
//                 var x = scaleX + i * divisionSpacing;
//                 ctx.beginPath();
//                 ctx.moveTo(x, scaleY - 3); // 刻度线
//                 ctx.lineTo(x, scaleY + 3);
//                 ctx.stroke();
//             }

//             // 标注比例尺的单位（如果需要）
//             ctx.font = "14px Arial";
//             ctx.fillStyle = "#0000FF";
//             ctx.fillText("Scale: " + scaleLength + " px", scaleX + scaleLength + 10, scaleY + 5);
//         }
//     }
// }


