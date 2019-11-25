#include "bilgiedinmevalue.h"

BilgiEdinmeValue::BilgiEdinmeValue()
    :SerikBLDCore::BilgiEdinme::BilgiEdinmeItem (nullptr)
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

BilgiEdinmeValue::BilgiEdinmeValue(const SerikBLDCore::BilgiEdinme::BilgiEdinmeItem &other)
{
    this->setDocumentView (other.view ());
}

BilgiEdinmeValue::BilgiEdinmeValue(SerikBLDCore::BilgiEdinme::BilgiEdinmeItem &&other)
{
    this->setDocumentView (other.view ());
}



BilgiEdinmeValue &BilgiEdinmeValue::operator=(const SerikBLDCore::BilgiEdinme::BilgiEdinmeItem &other)
{
    this->setDocumentView (other.view ());
    return *this;
}

BilgiEdinmeValue &BilgiEdinmeValue::operator=(SerikBLDCore::BilgiEdinme::BilgiEdinmeItem &&other)
{
    this->setDocumentView (other.view ());
    return *this;
}
