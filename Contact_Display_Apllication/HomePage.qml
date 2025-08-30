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
        }

        Button {
            text: "Call History"
            width: homePage.width / 2
            height: 50
            onClicked: pageLoader.source = "CallHistory.qml"
        }

        Button {
            text: "WhatsApp"
            width: homePage.width / 2
            height: 50
            onClicked: pageLoader.source = "WhatsAppList.qml"
        }
    }
}


