import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: root
    Image{
        id: backgroundImage
        source:"qrc:/appImages/3a.jpg"
        fillMode: Image.PreserveAspectFit
        opacity: 0.5
        anchors{
            fill: root
        }

        Rectangle {
            id: frame
            width: parent.width/2 - 50
            height: parent.height - 50
            color: "white"

            anchors{
                right: backgroundImage.right
                rightMargin: 50
                verticalCenter: parent.verticalCenter
            }

            Column {
                id: column
                anchors.fill: parent
                spacing: 10

                Label {
                    id: nickName
                    text: qsTr("What's your nickname?")
                    anchors{
                        left: column.left
                        leftMargin: 10
                    }
                }

                TextField {
                    id: nickNameEnter
                    placeholderText: qsTr("Text Field")
                    anchors{
                        left: column.left
                        leftMargin: 10
                    }
                }

                Label {
                    id: avartar
                    text: qsTr("Choose your Avartar")
                    anchors{
                        left: column.left
                        leftMargin: 10
                    }
                }

                Row {
                    id: avartarPick
                    width: column.width
                    height: 50
                    spacing: 5
                    anchors{
                        left: column.left
                        leftMargin: 10
                    }
                    //When you add avatars do not forget to
                    /*
                      1. Declare the source of the images
                      2. Display the avatarNum (so that on clicked, the main.avatar = avatar.num
                      */
                    MyAvatar{
                        id: av1
                        imageSource: "qrc:/avatar/Avatars/1.jpg"
                        avatarNum: 1

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
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
