import QtQuick

Rectangle {
    id: tile
    property alias source: img.source
    property bool expanded: false

    width: 100
    height: 100
    color: "white"
    border.color: "lightgray"

    Image {
        id: img
        anchors.fill: parent
        anchors.margins: 8
        fillMode: Image.PreserveAspectFit
    }

    MouseArea {
        anchors.fill: parent
        onClicked: expanded = !expanded
    }

    states: [
        State {
            name: "expanded"
            when: expanded
            PropertyChanges {
                target: tile
                anchors.fill: parent
                z: 1
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation { properties: "x,y,width,height"; duration: 400; easing.type: Easing.InOutQuad }
            NumberAnimation { properties: "opacity"; duration: 400 }
        }
    ]
}
