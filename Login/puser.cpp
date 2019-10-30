#include "puser.h"
#include <QUrl>


PUser::PUser(QObject *parent) : QObject(parent)
{

}

PUser::PUser(DataBase *_db) : User (_db->db ())
{

}

bool PUser::login(const QString &_mTel, const QString &_mPassword)
{
    if( this->Login (_mTel.toStdString (),_mPassword.toStdString ()) ){
        emit logined();
        return true;
    }else{
        return false;
    }
}

QString PUser::photoURL()
{
    auto fileName = this->PhotoFilePath ();
    return QUrl::fromLocalFile (QString::fromStdString (fileName)).toString ();
}

QString PUser::adSoyad()
{
    return this->AdSoyad ().c_str ();
}

QString PUser::statu()
{
    return QString::fromStdString (this->Statu ());
}

QString PUser::birimi()
{
    return Birimi ().c_str ();
}
