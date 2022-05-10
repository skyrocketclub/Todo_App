import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3

Window {
    width: 640
    height: 480
    minimumHeight: 480
    minimumWidth: 640
    visible: true
    title: qsTr("TO DO APP")

    Loader{
        id: loader
        anchors.fill: parent
        StackView{
            id: stack
            anchors.fill: parent
            initialItem: "Login.qml"
        }
    }
}
