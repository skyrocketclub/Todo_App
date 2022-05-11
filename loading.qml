import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    Rectangle{
        id: frame
        color: "#8382e9"
        anchors.fill: parent

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
                    left: row.left
                    leftMargin: 100
                }
            }

            Label {
                id: label
                text: qsTr("Loading your data...")
                font.pointSize: 20
                font.family: "Courier"
                anchors{
                    left:busyIndicator.right
                    leftMargin: 50
                    verticalCenter: busyIndicator.verticalCenter
                }
            }
        }
    }
}
