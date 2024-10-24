#pragma once
#include <QQmlEngine>
#include <qqmlcontext.h>
#include "Version.h"
#include "AppInfo.h"
#include "CircularReveal.h"
// #include "component/FileWatcher.h"
#include "FpsItem.h"
// #include "component/OpenGLItem.h"
 #include "SettingsHelper.h"
// #include "helper/InitializrHelper.h"
// #include "helper/TranslateHelper.h"
// #include "helper/Network.h"
// #include "extra/ExtraIconsDef.h"
// #include "test.h"


inline void Register_qml_frame_type(){

    int major = 1;
    int minor = 0;

    // qmlRegisterType<DataClass>("frame", major, minor, "DataClass");
    // qmlRegisterType<TestClass>("frame", major, minor, "TestClass");
    qmlRegisterType<CircularReveal>("Frame", major, minor, "CircularReveal");
    // qmlRegisterType<FileWatcher>("frame", major, minor, "FileWatcher");
    qmlRegisterType<FpsItem>("frame", major, minor, "FpsItem");
    // qmlRegisterType<NetworkCallable>("frame",major,minor,"NetworkCallable");
    // qmlRegisterType<NetworkParams>("frame",major,minor,"NetworkParams");
    // qmlRegisterType<OpenGLItem>("frame",major,minor,"OpenGLItem");
    // qmlRegisterUncreatableMetaObject(NetworkType::staticMetaObject, "frame", major, minor, "NetworkType", "Access to enums & flags only");
    // qmlRegisterUncreatableMetaObject(Extra_Regular_Icons::staticMetaObject,"frame", major, minor,"RegularIcons", "Access to enums only");
}


inline void Register_qml_frame_define(QQmlContext *context)
{
    context->setContextProperty("PROJECT_SET_NAME",PROJECT_SET_NAME);
    context->setContextProperty("PROJECT_SET_VERSION",PROJECT_SET_VERSION);
    context->setContextProperty("PROJECT_GIT_VERSION",PROJECT_GIT_VERSION);
    context->setContextProperty("PROJECT_TAG_VERSION",PROJECT_TAG_VERSION);
    context->setContextProperty("PORJECT_UPDATE_TIME",PORJECT_UPDATE_TIME);
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
    context->setContextProperty("EXE_APPLICATION_NAME",EXE_APPLICATION_NAME);
    context->setContextProperty("EXE_APPLICATION_DISPLAY_NAME",EXE_APPLICATION_DISPLAY_NAME);
    context->setContextProperty("EXE_APPLICATION_VERSION",EXE_APPLICATION_VERSION);
    context->setContextProperty("EXE_ORGANIZATION_NAME",EXE_ORGANIZATION_NAME);
    context->setContextProperty("EXE_ORGANIZATION_DOMAIN",EXE_ORGANIZATION_DOMAIN);
}

inline void Register_qml_frame_instance(QQmlContext *context)
{
#ifdef QT_DEBUG  //传递程序的构建类型，来隐藏部分Debug调试使用的功能
    context->setContextProperty("isDebugBuild",true);
#else
    context->setContextProperty("isDebugBuild",false);
#endif

    // context->setContextProperty("AppInfo",AppInfo::getInstance());
    context->setContextProperty("SettingsHelper",SettingsHelper::getInstance());
    // context->setContextProperty("InitializrHelper",InitializrHelper::getInstance());
    // context->setContextProperty("TranslateHelper",TranslateHelper::getInstance());
    // context->setContextProperty("Network",Network::getInstance());


}







