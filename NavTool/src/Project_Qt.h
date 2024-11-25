#pragma once

#include <QObject>
#include <QtQml/qqml.h>
#include "stdafx.h"
#include "Project.h"



//Qt类，继承所有的CPP的方法，调用CPP的方法
class Project_Qt:protected Project_CPP, public QObject
{
private:
    Q_OBJECT

    Q_PROPERTY_AUTO (QVariantMap,project_info)
    Q_PROPERTY_AUTO(QList<QVariantMap>, station_map)
    Q_PROPERTY_AUTO(QList<QVariantMap>, obsfile_map)
    Q_PROPERTY_AUTO(QList<QVariantMap>, baseline_map)

    Q_PROPERTY_AUTO(QList<QVariantMap>, result_map)

    Q_PROPERTY_AUTO(QList<QVariantMap>, task_map)

    QML_SINGLETON
    QML_ELEMENT
public:
    Project_Qt(/* args */);
    ~Project_Qt();



};
