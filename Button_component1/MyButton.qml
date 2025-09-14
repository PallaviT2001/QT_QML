import QtQuick

Rectangle {
    id: button
    width: 100
    height: 50
    radius: 0
    color: "green"
    border.color: "green"
    border.width: 3

    property alias text: label.text
    signal clicked()

    Text {
        id: label
        anchors.centerIn: parent
        text: "Click me"
        color: "black"
        font.pixelSize: 16
    }

    MouseArea {
        anchors.fill: parent
        onClicked:
        {
            button.clicked()
        }
    }
}
