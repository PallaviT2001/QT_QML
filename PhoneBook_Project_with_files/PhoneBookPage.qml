import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: phoneBookPage
    anchors.fill: parent
    color: "white"

    Column {
        anchors.fill: parent
        spacing: 0

        ListView {
            id: phoneBookList
            anchors.fill: parent
            anchors.bottomMargin: 60
            clip: true
            model: modelManager.contactModel
            spacing: 6

            delegate: Item {
                width: phoneBookList.width
                height: 70

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 12

                    Rectangle {
                        width: 50
                        height: 50
                        radius: 25
                        color: "orange"
                        anchors.verticalCenter: parent.verticalCenter

                        Text {
                            anchors.centerIn: parent
                            text: (name && name.length > 0) ? name.charAt(0).toUpperCase() : ""
                            color: "blue"
                            font.bold: true
                            font.pixelSize: 18
                        }
                    }

                    Column {
                        spacing: 4
                        anchors.verticalCenter: parent.verticalCenter
                        Text {
                            text: name
                            font.bold: true
                        }
                        Text {
                            text: number
                        }
                    }
                }

                Image {
                    source: "Images/PhoneBookCall.png"
                    width: 40
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.margins: 12
                    fillMode: Image.PreserveAspectFit
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        pageLoader.source = "ContactCall.qml"
                        pageLoader.item.contactName = name
                        pageLoader.item.contactNumber = number
                    }
                }
            }
        }

        Button {
            text: "Back"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            onClicked: pageLoader.source = "HomePage.qml"
        }
    }
}

/*import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: phoneBookPage
    anchors.fill: parent
    color: "white"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        ListView {
            id: phoneBookList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: modelManager.contactModel
            spacing: 6

            delegate: Item {
                width: phoneBookList.width
                height: 70

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 12

                    Rectangle {
                        width: 50
                        height: 50
                        radius: 25
                        color: "orange"
                        anchors.verticalCenter: parent.verticalCenter

                        Text {
                            anchors.centerIn: parent
                            text: (name && name.length > 0) ? name.charAt(0).toUpperCase() : ""
                            color: "blue"
                            font.bold: true
                            font.pixelSize: 18
                        }
                    }

                    Column {
                        spacing: 4
                        Text {
                            text: name
                            font.bold: true
                        }
                        Text {
                            text: number
                        }
                    }
                }

                Image {
                    source: "Images/PhoneBookCall.png"
                    width: 50
                    height: 50
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.margins: 8
                    fillMode: Image.PreserveAspectFit
                }

                MouseArea{
                    anchors.fill:parent
                    onClicked:
                    {
                       pageLoader.source="ContactCall.qml"
                       pageLoader.item.contactName=name
                       pageLoader.item.contactNumber=number
                    }
                }

            }
        }
        Button {
            text: "Back"
            Layout.alignment: Qt.AlignHCenter
            onClicked: pageLoader.source = "HomePage.qml"
        }
    }
}*/


