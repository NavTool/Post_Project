#include "AppInfo.h"
#include "Log.h"
#include <QGuiApplication>
#include <QProcess>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QtQml/qqmlextensionplugin.h>

#ifdef FLUENTUI_BUILD_STATIC_LIB
Q_IMPORT_QML_PLUGIN(FluentUIPlugin)
#endif

int main(int argc, char *argv[]) {
  qputenv("QT_QUICK_CONTROLS_STYLE", "FluentUI");
  QGuiApplication::setOrganizationName(PROJECT_COMPANY);
  QGuiApplication::setOrganizationDomain(PROJECT_DOMAIN);
  QGuiApplication::setApplicationName(PROJECT_APP_NAME);
  QGuiApplication::setApplicationDisplayName(PROJECT_APP_NAME);
  QGuiApplication::setApplicationVersion(PROJECT_VERSION);
  Log::setup(argv, PROJECT_APP_NAME);
  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine;
  engine.addImportPath(":/qt/qml");
  AppInfo::getInstance()->init(&engine);
  const QUrl url(u"qrc:/qt/qml/NavTool/App.qml"_qs);
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);
  const int exec = QGuiApplication::exec();
  return exec;
}
