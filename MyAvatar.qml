import QtQuick 2.0

Item {
    id: root
    height: 50
    width: 50
    property string backgroundColor: "white"
    property string clickedColor: "green"
    property string imageSource: ""
    property int avatarNum : 0


    Rectangle{
        id: babaRect
        anchors.fill: root
        color: backgroundColor

        Rectangle{
            id: imageRect
            width: 40
            height: 40
            anchors.centerIn: babaRect

            Image{
                id: avatarImage
                width: 40
                height: 40
                fillMode: Image.PreserveAspectFit
                opacity: 1
                anchors.fill: imageRect
                source: imageSource
            }
        }
    }



    /*
      The avatar has the following features
      1. The avartar has an image
      2. On clicked, the background goes green and all the others go white //This means you need a property called background color
      3. The avartarBackground > imageRect > Mousearea
      */



}
