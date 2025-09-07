import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1

Rectangle {
    id: addContactPage
    anchors.fill: parent
    color: "lightgray"

    property int contactIndex: -1
    property string initialName: ""
    property string initialNumber: ""
    property string initialImage: ""

    Column {
        anchors.centerIn: parent
        spacing: 15

        Rectangle {
            id: avatar
            width: 120
            height: 120
            radius: 60
            color: "orange"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.centerIn: parent
                text: (nameField.text && nameField.text.length > 0) ? nameField.text.charAt(0).toUpperCase() : ""
                color: "blue"
                font.bold: true
                font.pixelSize: 28
                visible: imagePath === ""
            }

            Image {
                id: chosenImage
                anchors.fill: parent
                anchors.margins: 5
                source: imagePath
                fillMode: Image.PreserveAspectFit
                visible: imagePath !== ""
                clip: true
            }

            Rectangle {
                width: 30
                height: 30
                radius: 15
                color: "white"
                border.color: "gray"
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: -5

                Text {
                    anchors.centerIn: parent
                    text: "+"
                    font.bold: true
                    font.pixelSize: 20
                    color: "black"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: fileDialog.open()
                }
            }
        }

        TextField {
            id: nameField
            width: addContactPage.width / 2
            height: 50
            placeholderText: "Enter Name"
            font.pixelSize: 18
            color: "white"
            text: initialName
        }

        TextField {
            id: numberField
            width: addContactPage.width / 2
            height: 50
            placeholderText: "Enter Number"
            font.pixelSize: 18
            color: "white"
            text: initialNumber
        }

        Row {
            spacing: 12
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "Save"
                visible: contactIndex === -1
                onClicked: {
                    if (nameField.text !== "" && numberField.text !== "") {
                        modelManager.addContact(nameField.text, numberField.text, imagePath, "", false, false, "")
                        pageLoader.source = "PhoneBookPage.qml"
                    } else {
                        console.log("Please enter name and number")
                    }
                }
            }

            Button {
                text: "Delete"
                visible: contactIndex >= 0
                onClicked: {
                    if (contactIndex >= 0) {
                        modelManager.removeContact(contactIndex)
                        pageLoader.source = "PhoneBookPage.qml"
                    }
                }
            }

            Button {
                text: "Back"
                onClicked: pageLoader.source = "HomePage.qml"
            }
        }
    }
    property string imagePath: initialImage

    FileDialog {
        id: fileDialog
        title: "Choose Contact Image"
        fileMode: FileDialog.OpenFile
        nameFilters: ["Images (*.png *.jpg *.jpeg *.bmp *.gif)", "All files (*)"]
        onAccepted:
        {
            imagePath = fileDialog.file.toString().replace("file://", "")
        }
    }

}
