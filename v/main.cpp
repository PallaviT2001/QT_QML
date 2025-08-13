#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QAccessible>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.loadData(R"(
        import QtQuick 2.15
        import QtQuick.Controls 2.15

        ApplicationWindow {
            visible: true
            width: 400
            height: 300

            Page {
                objectName: "testPage"   // Important: set objectName for C++ access
                width: 400
                height: 300
            }
        }
    )");

    if (engine.rootObjects().isEmpty()) {
        qWarning() << "Failed to load QML root object";
        return -1;
    }

    QObject *page = engine.rootObjects().first()->findChild<QObject*>("testPage");
    if (!page) {
        qWarning() << "Failed to find Page object";
        return -1;
    }

    QAccessibleInterface *iface = QAccessible::queryAccessibleInterface(page);
    if (iface) {
        printf("Accessible role enum value: %d\n", iface->role());
    } else {
        printf("No accessible interface available\n");
    }

    return app.exec();
}
