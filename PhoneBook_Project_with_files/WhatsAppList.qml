import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: whatsappPage
    anchors.fill: parent
    color: "white"

    Column {
        anchors.fill: parent
        spacing: 0

        ListView {
            id: whatsappList
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: backButton.top
            clip: true
            model: modelManager.contactModel
            spacing: 6

            delegate: Item {
                width: whatsappList.width
                height: 70

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 12

                    Rectangle {
                        width: 50
                        height: 50
                        radius: 25
                        color: "green"
                        anchors.verticalCenter: parent.verticalCenter

                        Text {
                            anchors.centerIn: parent
                            text: (name && name.length > 0) ? name.charAt(0).toUpperCase() : ""
                            color: "pink"
                            font.bold: true
                            font.pixelSize: 18
                        }
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 4
                        width: parent.width - 70

                        Row {
                            width: parent.width
                            spacing: 8

                            Text {
                                text: name
                                font.pixelSize: 16
                                font.bold: true
                                color: "black"
                                elide: Text.ElideRight
                                width: parent.width - callTimeText.width - 10
                            }

                            Text {
                                id: callTimeText
                                text: callTime
                                font.pixelSize: 12
                                color: "gray"
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Text {
                            text: shortMessage
                            font.pixelSize: 14
                            color: "gray"
                            elide: Text.ElideRight
                            width: parent.width
                        }
                    }
                }

                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    height: 1
                    color: "black"
                }
            }
        }

        Button {
            id: backButton
            text: "Back"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            onClicked: pageLoader.source = "HomePage.qml"
        }
    }
}


