import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
    id:addcontact
    anchors.fill: parent
    color: "lightgrey"

    signal onCancelButtonClicked()

    Column{
        id:columnLayout
        spacing:10
        anchors.horizontalCenter:parent.horzontalCenter
        anchors.centerIn: parent

        Text{
            id:name
            text: qsTr("User name")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id:usenametext
            width:addcontact.width/2
            height: 50
            placeholderText: "Enter User name"
            placeholderTextColor: "white"
            font.pixelSize:14
            color:"White"
        }

        Text{
            id:phonenumber
            text:qsTr("Phone Number")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }

        TextField{
            id:phonenumberText
            width:addcontact.width/2
            height:50
            placeholderText: "Enter phone number"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color:"White"
        }


    }

}
