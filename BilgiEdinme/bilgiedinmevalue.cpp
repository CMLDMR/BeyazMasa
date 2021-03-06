#include "bilgiedinmevalue.h"

BilgiEdinmeValue::BilgiEdinmeValue()
    :SerikBLDCore::BilgiEdinmeItem (nullptr)
{

}

BilgiEdinmeValue::BilgiEdinmeValue(const BilgiEdinmeValue &other)
{
    this->setDocumentView (other.view ());
}

BilgiEdinmeValue::BilgiEdinmeValue(BilgiEdinmeValue &&other)
{
    this->setDocumentView (other.view ());
}

BilgiEdinmeValue::BilgiEdinmeValue(const SerikBLDCore::BilgiEdinmeItem &other)
{
    this->setDocumentView (other.view ());
}

BilgiEdinmeValue::BilgiEdinmeValue(SerikBLDCore::BilgiEdinmeItem &&other)
{
    this->setDocumentView (other.view ());
}


QString BilgiEdinmeValue::basvuruOid() const
{
    auto _oid = this->oid ();
    if( _oid )
    {
        return QString::fromStdString (_oid.value ().to_string ());
    }
    return "";
}




BilgiEdinmeValue &BilgiEdinmeValue::operator=(const SerikBLDCore::BilgiEdinmeItem &other)
{
    this->setDocumentView (other.view ());
    return *this;
}

BilgiEdinmeValue &BilgiEdinmeValue::operator=(SerikBLDCore::BilgiEdinmeItem &&other)
{
    this->setDocumentView (other.view ());
    return *this;
}
