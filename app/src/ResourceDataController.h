#pragma once

#include <QObject>
#include <QtQml/qqml.h>
#include <QRandomGenerator>
#include "stdafx.h"

class ResourceDataController : public QObject {
    Q_OBJECT
    Q_PROPERTY_AUTO(QList<QVariantMap>, resource_data)
    Q_PROPERTY_AUTO(QList<QVariantMap>, station_data)
    Q_PROPERTY_AUTO(QList<QVariantMap>, obsfile_data)
    Q_PROPERTY_AUTO(QList<QVariantMap>, baseline_data)


    QML_SINGLETON
    QML_ELEMENT
public:
    explicit ResourceDataController(QObject *parent = nullptr);
    Q_SIGNAL void loadDataStart();
    Q_SIGNAL void loadDataSuccess();
    Q_INVOKABLE void loadData(const QString &path = "0", int level = 4);
    // Q_INVOKABLE QVariantMap generateRowData();


    Q_INVOKABLE QVariantMap generateStationData(const QString &station_name);
    Q_INVOKABLE QVariantMap generateObsFileData(const QString &station_name);
    Q_INVOKABLE QVariantMap generateBaselineData(const QString &station_start,const QString &station_end);
    Q_INVOKABLE QVariantMap generateResourceData();


private:
    QList<QVariantMap> dig(const QString &path, int level);



private:


    //站点信息
    //站点名
    QStringList m_station = {"HBJM01","HBJM02","HBJM03","HBJM04","HBJM05","HBJM06","HBJM07","HBJM08","HBJM09","HBSZ01","HBSZ05","HBTM01","HBXY10","HBXY11" };
    //经纬度、高程，随机生成（ECEF坐标、当地坐标，通过转换获得）

    //观测文件信息
    //文件名：[测站]+202410300000.240
    //文件类型：静态
    //测站：随机站点名
    //开始日期：随机日期（2024）
    //结束日期：[开始日期]+[时间段]
    //时间段：随机时长（0-86400s）
    //测量方式：天线座底部
    //测量天线高：0.0000
    //天线相位中心：0.0000
    //天线座底部高：0.0000
    //天线厂商：Unknown
    //天线类型：Unknown
    //接收机：
    //接收机类型：
    //文件路径：可执行程序当前路径+[文件名]

           //基线信息
           //基线ID:B+index+([文件名]+[文件名])
           //基线类型：静态
           //起点：[文件测站]
           //终点：[文件测站]
           //解算类型：未解算/固定解
           //利用率：未解算：0/固定解（93-100）
           //同步时间：随机秒数（7200-86400）
           //Ratio:(0.0-99.0)
           //RMS:0.000-0.0300
           //合格：合格/检查
           //Dx、Dy、Dz
           //StdX、StdY、StdZ
           //距离：sqrt(x2+y2+z2)
           //使用：是
           //平距
           //斜距
           //高差
           //NS前进方位角
           //椭球距离
           //Δ大地高
           //RDOP
           //PDOP
           //HDOP
           //VDOP


};
