import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: root
    Image{
        id: backgroundImage
        source:"qrc:/appImages/3a.jpg"
        fillMode: Image.PreserveAspectFit
        opacity: 1
        anchors{
            fill: root
        }

        //Dynamic
        Rectangle {
            id: frame
            width: parent.width/2 - 50
            height: parent.height - 150
            color: "white"


            anchors{
                right: backgroundImage.right
                rightMargin: 100 //permissible dimension
                verticalCenter: parent.verticalCenter
            }

            Column {
                id: column
                height: 200
                spacing: 20
                opacity: 1
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top


                //to be made dynamic
                Label {
                    id: nickName
                    text: qsTr("What's your nickname?")
                    font.pointSize: frame.height / 40
                    font.family: "Courier"
                    font.bold: true
                    anchors{
                        left: column.left
                        leftMargin: 10
                        top: column.top
                        topMargin: 20
                    }
                }


                //to be made dynamic
                TextField {
                    id: nickNameEnter
                    height: frame.height / 40
                    width: column.width - 30
                    placeholderText: qsTr("Typing? ...")
                    anchors{
                        left: column.left
                        leftMargin: 10
                        top: nickName.bottom
                        topMargin: 20
                    }
                }

                Label {
                    id: avartar
                    text: qsTr("Choose your favorite Avatar")
                    font.pointSize: frame.height / 40
                    font.family: "Courier"
                    font.bold: true
                    anchors{
                        left: column.left
                        leftMargin: 10
                        top: nickNameEnter.bottom
                        topMargin: 20
                    }
                }


                //to be made dynamic
                Row {
                    id: avartarPick
                    width: column.width
                    height: frame.height / 9
                    spacing: 8
                    anchors{
                        left: column.left
                        leftMargin: 10
                        top: avartar.bottom
                        topMargin: 20
                    }

                    //to be made dynamic (all the Avatars)
                    MyAvatar{
                        id: av1
                        imageSource: "qrc:/avatar/Avatars/1.jpg"
                        avatarNum: 1
                        width: avartarPick.height
                        height: avartarPick.height

                        MouseArea{
                            id: clickAvatar1
                            anchors.fill: av1
                            onClicked:{
                                av1.backgroundColor = "green"
                                main.avatar = av1.avatarNum
                                console.log ("The Avatar Number is: " + av1.avatarNum + " !")

                                av2.backgroundColor = "white"
                                av3.backgroundColor = "white"
                                av4.backgroundColor = "white"
                                av5.backgroundColor = "white"
                            }
                        }
                    }
                    MyAvatar{
                        id: av2
                        imageSource: "qrc:/avatar/Avatars/2.jpg"
                        avatarNum: 2
                        width: avartarPick.height
                        height: avartarPick.height


                        MouseArea{
                            id: clickAvatar2
                            anchors.fill: av2
                            onClicked:{
                                av2.backgroundColor = "green"
                                main.avatar = av2.avatarNum
                                console.log ("The Avatar Number is: " + av2.avatarNum + " !")


                               av1.backgroundColor = "white"
                               av3.backgroundColor = "white"
                               av4.backgroundColor = "white"
                               av5.backgroundColor = "white"
                            }
                        }
                    }
                    MyAvatar{
                        id: av3
                        imageSource: "qrc:/avatar/Avatars/3.jpg"
                        avatarNum: 3
                        width:avartarPick.height
                        height: avartarPick.height


                        MouseArea{
                            id: clickAvatar3
                            anchors.fill: av3
                            onClicked:{
                                av3.backgroundColor = "green"
                                main.avatar = av3.avatarNum
                                console.log ("The Avatar Number is: " + av3.avatarNum + " !")

                                av1.backgroundColor = "white"
                                av2.backgroundColor = "white"
                                av4.backgroundColor = "white"
                                av5.backgroundColor = "white"
                            }
                        }
                    }
                    MyAvatar{
                        id: av4
                        imageSource: "qrc:/avatar/Avatars/4.jpg"
                        avatarNum: 4
                        width: avartarPick.height
                        height: avartarPick.height


                        MouseArea{
                            id: clickAvatar4
                            anchors.fill: av4
                            onClicked:{
                                av4.backgroundColor = "green"
                                main.avatar = av4.avatarNum
                                console.log ("The Avatar Number is: " + av4.avatarNum + " !")

                                av1.backgroundColor = "white"
                                av2.backgroundColor = "white"
                                av3.backgroundColor = "white"
                                av5.backgroundColor = "white"
                            }
                        }
                    }
                    MyAvatar{
                        id: av5
                        imageSource: "qrc:/avatar/Avatars/5.jpg"
                        avatarNum: 5
                        width: avartarPick.height
                        height: avartarPick.height


                        MouseArea{
                            id: clickAvatar5
                            anchors.fill: av5
                            onClicked:{
                                av5.backgroundColor = "green"
                                main.avatar = av5.avatarNum
                                console.log ("The Avatar Number is: " + av5.avatarNum + " !")

                                av1.backgroundColor = "white"
                                av2.backgroundColor = "white"
                                av3.backgroundColor = "white"
                                av4.backgroundColor = "white"
                            }
                        }
                    }

                }
                Label {
                    id: password
                    text: qsTr("Enter a secret pass")
                    font.pointSize: frame.height / 40
                    font.family: "Courier"
                    font.bold: true
                    anchors{
                        left: column.left
                        leftMargin: 10
                        top: avartarPick.bottom
                        topMargin: 20
                    }
                }


                //to be made dynamic
                TextField {
                    id: passwordEnter
                    height: frame.height / 40
                    width: column.width - 30
                    placeholderText: qsTr("Enter your password here ...")
                    echoMode: "Password"
                    anchors{
                        left: column.left
                        leftMargin: 10
                        top: password.bottom
                        topMargin: 20
                    }
                }

                Button {
                    id: nextButton
                    width: column.width * 0.85
                    text: qsTr("NEXT")
                    font.family: "Courier"
                    anchors{
                        top: passwordEnter.bottom
                        topMargin: 20
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
