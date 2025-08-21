import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    anchors.fill: parent
    color: "lightgrey"

    ListView {
        id: mylistView
        anchors.fill: parent
        model: ContactModel
        spacing: 5
        delegate: Rectangle {
            width: parent.width
            height: 50
            border.color: "black"
            Row {
                spacing: 20
                anchors.verticalCenter: parent.verticalCenter
                Text { text: "Name: " + contactName }
                Text { text: "Number: " + contactNumber }
            }
        }
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        Button {
            text: "Add Bulk Numbers"
            onClicked: ContactModel.addNumberButtonClicked()
        }
    }
}
