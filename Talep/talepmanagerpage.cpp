#include "talepmanagerpage.h"
#include <QUrl>


TalepManagerPage::TalepManagerPage(QObject *parent) : TalepManager()
{

}


TalepManagerPage::TalepManagerPage(DataBase *_db) :  TalepManager (_db)
{

}

bool TalepManagerPage::insertTalepItem( TalepItem *item )
{
    return this->insertTalep(item);
}

bool TalepManagerPage::updateTalepItem(TalepItem *item)
{
    return this->updateTalep (item);
}


void TalepManagerPage::find()
{
    auto val = this->findTalep (Talep());
    this->clearModel ();
    for( auto item : val )
    {
        TalepItem item_;
        item_.setDocumentView (item.view ());
        this->insertModel(item_);
    }

}

TalepItem* TalepManagerPage::findOne(const QString &talepOid)
{
    Talep filter;
    filter.setOid (talepOid.toStdString ());
    auto val = this->findOneTalep (filter);
    TalepItem* item = new TalepItem();
    item->setDocumentView (val.view ());
    return item;
}

bool TalepManagerPage::insertTalepEvent(TalepEvent *event)
{
    return this->insertTalepSubItem (event);
}

void TalepManagerPage::updateEventList(const QString &talepOid)
{
//    mEventList.clear ();
    mEventList_Ptr.clear ();
    auto cursor = this->findTalepSubItem (talepOid);
    for( auto item : cursor )
    {
        TalepEvent *event_ = new TalepEvent();
        event_->setDocumentView (item.view ());
        mEventList_Ptr.append (event_);
    }
    emit eventListUpdated();
}

QString TalepManagerPage::uploadFile(const QString &fileUrl)
{
    auto val = this->uploadfile (QUrl(fileUrl).toLocalFile ());
    return QString::fromStdString (val.get_oid ().value.to_string ());
}

QString TalepManagerPage::downloadFileUrl(const QString &fileOid)
{
    auto val = this->downloadFile (fileOid);
    return QUrl::fromLocalFile (QString::fromStdString (val)).toString ();
}

QQmlListProperty<TalepEvent> TalepManagerPage::eventList( )
{
    return QQmlListProperty<TalepEvent>(this,mEventList_Ptr);
}


