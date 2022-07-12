
import QtQuick 2.0
import QtQuick.Controls 2.3

FocusScope {

    Rectangle{
        id: background


        anchors{
            fill: parent
        }

        Image{
            id:backgroundImage
            anchors.fill: background
            source: "qrc:/appImages/2a.jpg"
            fillMode: Image.PreserveAspectFit
            opacity: 0.5
            visible: true
        }

        Row {
            id: row
            width: background.width
            height: background.height /2

            anchors{
                top: background.top
                left: background.left
                right: background.right
            }

            Label {
                id: welcometxt
                text: qsTr("TIME TO PLAN YOUR DAY")
                font.bold: true
                font.family: "Courier"
                font.pointSize: 21
                anchors{
                    centerIn: row
                }
            }

            Label {
                id: wisequote
                text: qsTr("Don't be afraid to give up the good \r\nto go for the great. --John D. Rockefeller")
                font.italic: true
                font.bold: true
                font.family: "Courier"
                font.pointSize: 9
                anchors{
                    top: welcometxt.bottom
                    topMargin: 5
                    horizontalCenter: welcometxt.horizontalCenter
                }
            }

        }

        Row {
            id: row1
            width: background.width
            height: background.height /2

            anchors{
                bottom:background.bottom
                left: background.left
                right: background.right
            }

            Button {
                id: nextbtn
                width: 90
                height: 50
                text: qsTr("Next")
                font.family: "Courier"
                focus: true

                anchors{
                    right: row1.right
                    rightMargin: 100
                    bottom: row1.bottom
                    bottomMargin: 100
                }

                onClicked: {
                    console.log("Next Page Activated")
                    stack.push("Login.qml")
                    focus = false
                }
            }
        }


    }
}
