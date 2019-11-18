#include "dilekcegirispage.h"
#include "memory"
DilekceGirisPage::DilekceGirisPage(QObject *parent) : QObject(parent) , SerikBLDCore::DB()
{

}

DilekceItem *DilekceGirisPage::createYeniDilekce()
{

    DilekceItem* mYeniDilekce = new DilekceItem();

    return std::move(mYeniDilekce);

}
