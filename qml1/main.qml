import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 300
    title: "TableView header implicitWidth bug"

    TableView {
        id: table
        anchors.fill: parent
        clip: true

        columnSpacing: 1
        rowSpacing: 1

        // Narrow delegate content → column width is too small
        model: ListModel {
            ListElement { value: "1" }
            ListElement { value: "2" }
            ListElement { value: "3" }
        }

        delegate: Rectangle {
            implicitWidth: 20
            implicitHeight: 30
            color: "lightyellow"
            border.color: "gray"

            Text {
                anchors.centerIn: parent
                text: model.value
            }
        }
    }

    HorizontalHeaderView {
        id: header
        syncView: table
        anchors.left: parent.left
        anchors.right: parent.right
        height: 40

        model: 1   // one column

        delegate: Rectangle {
            color: "lightblue"
            implicitWidth: textItem.implicitWidth + 20 // header wants to be wide
            implicitHeight: 40
            border.color: "black"

            Text {
                id: textItem
                anchors.centerIn: parent
                text: "A Very Long Header Text"
            }
        }
    }
}
