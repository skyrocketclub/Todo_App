import QtQuick
import QtQuick.Controls 2.3

Item {
    Rectangle{
        id: background
        color: "#2752a0"

        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0

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
                text: qsTr("Username")
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
                    font.pixelSize: 15
                    wrapMode: Text.Wrap
                    renderType: Text.NativeRendering
                    font.italic: true
                    color: "white"
                    anchors.fill: parent
                    focus: true
                    activeFocusOnPress: true
                    onEditingFinished: {
                        passwordInput.focus = true
                    }
                    anchors{
                        left: loginBox.left
                        top: email.bottom
                    }

                }

            }

            Label {
                id: password
                color: "#f5e8e8"
                text: qsTr("Password")
                font.pointSize: 11

                anchors{
                    left: loginBox.left
                    leftMargin: 10
                    top: textFrame.bottom
                    topMargin: 30
                }
            }

            Rectangle{
                id: passwordFrame
                width: loginBox.width - 50
                height: 40
                color: "#3f67c2"
                border.color: "#130b0b"
                border.width: 1

                anchors{
                    left: loginBox.left
                    leftMargin: 10
                    top: password.bottom
                    topMargin: 5
                }

                TextInput {
                    id: passwordInput
                    text: qsTr("")
                    anchors.fill: parent
                    font.pixelSize: 15
                    font.italic: true
                    echoMode: TextInput.Password

                    color: "white"
                    onEditingFinished: {
                       passwordInput.focus= false
                        textInput.focus = true
                    }
                    anchors{
                        left: loginBox.left
                        top: password.bottom
                    }
                }
            }

            Button {
                id: loginNow
                x: 10
                y: 290
                height:50
                width: loginBox.width - 50
                text: qsTr("Login now")

//                anchors{
//                    top: passwordInput.bottom
//                    topMargin: 20
//                }
            }

            Label{
                id: register
                color: "#f5e8e8"
                text: qsTr("Click here to Register ->")
                font.pointSize: 9
                font.family: "Courier"
                anchors{
                    top: loginNow.bottom
                    topMargin: 10
                    left: loginBox.left
                    leftMargin: 10
                }

                MouseArea {
                    id: registerClick
                    width: 100
                    height: 100
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        //Take the user to the register page
                    }
                }
            }

        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:7}
}
##^##*/
