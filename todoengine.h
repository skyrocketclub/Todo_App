/*
 *
  WHAT'S THE WORKORDER BRO?
TO DO


C++ BackEnd

User Folder (/user)
--- There is a file to store the user name and the password of the user(s) - 01
--- Upon registration, there is a file that has the details of the user, name, nickname and avatar --->

When the user tries to log in, the program checks if the name is in the list of users

if it is, it confirms the password and grants access, else --> say wrong password or user not found depending on the error

--- ugo ... the details are then passed and the avartar as well as the nickname are updated accordingly
----in ugoToDo
... if the entry is empty. you can add tasks.
... as the task are added, they are also added to the .txt file
... if the task is deleted, it is deleted as well from the .txt file


How to go about it

1. Familiarize yourself with qt file concepts like

    a. folders,
    b. file creation,
    c. writing into the files
    d. opening, closing and deleting and replacing files...

    HOW IT WORKS


    storing the data

    1. A Person Registers,
    2. A file with the persons firstname is created dynamically that stores
            first line: Nickname,avartar, password
            the subsequent lines will have the diary entries...

            If I edit or delete, it is reflected real time

    using the app

    1. There is a loader timer and
    2. A current date and time function there to be seen when ever the app is in use

    HOW WE ARE TO ACHIEVE IT

    1. Make A backend cpp..........Done
    2. Make QProperties that
    (Upon Registration)
        a. Collects the Nickname of the user  ............ Done
        b. Collects the Avatar of the user & the password of the user................Done
        c. Function registers user that opens a file with the user's Nickname, that has all the above details as the first time but '#' separated.............Done


    (upon Logging in...)
        d. QProperty that sets the current user to be the nickname so that the file is the one accessed at any time............Done
        f. The Error Message shown if the user enters wrong details ........... Done
            - Create a new label called the feedback string that is normally not visible
            - When the login button is pressed
                1 - Check if the user is registered in the first place
                    if he is{
                            Check if the password correlates{
                                if it does : Login Successful
                                if it does not: premium tears
                            }
                    }
                    if not{
                            Feedback string: user is not registered...
                    }

        e. The QTimer that loads when the user clicks on Login ... Done


    (Upon Usage)
        g. Functions that Collects inputs (upon addition) and adds it to files with Numbers
        h. The QDate and Time Function that gives the time of the current day...
        i. Collects edits (and runs the rebuild of the txt files)
        j. Collects Deletes and RUns the rebuilds of the txt files as well...



 * */

#ifndef TODOENGINE_H
#define TODOENGINE_H

#include <QObject>
#include <QDebug>
#include <QFile>
#include <QDir>
#include <QDataStream>
#include <QTextStream>
#include <QTimer>
#include <QDate>

class TodoEngine : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString nickname READ nickname WRITE setNickname NOTIFY nicknameChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword)
    Q_PROPERTY(int avatar READ avatar WRITE setAvatar)
    Q_PROPERTY(int openFile READ setOpenFile NOTIFY openFileChanged)
    Q_PROPERTY(int userexists READ userexists)
    Q_PROPERTY(QString currentuser READ CurrentUser WRITE setCurrentUser)
    Q_PROPERTY(QString currentpass READ CurrentPass WRITE setCurrentPass)
    Q_PROPERTY(QString loginDetails READ loginDetails)
    Q_PROPERTY(int timeoutStart READ timeoutStart )
    Q_PROPERTY(int timeoutStop READ timeoutStop)
    Q_PROPERTY(QString date READ date)
    Q_PROPERTY(QString addEntry WRITE setaddEntry)
    Q_PROPERTY(int fetch READ fetchNumber)

public:
    explicit TodoEngine(QObject *parent = nullptr);

    //Declaring the accessor functions...
    QString nickname(); //getter for the nickname
    void setNickname(QString name);//setter for the nickname
    QString password(); //getter for the password
    void setPassword(QString pass); //setter for the password
    int avatar();
    void setAvatar(int choice);

    //Function to store details of a registered user...
    int setOpenFile(); //Function to edit the file of the new user...

    //Function that sets the current user and his password
    void setCurrentPass(QString user);
    void setCurrentUser(QString name);
    QString CurrentUser();
    QString CurrentPass();
    QString loginDetails();
    int userexists();

    //Functions and variables that handles the loader page
    void timeout();
    int timeoutStart();
    int timeoutStop();
    QTimer timer;

    //Functions that handle the main to do page
    QString date();
    void setaddEntry(QString entry);
    int fetchNumber();


private:
    QString nickname_{};
    QString password_{};
    int avatar_{};
    QString currentuser_{};
    QString currentpass_{};
//    void openUserFile(QString nickname);

signals:
    void nicknameChanged();
    void openFileChanged();
    void endloader();
};

#endif // TODOENGINE_H
