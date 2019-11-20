#include "smsobject.h"

SMSObject::SMSObject()
{

}

SMSObject::SMSObject(const SMSObject &other)
{
    this->setDocumentView (other.view ());
}

SMSObject::SMSObject(SMSObject &&other)
{
    this->setDocumentView (other.view ());
}

SMSObject &SMSObject::operator=(const SMSObject &other)
{
    this->setDocumentView (other.view ());
    return *this;
}

SMSObject &SMSObject::operator=(SMSObject &&other)
{
    this->setDocumentView (other.view ());
    return *this;
}
