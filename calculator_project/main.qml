import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 360
    height: 560
    title: "Calculator project"

    Rectangle {
        anchors.fill: parent
        color: "light gray"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 12

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 120
                radius: 10
                color: "black"
                border.color: "black"

                Text {
                    anchors.fill: parent
                    anchors.margins: 16
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 38
                    color: "white"
                    text: backend.displayText
                    elide: Text.ElideLeft
                    wrapMode: Text.NoWrap
                }
            }


            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 10
                color: "white"
                border.color: "white"

                GridLayout{
                    id: grid
                    anchors.fill: parent
                    anchors.margins: 10
                    columnSpacing: 10
                    rowSpacing: 10
                    columns: 4

                    property real cellW: (width - (columns - 1) * columnSpacing) / columns
                    property int rows: 5
                    property real cellH: (height - (rows - 1) * rowSpacing) / rows

                    Repeater {
                        model: backend.buttons

                        delegate: Button {
                            Layout.preferredWidth: grid.cellW
                            Layout.preferredHeight: grid.cellH
                            font.pixelSize: 20
                            text: modelData["text"]

                            background: Rectangle
                            {
                                radius: 0
                                color: modelData["color"]
                            }

                            contentItem: Text {
                                text: parent.text
                                color: "white"
                                font.pixelSize: 20
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.fill: parent
                                anchors.margins: 2
                            }

                            onClicked: backend.handleButtonClick(text)
                        }
                    }
                }


            }
        }
    }
}

