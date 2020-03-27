#include "talepkateogorimanagerpage.h"


#include <QDebug>

TalepKateogoriManagerPage::TalepKateogoriManagerPage(QObject *parent)
    : SerikBLDCore::TalepKategoriManager(new DB())
{

}

TalepKateogoriManagerPage::TalepKateogoriManagerPage(DataBase *_db)
    :SerikBLDCore::TalepKategoriManager(_db)
{
    this->setLimit (1000);
    this->UpdateList ();
}

void TalepKateogoriManagerPage::onList(const QVector<SerikBLDCore::TalepKategori> *mlist)
{
    this->clearModel ();
    for( auto item : *mlist )
    {
        this->insertModel(TalepKategoriItem(item));
    }
}

void TalepKateogoriManagerPage::updateKategoriList()
{
    this->UpdateList ();
}

bool TalepKateogoriManagerPage::deleteOne(const QString &oid)
{
    TalepKategoriItem item;
    item.setOid (oid.toStdString ());
    if( this->DeleteItem (item) )
    {
        return true;
    }
    return false;
}

int TalepKateogoriManagerPage::countItem(const QString &kategoriName)
{
    TalepKategoriItem item;
    item.setKategoriName (kategoriName);
    int count = static_cast<int>(SerikBLDCore::DB::countItem (item));
    return count;
}

bool TalepKateogoriManagerPage::insertOne(const QString &kategoriName)
{
    TalepKategoriItem item;
    item.setKategoriName (kategoriName);
    auto val = this->insertItem (item);
    if( val )
    {
        if( val.value ().result ().inserted_count () )
        {
            return true;
        }
        return false;
    }else{
        return false;
    }
}

QJsonArray TalepKateogoriManagerPage::listName() const
{
    QJsonArray array;
    array.append (QString("Belirtilmemiş"));
    for( auto item : this->List () )
    {
        array.append (item.KategoriName ());
    }
    return array;
}

QString TalepKateogoriManagerPage::kategoriOid(const QString &kategoriName)
{
    QString oid;
    for( auto item : this->List () )
    {
        if( item.KategoriName () == kategoriName )
        {
            oid = item.oid ().value ().to_string ().c_str ();
            break;
        }
    }
    return oid;
}

QString TalepKateogoriManagerPage::kategoriName(const QString &kategoriOid)
{
    QString kategoriName;
    for( auto item : this->List () )
    {
        if( item.oid ().value ().to_string ().c_str () == kategoriOid )
        {
            kategoriName = item.KategoriName ();
            break;
        }
    }
    return kategoriName;
}

void TalepKateogoriManagerPage::errorOccured(const std::string &errorText)
{



}
