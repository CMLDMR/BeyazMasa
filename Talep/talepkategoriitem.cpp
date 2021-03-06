#include "talepkategoriitem.h"

TalepKategoriItem::TalepKategoriItem()
    : SerikBLDCore::TalepKategori ()
{

}

TalepKategoriItem::TalepKategoriItem(const TalepKategoriItem &other)
{
    this->setDocumentView (other.view ());
}

TalepKategoriItem::TalepKategoriItem(TalepKategoriItem &&other)
{
    this->setDocumentView (other.view ());
}

TalepKategoriItem::TalepKategoriItem(const SerikBLDCore::TalepKategori &other)
{
    this->setDocumentView (other.view ());
}

TalepKategoriItem::TalepKategoriItem(SerikBLDCore::TalepKategori &&other)
{
    this->setDocumentView (other.view ());
}

TalepKategoriItem &TalepKategoriItem::operator=(const TalepKategoriItem &other)
{
    this->setDocumentView (other.view ());
    return *this;
}

TalepKategoriItem &TalepKategoriItem::operator=(TalepKategoriItem &&other)
{
    this->setDocumentView (other.view ());
    return *this;
}

QString TalepKategoriItem::Oid() const
{
    auto val = this->oid ();

    if( val )
    {
        return val.value ().to_string ().c_str ();
    }else{
        return "";
    }
}
