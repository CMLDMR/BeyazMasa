#include "bilgiedinmemanagerpage.h"

BilgiEdinmeManagerPage::BilgiEdinmeManagerPage()
    :SerikBLDCore::BilgiEdinmeManager (new DB())
{

}

BilgiEdinmeManagerPage::BilgiEdinmeManagerPage(DB *db)
    :SerikBLDCore::BilgiEdinmeManager (db)
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

void BilgiEdinmeManagerPage::bekleyenler()
{
    mCurrentFilter.clear ();
    mCurrentFilter.setBirim ("NULL");
    this->_refreshList ();
}

void BilgiEdinmeManagerPage::cevaplanmayanlar()
{
    mCurrentFilter.clear ();
    SerikBLDCore::BilgiEdinmeItem item;
    item.append("$exists",false);
    mCurrentFilter.append(SerikBLDCore::BilgiEdinme::Key::CevapOid,static_cast<SerikBLDCore::Item>(item));
    this->_refreshList ();
}

void BilgiEdinmeManagerPage::cevaplananlar()
{
    mCurrentFilter.clear ();
    SerikBLDCore::BilgiEdinmeItem item;
    item.append("$exists",true);
    mCurrentFilter.append(SerikBLDCore::BilgiEdinme::Key::CevapOid,static_cast<SerikBLDCore::Item>(item));
    this->_refreshList ();
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
    this->mDocumentCount = this->countItem (mCurrentFilter);
    auto cursor = this->UpdateList (mCurrentFilter,limit,skip);
    this->clearModel ();
    for( auto item : cursor )
    {
        BilgiEdinmeValue item_;
        item_.setDocumentView (item.view ());
        this->insertModel (item_);
    }
    emit currentPageChanged ();
}
