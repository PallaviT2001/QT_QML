import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: 600
        height: 450
        color: "white"
        radius: 10
        anchors.centerIn: parent

        Column {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 40
            anchors.rightMargin: 40
            spacing: 20

            // Production Button
            Button {
                background: Rectangle {
                    implicitWidth: 140
                    implicitHeight: 80
                    color: "orange"
                    radius: 8
                }
                contentItem: Text {
                    text: "Production"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }

                onClicked: console.log("Production button clicked")

            }

            // Setup Button
            Button {
                background: Rectangle {
                    implicitWidth: 140
                    implicitHeight: 80
                    color: "orange"
                    radius: 8
                }
                contentItem: Text {
                    text: "Setup"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }
                onClicked: console.log("Setup button clicked")
            }

            // Support Button
            Button {
                background: Rectangle {
                    implicitWidth: 140
                    implicitHeight: 80
                    color: "orange"
                    radius: 8
                }
                contentItem: Text {
                    text: "Support"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }
                onClicked: console.log("Support button clicked")
            }

            Button{
                background: Rectangle{
                    implicitWidth: 140
                    implicitHeight: 80
                    color: "orange"
                    radius :8

                }

                contentItem: Text{
                    text: "Tools"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }
                onClicked: console.log("Tools button clicked")
            }
        }
    }
}


