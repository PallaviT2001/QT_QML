import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 360
    height: 560
    title: "Calculator Application"

    Rectangle {
        anchors.fill: parent
        color: "black"

        Text {
            id: display
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 100
            text: backend.displayText
            color: "white"
            font.pixelSize: 36
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            anchors.margins: 10
        }

        GridView {
            id: grid
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: display.bottom
            anchors.bottom: parent.bottom

            model: backend.buttons
            cellWidth: width / backend.columns
            cellHeight: height / backend.rows

            delegate: Rectangle
            {
                width: grid.cellWidth
                height: grid.cellHeight
                radius: width/2
                color: modelData["color"]

                Text {
                    anchors.centerIn: parent
                    text: modelData["text"]
                    color: "white"
                    font.pixelSize: 22
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: backend.handleButtonClick(modelData["text"])
                }
            }
        }
    }
}
