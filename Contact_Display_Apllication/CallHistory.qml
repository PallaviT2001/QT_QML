import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: callHistoryPage
    anchors.fill: parent
    color: "white"

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 10

        ListView {
            id: callList
            anchors.fill: parent
            spacing: 8
            clip: true
            model: contactModel

            delegate: Rectangle {
                width: parent.width
                height: 70
                color: "#f9f9f9"
                border.color: "#ddd"

                Row {
                    anchors.centerIn: parent
                    spacing: 12
                    Text { text: name; font.bold: true }
                    Text { text: callTime; color: "gray" }
                    Text {
                        text: isIncoming ? "Incoming" : (isOutgoing ? "Outgoing" : "Missed")
                        color: isIncoming ? "green" : (isOutgoing ? "blue" : "red")
                    }
                }
            }
        }

        Button {
            text: "Back"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: pageLoader.source = "HomePage.qml"
        }
    }
}
