import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Calculator"

    Rectangle {
        anchors.fill: parent
        color: "black"

        ColumnLayout {
            anchors.fill: parent
            spacing: 10
            anchors.margins: 10

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 150
                color: "black"

                Text {
                    // anchors.right: parent.right
                    // anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    horizontalAlignment: Text.AlignRight

                    font.pixelSize: 40
                    color: "white"
                    text: backend.displayText    // Directly using backend
                    wrapMode: Text.NoWrap
                }
            }

            Component {
                id: calcButtonComponent
                Button {
                    id: btn
                    property color bgColor: "#3a3a3a"
                    property color textColor: "white"
                    font.pixelSize: 20

                    background: Rectangle {
                        radius: 8     // small rounded rectangle
                        color: btn.bgColor
                    }

                    contentItem: Text {
                        text: btn.text
                        font.pixelSize: 20
                        color: btn.textColor
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    implicitWidth: 70
                    implicitHeight: 50
                    Layout.preferredWidth: parent ? parent.width / 4 - 10 : 70
                    Layout.preferredHeight: 50

                    onClicked: backend.handleButtonClick(btn.text) // Directly call C++
                }
            }

            GridLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                columns: 4
                rowSpacing: 10
                columnSpacing: 10

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "AC"; item.bgColor = "orange" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "%"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "←"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "÷"; item.bgColor = "#d35400" } }

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "7"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "8"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "9"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "×"; item.bgColor = "#d35400" } }

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "4"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "5"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "6"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "-"; item.bgColor = "#d35400" } }

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "1"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "2"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "3"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "+"; item.bgColor = "#d35400" } }

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "00"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "0"; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "."; item.bgColor = "#d35400" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "="; item.bgColor = "#27ae60" } }
            }
        }
    }
}
