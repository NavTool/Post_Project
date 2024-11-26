#include <QtQml/qqmlextensionplugin.h>
#include <QtWidgets/QApplication>
#include <QApplication>
#include <QDir>
#include <QLoggingCategory>
#include <QNetworkProxy>
#include <QProcess>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QSslConfiguration>

#include "Version.h"
#include "AppInfo.h"

#include "src/frame.hpp"
#include "src/helper/SettingsHelper.h"
#include "src/helper/TranslateHelper.h"
#include "src/helper/Network.h"
#include "src/helper/Log.h"


#include "module/module.hpp"


#ifdef FLUENTUI_BUILD_STATIC_LIB
#if (QT_VERSION > QT_VERSION_CHECK(6, 2, 0))
Q_IMPORT_QML_PLUGIN(FluentUIPlugin)
#endif
#include <FluentUI.h>
#endif

#ifdef WIN32
#include "app_dmp.h"
#endif

int main(int argc, char *argv[])
{
    const char *uri = "frame";

#ifdef WIN32
    ::SetUnhandledExceptionFilter(MyUnhandledExceptionFilter);
    qputenv("QT_QPA_PLATFORM","windows:darkmode=2");
#endif

#if (QT_VERSION >= QT_VERSION_CHECK(6, 0, 0))
    qputenv("QT_QUICK_CONTROLS_STYLE","Basic");
#else
    qputenv("QT_QUICK_CONTROLS_STYLE","Default");
#endif

#ifdef Q_OS_LINUX
    //fix bug UOSv20 does not print logs
    qputenv("QT_LOGGING_RULES","");
    //fix bug UOSv20 v-sync does not work
    qputenv("QSG_RENDER_LOOP","basic");
#endif


    //设置可执行程序基本信息
    QGuiApplication::setOrganizationName(EXE_ORGANIZATION_NAME);
    QGuiApplication::setOrganizationDomain(EXE_ORGANIZATION_DOMAIN);
    QGuiApplication::setApplicationName(EXE_APPLICATION_NAME);
    QGuiApplication::setApplicationDisplayName(EXE_APPLICATION_DISPLAY_NAME);
    QGuiApplication::setApplicationVersion(EXE_APPLICATION_VERSION);
    QGuiApplication::setQuitOnLastWindowClosed(false);

    //初始化全局配置
    SettingsHelper::getInstance()->init(argv);
    Log::setup(argv,uri);

#if (QT_VERSION >= QT_VERSION_CHECK(6, 0, 0))
    QQuickWindow::setGraphicsApi(QSGRendererInterface::OpenGL);
#endif
#if (QT_VERSION < QT_VERSION_CHECK(6, 0, 0))
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
#if (QT_VERSION >= QT_VERSION_CHECK(5, 14, 0))
    QGuiApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::PassThrough);
#endif
#endif

    // QGuiApplication app(argc, argv);
    QApplication app(argc, argv);//由QGuiApplication切换为QApplication，来使得可以只用chart功能

    QQmlApplicationEngine engine;

    TranslateHelper::getInstance()->init(&engine);    //初始化翻译模块，载入对应的qm文件，来显示对应语言

    Register_qml_module(); //将自定义模块类型注册到qml中
    Register_qml_frame_type(); //将框架模块注类型册到qml中
    Register_qml_frame_define(engine.rootContext());//注册宏定义到qml中
    Register_qml_frame_instance(engine.rootContext());//注册单例到qml中

    const QUrl url(QStringLiteral("qrc:qml/App.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    const int exec = QApplication::exec();
    if (exec == 931) {
        QProcess::startDetached(qApp->applicationFilePath(), qApp->arguments());
    }

    return app.exec();
}
