#include "todoengine.h"

TodoEngine::TodoEngine(QObject *parent)
    : QObject{parent}
{

}

QString TodoEngine::nickname()
{
    return nickname_;
}

void TodoEngine::setNickname(QString name)
{
    nickname_ = name;
    qInfo()<<"Nickname: "<<nickname_<<"\n";
}

QString TodoEngine::password()
{
    return password_;
}

void TodoEngine::setPassword(QString pass)
{
    password_ = pass;
    qInfo()<<"Password: "<<password_<<"\n";
}

int TodoEngine::avatar()
{
    return avatar_;
}

void TodoEngine::setAvatar(int choice)
{
    avatar_ = choice;
    qInfo()<<"Avatar number: "<<avatar_<<"\n";
}

int TodoEngine::setOpenFile()
{
    /*
     * 1 - The C++ program tries to open a file wit the username (to check if it already exists)
     *          If the name is found,Say, A user with that nickname already exists
     *          emit to the QML: user exists
     *
     *     if the name does not exist
     *          Open a newfile with the nickname of the user as the file title and safe it in the section
     *          Then insert the Name, Password and the Avatar number accordingly in the .txt file with # saparator
     *          Then the file is closed
     *          Then emit... open file changed so that the status can be reflected in the QML
     * */
    QString user {};
    QString avatar = QString::number(avatar_); //converting integer to QString
    user = nickname_ + "#" + password_  + "#" + avatar;
    QString path = "files";
    qInfo()<<user<<"/n";

    //Opening the file to input the information
    QDir dir; //checking if the directory exists and then creating the directory
    if(!dir.exists(path)){
        dir.mkpath(path);
    }
    QString filename = path + "/" + nickname_ + ".txt";
    QFile file(filename);
    if(file.open(QIODevice::WriteOnly)){
        QTextStream stream( &file );
        stream << user <<"\n";
        emit openFileChanged();
        file.close();
    }
    else{
        qInfo()<<"Error opening file\n";
        qInfo()<<file.errorString();
    }

    return 0;
}
