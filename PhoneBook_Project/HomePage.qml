import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: homePage
    anchors.fill: parent
    color: "pink"

    Column {
        anchors.centerIn: parent
        spacing: 16

        Button {
            text: "Phone Book"
            width: homePage.width / 2
            height: 50
            onClicked: pageLoader.source = "PhoneBookPage.qml"

            background: Rectangle{
                color: "blue"
                anchors.fill: parent
                border.color: "Black"
                border.width: 2
                radius: 180
            }
        }

        Button {
            text: "Call History"
            width: homePage.width / 2
            height: 50
            onClicked: pageLoader.source = "CallHistoryPage.qml"

            background: Rectangle{
                color: "red"
                anchors.fill: parent
                border.color: "Black"
                border.width: 2
                radius: 180
            }
        }

        Button {
            text: "WhatsApp"
            width: homePage.width / 2
            height: 50
            onClicked: pageLoader.source = "WhatsAppPage.qml"
            background: Rectangle{
                color: "green"
                anchors.fill: parent
                border.color: "Black"
                border.width: 2
                radius: 180
            }
        }
    }
}
