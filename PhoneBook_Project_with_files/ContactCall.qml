import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: contactCallPage
    anchors.fill: parent
    color: "white"

    property string contactName: ""
    property string contactNumber: ""

    Column {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            width: 150
            height: 150
            radius: 75
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

        Rectangle {
            width: 120
            height: 50
            radius: 25
            color: "red"
            anchors.horizontalCenter: parent.horizontalCenter

            Row {
                anchors.centerIn: parent
                spacing: 8

                Image {
                    source: "Images/Callcutimage.png"
                    width: 24
                    height: 24
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    text: "End Call"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 16
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    pageLoader.source = "HomePage.qml"
                }
            }
        }
    }
}

