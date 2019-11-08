#include "talepitem.h"
#include <QMetaEnum>

TalepItem::TalepItem(QObject *parent) : QObject(parent)
{

}

TalepItem::TalepItem(const TalepItem &other)
{
    this->setDocumentView (other.view ());
}

TalepItem::TalepItem(TalepItem &&other)
{
    this->setDocumentView (other.view ());
}

TalepItem &TalepItem::operator=(const TalepItem &other)
{
    this->setDocumentView (other.view ());
    return *this;
}

TalepItem &TalepItem::operator=(TalepItem &&other)
{
    this->setDocumentView (other.view ());
    return *this;
}



void TalepItem::setTime(const int &mStartOfDay)
{
    this->setSec (mStartOfDay);
}

void TalepItem::setDate(const int &julianDay)
{
    this->setJulianDay (julianDay);
}



void TalepItem::setQMLDurum(const DurumKey &durum)
{
    auto metalVal = QMetaEnum::fromType<DurumKey>();
    this->setDurum (metalVal.valueToKey (durum));
}

TalepItem::DurumKey TalepItem::durumQML() const
{
    auto metalVal = QMetaEnum::fromType<DurumKey>();
    return static_cast<DurumKey>(metalVal.keyToValue (this->durum ().toStdString ().c_str ()));
}

void TalepItem::setQMLKaynak(const TalepItem::Kaynak &kaynak)
{
    auto metalVal = QMetaEnum::fromType<Kaynak>();
    this->setKaynak (metalVal.valueToKey (kaynak));}

TalepItem::Kaynak TalepItem::kaynakQML() const
{
    auto metalVal = QMetaEnum::fromType<Kaynak>();
    return static_cast<Kaynak>(metalVal.keyToValue (this->kaynak ().toStdString ().c_str ()));
}
