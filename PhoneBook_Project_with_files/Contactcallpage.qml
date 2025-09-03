import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: contactCallPage
    anchors.fill: parent
    color: "white"

    property string contactName: ""
    property string contactNumber: ""

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        // Circle Avatar
        Rectangle {
            width: 80
            height: 80
            radius: 40
            color: "orange"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.centerIn: parent
                text: (contactName && contactName.length > 0) ? contactName.charAt(0).toUpperCase() : ""
                color: "blue"
                font.bold: true
                font.pixelSize: 28
            }
        }

        // Name & Number
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8

            Text {
                text: contactName
                font.bold: true
                font.pixelSize: 20
                color: "black"
            }

            Text {
                text: contactNumber
                font.pixelSize: 16
                color: "gray"
            }
        }

        // Call Cut button
        Button {
            text: "End Call"
            width: 120
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter

            background: Rectangle {
                color: "red"
                radius: 25
            }

            onClicked: pageLoader.source = "PhoneBookPage.qml"
        }
    }
}
