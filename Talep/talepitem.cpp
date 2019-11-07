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
    return *this;}

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
    auto durumStr = QMetaEnum::fromType<DurumKey>().valueToKey(durum);
    this->setDurum (durumStr);
}

TalepItem::DurumKey TalepItem::durumQML() const
{
    auto _durum = QMetaEnum::fromType<DurumKey>().keyToValue (this->durum ().toStdString ().c_str ());
    return static_cast<DurumKey>(_durum);
}
