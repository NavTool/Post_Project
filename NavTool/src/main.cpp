#include "AppInfo.h"
#include "Log.h"
#include "SettingsHelper.h"
#include <QGuiApplication>
#include <QProcess>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QtQml/qqmlextensionplugin.h>
#include <QFont>
#include "Version.h"
#include "module/module.hpp"
#include "frame.hpp"

#ifdef FLUENTUI_BUILD_STATIC_LIB
Q_IMPORT_QML_PLUGIN(FluentUIPlugin)
#endif

int main(int argc, char *argv[])
{
    qputenv("QT_QUICK_CONTROLS_STYLE", "FluentUI");

    QGuiApplication::setOrganizationName(EXE_ORGANIZATION_NAME);
    QGuiApplication::setOrganizationDomain(EXE_ORGANIZATION_DOMAIN);
    QGuiApplication::setApplicationName(EXE_APPLICATION_NAME);
    QGuiApplication::setApplicationDisplayName(EXE_APPLICATION_DISPLAY_NAME);
    QGuiApplication::setApplicationVersion(EXE_APPLICATION_VERSION);

    Log::setup(argv, EXE_APPLICATION_DISPLAY_NAME);
    SettingsHelper::getInstance()->init(argv);

    QGuiApplication app(argc, argv);

#ifdef Q_OS_WIN
    QFont font = QGuiApplication::font();
    font.setFamily("微软雅黑");
    QGuiApplication::setFont(font);
#endif
    // QGuiApplication::setWindowIcon(QIcon(":/qt/qml/Gallery/res/image/logo.png"));

    QQmlApplicationEngine engine;


    Register_qml_module(); //将自定义模块类型注册到qml中
    Register_qml_frame_type(); //将框架模块注类型册到qml中
    Register_qml_frame_define(engine.rootContext());//注册宏定义到qml中
    Register_qml_frame_instance(engine.rootContext());//注册单例到qml中


    engine.addImportPath(":/qt/qml");

    AppInfo::getInstance()->init(&engine);

    const QUrl url(u"qrc:/qt/qml/NavTool/qml/App.qml"_qs);

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(url);

    const int exec = QGuiApplication::exec();

    if (exec == 931) {
#ifndef __EMSCRIPTEN__
        QProcess::startDetached(qApp->applicationFilePath(), qApp->arguments());
#endif
    }

    return exec;
}
