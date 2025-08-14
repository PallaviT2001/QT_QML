import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListModel
    {
        id: studentmodel
        ListElement{name:"Pallavi";rollnumber:"11";phone: "9874563215"}
        ListElement{name:"Pallavi1";rollnumber:"12";phone: "9874563215"}
        ListElement{name:"Pallavi2";rollnumber:"13";phone: "9874563215"}
        ListElement{name:"Pallavi3";rollnumber:"14";phone: "9874563215"}
        ListElement{name:"Pallavi4";rollnumber:"15";phone: "9874563215"}
        ListElement{name:"Pallavi5";rollnumber:"16";phone: "9874563215"}
        ListElement{name:"Pallavi6";rollnumber:"17";phone: "9874563215"}

    }
    ListView{
        id: listview
        width: parent.width/2
        height: parent.height
        model: studentmodel
        delegate: studentdelegate
        //clip: true
        //spacing :5
    }

    Component{
        id:studentdelegate
        Rectangle{
            id:background
            width:listview.width
            height:listview.height
            color: "gray"
            Row{
                spacing:10
                width: parent.width
                height: parent.height/5
                Text{
                    id:stname
                    text:name
                }
                Text{
                    id:strollnumber
                    text:rollnumber

                }
                Text{
                    id:stphone
                    text:phone
                }

            }


        }
    }



}

