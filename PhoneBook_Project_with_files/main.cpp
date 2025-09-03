#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ContactModelManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    ContactModelManager manager;
    engine.rootContext()->setContextProperty("modelManager", &manager);

    const QUrl url(QStringLiteral("qrc:/PhoneBook_Project_with_files/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(url);   // Only one load!

    return app.exec();
}

