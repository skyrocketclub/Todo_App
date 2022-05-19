import QtQuick 2.0
import QtQuick.Controls 2.3

/*
  1 - Make the Basic Layout consisting of
        The User's Panel
            - The Avartar is loaded here
            - The Nickname is loaded here
        The To-Do Panel
            -Divided into two layouts
                - The Date Layout
                    --- The Date Layout Which displays the current date and the time ... {Shall We}
                - The Main App Layout

                    --- In this layout there //Consider Making use of ListViews to implement this aspect if opportune

                        -The use clicks on the  + symbol to add a task
                        - There is also a button called delete all

                        ############################################################################
                        ---> This looks like a custom Component will be created here called ---- TASKS
                        This custom component of task will have the following attributes

                            1. A new Box is dynamically created, and at that moment,
                            2. The user can write a text describing what his current task is...
                            3. There is also a mouse area like a check box
                            4. If the user checks the it, the text is cancelled out (maybe)
                            5. There is (that which appears upon hover) a mouse area in which the TASKS can be deleted upon will


  */

Item {

}
