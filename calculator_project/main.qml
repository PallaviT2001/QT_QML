import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 360
    height: 560
    title: "Calculator"

    Rectangle {
        anchors.fill: parent
        color: "#121212"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 12

            // Display
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 120
                radius: 10
                color: "#1e1e1e"
                border.color: "#2a2a2a"

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

            // Keypad
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 10
                color: "#181818"
                border.color: "#262626"

                // 4 columns x 5 rows = 20 buttons, perfectly aligned
                GridLayout {
                    id: grid
                    anchors.fill: parent
                    anchors.margins: 10
                    columnSpacing: 10
                    rowSpacing: 10
                    columns: 4

                    // Compute uniform sizes
                    property real cellW: (width - (columns - 1) * columnSpacing) / columns
                    property int rows: 5
                    property real cellH: (height - (rows - 1) * rowSpacing) / rows

                    Repeater {
                        model: [
                            "AC", "%",  "←", "÷",
                            "7",  "8",  "9", "×",
                            "4",  "5",  "6", "-",
                            "1",  "2",  "3", "+",
                            "00", "0",  ".", "="
                        ]

                        delegate: Button {
                            Layout.preferredWidth: grid.cellW
                            Layout.preferredHeight: grid.cellH
                            font.pixelSize: 20
                            text: modelData
                            background: Rectangle {
                                radius: 10
                                color: (text === "AC") ? "#ff8c00"
                                      : (text === "=")  ? "green"
                                      : (text === "+" || text === "-" || text === "×" || text === "÷" || text === "%") ? "blue"
                                      : "#2c2c2c"
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
