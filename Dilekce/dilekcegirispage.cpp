#include "dilekcegirispage.h"
#include "memory"
DilekceGirisPage::DilekceGirisPage(QObject *parent) : QObject(parent) , DB()
{

}

YeniDilekce *DilekceGirisPage::createYeniDilekce()
{

    YeniDilekce* mYeniDilekce = new YeniDilekce();

    return std::move(mYeniDilekce);

}
