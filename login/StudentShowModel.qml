import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

Item{

    anchors.fill: parent

    ListView{
        id:studentView
        width: parent.width
        height: parent.height - 200
        interactive: true
        model: viewModel
        delegate: myComponent

    }
    Button{
        id:button1
        onClicked: {
            load.source = "WelcomePage.qml"
        }
    }

    Component{
        id:myComponent

        Rectangle{
            width: studentView.width
            height: studentView.height/5
            color: "pink"

            Row{
                spacing: 10
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                Text{
                    id:slno
                    text: model.index + 1
                }

                Text {
                    id: stName
                    text:studentName
                }
                Text {
                    id: phone
                    text:phoneNum
                }
                Text {
                    id: email
                    text:emailID
                }
                Text {
                    id: fathername
                    text:fatherName
                }
                Text {
                    id: username
                    text:userName
                }
                Text {
                    id: password
                    text:passWord
                }
            }
        }
    }
    Loader{
        id:load
        width:parent.width
        height: parent.height
    }

}


