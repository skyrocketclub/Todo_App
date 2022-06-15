import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3
import com.company.todoengine 1.0

/*
  Feature Implementations
        Not Urgent and Important ( ORANGE )
        Urgent and Not Important (YELLO)
        Not Urgent Not Important ( RED )

1. Sort the issue of the title bar expanding (But that will be later --- Last thing)
2. Introduce Priority and assign the colors based on the priorities chosen by the user
        Very Important (GREEN)

        No Category (BLUE) -- DEFAULT
3. Make a Delete all entries button

3. Implement the Categories
         A stand-by Color code is made available in the user section
         Upon the user's entry He selects A Category, default category is no category which is blue


  */

/*
  WHAT'S THE WORKORDER BRO?
TO DO


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

    HOW IT WORKS


    storing the data

    1. A Person Registers,
    2. A file with the persons firstname is created dynamically that stores
            first line: Nickname,avartar, password
            the subsequent lines will have the diary entries...

            If I edit or delete, it is reflected real time

    using the app

    1. There is a loader timer and
    2. A current date and time function there to be seen when ever the app is in use

    HOW WE ARE TO ACHIEVE IT

    1. Make A backend cpp
    2. Make QProperties that
    (Upon Registration)
        a. Collects the Nickname of the user
        b. Collects the Avartar of the user & the password of the user
        c. Function registers user that opens a file with the user's Nickname, that has all the above details as the first time but '#' separated


    (upon Logging in...)
        d. QProperty that sets the current user to be the nickname so that the file is t eone accessed at any time
        e. The QTimer that loads when the user clicks on Login
        f. The Error Message shown if the user enters wrong details

    (Upon Usage)
        g. Functions that Collects inputs (upon addition) and adds it to files with Numbers
        h. The QDate and Time Function that gives the time of the current day...
        i. Collects edits (and runs the rebuild of the txt files)
        j. Collects Deletes and RUns the rebuilds of the txt files as well...


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
        }
    }
}
