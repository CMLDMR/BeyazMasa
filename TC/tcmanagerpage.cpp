#include "tcmanagerpage.h"

TCManagerPage::TCManagerPage(QObject *parent)
    : QObject(parent),
      TCManager ()
{

}



TCManagerPage::TCManagerPage(DataBase *_db)
    : TCManager (static_cast<DB*>(_db))
{
    std::cout << __LINE__ << " " << __FUNCTION__ << " " << "TCMananager DataBase*" << std::endl;
}

bool TCManagerPage::tcCheck(const QString &mTC)
{
        TC item;
        item.setTCNO (mTC);
        auto count = this->countItem (item);

        if( count == -1 )
        {
            std::cout << "mTC DataBase Count Error: " << __LINE__ << __FUNCTION__ << std::endl;
            return false;
        }else if (count == 0 ) {
            return false;
        }else{
            return true;
        }
}

TCItem* TCManagerPage::loadByTC( const QString &mTCNO )
{
    auto val = this->Load_byTCNO (mTCNO.toStdString ());

    if( val )
    {
        return new TCItem(val.value());
    }else{
        return nullptr;
    }
}

TCItem *TCManagerPage::loadByTel(const QString &mTel)
{
    auto val = this->Load_byTEL (mTel.toStdString ());

    if( val )
    {
        return new TCItem(val.value());
    }else{
        return nullptr;
    }}
