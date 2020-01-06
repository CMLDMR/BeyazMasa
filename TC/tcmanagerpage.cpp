#include "tcmanagerpage.h"
#include <QRandomGenerator>

TCManagerPage::TCManagerPage(QObject *parent)
    : QObject(parent),
      SerikBLDCore::TCManager ()
{

}



TCManagerPage::TCManagerPage(DataBase *_db)
    : SerikBLDCore::TCManager (static_cast<SerikBLDCore::DB*>(_db))
{
    std::cout << __LINE__ << " " << __FUNCTION__ << " " << "TCMananager DataBase*" << std::endl;

}

bool TCManagerPage::tcCheck(const QString &mTC)
{
        SerikBLDCore::TC item;
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

bool TCManagerPage::cepTelefonuCheck(const QString &mCepTelefonu)
{
        SerikBLDCore::TC item;
        item.setCepTelefonu (mCepTelefonu);
        auto count = this->countItem (item);

        if( count == -1 )
        {
            std::cout << "mCepTelefonu DataBase Count Error: " << __LINE__ << __FUNCTION__ << std::endl;
            return false;
        }else if (count == 0 ) {
            return false;
        }else{
            return true;
        }
}

bool TCManagerPage::saveTCItem( TCItem *item)
{
    return this->insertTC (item);
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
    }
}

TCItem *TCManagerPage::loadByOid(const QString &mOid)
{
    auto val = this->Load_byOID (mOid.toStdString ());

    if( val )
    {
        return new TCItem(val.value());
    }else{
        return nullptr;
    }
}

QString TCManagerPage::generatePassword() const
{
    return QString("%1").arg (QRandomGenerator::global ()->generate64 ()%10000 + 1000);
}

TCManagerPageV2::TCManagerPageV2(QObject *parent)
    :SerikBLDCore::TCManagerV2 (new SerikBLDCore::DB())
{

}

TCManagerPageV2::TCManagerPageV2(DataBase *_db)
    :SerikBLDCore::TCManagerV2 (_db)
{

}

void TCManagerPageV2::onList(const QVector<SerikBLDCore::TC> *mlist)
{
    std::cout << "Item Count: " << mlist->count () << std::endl;
    this->clearModel ();
    for( auto item : *mlist )
    {
        this->insertModel (static_cast<TCItem>(item));
    }
}

void TCManagerPageV2::errorOccured(const std::string &errorText)
{
    emit errorOccur (QString::fromStdString (errorText));
}

void TCManagerPageV2::updatelist()
{
    this->UpdateList (filter);
    emit currentPageNotify ();
}

void TCManagerPageV2::updateWidthTCNO(const QString &tcno)
{
    filter.clear ();

    filter.append(SerikBLDCore::TC::KeyTC,SerikBLDCore::Item("").append("$regex",tcno.toStdString ())
                  .append("$options","i"));
    this->UpdateList (filter);
    emit currentPageNotify ();
}

void TCManagerPageV2::updateWidthAdSoyad(const QString &adsoyad)
{
    filter.clear ();
    filter.append(SerikBLDCore::TC::KeyAdSoyad,SerikBLDCore::Item("").append("$regex",adsoyad.toStdString ())
                  .append("$options","i"));
    this->UpdateList (filter);
    emit currentPageNotify ();
}

void TCManagerPageV2::updateWidthTelefon(const QString &telefon)
{
    filter.clear ();
    filter.append(SerikBLDCore::TC::KeyCepTelefonu,SerikBLDCore::Item("").append("$regex",telefon.toStdString ())
                  .append("$options","i"));
    this->UpdateList (filter);
    emit currentPageNotify ();
}

void TCManagerPageV2::next()
{
    SerikBLDCore::ListItem<SerikBLDCore::TC>::next(filter);
    emit currentPageNotify ();
}

void TCManagerPageV2::back()
{
    SerikBLDCore::ListItem<SerikBLDCore::TC>::back (filter);
    emit currentPageNotify ();
}

QString TCManagerPageV2::currentPage()
{
    QString str = QString(" %1 / %2 ").arg (TCManagerV2::currentPage (filter)).arg (TCManagerV2::totalPage (filter));
    return str;
}

TCItem *TCManagerPageV2::loadByOid(const QString &mOid)
{
    auto val = this->Load_byOID (mOid.toStdString ());

    if( val )
    {
        return new TCItem(val.value());
    }else{
        return nullptr;
    }
}

bool TCManagerPageV2::updateTCItem(TCItem *item)
{
    return this->UpdateItem (*item);
}

bool TCManagerPageV2::tcCheck(const QString &mTC)
{
    SerikBLDCore::TC item;
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

bool TCManagerPageV2::cepTelefonuCheck(const QString &mCepTelefonu)
{
    SerikBLDCore::TC item;
    item.setCepTelefonu (mCepTelefonu);
    auto count = this->countItem (item);

    if( count == -1 )
    {
        std::cout << "mCepTelefonu DataBase Count Error: " << __LINE__ << __FUNCTION__ << std::endl;
        return false;
    }else if (count == 0 ) {
        return false;
    }else{
        return true;
    }
}
