import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: mainWindow
    width: 400
    height: 600
    visible: true
    title: "Phone Book Application"

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "Contacts.qml"
    }

    function loadContactPage() {
        pageLoader.source = "Contacts.qml"
    }

    function loadContactListPage() {
        pageLoader.source = "ContactListDisplay.qml"
    }
}
