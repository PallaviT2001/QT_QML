import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: phoneBookPage
    anchors.fill: parent
    color: "white"

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 10

        ListView {
            id: phoneBookList
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: parent.height - 100
            spacing: 8
            clip: true
            model: contactModel   // assume defined in C++

            delegate: Rectangle {
                width: parent.width
                height: 60
                color: "#f0f0f0"
                radius: 6
                border.color: "gray"

                Row {
                    anchors.centerIn: parent
                    spacing: 12
                    Text { text: contactName; font.bold: true }
                    Text { text: contactNumber }
                }
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Button {
                text: "Add Contact"
                onClicked: pageLoader.source = "AddContactPage.qml"
            }

            Button {
                text: "Back"
                onClicked: pageLoader.source = "HomePage.qml"
            }
        }
    }
}
