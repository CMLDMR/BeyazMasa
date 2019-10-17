#include "personel.h"
#include <QUrl>


Personel::Personel(QObject *parent) : QObject(parent)
{

}

bool Personel::login(const QString &_mTel, const QString &_mPassword)
{
    if( this->Login (_mTel.toStdString (),_mPassword.toStdString ()) ){
        emit logined();
        return true;
    }else{
        return false;
    }
}

QString Personel::photoURL()
{
    auto fileName = this->PhotoFilePath ();
    return QUrl::fromLocalFile (QString::fromStdString (fileName)).toString ();
}

QString Personel::adSoyad()
{
    return this->AdSoyad ().c_str ();
}

QString Personel::statu()
{
    return this->Statu ().c_str ();
}

QString Personel::birimi()
{
    return Birimi ().c_str ();
}
