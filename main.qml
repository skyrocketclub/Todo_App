import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3

/*
  WHAT'S THE WORKORDER BRO?
TO DO

1. Sort the issue of the title bar expanding (But that will be later --- Last thing)
2. Introduce Priority and assign the colors based on the priorities chosen by the user
        Urgent and Important (GREEN)
        Not Urgent and Important ( ORANGE )
        Urgent and Not Important (YELLO)
        Not Urgent Not Important ( RED )
        No Category (BLUE) -- DEFAULT
3. Make a Delete all entries button

3. Implement the Categories
         A stand-by Color code is made available in the user section
         Upon the user's entry He selects A Category, default category is no category which is blue


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
