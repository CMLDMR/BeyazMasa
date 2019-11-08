#include "talepevent.h"

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
