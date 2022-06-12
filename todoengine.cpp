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
}
