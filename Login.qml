import QtQuick
import QtQuick.Controls 2.3
import com.company.todoengine 1.0
import "TODO.js" as Code

FocusScope {
    id: rootLogin
    property int loginSuccess: 0
    property string logindetails: ""
    property string passkey: ""
    property string user : ""
    property int avatar : 0
    property int validuser: 0

    focus: true

    Component.onCompleted: {
        rootLogin.forceActiveFocus()
         textInput.forceActiveFocus()
    }

    Rectangle{
        id: background
        color: "#2752a0"

        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0

        Todoengine{
            id: todoengine
        }

        Rectangle{
            id: loginBox
            width: 400
            height: 400
            color: "#3f67c2"
            anchors.centerIn: background

            Column{
                id: loginBoxCol
                anchors.fill: parent

                Label {
                    id: welcome
                    text: qsTr("WELCOME BACK")
                    font.bold: true
                    font.family: "Courier"
                    font.pointSize: 11
                    color: "yellow"
                    anchors{
                        horizontalCenter: loginBoxCol.horizontalCenter
                        top: loginBoxCol.top
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
                        horizontalCenter: loginBoxCol.horizontalCenter
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
                        left: loginBoxCol.left
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
                        left: loginBoxCol.left
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
//                                focus = false
                                todoengine.currentuser = textInput.text
                                passwordInput.forceActiveFocus()
                            }
                            onAccepted:{
//                                focus = false
                                todoengine.currentuser = textInput.text
                                passwordInput.forceActiveFocus()
                            }

                        }
                }

                Label {
                    id: password
                    color: "#f5e8e8"
                    text: qsTr("Password")
                    font.pointSize: 11

                    anchors{
                        left: loginBoxCol.left
                        leftMargin: 10
                        top: textFrame.bottom
                        topMargin: 30
                    }
                }

                Rectangle{
                    id: passwordFrame
                    width: loginBoxCol.width - 50
                    height: 40
                    color: "#3f67c2"
                    border.color: "#130b0b"
                    border.width: 1

                    anchors{
                        left: loginBoxCol.left
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
//                            focus: false
                            activeFocusOnPress: true
                            echoMode: TextInput.Password

                            color: "white"
                            onEditingFinished: {
//                                                      validuser = todoengine.userexists
                                if(validuser === 1){
                                    logindetails = todoengine.loginDetails
                                    passkey = Code.passget(logindetails)
                                    if(passkey === passwordInput.text){
                                        console.log("Password Correct")

                                        //setting the current user in the backend
                                        todoengine.currentuser = textInput.text.toLowerCase()
                                        console.log("Current user: " + textInput.text.toLowerCase())

                                        //getting the users details for the main page
                                        user = Code.nameget(logindetails)
                                        rootmain.nick = user
                                        avatar = Code.avatarget(logindetails)
                                        rootmain.avatar = avatar

                                        stack.push("loading.qml")
                                    }
                                    else{
                                        console.log("Wrong Password")
                                        feedback.visible = true
                                        feedback.text = "Wrong Password"
                                        feedback.color = "red"
                                    }
                                }
                                    else{
                                    feedback.visible = true
                                    feedback.text = "Invalid User"
                                    feedback.color = "red"
                                }
                            }
                            onAccepted:{
                                validuser = todoengine.userexists
                                if(validuser === 1){
                                    logindetails = todoengine.loginDetails
                                    passkey = Code.passget(logindetails)
                                    if(passkey === passwordInput.text){
                                        console.log("Password Correct")

                                        //setting the current user in the backend
                                        todoengine.currentuser = textInput.text.toLowerCase()
                                        console.log("Current user: " + textInput.text.toLowerCase())

                                        //getting the users details for the main page
                                        user = Code.nameget(logindetails)
                                        rootmain.nick = user
                                        avatar = Code.avatarget(logindetails)
                                        rootmain.avatar = avatar

                                        stack.push("loading.qml")
                                    }
                                    else{
                                        console.log("Wrong Password")
                                        feedback.visible = true
                                        feedback.text = "Wrong Password"
                                        feedback.color = "red"
                                    }
                                }
                                    else{
                                    feedback.visible = true
                                    feedback.text = "Invalid User"
                                    feedback.color = "red"
                                }
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
                    onClicked:{
                        validuser = todoengine.userexists
                        if(validuser === 1){
                            logindetails = todoengine.loginDetails
                            passkey = Code.passget(logindetails)
                            if(passkey === passwordInput.text){
                                console.log("Password Correct")

                                //setting the current user in the backend
                                todoengine.currentuser = textInput.text.toLowerCase()
                                console.log("Current user: " + textInput.text.toLowerCase())

                                //getting the users details for the main page
                                user = Code.nameget(logindetails)
                                rootmain.nick = user
                                avatar = Code.avatarget(logindetails)
                                rootmain.avatar = avatar

                                stack.push("loading.qml")
                            }
                            else{
                                console.log("Wrong Password")
                                feedback.visible = true
                                feedback.text = "Wrong Password"
                                feedback.color = "red"
                            }
                        }
                            else{
                            feedback.visible = true
                            feedback.text = "Invalid User"
                            feedback.color = "red"
                        }
                    }
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
                        left: loginBoxCol.left
                        leftMargin: 10
                    }

                    MouseArea {
                        id: registerClick
                        width: 100
                        height: 100
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
//                            rootLogin.focus = false
                            stack.push("Register.qml")      
                        }
                    }
                }

                Label {
                    id: feedback
                    text: qsTr("Login Successful")
                    font.pointSize: 9
                    visible: false
                    anchors{
                        top: register.bottom
                        topMargin: 10
                        horizontalCenter: parent.horizontalCenter
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
