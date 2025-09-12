import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Gallery Application"

    Grid {
        columns: 4
        rows: 3
        spacing: 3
        anchors.centerIn: parent
        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img1
                source: "qrc:/new/prefix1/Images/img1.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img1
                onClicked:{

                }
            }

        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100;

            Image {
                id:img2
                source: "qrc:/new/prefix1/Images/img2.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img2
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img3
                source: "qrc:/new/prefix1/Images/img3.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img3
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img4
                source: "qrc:/new/prefix1/Images/img4.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent

            }

            MouseArea
            {
                anchors.fill:img4
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img5
                source: "qrc:/new/prefix1/Images/img5.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img5
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img6
                source: "qrc:/new/prefix1/Images/img6.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img6
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img7
                source: "qrc:/new/prefix1/Images/img7.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img7
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img8
                source: "qrc:/new/prefix1/Images/img8.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent

            }

            MouseArea
            {
                anchors.fill:img8
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img9
                source: "qrc:/new/prefix1/Images/img9.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img9
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img10
                source: "qrc:/new/prefix1/Images/img10.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img10
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img11
                source: "qrc:/new/prefix1/Images/img11.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img11
                onClicked:{

                }
            }
        }

        Rectangle
        {
            color: "white";
            width: 100;
            height: 100

            Image {
                id:img12
                source: "qrc:/new/prefix1/Images/img12.png"
                anchors.margins:12
                anchors.centerIn: parent
                anchors.fill:parent
            }

            MouseArea
            {
                anchors.fill:img12
                onClicked:{

                }
            }
        }
    }
}
