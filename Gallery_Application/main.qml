import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    title: "Gallery Application"

    property int expandedIndex: -1
    property string expandedSource: ""

    Rectangle {
        anchors.fill: parent
        color: "pink"

        Grid {
            id: grid
            anchors.centerIn: parent
            columns: 4
            spacing: 10

            Repeater {
                model: [
                    "qrc:/Gallery_Application/Images/img1.png",
                    "qrc:/Gallery_Application/Images/img2.png",
                    "qrc:/Gallery_Application/Images/img3.png",
                    "qrc:/Gallery_Application/Images/img4.png",
                    "qrc:/Gallery_Application/Images/img5.png",
                    "qrc:/Gallery_Application/Images/img6.png",
                    "qrc:/Gallery_Application/Images/img7.png",
                    "qrc:/Gallery_Application/Images/img8.png",
                    "qrc:/Gallery_Application/Images/img9.png",
                    "qrc:/Gallery_Application/Images/img10.png",
                    "qrc:/Gallery_Application/Images/img11.png",
                    "qrc:/Gallery_Application/Images/img12.png"
                ]

                delegate: ImageTile {
                    source: modelData

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (root.expandedIndex === index) {
                                root.expandedIndex = -1
                                root.expandedSource = ""
                            } else {
                                root.expandedIndex = index
                                root.expandedSource = modelData
                            }
                        }
                    }
                }
            }
        }

        // Overlay fullscreen image
        Rectangle {
            id: overlay
            anchors.fill: parent
            color: "black"
            opacity: root.expandedIndex === -1 ? 0 : 0.8
            visible: opacity > 0
            z: 1

            Behavior on opacity {
                NumberAnimation { duration: 300 }
            }

            Image {
                id: fullImage
                anchors.centerIn: parent
                width: parent.width * 0.9
                height: parent.height * 0.9
                fillMode: Image.PreserveAspectFit
                source: root.expandedSource
                opacity: root.expandedIndex === -1 ? 0 : 1

                Behavior on opacity {
                    NumberAnimation { duration: 300 }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.expandedIndex = -1
                        root.expandedSource = ""
                    }
                }
            }
        }
    }
}
