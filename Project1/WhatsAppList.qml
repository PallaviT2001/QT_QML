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
            anchors.fill: parent
            clip: true
            model: modelManager.contactModel
            delegate: Rectangle {
                width: whatsappList.width
                height: 72
                color: "white"

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 12

                    // Avatar circle (initial)
                    Rectangle {
                        width: 48
                        height: 48
                        radius: 24
                        color: "#25D366"
                        Row {
                            anchors.centerIn: parent
                            Text {
                                text: (name && name.length > 0) ? name.charAt(0).toUpperCase() : ""
                                color: "white"
                                font.bold: true
                                font.pixelSize: 18
                            }
                        }
                    }

                    Column {
                        width: whatsappList.width * 0.6
                        spacing: 4
                        Row {
                            Text {
                                text: name
                                font.pixelSize: 16
                                font.bold: true
                                elide: Text.ElideRight
                                width: whatsappList.width * 0.55
                            }
                            Text {
                                text: callTime
                                font.pixelSize: 12
                                color: "gray"
                                anchors.right: parent.right
                            }
                        }
                        Text {
                            text: shortMessage
                            font.pixelSize: 13
                            color: "gray"
                            elide: Text.ElideRight
                            wrapMode: Text.NoWrap
                            width: whatsappList.width * 0.7
                        }
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
