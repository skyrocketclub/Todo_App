import QtQuick 2.0
import QtQuick.Controls 2.3

/*
   - Make the Basic Layout consisting of
  1      The User's Panel
            - The Avartar is loaded here
            - The Nickname is loaded here
        The To-Do Panel
            -Divided into two layouts

  2              - The Date Layout
                    --- The Date Layout Which displays the current date and the time ... {Shall We}

  3            - The Main App Layout

                    --- In this layout there //Consider Making use of ListViews to implement this aspect if opportune

                        -The use clicks on the  + symbol to add a task
                        - There is also a button called delete all

                        ############################################################################
                        ---> This looks like a custom Component will be created here called ---- TASKS
                        This custom component of task will have the following attributes



                           a.  Understand how ListView Works
                           b.  Understand How to dynamically create objects in a listview

                                Create a custom component called tasks

                                1. A rectangle with the following
                                    - A check box //try the check delegate to see if you can also cancel the text once the task is done
                                    - On hover, the option for Delete pops up ... also the icon for editing (pencil like) comes on as well

                                    Create the Plus Button
                                        Upon clicking the plus button, a text  area becomes visible.
                                            Upon clicking enter,
                                                A new "task" is created

                                    Create the Delete all Button
                                    { one on the left --------------- one on the right


                                     If any of the tasks is double clicked, the text area appears again and the text can be editted then





  */

Item {
    Rectangle{
        id: background
        anchors.fill: parent
        color: "white"

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
                        horizontalCenter: parent.horizontalCenter
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
                    height: column.height / 5
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
                    height: column.height - dateFrame.height
                    color: "#ffffff"
                    anchors{
                        top: dateFrame.bottom
                    }

                    CheckBox {
                        id: checkBox
                        text: qsTr("Task to be done")
                    }
                }
            }
        }


    }
}
