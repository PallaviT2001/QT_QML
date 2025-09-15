import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    MyButton {
        anchors.centerIn: parent
        text: "Click Button"
        color: "Green"
        onClicked: console.log("Button Clicked")
    }
}


