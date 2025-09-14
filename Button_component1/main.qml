import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    MyButton {
        anchors.centerIn: parent
        text: "Press Me"
        color: "red"
        onClicked: console.log("Button Clicked")
    }
}


