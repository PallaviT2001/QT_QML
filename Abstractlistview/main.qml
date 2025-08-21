/*import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Phonebook"

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 10

        Row {
            spacing: 10
            TextField {
                id: nameField
                placeholderText: "Name"
                width: 200
            }
            TextField {
                id: numberField
                placeholderText: "Number"
                width: 200
                inputMethodHints: Qt.ImhDigitsOnly
            }
            Button {
                text: "Add"
                onClicked: {
                    if (nameField.text !== "" && numberField.text !== "")
                        ContactModel.addContact(nameField.text, numberField.text)
                    nameField.text = ""
                    numberField.text = ""
                }
            }
        }

        Rectangle {
            width: parent.width
            height: 2
            color: "black"
        }

        ShowList {
            anchors.fill: parent
        }
    }
}*/


import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Phone Book"

    // Main data model
    ListModel {
        id: optionsModel
        ListElement { name: "Add Contact" }
        ListElement { name: "Search Contact" }
        ListElement { name: "View Contact List" }
    }

    // Simple ListView with single delegate
    ListView {
        id: listView
        anchors.fill: parent
        model: optionsModel
        spacing: 10

        delegate: Rectangle {
            width: parent.width
            height: 50
            color: "lightgrey"
            border.color: "black"
            border.width: 1

            Text {
                anchors.centerIn: parent
                text: name
                font.pixelSize: 18
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (name === "Add Contact") {
                        console.log("Add Contact Page Opened")
                    } else if (name === "Search Contact") {
                        console.log("Search Contact Page Opened")
                    } else if (name === "View Contact List") {
                        console.log("Contact List Page Opened")
                    }
                }
            }
        }
    }
}

