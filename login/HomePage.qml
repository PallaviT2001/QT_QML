import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: homePage
    anchors.fill: parent
    color: "lightblue"

    signal signInClicked()
    signal signUpClicked()

    Column {
        id: homePageColumn
        anchors.centerIn: homePage
        spacing: 30

        Label {
            text: "Student Application"
            font.pixelSize: 30
            color: "black"
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                id: signIn
                width: homePage.width / 3
                height: 50

                Text {
                    text: qsTr("Login")
                    anchors.centerIn: parent
                    font.bold: true
                    font.pixelSize: 20
                    color: "Black"
                }

                onClicked: {
                    console.log("SignIn Button Clicked")
                    signInClicked()
                }

                background: Rectangle {
                    color: signIn.pressed ? "#5A5A5A" : "transparent"
                    anchors.fill: parent
                    border.color: "Black"
                    border.width: 2
                    radius: 0 // No curves
                }
            }

            Button {
                id: signUp
                width: homePage.width / 3
                height: 50

                Text {
                    text: qsTr("SignUp")
                    anchors.centerIn: parent
                    font.bold: true
                    font.pixelSize: 20
                    color: "Black"
                }

                onClicked: {
                    console.log("SignUp Button Clicked")
                    signUpClicked()
                }

                background: Rectangle {
                    color: signUp.pressed ? "#5A5A5A" : "transparent"
                    anchors.fill: parent
                    border.color: "Black"
                    border.width: 2
                    radius: 0 // No curves
                }
            }
        }
    }
}
