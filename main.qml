import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3

/*
  WHAT'S THE WORKORDER BRO?
TO DO

1. Make the todo take only the title and abandon description
2. Make the GUI work smoothly, that is the foundation for the Backend...

C++ BackEnd

User Folder (/user)
--- There is a file to store the user name and the password of the user(s) - 01
--- Upon registration, there is a file that has the details of the user, name, nickname and avatar --->

When the user tries to log in, the program checks if the name is in the list of users

if it is, it confirms the password and grants access, else --> say wrong password or user not found depending on the error

--- ugo ... the details are then passed and the avartar as well as the nickname are updated accordingly
----in ugoToDo
... if the entry is empty. you can add tasks.
... as the task are added, they are also added to the .txt file
... if the task is deleted, it is deleted as well from the .txt file


How to go about it

1. Familiarize yourself with qt file concepts like

    a. folders, 
    b. file creation, 
    c. writing into the files
    d. opening, closing and deleting and replacing files...




  */

Window {
    id: main
    width: 640
    height: 480
    minimumHeight: 480
    minimumWidth: 640
    visible: true
    title: qsTr("TO DO APP")

    //Details of the user...
    property string nickname: ""
    property string password: ""
    property int avatar: 1


    Loader{
        id: loader
        anchors.fill: parent
        StackView{
            id: stack
            anchors.fill: parent
            initialItem: "Home.qml"
            focus: true

//            onCurrentItemChanged: {
//                    if (currentItem) {
//                        const nextFocusItem = currentItem.nextItemInFocusChain()
//                        if (nextFocusItem) {
//                            nextFocusItem.forceActiveFocus();
//                        }
//                    }
//                }
        }
    }
}
