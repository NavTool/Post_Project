#pragma once
#include <QQmlEngine>
#include <qqmlcontext.h>
#include "Version.h"
#include "AppInfo.h"


#include <QObject>
#include <QtQml>


inline void Register_qml_frame_define(QQmlContext *context)
{
#ifdef QT_DEBUG  //传递程序的构建类型，来隐藏部分Debug调试使用的功能
    context->setContextProperty("isDebugBuild",true);
#else
    context->setContextProperty("isDebugBuild",false);
#endif

    context->setContextProperty("INFO_APP_NAME",INFO_APP_NAME);
    context->setContextProperty("INFO_VERSION_TYPE",INFO_VERSION_TYPE);
    context->setContextProperty("INFO_APP_VERSION",INFO_APP_VERSION);
    context->setContextProperty("INFO_GIT_VERSION",INFO_GIT_VERSION);
    context->setContextProperty("INFO_TAG_VERSION",INFO_TAG_VERSION);
    context->setContextProperty("INFO_SUBMIT_TIME",INFO_SUBMIT_TIME);
    context->setContextProperty("BUILD_SYSTEM",BUILD_SYSTEM);
    context->setContextProperty("BUILD_SYSTEM_PROCESSOR",BUILD_SYSTEM_PROCESSOR);
    context->setContextProperty("BUILD_COMPILER_VERSION",BUILD_COMPILER_VERSION);
    context->setContextProperty("BUILD_DATE",BUILD_DATE);
    context->setContextProperty("SUPPORT_DEVELOPER",SUPPORT_DEVELOPER);
    context->setContextProperty("SUPPORT_OFFICIAL_DOMAIN",SUPPORT_OFFICIAL_DOMAIN);
    context->setContextProperty("SUPPORT_PROJECT_DOMAIN",SUPPORT_PROJECT_DOMAIN);
    context->setContextProperty("SUPPORT_FEEDBACK",SUPPORT_FEEDBACK);
    context->setContextProperty("SUPPORT_COPYRIGHT",SUPPORT_COPYRIGHT);

}


class DefFileFormat: public QObject {
    Q_OBJECT
    QML_ELEMENT
public:
    enum FileFormat {
        RINEX = 0x0000,
        RTCM3 = 0x0001,
        CNB = 0x0002,
        UNKNOWN=0x00004,
    };

    Q_DECLARE_FLAGS(FileFormats, FileFormat)
    Q_FLAG(FileFormats)

};

class DefStationType: public QObject {
    Q_OBJECT
    QML_ELEMENT
public:

    enum StationType {
        Dynamic = 0x0000,
        Static = 0x0001,
    };

    Q_DECLARE_FLAGS(StationTypes, StationType)
    Q_FLAG(StationType)

};














