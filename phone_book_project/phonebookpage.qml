import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle
{
    id:phonebook
    anchors.fill: parent
    color:"lightgrey"

    signal addcontactpageClicked()
    signal searchcontactpageClicked()
    signal contactlistpageClicked()

    Column{
        id:phonebookColoum
        anchors.centerIn: phonebook
        spacing :30

        Label {
            text: "Phone Book Application"
            font.pixelSize: 30
            color: "black"
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button
        {
            id:addcontact
            width:phonebook.width/2
            height:50

        Text{
            id:addconatactlabel
            text: qsTr("AddContact")
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: 20
            color: "Black"
        }
        onClicked:
        {
            console.log("Add contactbutton clicked")
            addcontactpageClicked()
        }

        background: Rectangle{
            color: addcontact.pressed? "#5A5A5A" : "transparent"
            anchors.fill: addcontact
            border.color: "Black"
            border.width:2
            radius:180
        }
        }

        Button{
            id:searchcontact
            width: phonebook.width/2
            height:50

            Text{
                id:searchcontactLabel
                text: qsTr("SearchContact")
                anchors.centerIn:parent
                font.bold: true
                font.pixelSize: 20
                color: "Black"
            }

            onClicked:{
                console.log("search contact button clicked")
                searchcontactpageClicked()
            }
            background: Rectangle{
                color: searchcontact.pressed? "5A5A5A" : "transparent"
                anchors.fill:searchcontact
                border.color: "Black"
                border.width: 2
                radius: 180
            }
        }

            Button{
                id: contactlist
                width:phonebook.width/2
                height: 50

                Text{
                    id:contactlistlabel
                    text: qsTr("ContactList")
                    anchors.centerIn: parent
                    font.bold: true
                    font.pixelSize : 20
                    color: "Black"
                }
                onClicked:
                {
                    console.log("contact list button clicked")
                    contactlistpageClicked()
                }
                background: Rectangle{
                    color: contactlist.pressed ? "#5A5A5A" : "transparent"
                    anchors.fill: contactlist
                    border.color: "Black"
                    border.width: 2
                    radius:180

                }
            }
        }
    }
