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
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
