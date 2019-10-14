#include "backend.h"

Backend::Backend(QObject *parent) : QObject(parent)
{

}

QString Backend::message() const
{
    return mMessage;
}

void Backend::setMessage(const QString &message)
{
    if( mMessage == message )
    {
//        return;
    }
    mMessage = message;
    emit messageChanged (mMessage);
}
