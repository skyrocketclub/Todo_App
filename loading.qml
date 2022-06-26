import QtQuick 2.0
import QtQuick.Controls 2.3
import com.company.todoengine 1.0


/*
    e. The QTimer that loads when the user clicks on Login

    Engage this Page
    after 3 seconds
    a signal is emitted...
    once the signal is emitted, push the main page to the stack
  */
Item {
    Rectangle{
        id: frame
        color: "#8382e9"
        anchors.fill: parent

        Component.onCompleted: {
            todoengine.timeoutStart
        }

        Todoengine{
            id: todoengine
            onEndloader: {
                todoengine.timeoutStop
                stack.push("MainPage.qml")
            }
        }

        Row {
            id: row
            width: frame.width
            height: 80
            spacing: 20

            anchors{
                verticalCenter: frame.verticalCenter
            }

            BusyIndicator {
                id: busyIndicator
                width: 70
                height: 70

                anchors{
                    right: label.left
                    rightMargin: 10
                }
            }

            Label {
                id: label
                text: qsTr("Loading your data...")
                font.pointSize: 20
                font.family: "Courier"
                anchors{
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
