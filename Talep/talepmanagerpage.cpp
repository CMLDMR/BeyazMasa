#include "talepmanagerpage.h"



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


void TalepManagerPage::find()
{
    auto val = this->findTalep (Talep());

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

