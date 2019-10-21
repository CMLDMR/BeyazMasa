#include "yenidilekce.h"
#include <boost/optional.hpp>
#include <QUrl>

YeniDilekce::YeniDilekce(QObject *parent) : QObject(parent) , Dilekce (Create_Dilekce ().get ())
{

    this->SetSayi (4422);

    this->Update ();
}

YeniDilekce::YeniDilekce(const YeniDilekce &dilekce)
{
    std::cout << "copy Cosntructor" << std::endl;
    this->setDocumentView (dilekce.view ());
}

YeniDilekce::YeniDilekce(Dilekce *dilekce)
{
    this->setDocumentView (dilekce->view ());

}

YeniDilekce::~YeniDilekce()
{
    std::cout << "Destrutor of Yeni Dilekce" << std::endl;
}

void YeniDilekce::operator=(const Dilekce &dilekce)
{
    this->setDocumentView (dilekce.view ());
}

void YeniDilekce::operator=(Dilekce *dilekce)
{
    this->setDocumentView (dilekce->view ());
}


bool YeniDilekce::save()
{
    return this->Update ();
}

QJsonArray YeniDilekce::ekList() const
{
    return mEkList;
}

void YeniDilekce::addEk(const QString &ekPath)
{
    mEkList.append (QUrl(ekPath).toLocalFile ());
    emit ekListChanged ();
}

bool YeniDilekce::deleteEk(const QString &ekPath)
{
    int i = -1;
    bool exist = false;
    for( auto item : mEkList )
    {
        i++;
        if( item == ekPath ){
            exist = true;
            break;
        }

    }
    if( i != -1 && exist )
    {
        mEkList.removeAt (i);
        emit ekListChanged ();
        return true;
    }

    return false;
}
