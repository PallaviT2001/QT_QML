import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window{
    id:mainWindow
    width:550
    height:1000
    visible: true
    title: qsTr("PhoneBook Application")

    Loader
    {
        id: pageLoader
        width: 600
        height: mainWindow.height
        anchors.centerIn: parent
        source: "phonebookpage.qml"
    }

    Connections
    {
        target: pageLoader.item

        function addcontactpageClicked()
        {
            pageLoader.source= "addcontactpage.qml"
        }

        function searchcontactpageClicked()
        {
            pageLoader.source= "searchcontactpage.qml"
        }

        function contactlistpageClicked()
        {
            pageLoader.source= "contactlistpage.qml"
        }

        function onCancelButtonClicked()
        {
            pageLoader.source= "Phonebookpage.qml"
        }

    }
    Connections{
        target: Login

        onAddConatctSuccess:
        {
            console.log("Contact added and saved successfully")
            pageLoader.source = "contactlist.qml"
        }
    }

}
