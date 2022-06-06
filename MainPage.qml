import QtQuick 2.0
import QtQuick.Controls 2.3



FocusScope {
    Rectangle{
        id: background
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        color: "white"



        ListModel{
            id: todoModel
        }

        Row {
            id: row
            anchors.fill: parent

            Rectangle {
                id: rectangle // The user's panel
                width: row.width/3.7
                height: row.height
                color: "#89c4e1"
                anchors{
                    top: row.top
                    left: row.left
                }

                Column {
                    id: column1
                    y: 58
                    width: rectangle.width / 1.75
                    height: rectangle.height / 7
                    spacing: 10
                    anchors{
                        top: rectangle.top
                        topMargin: 80
//                        horizontalCenter: parent.horizontalCenter
                    }

                    Label {
                        id: label
                        text: qsTr("Nickname")
                        font.pointSize: column1.height/ 10
                        anchors{

                            horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Rectangle {
                        id: rectangle1
                        width: column1.width * 0.7
                        height: column1.width * 0.7
                        color: "#ffffff"
                        anchors.horizontalCenter: parent.horizontalCenter

                        Image {
                            id: image
                            anchors.fill: parent
                            source: "qrc:/qtquickplugin/images/template_image.png"
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                }
            }

            Column {
                id: column
                width: row.width - rectangle.width
                height: row.height
                anchors{
                    right: row.right
                    top: row.top
                }

                Rectangle {
                    id: dateFrame
                    width: column.width
                    height: column.height * 0.2
                    color: "#dcebf3"
                    anchors{
                        top: row.top
                    }

                    Label {
                        id: label1
                        text: qsTr("Tasks for the day: ")
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                        font.pointSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: todoFrame
                    width: column.width
                    height: column.height * 0.8 //
                    color: "#ffffff"

                    anchors{
                        top: dateFrame.bottom
                    }

                    ListView{
                        id: taskSpace
                        width: todoFrame.width
                        height: todoFrame.height - functionTab.height
                        interactive: true
                        boundsBehavior: Flickable.StopAtBounds
                        keyNavigationWraps: true
                        spacing: 5
                        clip: true
                        model: todoModel

                        anchors.top: todoFrame.top
                        anchors.topMargin: 10

                        delegate: Rectangle{
                            id: dlg
                            width: todoFrame.width * 0.85
                            height: todoFrame.height / 13
                            radius: 5
                            color: "lightblue"
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors{
                                left: rectangle.right
                                leftMargin: 20
                            }

                            property string title
                            property string des

                            title: _title
                            des: _des

                            Row{
                                id:taskRow
                                height: parent.height

                                anchors{
                                    fill: parent
                                }


                                //Mouse Area that Makes the Edit and Delete Button Visible
                                MouseArea{
                                    id:hoverMouse
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        taskRowFunction.visible = true
                                    }
                                    onExited: {
                                        taskRowFunction.visible = false
                                    }
                                }
                                    Column{
                                        id: dlgTexts
                                        width: dlg.width * 0.8
                                        height: dlg.height
                                        spacing: 0.1

                                        anchors{
                                            top: taskRow.top
                                            bottom: taskRow.bottom
                                            bottomMargin: 5
                                            left: taskRow.left
                                            leftMargin: 8
                                        }


                                        Label{
                                            id: titleShow
                                            text: dlg.title
                                            font.bold : true
                                            font.pointSize: dlgTexts.height * 0.25
                                            anchors.top: dlgTexts.top
                                            anchors.topMargin: 0.1
                                           }
                                        Label{
                                            id: desShow
                                            text: dlg.des
                                            font.pointSize: dlgTexts.height * 0.20

                                            anchors.top: titleShow.bottom
                                            anchors.topMargin: 0.2


                                            wrapMode: Label.WrapAtWordBoundaryOrAnywhere
//                                            onPaintedWidthChanged:{
//                                                if (paintedWidth>dlgTexts.width){
//                                                    dlgTexts.height = dlgTexts.height + 1 //increasing column size
//                                                    dlg.height = dlgTexts.height
//                                                }
//                                                if (paintedWidth<dlgTexts.width){
//                                                    dlgTexts.height = dlgTexts.height - 1 //increasing column size
//                                                    dlg.height = dlgTexts.height
//                                                }

//                                            }
//                                            onPaintedHeightChanged: {
//                                                if (dlgTexts.height>dlg.height){
////                                                    dlgTexts.height = desShow.paintedHeight + titleShow.paintedHeight + 1
//                                                    dlg.height = dlgTexts.height
//                                                }
////                                                if (dlgTexts.height<dlg.height){
//////                                                    dlgTexts.height = desShow.paintedHeight + titleShow.paintedHeight - 1
////                                                    dlg.height = dlgTexts.height
////                                                }

//                                            }
                                        }

                                    }
                                    Row{
                                        id: taskRowFunction
                                        visible: false
                                        width: taskRow.width - dlgTexts.width
                                        height: taskRow.height

                                        anchors{
                                            left: dlgTexts.right
                                        }

                                        Rectangle{
                                            id: editBtn
                                            height: taskRow.height
                                            width: taskRowFunction.width * 0.5
                                            color: "lightgray"
                                            radius: 5
//                                            visible: false
                                            anchors{
                                                left: taskRowFunction.left
                                            }
                                            Label{
                                                id: editLbl
                                                anchors.centerIn: parent
                                                text: "Edit"
                                            }
                                            MouseArea{
                                                id: editMouse
                                                anchors.fill: parent
                                                onClicked: {
                                                    textBox.visible = true
                                                    enterTitle.text = title
                                                    enterDescription.text = des
                                                    button.text = "SAVE EDIT"
                                                    todoModel.remove(index)
                                                }
                                            }
                                        }

                                        Rectangle{
                                            id: deleteBtn
                                            height: taskRow.height
                                            width: taskRowFunction.width * 0.5
                                            color: "red"
                                            radius: 5
//                                            visible: false
                                            anchors{
                                                left: editBtn.right
                                            }
                                            Label{
                                                id: deleteLbl
                                                anchors.centerIn: parent
                                                text: "delete"
                                            }
                                            MouseArea{
                                                id: deleteMouse
                                                anchors.fill: parent
                                                onClicked: {
                                                    todoModel.remove(index)
                                                }
                                            }
                                        }
                                    }
                            }


                        }

                    }

                    Row {
                        id: functionTab
                        width: todoFrame.width
                        height: todoFrame.height / 4
                        anchors{
                            bottom: todoFrame.bottom
                            bottomMargin: 10
                            left: todoFrame.left
                            leftMargin: 10
                        }

                        Column {
                            id: textBox
                            width: todoFrame.width * 0.7
                            height: functionTab.height
                            spacing: 3
                            visible: false
                            anchors{
                                left: todoFrame.left
                                leftMargin: 15
                            }

                            Label {
                                id: title
                                text: qsTr("Title")
                            }

                            Row {
                                id: titleEnterandButton
                                width: todoFrame.width * 0.7
                                height: textBox.height * 0.15
                                spacing: 10
                                anchors{
                                    left: textBox.left
                                }

                                TextField {
                                    id: enterTitle
                                    placeholderText: qsTr("Enter the title here")
                                    width: titleEnterandButton.width * 0.6
                                    anchors{
                                        verticalCenter: parent.verticalCenter
                                    }
                                    focus: true
                                    onAccepted: {
                                        focus = false
                                        enterDescription.focus = true
                                    }
                                }

                                Button {
                                    id: button
                                    text: qsTr("ADD TO LIST")
                                    width:  titleEnterandButton.width * 0.3
                                    anchors{
                                        verticalCenter: parent.verticalCenter
                                    }
                                    onClicked: {
                                        textBox.visible = false

                                        roundButton.visible = true
                                        todoModel.append({"_title":enterTitle.text,"_des":enterDescription.text})
                                        enterTitle.text = ""
                                        enterDescription.text = ""
                                    }
                                }
                            }

                            Label {
                                id: description
                                text: qsTr("Description")
                            }

                            Rectangle {
                                id: enterDescriptionFrame
                                width: textBox.width
                                height: textBox.height - (10 + title.height + enterTitle.height + description.height)
                                color: "#ffffff"


                                TextField {
                                    id: enterDescription
                                    anchors.fill: parent
                                    layer.mipmap: true
                                    wrapMode: TextField.WrapAtWordBoundaryOrAnywhere
                                    placeholderText: qsTr("Text Field")
                                    onAccepted: {
                                        focus = false
                                        textBox.visible = false
                                        roundButton.visible = true
                                        todoModel.append({"_title":enterTitle.text,"_des":enterDescription.text})
                                        enterTitle.text = ""
                                        enterDescription.text = ""
                                    }
                                }
                            }

                        }

                        RoundButton {
                            id: roundButton
                            width: textBox.height * 0.6
                            height: textBox.height * 0.6
                            text: "ADD"
                            visible: true
                            anchors{
                                verticalCenter: textBox.verticalCenter
                                right: functionTab.right
                                rightMargin: 20
                            }
                            onClicked: {
                                textBox.visible = true
                                roundButton.visible = false
                                enterTitle.focus = true

                            }
                        }
                    }
                }


            }
        }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
