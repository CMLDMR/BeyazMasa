#include "talepevent.h"

using namespace SerikBLDCore;

TalepEvent::TalepEvent(QObject *parent) : QObject(parent)
{

}

TalepEvent::TalepEvent(const TalepEvent &other)
{
    this->setDocumentView (other.view ());
}

TalepEvent::TalepEvent(TalepEvent &&other)
{
    this->setDocumentView (other.view ());
}

TalepEvent &TalepEvent::operator=(const TalepEvent &other)
{
    this->setDocumentView (other.view ());
    return *this;
}

TalepEvent &TalepEvent::operator=(TalepEvent &&other)
{
    this->setDocumentView (other.view ());
    return *this;
}

void TalepEvent::setEventType(TalepEvent::EventType type)
{
    this->setType (static_cast<TalepSubItem::ItemType>(type));
}

TalepEvent::EventType TalepEvent::eventType() const
{
    return static_cast<EventType>(type ());
}

QString TalepEvent::eventTypeStr() const
{
    return QMetaEnum::fromType<EventType>().valueToKey (static_cast<EventType>(this->type ()));
}
