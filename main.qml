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




ApplicationWindow {
    id: rootmain
    width: 640
    height: 480
    minimumHeight: 480
    minimumWidth: 640
    visible: true
    title: qsTr("TO DO APP")

    //Details of the user...
    property string nick: ""
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
