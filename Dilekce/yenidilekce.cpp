#include "yenidilekce.h"
#include <boost/optional.hpp>
#include <QUrl>

DilekceItem::DilekceItem(QObject *parent) : QObject(parent) , Dilekce (Create_Dilekce ().get ())
{
    this->SetSayi (-1);
    this->Update ();
}

DilekceItem::DilekceItem(const DilekceItem &dilekce)
{
    std::cout << "copy Cosntructor" << std::endl;
    this->setDocumentView (dilekce.view ());
}

DilekceItem::DilekceItem(Dilekce *dilekce)
{
    this->setDocumentView (dilekce->view ());
}

DilekceItem::~DilekceItem()
{
    std::cout << "Destrutor of Yeni Dilekce" << std::endl;
}

void DilekceItem::operator=(const Dilekce &dilekce)
{
    this->setDocumentView (dilekce.view ());
}

void DilekceItem::operator=(Dilekce *dilekce)
{
    this->setDocumentView (dilekce->view ());
}


bool DilekceItem::save()
{


    for( auto item : mBilgiBirimList )
    {
        this->AddBilgiBirim (item.toString ());
    }

    for( auto item : mEkList )
    {
        auto fOid = this->uploadfile ( item.toString () );
        this->AddEkOid (fOid.get_oid ().value.to_string ().c_str ());
    }

    auto tOid = this->uploadfile (QUrl(this->dilekceFilePath ()).toLocalFile ());

    this->SetDilekceOid (tOid.get_oid ().value.to_string ().c_str () );

    this->testView ();



    return this->Update ();
}

void DilekceItem::testView()
{
    std::cout << bsoncxx::to_json (this->view ()) << std::endl;
}

QJsonArray DilekceItem::ekList() const
{
    return mEkList;
}

void DilekceItem::addEk(const QString &ekPath)
{
    if( !mEkList.contains (ekPath) )
    {
        mEkList.append (QUrl(ekPath).toLocalFile ());
        emit ekListChanged ();
    }

}

bool DilekceItem::deleteEk(const QString &ekPath)
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

QJsonArray DilekceItem::bilgiBirimList() const
{
    return mBilgiBirimList;
}

void DilekceItem::addBilgiBirim(const QString &_birim)
{
    if( !mBilgiBirimList.contains (_birim) )
    {
        mBilgiBirimList.append (_birim);
        emit bilgiBirimChanged ();
    }

}

bool DilekceItem::deleteBilgiBirim(const QString &_birim)
{
    int i = -1;
    bool exist = false;
    for( auto item : mBilgiBirimList )
    {
        i++;
        if( item == _birim ){
            exist = true;
            break;
        }

    }
    if( i != -1 && exist )
    {
        mBilgiBirimList.removeAt (i);
        emit bilgiBirimChanged ();
        return true;
    }

    return false;
}

QString DilekceItem::dilekceFilePath() const
{
    return mDilekceFilePath;
}

void DilekceItem::setDilekceFilePath(const QString &dilekceFilePath)
{
    mDilekceFilePath = dilekceFilePath;
}
