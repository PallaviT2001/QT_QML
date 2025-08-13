import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: registerPage
    anchors.fill: parent
    color: "lightblue"

    signal cancelButtonClicked()

    Column{
        id: columnLayout
        spacing:  10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent

        Text {
            id: studentName
            text: qsTr("Student Name")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: studentNameText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Student Name"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            validator:  RegularExpressionValidator {
                regularExpression: /^[a-zA-Z ]+$/
            }
        }


        Text {
            id: phoneNumber
            text: qsTr("Phone Number")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: phoneNumberText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Phone Number"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            validator: RegularExpressionValidator {
                regularExpression: /^[0-9]{10}+$/
            }
        }



        Text {
            id: fatherName
            text: qsTr("Father Name")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: fathereNameText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Father Name"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            validator:  RegularExpressionValidator {
                regularExpression: /^[a-zA-Z ]+$/
            }
        }


        Text {
            id: email
            text: qsTr("Email Id")
            color: "Black"
            font.bold: true
            font.pixelSize: 18
        }
        TextField{
            id: emailText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Email Id"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            onEditingFinished: {
                if (!emailText.text.includes("@") || !emailText.text.includes(".com")) {
                    emailText.color = "red"
                    console.log("Invalid email format")
                } else {
                    emailText.color = "white"
                }
            }
        }

        Text {
            id: password
            text: qsTr("Password")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: passwordText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Password"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            echoMode: TextInput.Password
        }

        Text {
            id: confirmPassword
            text: qsTr("Confirm Password")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: confirmPasswordText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Confirm Password"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            echoMode: TextInput.Password
        }

        Column {
            id: buttonColumn
            spacing: 15
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20

            Button {
                id: submitButton
                width: registerPage.width / 4
                height: 50

                Text {
                    text: qsTr("Submit")
                    anchors.centerIn: parent
                    font.bold: true
                    font.pixelSize: 14
                    color: "Black"
                }

                onClicked: {
                    console.log("Submit Button Clicked")
                    Login.addStudent(studentNameText.text,
                                     phoneNumberText.text,
                                     fathereNameText.text,
                                     emailText.text,
                                     passwordText.text,
                                     confirmPasswordText.text)
                }

                background: Rectangle {
                    color: submitButton.pressed ? "#5A5A5A" : "transparent"
                    anchors.fill: parent
                    border.color: "Black"
                    border.width: 2
                    radius: 0
                }
            }

            Button {
                id: cancelButton
                width: registerPage.width / 4
                height: 50

                Text {
                    text: qsTr("Back")
                    anchors.centerIn: parent
                    font.bold: true
                    font.pixelSize: 14
                    color: "Black"
                }

                onClicked: {
                    console.log("Cancel Button Clicked")
                    cancelButtonClicked()
                }

                background: Rectangle {
                    color: cancelButton.pressed ? "#5A5A5A" : "transparent"
                    anchors.fill: parent
                    border.color: "Black"
                    border.width: 2
                    radius: 0
                }
            }

            Button {
                id: clearButton
                width: registerPage.width / 4
                height: 50

                Text {
                    text: qsTr("Clear")
                    anchors.centerIn: parent
                    font.bold: true
                    font.pixelSize: 14
                    color: "Black"
                }

                onClicked: {
                    console.log("Clear Button Clicked")
                    studentNameText.text = ""
                    phoneNumberText.text = ""
                    fathereNameText.text = ""
                    emailText.text = ""
                    passwordText.text = ""
                    confirmPasswordText.text = ""
                }

                background: Rectangle {
                    color: clearButton.pressed ? "#5A5A5A" : "transparent"
                    anchors.fill: parent
                    border.color: "Black"
                    border.width: 2
                    radius: 0
            }   }
        }
    }
}
