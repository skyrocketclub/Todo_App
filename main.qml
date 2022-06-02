import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3

/*
  WHAT'S THE WORKORDER BRO?



  3. Make all the pages Dynamic okay??
  4. Continue with the other aspects


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
        }
    }
}
