#include "dilekcemanagerpage.h"
#include <QVector>
#include <QUrl>

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
