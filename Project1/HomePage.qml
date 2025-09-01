import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: homePage
    anchors.fill: parent
    color: "lightgrey"

    Column {
        anchors.centerIn: parent
        spacing: 16

        Button {
            text: "Phone Book"
            width: homePage.width / 2
            height: 50

            background: Rectangle{
                color: "blue"
                anchors.fill: parent
                border.color: "Black"
                border.width: 2
                radius: 180
            }
            onClicked: {
                modelManager.createPhoneBook();
                pageLoader.source = "PhoneBookPage.qml";
            }
        }

        Button {
            text: "Call History"
            width: homePage.width / 2
            height: 50
            background: Rectangle{
                color: "red"
                anchors.fill: parent
                border.color: "Black"
                border.width: 2
                radius: 180
            }
            onClicked: {
                modelManager.createCallHistory();
                pageLoader.source = "CallHistoryPage.qml";
            }
        }

        Button {
            text: "WhatsApp"
            width: homePage.width / 2
            height: 50

            background: Rectangle{
                color: "green"
                anchors.fill: parent
                border.color: "Black"
                border.width: 2
                radius: 180
            }
            onClicked: {
                modelManager.createWhatsApp();
                pageLoader.source = "WhatsAppList.qml";
            }
        }
    }
}

