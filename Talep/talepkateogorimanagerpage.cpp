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
    qDebug() << "Count: " << this->List ().count ();
}
