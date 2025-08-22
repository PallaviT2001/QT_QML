import QtQuick 2.15
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
}


