import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: phoneBookPage
    width: parent ? parent.width : 550
    height: parent ? parent.height : 1000

    signal backButtonClicked()

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        // Title
        Label {
            text: "Phone Book"
            font.pixelSize: 24
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        // Contact List
        ListView {
            id: phoneBookList
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 8
            clip: true
            model: phoneBookModel   // <-- C++ PhoneBookModel exposed in main.cpp

            delegate: Rectangle {
                width: ListView.view.width
                height: 70
                radius: 10
                color: "#f0f0f0"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 15

                    // Contact Image (Circular)
                    Rectangle {
                        width: 50
                        height: 50
                        radius: width / 2
                        color: "lightgray"
                        clip: true

                        Image {
                            anchors.fill: parent
                            source: contactImage
                            fillMode: Image.PreserveAspectCrop
                        }
                    }

                    // Contact Info
                    ColumnLayout {
                        spacing: 2
                        Label {
                            text: contactName
                            font.bold: true
                            font.pixelSize: 16
                        }
                        Label {
                            text: contactNumber
                            font.pixelSize: 14
                            color: "gray"
                        }
                    }
                }
            }
        }

        // Back Button
        Button {
            text: "Back"
            Layout.alignment: Qt.AlignHCenter
            onClicked: phoneBookPage.backButtonClicked()
        }
    }
}
