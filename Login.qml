import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    Rectangle{
        id: background
        color: "#2752a0"

        anchors.fill: parent

        Rectangle{
            id: loginBox
            width: 400
            height: 400
            color: "#3f67c2"
            anchors.centerIn: background

            Label {
                id: welcome
                text: qsTr("WELCOME BACK")
                font.bold: true
                font.family: "Courier"
                font.pointSize: 11
                color: "yellow"
                anchors{
                    horizontalCenter: loginBox.horizontalCenter
                    top: loginBox.top
                    topMargin: 15
                }
            }

            Label {
                id: loginInstruct
                text: qsTr("Log into your account")
                font.pointSize: 11
                font.bold: true
                font.family: "Courier"
                color: "white"
                anchors{
                    horizontalCenter: loginBox.horizontalCenter
                    top:welcome.bottom
                    topMargin: 5

                }
            }

            Label {
                id: email
                color: "#f5e8e8"
                text: qsTr("E-mail or Username")
                font.pointSize: 11

                anchors{
                    left: loginBox.left
                    leftMargin: 10
                    top: loginInstruct.bottom
                    topMargin: 30
                }
            }

            Rectangle{
                id: textFrame
                width: loginBox.width - 50
                height: 40
                color: "#3f67c2"
                border.color: "#130b0b"
                border.width: 1

                anchors{
                    left: loginBox.left
                    leftMargin: 10
                    top: email.bottom
                    topMargin: 5
                }

                TextInput {
                    id: textInput
                    x: 80
                    y: 146
                    text: qsTr("")
                    font.pixelSize: 25
                    font.italic: true
                    anchors.fill: textFrame
                    color: "white"
                }
            }



//            TextField {
//                id: textfieldTab
//                placeholderTextColor: "#b9a3a3"
//                placeholderText: qsTr("Enter E-mail or Username")

//                anchors{
//                    left: loginBox.left
//                    leftMargin: 10
//                    top: email.bottom
//                    topMargin: 5
//                }
//            }

        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
