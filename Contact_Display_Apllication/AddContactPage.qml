import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: addContactPage
    anchors.fill: parent
    color: "lightgray"

    Column {
        anchors.centerIn: parent
        spacing: 15

        TextField {
            id: nameField
            width: addContactPage.width / 2
            height: 50
            placeholderText: "Enter Name"
            placeholderTextColor: "White"
            font.pixelSize: 18
            color: "white"
        }

        TextField {
            id: numberField
            width: addContactPage.width / 2
            height: 50
            placeholderText: "Enter Number"
            placeholderTextColor: "White"
            font.pixelSize: 18
            color: "white"
        }

        TextField {
            id: imageField
            placeholderText: "Image URL (optional)"
            width: addContactPage.width / 2
            height: 50
            placeholderTextColor: "White"
            font.pixelSize: 18
            color: "white"
        }

        Row{
            spacing: 40

            Button {
                text: "Save"

                onClicked:
                {
                    if (nameField.text !== "" && numberField.text !== "")
                    {
                        contactModel.addContact(nameField.text,numberField.text,imageField.text)
                        pageLoader.source = "PhoneBookPage.qml"
                    }
                    else
                    {
                        console.log("Please enter name and number")
                    }
                }
            }

            Button
            {
                text: "Back"
                onClicked: pageLoader.source = "PhoneBookPage.qml"
            }
        }
    }
}
