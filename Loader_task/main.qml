import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Main Page")

    Column {
        anchors.centerIn: parent
        spacing: 20


        Button {
            text: "Button1"
            onClicked:
            {
                pageLoader.source = "A.qml"
            }
        }

        Loader {
            id: pageLoader
        }
    }
}
