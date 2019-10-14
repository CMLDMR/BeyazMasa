#include "user.h"
#include <QUrl>

User::User(DB *_db, QObject *parent) : QObject(parent) , Item()
{

}

bool User::login(QString _mTel, QString _mPassword)
{

    this->append(this->KeyTel,_mTel.toStdString ());
    this->append(this->KeyPassword,_mPassword.toStdString ());

    try {
        auto val = this->db ()->collection (Collection).find_one (this->view ());

        if( val )
        {
            this->setDocumentView (val.value ().view ());
            emit logined();
            return true;
        }

    } catch (mongocxx::exception &e) {
        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
        std::cout << str << std::endl;
    }

    return false;



}

QString User::photoURL()
{
    auto element = this->element (KeyFotoid);
    if( element )
    {
        auto url = this->downloadFile (element->get_oid ().value.to_string ().c_str ());
        return QUrl::fromLocalFile (url).toString ();
    }else{
        return "";
    }
}

QString User::AdSoyad()
{
    auto element = this->element (KeyAdSoyad);

    if( element )
    {
        return QString::fromStdString (element->get_utf8 ().value.to_string());
    }else{
        return QString(KeyAdSoyad + " Bilgisi Eksik");
    }


}

QString User::Statu()
{
    auto element = this->element (KeyStatu);

    if( element )
    {
        return QString::fromStdString (element->get_utf8 ().value.to_string());
    }else{
        return QString(KeyStatu + " Bilgisi Eksik");
    }
}

QString User::Birimi()
{
    auto element = this->element (KeyBirimi);

    if( element )
    {
        return QString::fromStdString (element->get_utf8 ().value.to_string());
    }else{
        return QString(KeyBirimi + " Bilgisi Eksik");
    }
}
