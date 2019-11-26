#include "bilgiedinmemanagerpage.h"

BilgiEdinmeManagerPage::BilgiEdinmeManagerPage()
    :SerikBLDCore::BilgiEdinme::BilgiEdinmeManager (new DB())
{

}

BilgiEdinmeManagerPage::BilgiEdinmeManagerPage(DB *db)
    :SerikBLDCore::BilgiEdinme::BilgiEdinmeManager (db)
{
    this->refreshList ();
}

BilgiEdinmeValue *BilgiEdinmeManagerPage::valueAt(const QString &byOid)
{
    return new BilgiEdinmeValue(this->itemAt (byOid));
}

bool BilgiEdinmeManagerPage::updateItem(BilgiEdinmeValue *item)
{
    if( this->UpdateItem (*item) ){
        _refreshList ();
        return true;
    }
    return false;
}

void BilgiEdinmeManagerPage::refreshList()
{
    _refreshList();
}

void BilgiEdinmeManagerPage::_refreshList()
{
    auto cursor = this->UpdateList (SerikBLDCore::BilgiEdinme::BilgiEdinmeItem());
    this->clearModel ();
    for( auto item : cursor )
    {
        BilgiEdinmeValue item_;
        item_.setDocumentView (item.view ());
        this->insertModel (item_);
    }
}
