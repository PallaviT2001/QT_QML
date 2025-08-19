#include "Backendoperations.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    BackendOperations backend;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("backend", &backend);
    engine.load(QUrl(QStringLiteral("qrc:/calculator_project/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
