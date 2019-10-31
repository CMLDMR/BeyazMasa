#include "dilekcemanagerpage.h"
#include <QVector>
#include <QUrl>
#include <QJsonArray>
#include <QJsonObject>

DilekceManagerPage::DilekceManagerPage(QObject *parent) : QObject(parent) , DilekceManager ()
{
}

DilekceManagerPage::DilekceManagerPage(DataBase *db)
    :DilekceManager (db)
{

}

DilekceManagerPage::DilekceManagerPage(const DilekceManagerPage &other)
    :DilekceManager (other)
{

}

//DilekceManagerPage *DilekceManagerPage::createManager(DataBase* db)
//{
//    return new DilekceManagerPage(db);
//}

QQmlListProperty<DilekceItem> DilekceManagerPage::dilekceList()
{
    return QQmlListProperty<DilekceItem>(this,&mDilekceItemlist,&DilekceManagerPage::appendList , &DilekceManagerPage::listSize , &DilekceManagerPage::cardAt , &DilekceManagerPage::clearListPtr);
}

void DilekceManagerPage::dilekceListByTelefon(const QString &telefon)
{
    this->mDilekceItemlist.clear ();
    auto cursor = this->findByTelefon (telefon);
    for( auto doc : cursor )
    {
        DilekceItem item;
        item = doc;
        this->mDilekceItemlist.append (std::move(item));
    }
    emit dilekceListChanged ();
}

void DilekceManagerPage::dilekceListByTCNO(const QString &tcno)
{
    this->mDilekceItemlist.clear ();
    auto cursor = this->findByTCNO (tcno);
    for( auto doc : cursor )
    {
        DilekceItem item;
        item = doc;
        this->mDilekceItemlist.append (std::move(item));
    }
    emit dilekceListChanged ();
}

void DilekceManagerPage::dilekceListBySayi(const int &sayi)
{
    this->mDilekceItemlist.clear ();
    auto cursor = this->findBySayi (sayi);
    for( auto doc : cursor )
    {
        DilekceItem item;
        item = doc;
        this->mDilekceItemlist.append (std::move(item));
    }
    emit dilekceListChanged ();
}

QString DilekceManagerPage::downloadFilePath(const QString &fileOid)
{
    return this->TaranmisDilekcePath (fileOid);
}

DilekceItem *DilekceManagerPage::loadByOid(const QString &moid)
{
    auto val = this->LoadDilekce (moid.toStdString ());
    if( val )
    {
//        val.value ()->printView ();
        DilekceItem *item = new DilekceItem();
        item->setDocumentView (val.value ()->view ());
        return item;
    }else{
        return nullptr;
    }
}

QJsonArray DilekceManagerPage::ekFilePathList(QVariant dilekceItem)
{
    QJsonArray array;

    auto itemlist = dilekceItem.value<DilekceItem*>();

    int ekCount = 1;
    for( auto item : itemlist->EkOidList () )
    {
        auto val = this->downloadFilePath (item);
        QJsonObject obj;
        obj.insert ("ad",QString("EK %1").arg (ekCount++));
        obj.insert ("url",QUrl::fromLocalFile (val).toString ());
        array.append (obj);
    }
    return array;
}

QJsonArray DilekceManagerPage::gorevliList(DilekceItem *item)
{

    QJsonArray array;

    auto itemlist = item->GorevliList ();

    for( auto _item : itemlist )
    {
        QJsonObject obj;
        obj.insert ("ad",_item.AdSoyad ());
        auto val = this->downloadFilePath (_item.FotoOid ());
        obj.insert ("url",QUrl::fromLocalFile (val).toString ());
        array.append (obj);
    }

    return array;

}

QJsonArray DilekceManagerPage::aciklamalar(DilekceItem *item)
{
    QJsonArray array;
    auto dilekceoid = item->oid ();
    if( dilekceoid )
    {
        auto itemlist = this->findAciklama (dilekceoid.value ().to_string ());
        for( auto aciklama : itemlist )
        {
            QJsonObject obj;
            obj.insert ("saat",aciklama.Saat ());
            obj.insert ("tarih",aciklama.Tarih ());
            obj.insert ("person",aciklama.PersonelName ());
            obj.insert ("aciklama",aciklama.Aciklama ());
            array.append (obj);
        }
    }
    return array;
}

QJsonObject DilekceManagerPage::cevap(DilekceItem *item)
{
    QJsonObject obj;



    auto cevapOidStr = item->cevapOid ();

    if( cevapOidStr.isEmpty () )
    {
        return obj;
    }

    auto val = this->LoadDilekceCevap (cevapOidStr.toStdString () );

    if( val )
    {
        auto cevapItem = val.value ();
        auto filePath = this->downloadFilePath (cevapItem->cevapOid ());
        obj.insert ("url",QUrl::fromLocalFile (filePath).toString ());
        obj.insert ("personel",cevapItem->personelName ());
        obj.insert ("saat",cevapItem->saat ());
        obj.insert ("tarih",cevapItem->Tarih ());
    }

    return obj;
}

QJsonArray DilekceManagerPage::cevapEkList(QJsonArray oidList)
{
    QJsonArray array;
    for( auto item : oidList )
    {
        auto val = this->downloadFilePath (item.toString ());
        array.append (QUrl::fromLocalFile (val).toString ());
    }
    return array;
}

bool DilekceManagerPage::saveDilekce( DilekceItem *_item)
{
    auto item = qobject_cast<DilekceItem*>(_item);
    for( auto doc : item->bilgiBirimList () )
    {
        item->AddBilgiBirim (doc.toString ());
    }
    for( auto doc : item->ekList ())
    {
        auto fOid = this->uploadfile ( doc.toString ().toStdString ().c_str ());
        item->AddEkOid (fOid.get_oid ().value.to_string ().c_str ());
    }

    auto tOid = this->uploadfile (QUrl(item->dilekceFilePath ()).toLocalFile ());

    item->SetDilekceOid (tOid.get_oid ().value.to_string ().c_str () );

    return this->insertDilekce (item);

}

void DilekceManagerPage::appendList(QQmlListProperty<DilekceItem> *property, DilekceItem *note)
{
    Q_UNUSED(property)
    Q_UNUSED(note)
}

DilekceItem *DilekceManagerPage::cardAt(QQmlListProperty<DilekceItem> *property, int index)
{
    return static_cast<QList<DilekceItem*>*>(property->data)->at(index);

}

int DilekceManagerPage::listSize(QQmlListProperty<DilekceItem> *property)
{
    return static_cast<QList<DilekceItem*>*>(property->data)->size();

}

void DilekceManagerPage::clearListPtr(QQmlListProperty<DilekceItem> *property)
{
    static_cast<QList<DilekceItem*>*>(property->data)->clear ();

}










//QQmlListProperty<DilekceItem> Storage::getList()
//{
//    {
//        DilekceItem item;
//        item.SetKonu ("testhh  ");
//        this->noteItems.append (item);
//    }

//    {
//        DilekceItem item;
//        item.SetKonu ("testhhyyyyyy  ");
//        this->noteItems.append (item);
//    }

//    return QQmlListProperty<DilekceItem>(this,&noteItems,&Storage::appendList , &Storage::listSize , &Storage::cardAt , &Storage::clearListPtr);
//}

//void Storage::appendList(QQmlListProperty<DilekceItem> *property, DilekceItem *note)
//{
//    Q_UNUSED(property)
//    Q_UNUSED(note)
//}

//DilekceItem *Storage::cardAt(QQmlListProperty<DilekceItem> *property, int index)
//{
//    return static_cast<QList<DilekceItem*>*>(property->data)->at(index);

//}

//int Storage::listSize(QQmlListProperty<DilekceItem> *property)
//{
//    return static_cast<QList<DilekceItem*>*>(property->data)->size();
//}

//void Storage::clearListPtr(QQmlListProperty<DilekceItem> *property)
//{
//    static_cast<QList<DilekceItem*>*>(property->data)->clear ();
//}
