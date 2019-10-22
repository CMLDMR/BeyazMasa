#include "dilekceitem.h"
#include <boost/optional.hpp>
#include <QUrl>

DilekceItem::DilekceItem(QObject *parent) : QObject(parent) , Dilekce ()
{
    this->SetSayi (-1);
}

DilekceItem::DilekceItem(const DilekceItem &dilekce)
{
    std::cout << "copy Cosntructor" << std::endl;
    this->setDocumentView (dilekce.view ());
}

DilekceItem::DilekceItem(const DilekceItem &&dilekce)
{
    this->setDocumentView (dilekce.view ());
}

DilekceItem::~DilekceItem()
{
    std::cout << "Destrutor of ~DilekceItem" << std::endl;
}

void DilekceItem::operator=(const Dilekce &dilekce)
{
    this->setDocumentView (dilekce.view ());
}

void DilekceItem::operator=(Dilekce *dilekce)
{
    this->setDocumentView (dilekce->view ());
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
