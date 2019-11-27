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

void BilgiEdinmeManagerPage::next()
{
    this->operator++ ();
}

void BilgiEdinmeManagerPage::back()
{
    this->operator-- ();
}

QString BilgiEdinmeManagerPage::currentPage()
{
    if( ( skip + limit ) > mDocumentCount )
    {
        return QString("%1/%2").arg (mDocumentCount).arg (mDocumentCount);
    }else{
        return QString("%1/%2").arg (skip+limit).arg (mDocumentCount);
    }
}

void BilgiEdinmeManagerPage::operator++()
{
    if( skip + limit < mDocumentCount )
    {
        skip += limit;
        this->_refreshList ();
    }
}

void BilgiEdinmeManagerPage::operator--()
{
    if( skip - limit >= 0 )
    {
        skip -= limit;
    }else{
        skip = 0;
    }
    this->_refreshList ();
}

void BilgiEdinmeManagerPage::_refreshList()
{
    this->mDocumentCount = this->countItem (SerikBLDCore::BilgiEdinme::BilgiEdinmeItem());
    auto cursor = this->UpdateList (SerikBLDCore::BilgiEdinme::BilgiEdinmeItem(),limit,skip);
    this->clearModel ();
    for( auto item : cursor )
    {
        BilgiEdinmeValue item_;
        item_.setDocumentView (item.view ());
        this->insertModel (item_);
    }
    emit currentPageChanged ();
}
