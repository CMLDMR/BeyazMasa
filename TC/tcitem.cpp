#include "tcitem.h"

TCItem::TCItem(QObject *parent) : QObject(parent) , TC()
{

}

TCItem::TCItem(const TCItem &other)
{
    this->setDocumentView (other.view ());
}

TCItem::TCItem(TCItem &&other)
{
    this->setDocumentView (other.view ());
}

TCItem::TCItem(TC *other)
{
    this->setDocumentView(other->view());
}

TCItem::TCItem(SerikBLDCore::TC &other)
{
    this->setDocumentView(other.view());
}

TCItem &TCItem::operator=(const TCItem &other)
{
    this->setDocumentView (other.view ());
    return *this;
}

TCItem &TCItem::operator=(TCItem &&other)
{
    this->setDocumentView (other.view ());
    return *this;}

TCItem &TCItem::operator=(const SerikBLDCore::TC &other)
{
    this->setDocumentView (other.view ());
    return *this;
}

TCItem &TCItem::operator=(SerikBLDCore::TC &other)
{
    this->setDocumentView (other.view ());
    return *this;
}


QString TCItem::tcOid()
{
    auto oid = this->oid ();
    if( oid )
    {
        return QString::fromStdString (oid.value ().to_string ());
    }else{
        return "";
    }
}



void TCItem::testView()
{
    std::cout << bsoncxx::to_json (this->view ()) << std::endl;
}
