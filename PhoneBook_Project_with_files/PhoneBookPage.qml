import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: phoneBookPage
    anchors.fill: parent
    color: "white"

    Rectangle {
        id: searchbar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        height: 40
        radius: 10
        color: "black"
        border.color: "white"

        TextField {
            id: searchfield
            anchors.fill: parent
            anchors.margins: 5
            placeholderText: "Search contact"
            font.pixelSize: 20
            color: "white"

            background: Rectangle {
                radius: 2
                border.color: "gray"
                color: "transparent"
            }
        }
    }

    ListView {
        id: phoneBookList
        anchors.top: searchbar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: backButton.top
        anchors.margins: 10
        clip: true
        spacing: 6
        model: modelManager.contactModel

        delegate: Item {
            width: phoneBookList.width
            height: 70

            Row {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 12

                Rectangle {
                    id: avatar
                    width: 50
                    height: 50
                    radius: 25
                    color: "pink"
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        anchors.centerIn: parent
                        text: (name && name.length > 0) ? name.charAt(0).toUpperCase() : ""
                        color: "blue"
                        font.bold: true
                        font.pixelSize: 18
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            pageLoader.source = "AddContactPage.qml"
                            pageLoader.item.contactIndex = index
                            pageLoader.item.initialName = name
                            pageLoader.item.initialNumber = number
                            pageLoader.item.initialImage = image
                        }
                    }
                }

                Column {
                    spacing: 4
                    anchors.verticalCenter: parent.verticalCenter
                    Text { text: name; font.bold: true }
                    Text { text: number }
                }
            }

            Image {
                id: callIcon
                source: "Images/PhoneBook.png"
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.margins: 12
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                anchors.fill: callIcon
                onClicked: {
                    pageLoader.source = "ContactCall.qml"
                    pageLoader.item.contactName = name
                    pageLoader.item.contactNumber = number
                    pageLoader.item.contactImage = image
                }
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

