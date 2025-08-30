import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: whatsappPage
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        ListView {
            id: whatsappList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: contactModel

            delegate: Rectangle {
                width: whatsappList.width
                height: 72
                color: "white"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 12

                    // Avatar (WhatsApp green circle)
                    Rectangle {
                        width: 48
                        height: 48
                        radius: 24
                        color: "#25D366"
                        Layout.alignment: Qt.AlignVCenter
                        Text {
                            anchors.centerIn: parent
                            text: (name && name.length > 0) ? name.charAt(0).toUpperCase() : ""
                            color: "white"
                            font.bold: true
                            font.pixelSize: 18
                        }
                    }

                    // Middle: name + last message (takes remaining width)
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 4

                        // Top row: name (left) and time (right)
                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: name
                                font.pixelSize: 16
                                font.bold: true
                                elide: Text.ElideRight
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                // ensure the name does not push the time out
                                Layout.preferredWidth: whatsappList.width * 0.55
                            }

                            Text {
                                text: callTime
                                font.pixelSize: 12
                                color: "gray"
                                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            }
                        }

                        // Second line: last message (single line, elide if long)
                        Text {
                            text: shortMessage
                            font.pixelSize: 13
                            color: "gray"
                            elide: Text.ElideRight
                            wrapMode: Text.NoWrap
                            Layout.fillWidth: true
                        }
                    }
                }

                // Separator line
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    height: 1
                    color: "#e0e0e0"
                }
            }
        }

        Button {
            text: "Back"
            Layout.alignment: Qt.AlignHCenter
            onClicked: pageLoader.source = "HomePage.qml"
        }
    }
}
