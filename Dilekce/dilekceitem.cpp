#include "dilekceitem.h"
#include <boost/optional.hpp>
#include <QUrl>

DilekceItem::DilekceItem(QObject *parent) : QObject(parent) , Dilekce ()
{
    this->SetDurum (DilekceDurum::Acik);
}

DilekceItem::DilekceItem(const DilekceItem &dilekce)
{
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

DilekceItem& DilekceItem::operator=(const Dilekce &dilekce)
{
    this->setDocumentView (dilekce.view ());
    return *this;
}

void DilekceItem::operator=(Dilekce *dilekce)
{
    this->setDocumentView (dilekce->view ());
}

DilekceItem &DilekceItem::operator=(DilekceItem &&other)
{
    this->setDocumentView (other.view ());
    return *this;
}

DilekceItem &DilekceItem::operator=(const DilekceItem &other)
{
    this->setDocumentView (other.view ());
    return *this;
}

QString DilekceItem::dilekceID()
{
    auto val = this->oid ();

    if( val )
    {
        return QString::fromStdString (val.value ().to_string ());
    }else{
        return "";
    }
}

QString DilekceItem::taranmisDilekceOid()
{
    return this->dilekceOid ();
}

bool DilekceItem::durum()
{
    auto Durum = this->Durum ();

    if( Durum == DilekceDurum::Acik )
    {
        return false;
    }else{
        return true;
    }
}

QJsonArray DilekceItem::cevapEkList()
{
    std::cout << "dilekce Cevap Eklist Count: " << this->EkOidList ().count () << std::endl;

    QJsonArray array;
    for( auto item : this->EkOidList () )
    {
        array.append (item);
    }
    return array;
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
