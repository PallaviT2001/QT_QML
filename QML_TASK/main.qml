import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.3

ApplicationWindow {
    id: window
    width: 400
    height: 600
    visible: true

    // Background Rectangle to test click
    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: "lightblue"

        Text {
            text: "Click me!"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: console.log("Background clicked!")
        }
    }

    // Simulated Keyboard
    Rectangle {
        id: keyboard
        width: parent.width
        height: 200
        color: "lightgray"
        anchors.bottom: parent.bottom

        // Invisible MouseArea from the bug
        MouseArea {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: keyboard.height * 3 // Simulate "keyboard.screenHeight" covering whole screen
            onPressed: console.log("Keyboard hides candidate menu")
        }
    }
}
