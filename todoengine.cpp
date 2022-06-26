#include "todoengine.h"

TodoEngine::TodoEngine(QObject *parent)
    : QObject{parent}
{
    timer.setInterval(3000);
    connect(&timer,&QTimer::timeout,this,&TodoEngine::timeout);
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

void TodoEngine::setCurrentPass(QString pass)
{
    currentpass_ = pass;
    qInfo()<<"Current Pass: "<<currentpass_<<"\n";
}

void TodoEngine::setCurrentUser(QString name)
{
    currentuser_ = name;
    nickname_ = name;
    qInfo()<<"Current Name Changed Successfully: "<<currentuser_<<"\n";
}

QString TodoEngine::CurrentUser()
{
    return currentuser_;
}

QString TodoEngine::CurrentPass()
{
    return currentpass_;
}

QString TodoEngine::loginDetails()
{
    QString path = "files/" + currentuser_ + ".txt";
    QFile file(path);
    QString userLine;

    if(file.open(QIODevice::ReadOnly)){
        userLine = file.readLine(); //sends the user name and the password to the front-end
        qInfo()<<"Current User: "<<currentuser_<<"\n";
        file.close();
    }else{
        qInfo()<<file.errorString();
    }
    return userLine;
}

int TodoEngine::userexists()
{
    QString path = "files/" + currentuser_ + ".txt";
    QFile file(path);
    int status{0};

    if(file.exists()){
        status = 1;
    }
    return status;
}

void TodoEngine::timeout()
{
    emit endloader();
    qInfo()<<"Time to end loader";
}

int TodoEngine::timeoutStart()
{
    timer.start();
    return 0;
}

int TodoEngine::timeoutStop()
{
    timer.stop();
    return 0;
}

QString TodoEngine::date()
{
    QString currentDate;
    QDate date = QDate::currentDate();
    currentDate = date.toString();
    return currentDate;
}

void TodoEngine::setaddEntry(QString entry)
{
    qInfo()<<nickname_<<" is the nickname\n";
    QString path = "./files/";
    QString currentuser {nickname_};
    QDir dir(path);
    QString filename = path + currentuser + ".txt";
    QFile file(filename);
    qInfo()<<"Path: "<<filename;
    if(file.open(QIODevice::Append)){
        QTextStream stream(&file);
        stream<<entry<<"\n";
        qInfo()<<"Write to " <<nickname_<<" Successful";
        file.close();
    }
    else{
        qInfo()<<file.errorString();
    }

}

