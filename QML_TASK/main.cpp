#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QAccessible>
#include <QtQuick/QQuickItem>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.loadData(R"(
        import QtQuick 2.15
        import QtQuick.Controls 2.15

        Page {
            id: testPage
            width: 200
            height: 200
        }
    )");

    if (engine.rootObjects().isEmpty())
        return -1;

    QObject *root = engine.rootObjects().first();
    QQuickItem *pageItem = qobject_cast<QQuickItem*>(root);
    if (!pageItem) {
        qDebug() << "Root is not a QQuickItem!";
        return -1;
    }

    // Get the accessible interface for this object
    QAccessibleInterface *iface = QAccessible::queryAccessibleInterface(pageItem);
    if (!iface) {
        qDebug() << "No accessible interface available for Page!";
        return -1;
    }

    QAccessible::Role role = iface->role();
    qDebug() << "Accessible role enum value:" << role;

    if (role == QAccessible::PageTab)
        qDebug() << "Bug exists: Page identifies as PageTab";
    else
        qDebug() << "No bug: Page role is correct";

    return 0;
}
